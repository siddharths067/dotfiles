set -e
set -x
echo "Stowing Neovim configuration"
stow  -t $HOME/.config --dotfiles config -vv
