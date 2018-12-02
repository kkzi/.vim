set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim  "use windows short key
"behave mswin


let mapleader=","
map <silent> <leader>ss :so ~/vimfiles/vimrc<cr>
map <silent> <leader>ee :e ~/vimfiles/vimrc<cr>
map <silent> <leader>oo :so session.vim<cr>
map <silent> <leader>mm :mks!<cr>

noremap <silent> <leader>y "+yy
noremap <silent> <leader>x "+dd
noremap <silent> <leader>p "+p
vnoremap <silent> <leader>y "+y
vnoremap <silent> <leader>x "+x
inoremap <silent> <leader>p <c-r>+

au! bufwritepost _vimrc so $vim/_vimrc "autocmd
map <silent> <leader>,mf GUIEnter * simalt ~x


" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

inoremap <m-k> <up>
inoremap <m-j> <down>
inoremap <m-l> <right>
inoremap <m-h> <left>

syntax on
filetype on
filetype plugin on
filetype indent on

set nocuc 
set noswapfile
set nobackup
set nowb "writeback
"set backupdir=~/tmp

set nu "number
set rnu "relativenumber
set ru "ruler
set ai "auto indent
set ci "c indent
set ar "autoread
set wmnu "wild menu
set hls "highlight search
set ic "ignorecase

set gfn=consolas:h11
"set gfn=menlo:h11
set ts=4 "tab stop
set sts=4 "soft tab stop
set sw=4 "shift width
set bs=2 "backspace
set et "expand tab

set enc=utf-8 "encoding
set fenc=utf-8 "file encoding
set fencs=utf-8,gbk,big5,gb18030,latin1
"set fdm=indent "fold method
set hi=100 "history
"set go-=T "gui options
"set go-=m 
set shm=atI "short mess: no default boot info
set ssop-=curdir "session options
set ssop+=sesdir "session options

set cul "cursor line
"set cuc "cursor culumn

set noeb "noerrorbells
set novb "novisualbell
"set vb t_vb=
"
colo desert




"plug.vim
call plug#begin('~/vimfiles/plugged')
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-unimpaired'
Plug 'terryma/vim-expand-region'
Plug 'easymotion/vim-easymotion'
"Plug 'Valloric/YouCompleteMe'
call plug#end()
