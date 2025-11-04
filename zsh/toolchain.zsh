# Toolchain config
if [[ -d "$HOMEBREW_PREFIX" ]]; then
    # environment for clang/clangd/gcc
    export CPATH="$HOMEBREW_PREFIX/include"
    # export C_INCLUDE_PATH=""
    # export CPLUS_INCLUDE_PATH=""

    # environment for CMake
    export CC="$HOMEBREW_PREFIX/opt/llvm/bin/clang"
    export CXX="$HOMEBREW_PREFIX/opt/llvm/bin/clang++"
    export CFLAGS="-I$HOMEBREW_PREFIX/include"
    export CXXFLAGS="-I$HOMEBREW_PREFIX/include"
    export LDFLAGS="-L$HOMEBREW_PREFIX/lib -L$HOMEBREW_PREFIX/opt/llvm/lib/c++ -L$HOMEBREW_PREFIX/opt/llvm/lib/unwind -lunwind"

    # environment for Cargo
    export RUSTFLAGS="-L$HOMEBREW_PREFIX/lib"

    # prevent tmux from loading $PATH twice
    typeset -aU path
    path=($HOMEBREW_PREFIX/opt/llvm/bin $path)
fi
