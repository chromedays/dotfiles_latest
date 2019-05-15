Set-PSReadlineOption -BellStyle None
function dot() {
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME @args
}
