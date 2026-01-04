#!/bin/sh

# install pixi package manager and essential tools
curl -fsSL https://pixi.sh/install.sh | sh
~/.pixi/bin/pixi global install zsh tmux==3.6a nvim fzf wget git unzip ninja ripgrep fd-find ffmpeg imagemagick tree-sitter-cli nodejs python zoxide

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain nightly

# install uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# setup config files
~/.pixi/bin/git clone https://github.com/njurui/dotfiles.git ~/.config/dotfiles
ln -sf ~/.config/dotfiles/zsh ~/.config/zsh
ln -sf ~/.config/dotfiles/tmux ~/.config/tmux
ln -sf ~/.config/dotfiles/nvim ~/.config/nvim
ln -sf ~/.config/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/.config/dotfiles/zsh/.zshenv ~/.zshenv
ln -sf ~/.config/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
ln -sf ~/.config/dotfiles/zsh/.env.zsh ~/.env.zsh
