"                 _                     _                    
" __   _____  ___| |_ ___  _ __  __   _(_)_ __ ___  _ __ ___ 
" \ \ / / _ \/ __| __/ _ \| '__| \ \ / / | '_ ` _ \| '__/ __|
"  \ V /  __/ (__| || (_) | |     \ V /| | | | | | | | | (__ 
"   \_/ \___|\___|\__\___/|_|      \_/ |_|_| |_| |_|_|  \___|
"                                                            


" ===
" === Auto load for first time uses
" ===

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ===
" === System
" ===

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
" clearing uses the current background color
let &t_ut=''


" ===
" === Main code display
" ===
set number
set relativenumber
set ruler
set cursorline
set wrap
syntax on
syntax enable



" ===
" === Editor behavior
" ===

" Better tab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
" set the display of <tab> and <space> at the <EOL>
set list
set listchars=tab:▸\ ,trail:▫
" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=5
" Prevent auto line split
set wrap
set textwidth=0

set indentexpr=
" Better backspace
set backspace=indent,eol,start

set foldmethod=indent
set foldlevel=99

" set the cursor shape for different model
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" ===
" === Status/command bar
" ===

set showcmd
set autochdir
set laststatus=2
"set formatoptions-=tc

" Show command autocomplete
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu
set wildmode=longest,list,full


" Searching options
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

" ===
" === Restore Cursor Position
" ===

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Basic Mappings
" ===

" set <LEADER> as <SPACE>
let mapleader=" "

" save, quit and reload
map Q :q<CR>
map S :w<CR>
map R :source $MYVIMRC<CR>

" Open the vimrc file anytime
map <LEADER>vc :e ~/.vim/vimrc<CR>

" speedup moving
noremap J 5j
noremap K 5k
noremap L 5l
noremap H 5h

" make cursor in the center of screen when we choose the searching result
noremap n nzz
noremap N Nzz

" no highlight search result
noremap <ESC><CR> :nohlsearch<CR>

" disable the default s key
noremap s <nop>

" ===
" === Window Management
" ===

" split operation
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>

" move the cursor
map <LEADER>w <C-w>w
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l


" Place the two screens vertically
noremap <LEADER>K <C-w>t<C-w>K
" Place the two screens horizontally
noremap <LEADER>H <C-w>t<C-w>H


" resize the editor
"map <up> :res+5<CR>
"map <down> :res-5<CR>
"map <left> :vertical resize-5<CR>
"map <right> :vertical resize+5<CR>


" ===
" === Tab management
" ===

" move tab operation, new/move/close
map te :tabe<cR>
map tn :tabn<CR>
map tp :tabp<CR>
map tc :tabc<CR>



" ===
" === Other useful tools
" ===

" Press space twice to jump to the next '<++>' and edit it
" map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i

" Spelling Check with <space>sc
map <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s

" Copy to system clipboard(register *)
vnoremap Y "*y

" Call figlet
map tx :r !figlet 

" Compile function
map <LEADER>b :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc

"map R :call CompileBuildrrr()<CR>
"func! CompileBuildrrr()
  "exec "w"
  "if &filetype == 'vim'
    "exec "source $MYVIMRC"
  "elseif &filetype == 'markdown'
    "exec "echo"
  "endif
"endfunc


" ===
" === Plugins
" ===
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go', {'for': 'go' ,'do': ':GoUpdateBinaries' }
Plug 'SirVer/ultisnips'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'
call plug#end()


" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

" ===
" === vimwiki
" ===
let g:vimwiki_list = [{
  \ 'automatic_nested_syntaxes':1,
  \ 'path_html': '~/wiki_html',
  \ 'path': '~/wiki',
  \ 'template_path': '~/.vim/vimwiki/template/',
  \ 'syntax': 'markdown',
  \ 'ext':'.md',
  \ 'template_default':'markdown',
  \ 'custom_wiki2html': '~/.vim/vimwiki/wiki2html.sh',
  \ 'template_ext':'.html'
\}]

autocmd BufRead,BufNewFile *.md set filetype=vimwiki

let g:taskwiki_sort_orders={"C": "pri-"}
let g:taskwiki_syntax = 'markdown'
let g:taskwiki_markdown_syntax='markdown'
let g:taskwiki_markup_syntax='markdown'
source ~/.vim/markdown-snippets.vim


" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>
