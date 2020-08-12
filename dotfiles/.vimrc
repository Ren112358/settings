"--------------------
" dein setting
"--------------------

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

" dein settings
" auto install dein
let s:cache_home    = expand('~/.cache')
let s:dein_dir      = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

" read plugins and make cache
let s:toml_dir  = s:dein_dir . '/userconfig'
let s:toml      = s:toml_dir . '/plugins.toml'
let s:lazy_toml = s:toml_dir . '/lazy_plugins.toml'
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " read TOML files
    call dein#load_toml(s:toml     , {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

"deinvim Plug-in: indentLine"
let g:indentLine_color_term=111
let g:indentLine_color_gui='#708090'
let g:indentLine_char='|'


"--------------------
" indent
"--------------------
filetype plugin indent on

"--------------------
" syntax
"--------------------
syntax on

"--------------------
" color
"--------------------
colorscheme lucario
highlight Type ctermfg=cyan
highlight Comment ctermfg=green
highlight Visual cterm=reverse
highlight Search ctermfg=23, ctermbg=186
highlight Todo cterm=reverse ctermfg=190 gui=reverse guifg=Yellow
highlight Pmenu ctermbg=26
highlight PmenuSel cterm=reverse

"--------------------
" set
"--------------------
set t_Co=256
set expandtab
set smarttab
set showcmd
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set title
set number
set list
set listchars=tab:>-,trail:-
set encoding=utf-8
set nocompatible
set backspace=indent,eol,start
set noignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan
set showmatch
set matchtime=1
set history=200
set completeopt=menuone
set ttyfast

"--------------------
" nnoremap
"--------------------
nnoremap j gj
nnoremap k gk

"--------------------
" inoremap
"--------------------
inoremap () ()
inoremap [] []
inoremap {} {}
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
inoremap # X<C-H>#
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap :<Enter> :<CR><ESC><S-o>

"--------------------
" cnoremap
"--------------------
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

"--------------------
" ideographic space
"--------------------
function! IdeographicSpace()
    highlight IdeographicSpace cterm=reverse ctermfg=Yellow gui=reverse guifg=Yellow
endfunction

if has('syntax')
    augroup IdeographicSpace
        autocmd!
        autocmd ColorScheme * call IdeographicSpace()
        autocmd VimEnter,WinEnter * match IdeographicSpace /　/
    augroup END
    call IdeographicSpace()
endif

" ------------------
" auto-comment-out off
" ------------------
augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END
