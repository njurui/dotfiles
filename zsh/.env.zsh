# kitty shell integration
if [[ -n "$KITTY_INSTALLATION_DIR" ]]; then
    # Must reload shell integration to keep tmux/nvim cursor beam
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration

    # kitten alias
    alias ssh="kitten ssh"
    alias icat="kitten icat"

    # entr integration
    if command -v entr &>/dev/null; then
        entr() {
            echo "$1" | command entr -s "kitten icat $1"
        }
        compdef _files entr
    fi
fi

# kitten remote config
export KITTY_REMOTE_DIR="$HOME/.local/share/kitty-ssh-kitten"
if [[ -d "$KITTY_REMOTE_DIR" ]]; then
    # load kitty shell integration
    path=($KITTY_REMOTE_DIR/kitty/bin $path)
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_REMOTE_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration

    # kitten alias
    alias icat="kitten icat"

    # entr integration
    if command -v entr &>/dev/null; then
        entr() {
            echo "$1" | command entr -s "kitten icat $1"
        }
        compdef _files entr
    fi
fi

# Toolchain config in Homebrew
if [[ -d ${HOMEBREW_PREFIX-} ]]; then
    # environment for clang & clangd & gcc
    export CPATH="$HOMEBREW_PREFIX/include"

    # environment for Autotools
    export CPPFLAGS="-I$HOMEBREW_PREFIX/include"

    # environment for CMake & Autotools
    export CFLAGS="-I$HOMEBREW_PREFIX/include"
    export CXXFLAGS="-I$HOMEBREW_PREFIX/include"
    export LDFLAGS="-L$HOMEBREW_PREFIX/lib"

    # environment for Cargo
    export RUSTFLAGS="-L$HOMEBREW_PREFIX/lib"

    # LLVM config
    if [[ -d "$HOMEBREW_PREFIX/opt/llvm" ]]; then
        typeset -aU path
        path=($HOMEBREW_PREFIX/opt/llvm/bin $path)

        # environment for CMake & Autotools
        export CC="$HOMEBREW_PREFIX/opt/llvm/bin/clang"
        export CXX="$HOMEBREW_PREFIX/opt/llvm/bin/clang++"
        export LDFLAGS="$LDFLAGS -L$HOMEBREW_PREFIX/opt/llvm/lib/c++ -L$HOMEBREW_PREFIX/opt/llvm/lib/unwind -lunwind"
    fi
fi
