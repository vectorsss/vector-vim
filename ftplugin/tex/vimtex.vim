" setting for VimTex
let g:vimtex_view_general_viewer = 'skim'
let g:vimtex_view_method = 'skim'
let g:vimtex_view_skim_sync = 1
let g:vimtex_view_skim_reading_bar = 1
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_view_automatic = 1
let g:vimtex_fold_manual = 1
let g:vimtex_quickfix_mode=0
let g:vimtex_matchparen_enabled = 0
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif
nmap <LEADER>c :set conceallevel=1<CR>
let g:tex_conceal='abdmg'
let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-pdf',
    \ 'pdfdvi'           : '-pdfdvi',
    \ 'pdfps'            : '-pdfps',
    \ 'pdflatex'         : '-pdf',
    \ 'luatex'           : '-lualatex',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \}
