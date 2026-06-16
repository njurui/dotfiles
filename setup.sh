#!/bin/sh

# install pixi package manager and essential tools
curl -fsSL https://pixi.sh/install.sh | sh
~/.pixi/bin/pixi global install zsh tmux==3.6a nvim fzf wget git unzip ninja ripgrep fd-find ffmpeg imagemagick tree-sitter-cli nodejs python zoxide bat hexyl uv aria2 sshpass codex

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain nightly

# download vscode
mkdir vscode
curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' --output vscode/vscode_cli.tar.gz
tar -xzf vscode/vscode_cli.tar.gz -C vscode

# setup config files
~/.pixi/bin/git clone https://github.com/njurui/dotfiles.git ~/.config/dotfiles
ln -sf ~/.config/dotfiles/zsh ~/.config/zsh
ln -sf ~/.config/dotfiles/tmux ~/.config/tmux
ln -sf ~/.config/dotfiles/nvim ~/.config/nvim
ln -sf ~/.config/dotfiles/aria2 ~/.config/aria2
ln -sf ~/.config/dotfiles/matplotlib ~/.config/matplotlib
ln -sf ~/.config/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/.config/dotfiles/zsh/.zsh_plugins.txt ~/.zsh_plugins.txt
ln -sf ~/.config/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
