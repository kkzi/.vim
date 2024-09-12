let mapleader=","

nnoremap <silent> <leader>y "+yy
nnoremap <silent> <leader>x "+dd
nnoremap <silent> <leader>p "+p
vnoremap <silent> <leader>y "+y
vnoremap <silent> <leader>x "+x

nnoremap ; :
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

nnoremap <silent> <C-,>   :e $MYVIMRC<cr>
nnoremap <silent> <Esc>   :nohl<CR>
inoremap <expr>   <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr>   <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <silent> <Tab>   :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>
nnoremap <silent> <M-w>   :bd<CR>

nnoremap <silent> <M-h> <C-w>h
nnoremap <silent> <M-l> <C-w>l
nnoremap <silent> <M-j> <C-w>j
nnoremap <silent> <M-k> <C-w>k
inoremap <silent> <M-h> <left>
inoremap <silent> <M-l> <right>
inoremap <silent> <M-k> <up>
inoremap <silent> <M-j> <down>

" for when you mess up and hold shift too long (using ! to prevent errors while
" sourcing vimrc after it was updated)
command! W w
command! WQ wq
command! Wq wq
command! Q q

" changing file types:
command! DOS  set ff=dos  " force windows style line endings
command! UNIX set ff=unix " force unix style line endings
command! MAC  set ff=mac  " force mac style line endings


""""""""""""""""""""""""""" options """""""""""""""""""""""""""
" Syntax highlighting
syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on


set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim  "use windows short key
"behave mswin

set textwidth=0
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

"guifont
"set gfn=Consolas:h11
set gfn=Sarasa\ Fixed\ SC\ Nerd\ Font:h12

set ls=2 "laststatus
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
" set vb t_vb=

"set timeoutlen=250
set autochdir

" set clipboard=unnamed
set completeopt=menu,menuone
" set completeopt=menu,menuone,noinsert,noselect



" autocmd! BufEnter * :slient lcd %:p:h
" autocmd! BufEnter * :slient lchdir %:p:h

autocmd! BufWritePost $MYVIMRC source $MYVIMRC "| echom "Reloaded ".$MYVIMRC

let $PATH .= ';'.$VIMRUNTIME.'\\3rdparty'
autocmd! InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口


"*****************   plug.vim *****************************
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'altercation/vim-colors-solarized'
Plug 'ap/vim-buftabline'
Plug 'maciakl/vim-neatstatus'
Plug 'itchyny/vim-cursorword'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-endwise'
Plug 'Raimondi/delimitMate'
Plug 'andymass/vim-matchup'
Plug 'markonm/traces.vim'
Plug 'zczsyqxl/vim-alignment'
Plug 'easymotion/vim-easymotion'
Plug 'rhysd/clever-f.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'moll/vim-bbye'
Plug 'voldikss/vim-floaterm'

Plug 'tomtom/tcomment_vim'
Plug 'Yggdroot/indentLine'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-autoformat/vim-autoformat'

Plug 'derekwyatt/vim-fswitch'
Plug 'preservim/tagbar'

Plug 'mattn/emmet-vim'

"Plug 'ycm-core/YouCompleteMe'
Plug 'bfrg/vim-cpp-modern'

" Plug 'aklt/plantuml-syntax'

Plug 'Donaldttt/fuzzyy'
call plug#end()


nnoremap <leader>ii :PlugClean!  \| :PlugInstall<CR>
nnoremap <leader>iu :PlugUpgrade \| :PlugUpdate<CR>

"*****************   Startify   ***************************
nmap <leader>h <cmd>:Startify<CR>
let g:startify_enable_special = 0
let g:startify_disable_at_vimenter = 1
" let g:startify_lists = [ { 'type': 'files', 'header': ['   MRU']}, ]


"*****************   nerdtree   ***************************
let g:NERDTreeWinPos = "right"
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
" nnoremap <leader>l :NERDTreeFind<CR>
" nnoremap <leader>l :NERDTreeToggle<CR>
"autocmd VimEnter * NERDTree

let g:nerdtree_sync_cursorline = 1


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
nmap <M-`> <cmd>:FloatermToggle<CR>
imap <M-`> <cmd>:FloatermToggle<CR>
xmap <M-`> <cmd>:FloatermToggle<CR>
tmap <M-`> <cmd>:FloatermToggle<CR>
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
    set  background=light
    colo solarized
else
    set  background=dark
    " colo desert
    " colo industry
    " hi Visual ctermfg=white ctermbg=lightred
    " hi CursorLine ctermfg=white ctermbg=23 cterm=NONE
endif
