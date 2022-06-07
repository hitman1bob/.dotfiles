# install nix
curl -L https://nixos.org/nix/install | sh

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
    nixpkgs.zsh \
    nixpkgs.antibody \
    nixpkgs.git \
    nixpkgs.neovim \
    nixpkgs.stow \
    nixpkgs.powerlevel10k \
    nixpkgs.bat \
    nixpkgs.ripgrep

stow git
stow zsh
stow nvim

# add zsh as valid login shell
command -v zsh | sudo tee -a /etc/shells

#use zsh as default shell
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh