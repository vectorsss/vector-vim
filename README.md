<h1 align="center"> Vector's VIMRC memo </h1>


<!-- TOC GFM -->

* [Pre-requirements](#pre-requirements)
* [spell check usage](#spell-check-usage)
* [vim-instant-markdown](#vim-instant-markdown)
* [tabular](#tabular)
* [vim-table-model](#vim-table-model)
* [vim-surround](#vim-surround)
* [vim-visual-multi](#vim-visual-multi)
* [coc-translator](#coc-translator)
* [other visual enhancement](#other-visual-enhancement)
* [bullets.vim](#bulletsvim)
* [vim-xtabline](#vim-xtabline)
* [vim-move](#vim-move)
* [coc-snippets T.B.A](#coc-snippets-tba)
* [some known issues](#some-known-issues)
* [To-do](#to-do)

<!-- /TOC -->
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

## other visual enhancement

- [vim-xtabline](https://github.com/mg979/vim-xtabline): pretty the tab line;
- [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons)

  need some pre-requirements
    * [nerd-fonts](https://github.com/ryanoasis/nerd-fonts)
      ```shell
      brew tap homebrew/cask-fonts
      brew install --cask font-hack-nerd-font
      ```
      Set your terminal font to `Hack Nerd Font Mono` or `Hack Nerd Font`. The following figure show the comparison between proportional font and monospaced font.

![comparison between proportional font and monospaced font](https://image.i-ll.cc//uPic/20220122/phEM1j.jpg)

## [bullets.vim](https://github.com/dkarter/bullets.vim)

- `<leader>x` : set the current checkbox as completion.

## [vim-xtabline](https://github.com/mg979/vim-xtabline)

- `to` : switch among the modes in the list ['tabs', 'buffers']
- `\p` : show the path of current file


## [vim-move](https://github.com/matze/vim-move)

- `C-j` : move the current line down


## [coc-snippets](https://github.com/neoclide/coc-snippets) T.B.A

- `<TAB>` : trigger completion, select next and jump to next like VSCode
- `<S-TAB>` : select previous and jump to previous like VSCode.
- `C-e` : trigger snippet expand in `insert` mode.
- `C-s` : select the text under the visual placeholder of snippet in `visual` mode.
- `C-s` : expand snippet or jump(expand has higher priority).


## some known issues

- [X] `bullets.vim` will cause selecting the first item in the candidate list via `<CR>` not work.
    >Using `<TAB>` instead of `<CR>`.

## To-do

- [X] vim-table-model
- [ ] coc-nvim
- [ ] coc-snippets
- [ ] auto-pairs
- [X] spell check
- [ ] fzf
- [X] [vim-visual-multi](https://github.com/mg979/vim-visual-multi)
- [X] [tabular](https://github.com/godlygeek/tabular)
- [X] [vim-surround](https://github.com/tpope/vim-surround)
- [X] [coc-translator](https://github.com/voldikss/coc-translator)
- [X] [vim-xtabline](https://github.com/mg979/vim-xtabline)

