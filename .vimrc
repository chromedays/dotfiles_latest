" copied from Vim 7.3's mswin.vim:

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+gP
map <S-Insert>		"+gP
imap <C-V>		<Esc>"+gpa

cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+


imap <S-Insert>		<C-V>
vmap <S-Insert>		<C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>
source ~/vimfiles/shared.vim
source ~/vimfiles/plugins.vim
source ~/vimfiles/origin.vim


"call project#rc('C:\work')

"Project 'game_lab', 'game_lab'
"File 'game_lab/code/k_main.cpp', 'k_main.cpp'

"Project 'dotfiles', 'dotfiles'
"File '~/vimfiles/shared_vimrc', 'shared_vimrc'
"File '~/vimfiles/plugins.vim', 'plugrc'
"File '~/vimfiles/vimrc', 'vimrc'
"File '~/_vimrc', '_vimrc'
