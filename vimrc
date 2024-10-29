let mapleader=","

noremap  <silent> <leader>y "+yy
noremap  <silent> <leader>x "+dd
noremap  <silent> <leader>p "+p
vnoremap <silent> <leader>y "+y
vnoremap <silent> <leader>x "+x

nnoremap <silent> j gj
nnoremap <silent> k gk

nnoremap <silent> <esc>   :nohl<CR><esc>
nnoremap <esc>^[ <esc>^[
inoremap <expr>   <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr>   <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr>   <CR>    pumvisible() ? "\<C-y>" : "\<CR>"

nmap     <silent> <C-,> :e $MYVIMRC<cr>
nmap     <silent> <leader>zp :e $MYVIMRC<cr>
nmap     <silent> <m-h> <C-w>h
nmap     <silent> <m-l> <C-w>l
nmap     <silent> <m-j> <C-w>j
nmap     <silent> <m-k> <C-w>k

nmap <tab> :bn<cr>
nmap <s-tab> :bp<cr>

nmap ; :
nmap gh ^
nmap gl $
nmap gs 0
nmap ge G
nmap j  gj
nmap k  gk

imap <A-k> <up>
imap <A-j> <down>

nnoremap < <<
nnoremap > >>
nnoremap <c-u> <c-u>zz
nnoremap <c-d> <c-d>zz
nnoremap <c-b> <c-b>zz
nnoremap <c-f> <c-f>zz


inoremap <m-k> <up>
inoremap <m-j> <down>
inoremap <m-h> <left>
inoremap <m-l> <right>

" autocmd! BufEnter * :slient lcd %:p:h
" autocmd! BufEnter * :slient lchdir %:p:h

autocmd! BufWritePost $MYVIMRC source $MYVIMRC "| echom "Reloaded ".$MYVIMRC
autocmd! FocusGained,BufEnter * silent! checktime
autocmd! InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口


command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


""""""""""""""""""""""""""" options """""""""""""""""""""""""""
syntax on
filetype on
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set ar "autoread

set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim  "use windows short key
"behave mswin

set textwidth=0
set noswapfile
set nobackup
set nowb "writeback
"set backupdir=~/tmp
set hid

set nu "number
set rnu "relativenumber
set ru "ruler
set ai "auto indent
set ci "c indent
set wmnu "wild menu
set hls "highlight search
set ic "ignorecase
set smartcase
set lazyredraw
set magic
set showmatch


"guifont
"set gfn=Consolas:h11
set gfn=Sarasa\ Fixed\ SC\ Nerd\ Font:h12

set ls=2 "laststatus
set ts=4 "tab stop
set sts=4 "soft tab stop
set sw=4 "shift width
" set bs=2 "backspace
set bs=eol,start,indent
set whichwrap+=<,>,h,l

set so=7 "source
set et "expand tab

set enc=utf-8 "encoding
set fenc=utf-8 "file encoding
set fencs=utf-8,gbk,big5,gb18030,latin1
"set fdm=indent "fold method
set history=500
set shm=atI "short mess: no default boot info
set ssop-=curdir "session options
set ssop+=sesdir "session options

set ruler
set cul "cursor line
"set cuc "cursor culumn
set nocuc
set cmdheight=1
set regexpengine=0

set noeb "noerrorbells
set novb "novisualbell
" set vb t_vb=

set tm=500
set timeoutlen=250
set autochdir

" set clipboard=unnamed
set completeopt=menu,menuone
" set completeopt=menu,menuone,noinsert,noselect

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif


"*****************   plug.vim *****************************
let VIMRC_DIR = fnamemodify($MYVIMRC, ":h")
if empty(glob('~/$VIMRC_DIR/autoload/plug.vim'))
    silent !curl -fLo ~/$VIMRC_DIR/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-endwise'
Plug 'Raimondi/delimitMate'
Plug 'andymass/vim-matchup'
Plug 'markonm/traces.vim'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'rhysd/clever-f.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'moll/vim-bbye'
Plug 'voldikss/vim-floaterm'
"Plug 'RRethy/vim-illuminate'

Plug 'tomtom/tcomment_vim'
Plug 'Yggdroot/indentLine'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-autoformat/vim-autoformat'

Plug 'lifepillar/vim-solarized8'
Plug 'lifepillar/vim-cheat40'

Plug 'derekwyatt/vim-fswitch'
Plug 'preservim/tagbar'

Plug 'mattn/emmet-vim'

Plug 'bfrg/vim-cpp-modern'

"Plug 'ycm-core/YouCompleteMe'

call plug#end()

nnoremap <leader>ii :PlugClean!  \| :PlugInstall<CR>
nnoremap <leader>iu :PlugUpgrade \| :PlugUpdate<CR>


"*****************   easy-align   ***************************
xmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)


"*****************   nerdtree   ***************************
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:NERDTreeWinPos = "left"
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
" nnoremap <leader>l :NERDTreeFind<CR>
nnoremap <leader>l :NERDTreeToggle<CR>
"autocmd VimEnter * NERDTree

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

let g:nerdtree_sync_cursorline = 1


"*****************   lightline *****************************
let g:lightline = {
            \ 'active':  { 'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ], },
            \'inactive': { 'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ], },
            \}


"*****************   clever-f *****************************
let g:clever_f_smart_case = 1


"*****************   ctrlp *****************************
let g:ctrlp_lazy_update=1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.gitignore', '.git']
let g:ctrlp_custom_ignore = { 'dir':'\v[\/](\.git|\.github|\.vs|\.idea|build|out|Doc|Docs|Debug|Release|Depends)$', 'file': '\v\.(exe|so|lib|pdb|dll|7z|zip|tar|tar.gz|pyc)$' }
" let g:ctrlp_custom_ignore = { 'file':'\v(\.c|\.cc|\.cpp|\.cxx|\.h|\.hh|\.py|\.css|\.ui|\.xml|\.json|\.txt|\.in)@<!$', 'dir':'\v[\/]\.(git|hg|svn|idea|vs)$', 'link':'*', }


"*****************   auto-format *****************************
" let g:formatterpath = [$LLVM.'/bin', 'clang-format']
let g:autoformat_autoindent = 1
let g:autoformat_retab = 1
let g:autoformat_remove_trailing_spaces = 1

"""""" use custom via https://harttle.land/2015/07/18/vim-cpp.html
" let g:formatdef_harttle = '"astyle --style=attach --pad-oper"'
" let g:formatters_cpp = ['harttle']
" let g:formatters_java = ['harttle']
" let g:formatdef_clangformat = "'clang-format -lines='.a:firstline.':'.a:lastline.' --assume-filename=\"'.expand('%:p').'\"--style=file --fallback-style=Microsoft'"

" au BufWrite * :Autoformat "!!SLOW

map  <C-K> :Autoformat<CR>
imap <C-K> <c-o>:Autoformat<CR>


"*****************   tagbar *****************************
nmap <leader>o :TagbarToggle<CR>
imap <leader>o <c-o>:TagbarToggle<CR>


"*****************   floaterm ****************************
let g:floaterm_width=0.85
let g:floaterm_height=0.80
let g:floaterm_title='Terminal'
let g:floaterm_autoclose=2
nmap <M-=> <cmd>:FloatermToggle<CR>
imap <M-=> <cmd>:FloatermToggle<CR>
xmap <M-=> <cmd>:FloatermToggle<CR>
tmap <M-=> <cmd>:FloatermToggle<CR>
tmap <esc> <cmd>:FloatermHide<CR>


"*****************   fswitch *****************************
nmap <silent> <m-o> :FSHere<cr>
augroup mycppfiles
    au!
    au BufEnter *.h let b:fswitchdst  = 'cpp,cc'
    au BufEnter *.h let b:fswitchlocs = 'reg:/include/src/,reg:/include.*/src/,./src/'
    au BufEnter *.cpp let b:fswitchdst  = 'h,hpp'
    au BufEnter *.cpp let b:fswitchlocs = 'reg:/include/src/,reg:/include.*/src/,../src,../'
augroup END


"*****************   emmet *****************************
autocmd FileType html,css,xml,ui EmmetInstall



"*****************   youcompleteme *****************************
" let g:ycm_use_ultisnips_completer=1
let g:ycm_global_ycm_extra_conf=$HOME.'/.vim/.ycm_extra_conf.py'
let g:ycm_key_list_stop_completion = [ '<C-y>', '<Enter>' ]
let g:ycm_filepath_blacklist = {}
let g:ycm_filetype_whitelist = { "h":1, "hh":1, "hpp":1, "c":1, "cc":1, "cpp":1, "py":1, }
let g:ycm_filepath_blacklist = { 'html':1, 'xml':1, 'jsx':1, 'exe':1, 'xlsx':1, 'docx':1, 'pptx':1, 'lib':1, 'dll':1, 'log':1, 'tlog':1}
let g:ycm_filetype_specific_completion_to_disable = { 'gitcommit':1, 'startify':1, 'vim':1, }
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'


"*****************   c++ highlight *****************************
let g:cpp_function_highlight = 1
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1



"*****************   theme|color **************************
if has('gui_running')
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
    set  background=light
    colo solarized8
else
    set  background=dark
    " colo desert
    " colo industry
    " hi Visual ctermfg=white ctermbg=lightred
    "hi CursorLine ctermfg=white ctermbg=23 cterm=NONE
endif


""" REFERENCE
""" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
