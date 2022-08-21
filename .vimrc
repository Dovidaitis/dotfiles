syntax on
set nocompatible
set number
set background=dark


filetype plugin on

set tabstop=4
set shiftwidth=4
" allow long lines to extend as far as line goes
set nowrap

" highlighting when doing search
set hlsearch

" auto completion after pressing TAB
set wildmenu

" --- Plugins ---

call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'

call plug#end()
 
" ---------------


" ---  Status Line ---

" left side
set statusline=
set statusline+=\%F

" seperation
set statusline+=%=

" right side
set statusline+=\ [ascii:\ %b\]\ [hex:\ 0x%B\]\ [row:\ %l\ col:\ %c\]
set laststatus=2

" -------------------

