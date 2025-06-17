# Dots

```shell
            __                         __
           /%%\                  ^    /%%\
       ^  /%%%%\      *-*            /%%%%\
   ^     /%%%%%%\______|____________/%%%%%%\
          |""""|%%%/^\%%%/^\%%%/^\%%%|""""|   ^
          | H  |%%%|H|%%%|H|%%%|H|%%%| H  |      ^
          |    |¾¾¾¾¾¾¾¾¾¾¾¾¾¾¾¾¾¾¾¾¾|    |
          |    |   HHH   HHH   HHH   |    |
()) ______|    |_____________________|    |_____  ()
(()/%/^\%%|    |%%%%%%%%%%%%%%%%%%%%%|    |%%/^\%\(()
()/%%|H|%%|    |%%%%%%%%%%%%%%%%%%%%%|    |%%|H|%%\()
)/%%%%%%%%|    |  ___  _/-o-\_  ___  |    |%%%%%%%%\(
()| HH HH |    |  HHH   | | |   HHH  |    | HH HH |()
|||_______|____|__HHH___|_|_|___HHH__|____|_______|||
_________________________   _________________________
               A man's ~ is his castle
```

---

## Todo

- [ ] conform - Toggle formatting of whole file vs only modified lines

## Language support

### Python

| Formatter | Linter | LSP |
| --------------- | --------------- | --------------- |
| ruff_organize_imports (conform) | ruff(nvim-lint) | basedpyright |
| ruff_fix (conform) | basedpyright(lsp) |  |
| ruff_format (conform) |  |  |

> [!NOTE]
> Ruff LSP would be prefered but it doesn't support organizing imports yet
> so rather than splitting formatting in LSP and Conform just use conform
> for now.
