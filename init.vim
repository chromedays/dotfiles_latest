" {{{ Plugins
call plug#begin(stdpath('data').'/plugged')
Plug 'sheerun/vim-polyglot'
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

" }}} Shared configs (can be used by other vim emulator)

" {{{ Vim specific configs

" {{{ autocmds for file types
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker foldlevelstart=0
augroup END
" }}} autocmds for file types


" }}} Vim specific configs

