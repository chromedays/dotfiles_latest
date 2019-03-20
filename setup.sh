#!/bin/bash
echo Downloading vim-plug...
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo Setting git global config...
git config --global user.email "haik0925@gmail.com"
git config --global user.name "Illkwon Ha"
git config --global core.editor vim

echo Configuring zsh...
chsh -s $(which zsh)
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
source ~/.zshrc
