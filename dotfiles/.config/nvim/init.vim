" ====================
" === dein setting ===
" ====================

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
"if no-match plugins
let s:cache_home    = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:config_home   = empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME
let s:dein_dir      = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

" read plugins and make cache
let s:toml_dir  = s:config_home . '/nvim'
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
syntax on

" If you want to install not installed plugins on startup.
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
"End of dein Scripts-------------------------



" ====================
" === Vim Settings ===
" ====================

" Vim scripts ----------------------------
" change indent width depending on file type
filetype plugin indent on

" syntax
syntax on

" color
colorscheme lucario

" highlight
highlight Type ctermfg=cyan
highlight Comment ctermfg=green
highlight Function ctermfg=215
highlight Visual cterm=reverse
highlight Search cterm=reverse gui=reverse
highlight Todo cterm=reverse ctermfg=yellow gui=reverse guifg=yellow
highlight Pmenu ctermbg=26
highlight PmenuSel cterm=reverse

" set
set t_Co=256 " 256 colored screen

set expandtab  " tab -> spaces
set smarttab  " auto indent when you return line
set shiftwidth=4  " 4 spaces for 1 indent when you return line
set tabstop=4  " 1 tab = 4 spaces
set autoindent   " automatically make indent when you return line
set smartindent  " automatic indent if you have {
set showcmd
set title
set number  " show row number
set list  " visualize space
set showmatch " visualize matched parenthesis
set listchars=tab:>-,trail:-
set encoding=utf-8
set backspace=indent,eol,start
set noignorecase  " distinguish upper and lower letters
set smartcase
set incsearch
set hlsearch  " highlight searched items
set wrapscan  " go to the first searched iterm when arrived at the last
set matchtime=1
set history=200  " save 200 search patterns
set completeopt=menuone
"set spell
"set spelllang=en,cjk

" nnoremap
nnoremap j gj
nnoremap k gk

" inoremap
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

" cnoremap
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" ideographic space
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

" auto-comment-out off
augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END

" disable tex conceal
let g:tex_conceal=''

" End of vim scripts ----------------------------
