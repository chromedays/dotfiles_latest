" {{{ Plugins
" call plug#begin(stdpath('data').'/plugged')
call plug#begin()
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'ajh17/VimCompletesMe'
Plug 'skywind3000/asyncrun.vim'
" Plug 'voldikss/vim-floaterm' " TODO: Not working properly
" Plug 'airblade/vim-gitgutter' " TODO: Not working properly
" Plug 'OmniSharp/omnisharp-vim'
call plug#end()
" }}} Plugins

if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType h setlocal omnifunc=lsp#complete
        autocmd FileType hpp setlocal omnifunc=lsp#complete
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType c let b:vcm_tab_complete="omni"
        autocmd FileType cpp let b:vcm_tab_complete="omni"
        autocmd FileType h let b:vcm_tab_complete="omni"
        autocmd FileType hpp let b:vcm_tab_complete="omni"
    augroup end

endif

let g:lsp_diagnostics_enabled=0

" {{{ Keybindings
let mapleader="\<Space>"
inoremap jk <Esc>
inoremap jK <Esc>
inoremap Jk <Esc>
inoremap JK <Esc>
nnoremap <leader>er :exe 'edit' stdpath('config').'/init.vim'<cr>
nnoremap <leader>hh :nohls<cr>
command! Cnext try | cnext | catch | cfirst | catch | endtry
noremap <F8> :Cnext<cr>
noremap <F9> :copen<bar>AsyncRun -program=make -focus=0<cr>
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

if filereadable("local.vim")
    source local.vim
endif

set autoread

" TODO: Weird cursor behaviour in nvim
" if has('win32')
    "source $VIMRUNTIME/mswin.vim
" endif

" {{{ NERDTree
" nnoremap <c-n> :NERDTreeToggle<cr>
" }}} NERDTree

" {{{ ctrlp
" let g:ctrlp_custom_ignore=['.git/']
" }}} ctrlp

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
if has('win32')
    set shell=cmd
else
    set shell=/bin/bash
endif


" {{{ Theme

set background=dark
highlight clear
syntax reset
let g:colors_name="chromedays"
highlight Normal cterm=NONE ctermbg=0 ctermfg=7 gui=NONE guibg=#222222 guifg=LightGray
" highlight SpecialKey
highlight Comment cterm=NONE ctermbg=NONE ctermfg=10 gui=NONE guibg=NONE guifg=LightGreen
highlight IncSearch cterm=reverse ctermbg=NONE ctermfg=NONE gui=reverse guibg=NONE guifg=NONE
highlight Search cterm=reverse ctermbg=NONE ctermfg=NONE gui=reverse guibg=NONE guifg=NONE
highlight MoreMsg cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight ModeMsg cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight LineNr cterm=NONE ctermbg=NONE ctermfg=8 gui=NONE guibg=NONE guifg=#444444
highlight StatusLine cterm=NONE ctermbg=8 ctermfg=NONE gui=NONE guibg=#444444 guifg=NONE
highlight StatusLineNC cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight VertSplit cterm=reverse ctermbg=NONE ctermfg=NONE gui=reverse guibg=NONE guifg=NONE
highlight Title cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight Visual cterm=NONE ctermbg=8 ctermfg=NONE gui=NONE guibg=#444444 guifg=NONE
" highlight VisualNOS cterm=NONE ctermbg=8 ctermfg=NONE
highlight WarningMsg cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight WildMenu cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight Folded cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight FoldColumn cterm=reverse ctermbg=NONE ctermfg=NONE gui=reverse guibg=NONE guifg=NONE
highlight DiffAdd cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight DiffChange cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight DiffDelete cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight DiffText cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight Type cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight Keyword cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight Number cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight Char cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight Format cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight Special cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight Constant cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight PreProc cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight Directive cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight Conditional cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight Func cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight Identifier cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight Statement cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight Ignore cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight String cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight ErrorMsg cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight Error cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight Todo cterm=NONE ctermbg=NONE ctermfg=12 gui=NONE guibg=NONE guifg=Red
highlight MatchParen cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight ColorColumn cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
highlight EndOfBuffer cterm=NONE ctermbg=NONE ctermfg=8 gui=NONE guibg=NONE guifg=#444444
highlight Pmenu cterm=NONE ctermbg=8 ctermfg=NONE gui=NONE guibg=#444444 guifg=NONE
highlight PmenuSel cterm=reverse ctermbg=NONE ctermfg=NONE gui=reverse guibg=NONE guifg=NONE

" }}}

