# kitty shell integration
if [[ -n "$KITTY_INSTALLATION_DIR" ]]; then
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
    alias ssh="kitten ssh -o ServerAliveInterval=5 -o ServerAliveCountMax=999"
fi

# kitten config
export KITTY_REMOTE_DIR="$HOME/.local/share/kitty-ssh-kitten"
if [[ -d "$KITTY_REMOTE_DIR" ]]; then
    path=( $KITTY_REMOTE_DIR/kitty/bin $path )
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_REMOTE_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
fi

