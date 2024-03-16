COMPILER_BIN=$(pwd)/.compiler/bin
export PATH=$COMPILER_BIN:$PATH
export CC=$COMPILER_BIN/gcc
clj -T:build build/uberjar
native-image --initialize-at-build-time --no-fallback --static --libc=musl -jar target/echo.jar target/echo

