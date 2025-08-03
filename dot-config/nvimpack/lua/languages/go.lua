vim.dap.adapters.delve = function(callback, config)
	if config.mode == "remote" and config.request == "attach" then
		callback({
			type = "server",
			host = config.host or "127.0.0.1",
			port = config.port or "38697",
		})
	else
		callback({
			type = "server",
			port = "${port}",
			executable = {
				command = "dlv",
				args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" },
				detached = vim.fn.has("win32") == 0,
			},
		})
	end
end

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
vim.dap.configurations.go = {
	{
		type = "delve",
		name = "Debug",
		request = "launch",
		program = "${file}",
	},
	{
		type = "delve",
		request = "attach",
		name = "go attach to the process",
		processId = vim.dap.utils.pick_process,
	},
}

local function log(msg)
  -- if not vim.g.debug_enabled then
  --   return
  -- end

  -- Wrap the print call in vim.schedule to ensure it runs in main event loop
  vim.schedule(function()
    -- Use vim.print safely here
    vim.print(msg)
  end)
end

local gitsigns = require("gitsigns")
local ts = vim.treesitter

-- Get changed hunks ranges from gitsigns
local function get_changed_ranges(bufnr)
	local hunks = gitsigns.get_hunks(bufnr)
	local ranges = {}

	if not hunks then
		log("[Debug] No hunks found by gitsigns")
		return ranges
	end

	log(string.format("[Debug] Found %d hunks", #hunks))
	for i, hunk in ipairs(hunks) do
		local start_line = hunk.added.start or 0
		local end_line = start_line + (hunk.added.count or 0) - 1
		log(string.format("[Debug] Hunk #%d: start_line=%d, end_line=%d", i, start_line, end_line))
		table.insert(ranges, { start_line = start_line, end_line = end_line })
	end

	return ranges
end

-- Expand a line range to the full enclosing scope node (function/struct/etc)
local function expand_range_to_scope(bufnr, range, scopes)
	log(string.format("[Debug] Expanding range: start_line=%d, end_line=%d", range.start_line, range.end_line))

  local filetype = vim.bo.filetype
	local parser = ts.get_parser(bufnr, filetype)
	if not parser then
		log("[Debug] No treesitter parser found for buffer")
		return range
	end

	local tree = parser:parse()[1]
	if not tree then
		log("[Debug] No treesitter tree available")
		return range
	end

	local root = tree:root()

	-- Find smallest enclosing scope node for start and end lines
	local function find_enclosing_scope(line, scopes)
		line = line - 1 -- convert to 0-based
		local node = root:named_descendant_for_range(line, 0, line, 0)
		log(string.format("[Debug] Finding enclosing scope for line %d", line + 1))
		while node do
			vim.notify(string.format("[Debug] Visiting node '%s'", node:type()))

      for _, v in ipairs(scopes) do
        if node:type() == v then
          log(string.format("[Debug] Found enclosing scope node: '%s'", node:type()))
          return node
        end
      end

			node = node:parent()
		end
		log("[Debug] No enclosing scope node found for line")
		return nil
	end

	local start_scope = find_enclosing_scope(range.start_line + 1, scopes)
	local end_scope = find_enclosing_scope(range.end_line + 1, scopes)

	if not start_scope or not end_scope then
		log("[Debug] Could not find start or end scope node; returning original range")
		return range
	end

	local sline, _, eline, _ = start_scope:range()
	local esline, _, eeline, _ = end_scope:range()

	local start_line = math.min(sline, esline)
	local end_line = math.max(eline, eeline)

	log(string.format("[Debug] Expanded scope lines: start_line=%d, end_line=%d", start_line, end_line))
	return { start_line = start_line, end_line = end_line }
end

-- Format all expanded changed scopes using conform.nvim
local function format_changed_scopes(bufnr, formatter, scopes)
	log("[Debug] Starting format_changed_scopes()")

	local changed_ranges = get_changed_ranges(bufnr)
	log(string.format("[Debug] Number of changed ranges: %d", #changed_ranges))

	if #changed_ranges == 0 then
		vim.notify("[Debug] No git hunks detected; skipping partial format.", vim.log.levels.INFO)
		log("[Debug] No git hunks detected; skipping partial format.")
		return
	end

	for i, range in ipairs(changed_ranges) do
		local expanded = expand_range_to_scope(bufnr, range, scopes)
		log(
			string.format(
				"[Debug] Formatting range #%d: lines %d to %d",
				i,
				expanded.start_line + 1,
				expanded.end_line + 1
			)
		)

		require("conform").format({
			buf = bufnr,
			range = {
				start = { expanded.start_line + 1, 0 }, -- conform.nvim expects 1-based line numbers
				["end"] = { expanded.end_line + 1, 0 },
			},
			async = false,
      formatters = { formatter },
		})
	end
	log("[Debug] Finished formatting changed scopes")
end

local function create_formater(filetype, formatter, scopes)

  local group_name = "format_augroup_for" .. filetype .. formatter
  local group = vim.api.nvim_create_augroup(group_name, { clear = true })

  -- Create the autocommand
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = group,
    pattern = "*."..filetype,
    callback = function(args)
      vim.print("[Debug] BufWritePre triggered for Go file formatter:" .. formatter)
      if not vim.bo.modified then
        vim.print("[Debug] File not changed, exiting early")
        return
      end

      format_changed_scopes(args.buf, formatter, scopes)
    end,
  })

  -- The following two autocommands listen for the two events published by
  -- Conform pre and post formatting and sends a Figlet notification accordingly.
  -- >>>
  -- vim.api.nvim_create_autocmd("User", {
  --   pattern = "ConformFormatPre",
  --   callback = function(event)
  --     print(vim.inspect(event))
  --     require("fidget").notify("Conform: Running " .. formatter, nil, { name = "conform", key = "conformid" })
  --   end,
  -- })
  -- vim.api.nvim_create_autocmd("User", {
  --   pattern = "ConformFormatPost",
  --   callback = function()
  --     require("fidget").notify("Conform: File Formatted", nil, { name = "conform", key = "conformid" })
  --   end,
  -- })
  -- <<<

end

create_formater("go", "goimports", {"import_declaration"})
create_formater("go", "gofumpt", {"expression_statement", "short_var_declaration", "assignment_statement", "if_statement", "function_declaration", "method_declaration", "type_spec"})
-- create_formater("go", "golines", {"expression_statement", "short_var_declaration", "assignment_statement", "if_statement", "function_declaration", "method_declaration", "type_spec"})
