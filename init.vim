" {{{ Plugins
" call plug#begin(stdpath('data').'/plugged')
call plug#begin()
Plug 'rafi/awesome-vim-colorschemes'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'voldikss/vim-floaterm'
" Plug 'airblade/vim-gitgutter' " TODO: Not working properly
" Plug 'OmniSharp/omnisharp-vim'
call plug#end()
" }}} Plugins

" {{{ Shared configs (can be used by other vim emulator)
"

" {{{ Keybindings
let mapleader="\<Space>"
inoremap jk <Esc>
inoremap jK <Esc>
inoremap Jk <Esc>
inoremap JK <Esc>
nnoremap <leader>er :exe 'edit' stdpath('config').'/init.vim'<cr>
nnoremap <leader>hh :nohls<cr>
" }}} Keybindings

" {{{ Tabs
set shiftwidth=4
set tabstop=4
set expandtab
" }}} Tabs

" {{{ Backup, Swap, and Undo
set noundofile "Maintain undo history between sessions
set noswapfile
set nobackup
" }}} Backup, Swap, and Undo

" Line Number
set number

" {{{ Abbreviations for typos
iabbrev reutnr return
iabbrev reutrn return
" }}} Abbreviations for typos

" {{{ Case-insensitive search (only if it doesn't contain uppercase
set ignorecase
set smartcase
" }}}

" }}} Shared configs (can be used by other vim emulator)

" {{{ Vim specific configs

" Weird cursor behaviour in nvim
if has('win32')
    "source $VIMRUNTIME/mswin.vim
endif

" {{{ NERDTree
nnoremap <c-n> :NERDTreeToggle<cr>
" }}} NERDTree

" {{{ ctrlp
let g:ctrlp_custom_ignore=['.git/']
" }}} ctrlp

" {{{ floaterm
let g:floaterm_type = 'floating'
let g:floaterm_winblend = 30
let g:floaterm_position = 'center'
let g:floaterm_keymap_toggle = '<F10>'
" }}} floaterm

" {{{ autocmds for file types
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker foldlevelstart=0
augroup END
" }}} autocmds for file types

" {{{ https://github.com/neoclide/coc.nvim
"set cmdheight=2
"set updatetime=300
"set shortmess+=c
" }}}

" Use powershell core, even in *nix os!
set shell=pwsh


" }}} Vim specific configs

