Set-PSReadlineOption -BellStyle None
$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'

function dot() {
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME @args
}
