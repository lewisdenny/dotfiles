local command = function()
  local tags_list = vim.g.go_tags or {}
  local tags = table.concat(tags_list, ",")

  local cmd={
    'golangci-lint',
    'run',
    '--output.json.path=stdout',
    '--show-stats=false',
    '--concurrency=1', --Note: Testing shows this is faster, not sure why
  }
  if tags ~= "" then
    table.insert(cmd, 2, '--build-tags=' .. tags)
  end
  return cmd
end

return {
  cmd = { 'golangci-lint-langserver' },
  filetypes = { 'go', 'gomod' },
  init_options = {
    command = command(),
  },

  root_markers = {
    '.golangci.yml',
    '.golangci.yaml',
    '.golangci.toml',
    '.golangci.json',
    'go.work',
    'go.mod',
    '.git',
  },
}
