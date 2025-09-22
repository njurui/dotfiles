# LLVM toolchain config
if [[ -d "$HOMEBREW_PREFIX" ]]; then
    # environment variable for clang
    export LIBRARY_PATH=$HOMEBREW_PREFIX/opt/llvm/lib/c++:$HOMEBREW_PREFIX/lib
    export CPATH="$HOMEBREW_PREFIX/include"
    # export C_INCLUDE_PATH=""
    # export OBJC_INCLUDE_PATH=""
    # export CPLUS_INCLUDE_PATH=""

    # export flags of llvm for build system
    export CC="$HOMEBREW_PREFIX/opt/llvm/bin/clang"
    export CXX="$HOMEBREW_PREFIX/opt/llvm/bin/clang++"
    export CPPFLAGS="-I$HOMEBREW_PREFIX/include -I$HOMEBREW_PREFIX/opt/llvm/include/c++/v1"
    export CXXFLAGS="-I$HOMEBREW_PREFIX/include -I$HOMEBREW_PREFIX/opt/llvm/include/c++/v1"
    export LDFLAGS="-L$HOMEBREW_PREFIX/lib -L$HOMEBREW_PREFIX/opt/llvm/lib/c++ -Wl,-rpath,$HOMEBREW_PREFIX/opt/llvm/lib/c++"
    export RUSTFLAGS="-L$HOMEBREW_PREFIX/lib -L$HOMEBREW_PREFIX/opt/llvm/lib/c++"

    # prevent tmux from loading $PATH twice
    typeset -aU path
    path=($HOMEBREW_PREFIX/opt/llvm/bin $path)
fi
