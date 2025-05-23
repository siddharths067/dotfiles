set -e
set -x
echo "Stowing Neovim configuration"
stow  -t $HOME/.config --dotfiles config -vv

echo "Installing Oh-My-Zsh"

if [ -n $ZSH ]; then
	echo "ZSH Already installed";
else
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
fi

ln -sf $PWD/zsh_custom.zsh $ZSH/custom/zsh_custom.zsh 

sudo tar -xvf  tarball_packages/nvim-linux-x86_64.tar.gz -C /usr/local/stow 

cd /usr/local/stow
sudo stow nvim-linux-x86_64 -vv 
cd $PWD
