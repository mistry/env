syntax enable 
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans =1       
let g:solarized_degrade   =0       
let g:solarized_bold      =1       
let g:solarized_underline =1       
let g:solarized_italic    =1       
let g:solarized_contrast  ="normal"
let g:solarized_visibility="normal"
colorscheme solarized
if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

set more                      " use more prompt
set autoread                  " watch for file changes
set diffopt+=iwhite
set hidden
set noautowrite               " don't automagically write on :next
set lazyredraw                " don't redraw when don't have to
set showmode
set showcmd
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set scrolloff=3               " keep at least 5 lines above/below
set sidescrolloff=3           " keep at least 5 lines left/right
set backspace=indent,eol,start
set linebreak
set cmdheight=2               " command line two lines high
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal
set noerrorbells              " No error bells please
set shell=bash
set fileformats=unix
set ff=unix
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins
set wildmode=longest:full
set wildmenu                  " menu has tab completion
set laststatus=2
"  searching
set incsearch                 " incremental search
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set diffopt=filler,iwhite     " ignore all whitespace and sync

