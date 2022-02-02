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
let g:tex_flavor="latex"

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
map te :tabe<CR>
map tn :tabn<CR>
map tp :tabp<CR>
map tc :tabc<CR>



" ===
" === Other useful tools
" ===

" Press space twice to jump to the next '<++>' and edit it
" map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i

" Spelling Check with <space>sc
map <LEADER>sc :call SetSpell()<CR>
function SetSpell()
  set spell!
  noremap <C-x> ea<C-x>s
  inoremap <C-x> <Esc>ea<C-x>s
  hi SpellBad cterm=underline ctermfg=red
  noremap <LEADER>p [s
  noremap <LEADER>n ]s
endfunction


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
  endif
endfunc



" ===
" === Plugins
" ===
call plug#begin('~/.vim/plugged')

" Pretty vim
Plug 'vim-airline/vim-airline' " status line
Plug 'ajmwagar/vim-deus' " color scheme
" Other visual enhancement
Plug 'luochen1990/rainbow'
Plug 'RRethy/vim-illuminate' " General highlight
Plug 'mg979/vim-xtabline' " tab line
Plug 'ryanoasis/vim-devicons' " icons

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" auto completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', {'for': 'go', 'tag': '*' }
Plug 'honza/vim-snippets' " snippets

" Git
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim', {'for': 'markdown'}
Plug 'ferrine/md-img-paste.vim', {'for': ['markdown', 'tex']}

" latex
Plug 'lervag/vimtex'
" Editor Enhancement
Plug 'jiangmiao/auto-pairs'
Plug 'matze/vim-move'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround' " type ysiw' to wrap the word with '', type cs'` to change 'word' to `word`, type ds' to change 'word' to word
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()

" ===
" === ajmwagar/vim-deus
" ===
set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark    " Setting dark mode
colorscheme deus
let g:deus_termcolors=256
" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 1
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
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_theme = 'light'
let g:mkdp_port = '12333'
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']
source ~/.vim/markdown-snippets.vim
autocmd BufRead,BufNewFile *.md call SetSpell()


" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>

" ===
" === coc-nvim
" ===

let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-vimlsp',
  \ 'coc-snippets',
  \ 'coc-translator']

set hidden
set updatetime=100
set shortmess+=c
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use gh to show documentation in preview window.
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" ===
" === coc-snippets
" ===
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
imap <C-e> <Plug>(coc-snippets-expand)
vmap <C-s> <Plug>(coc-snippets-select)
imap <C-s> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'Zhao Chi'
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)



" ===
" === vim-illuminate
" ===
let g:Illuminate_delay = 500


" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = "l"
let NERDTreeMapUpdirKeepOpen = ""
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"


" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "✹",
  \ "Staged"    : "✚",
  \ "Untracked" : "✭",
  \ "Renamed"   : "➜",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "✗",
  \ "Clean"     : "✔︎",
  \ "Unknown"   : "?"
  \ }

" ==
" == GitGutter
" ==
" let g:gitgutter_signs = 0
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
" autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap <LEADER>gh :GitGutterPreviewHunk<CR>
nnoremap <LEADER>gp :GitGutterPrevHunk<CR>
nnoremap <LEADER>gn :GitGutterNextHunk<CR>
" ===
" === rainbow
" ===
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'separately': {
\		'nerdtree': 0,
\	}
\}
" ===
" === vim-xtabline
" ===
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
let g:xtabline_settings.theme = 'dracula'
nmap <silent><expr> <BS> v:count ? "\<Plug>(XT-Select-Buffer)" : ":Buffers\r"
noremap to :XTabMode<CR>
noremap \p :echo expand('%:p')<CR>
" ===
" === matze/vim-move
" ===
let g:move_key_modifier = 'C'

" ===
" === vim-markdown-toc
" ===
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 0
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'
" ===
" === coc-translator
" ===
nmap ts <Plug>(coc-translator-p)
vmap ts <Plug>(coc-translator-pv)
" ===
" === vim-visual-multi
" ===
let g:VM_leader           = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps             = {}
let g:VM_maps['Motion ,'] = ',,'
let g:VM_maps["Undo"]     = 'u'
let g:VM_maps["Redo"]     = '<C-r>'
" ===
" === fzf.vim
" ===
noremap <silent> <C-p> :Files<CR>
noremap <silent> <C-f> :Rg<CR>
noremap <LEADER>; :History
" ===
" === md-img-paste.vim
" ===
autocmd FileType tex let g:mdip_imgdir = 'figures'
autocmd FileType tex let g:mdip_imgdir_intext = 'figures'
autocmd FileType tex let g:mdip_imgname = 'figure'
autocmd FileType tex let g:PasteImageFunction = 'g:LatexPasteImage'
autocmd FileType markdown let g:PasteImageFunction = 'g:MarkdownPasteImage'
autocmd FileType markdown,tex nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" ===
" === VimTex
" ===
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'
let maplocalleader = ","
let g:vimtex_view_automatic = 1
let g:tex_flavor = 'latex'
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif
