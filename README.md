<h1 align="center"> Vector's VIMRC memo </h1>

- [X] vim-table-model
- [ ] coc-nvim
- [ ] auto-pairs
- [X] spell check
- [ ] fzf
- [X] [vim-visual-multi](https://github.com/mg979/vim-visual-multi)
- [X] [tabular](https://github.com/godlygeek/tabular)
- [X] [vim-surround](https://github.com/tpope/vim-surround)
- [X] [coc-translator](https://github.com/voldikss/coc-translator)

## Pre-requirements

- [X] `nodejs` - For coc.nvim.
- [X] `yarn` - For vim-instant-markdown.
- [X] `instant-markdown-d ` - For vim-instant-markdown.


## spell check usage

- `<LEADER>sc` : enable spell check
- `C-x` : replace the bad word
- `<LEADER>p` : jump to the previous bad word
- `<LEADER>n` : jump to the next bad word

Auto enable spell check for `markdown` files.

>autocmd BufRead,BufNewFile *.md call SetSpell()


## vim-instant-markdown

## tabular


Simple usage: line up at `=`.

```text
:Tabularize /=
```
`=` can be changed to any signs.

More complex usage can be found at [tabular-doc](https://github.com/godlygeek/tabular/blob/master/doc/Tabular.txt).

## vim-table-model

- `<LEADER>tm` : enable table model;
- `<LEADER>tdd` : delete row;
- `<LEADER>tdc` : delete column;
- `<LEADER>tic` : insert column;
- `[|` : move to the previous cell;
- `]|` : move to the next cell;
- `{|` : move to the left top corner of table;
- `}|` : move to the right bottom corner of table.
- `<LEADER>tt` : convert select part to table(only available in visual model)


## [vim-surround](https://github.com/tpope/vim-surround)

- `ysiw'` : change `word` to `'word'`
- `ds'` : change `'word'` to `word`
- `cs"'` : change `"word"` to `'word'`

## [vim-visual-multi](https://github.com/mg979/vim-visual-multi)

`<LEADER>` in my vimrc is `,`.
- `u` : undo
- `C-r` : redo
- `C-n` : select the next key
- `q` : skip and go to next
- `Q` : remove region under cursor
- `<Tab>` : switch between `Cursor Model` and `Extend Model`
- `C-Up` : add cursors up
- `C-Down` : ad cursors down
- `<LEADER>A` : select all words under cursor.


## [coc-translator](https://github.com/voldikss/coc-translator)

- `ts` : translate the words under cursor or in the selected region.

## some known issues

- [X] `bullets.vim` will cause selecting the first item in the candidate list via `<CR>` not work.
    >Using `<TAB>` instead of `<CR>`.
