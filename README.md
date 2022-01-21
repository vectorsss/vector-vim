<h1 align="center"> Vector's VIMRC memo </h1>

- [X] vim-table-model
- [ ] coc-nvim
- [ ] auto-pairs
- [X] spell check
- [ ] fzf

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

## some known issues

- [ ] `bullets.vim` will cause selecting the first item in the candidate list via `<CR>` not work.
    >Using `<TAB>` instead of `<CR>`.
