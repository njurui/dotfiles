#!/bin/sh

# install pixi package manager and essential tools
curl -fsSL https://pixi.sh/install.sh | sh
~/.pixi/bin/pixi global install zsh tmux==3.5 nvim fzf wget git ripgrep fd-find ffmpeg imagemagick tree-sitter-cli nodejs python

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain nightly

# install uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# setup config files
~/.pixi/bin/git clone https://github.com/njurui/dotfiles.git ~/.config/dotfiles
ln -s ~/.config/dotfiles/zsh ~/.config/zsh
ln -s ~/.config/dotfiles/tmux ~/.config/tmux
ln -s ~/.config/dotfiles/nvim ~/.config/nvim
ln -s ~/.config/dotfiles/zsh/.zshrc ~/.zshrc
