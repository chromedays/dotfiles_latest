set nocompatible

" Plugins {{{
"" Plugin Manager
if has("win32")
    call plug#begin('$HOME\vimfiles\plugged')
else
    call plug#begin('~/.vim/plugged')
endif

""" Basics
Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
Plug 'flazz/vim-colorschemes'
Plug 'jszakmeister/vim-togglecursor'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-vinegar'
Plug 'embear/vim-localvimrc'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-dispatch'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'vim-airline/vim-airline'
Plug 'mh21/errormarker.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vitalk/vim-simple-todo'
"if has('unix')
    "Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"endif

"Plug 'tpope/vim-fugitive'
"Plug 'junegunn/gv.vim'
"Plug 'lifepillar/vim-mucomplete'
"Plug 'sirver/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'tpope/vim-projectionist'
"Plug 'amiorin/vim-project'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'junegunn/goyo.vim'
"Plug 'junegunn/limelight.vim'
"Plug 'stefandtw/quickfix-reflector.vim'

call plug#end()
" }}}

" Plugin Settings {{{

let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0

let g:asyncrun_auto = 'make'
let g:asyncrun_open = 6
let g:asyncrun_status = ''
"let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

let g:buffergator_autoexpand_on_split = 0

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

let g:simple_todo_map_insert_mode_keys = 0

let g:togglecursor_force = 'xterm'

" }}}

" Shared configurations (can be used by other vim emulators) {{{

" General
let mapleader="\<Space>"
let maplocalleader=","
set hidden "Allow background buffers without saving
set spell spelllang=en_us
set splitright "Split to right by default
set nospell

if has('gui_running')
    colorscheme dracula
else
    if has('win32')
        colorscheme default
    else
        colorscheme dracula
    endif
endif

" Text Wrapping
set textwidth=80
set colorcolumn=81
set nowrap
" Search and Substitute
set gdefault "Use global flag by default in s: commands
set hlsearch "Highlight searches
set ignorecase
set smartcase "Don't ignore capitals in searches
nnoremap <leader>hh :set hls!<cr>

" Mapping - Switching to normal mode
inoremap jk <Esc>
inoremap jK <Esc>
inoremap Jk <Esc>
inoremap JK <Esc>
nnoremap <leader>w :w <cr>
nnoremap <leader>j :cn <cr>
nnoremap <leader>k :cp <cr>

" Tabs
set shiftwidth=4
set tabstop=4
set expandtab

" Backup, Swap, and Undo
set noundofile "Maintain undo history between sessions
set noswapfile
set nobackup
"if has("win32")
"    set directory=$HOME\vimfiles\swap,$TEMP
"    set backupdir=$HOME\vimfiles\backup,$TEMP
"    set undodir=$HOME\vimfiles\undo,$TEMP
"else
"    set directory=~/.vim/swap,/tmp
"    set backupdir=~/.vim/backup,/tmp
"    set undodir=~/.vim/undo,/tmp
"endif

"" Line number
set number

set smartindent
set autoindent
" }}}

" Vim configs {{{
noremap <F7> :AsyncRun -program=make<cr>
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

set makeprg=build.bat " TODO: unix version of build.bat
" }}}

" Gvim configs {{{
" Maxmize
autocmd GUIEnter * simalt ~x
if has('gui_running')
    set guifont=Consolas:h11
endif
" }}}

" Set Cut/Copy/Paste command to use clipboard register {{{
if has('clipboard')
    " CTRL-X is Cut
    vnoremap <C-X> "+x
    " CTRL-C is Copy
    vnoremap <C-C> "+y
    " CTRL-V is Paste
    noremap <C-V> "+gP
    inoremap <C-V> <Esc>"+gpa
    cnoremap <C-V> <C-R>+

    " Use CTRL-Q to do what CTRL-V used to do (Vertical Visual Mode)
    noremap <C-Q> <C-V>
endif
" }}}



" Conver current word to uppercase
inoremap <c-u> <esc>viwUi
nnoremap <c-u> viwU
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Abbreviations for shorcuts
iabbrev @@ haik0925@gmail.com

" Abbreviations for typos
iabbrev reutnr return
iabbrev reutrn return

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker foldlevelstart=0
augroup END
