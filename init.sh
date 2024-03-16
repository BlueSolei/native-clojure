# sudo apt install zip
#   2. sdkman (mange jave sdks)
#     2.1. run:
# curl -s "https://get.sdkman.io" | bash
#     2.2. re-open the shell and run:
# source "$HOME/.sdkman/bin/sdkman-init.sh"
#   3. install graal-vm
# sdk install java 22.0.1-graal

# install musl gcc
mkdir .compiler && pushd .compiler
wget https://more.musl.cc/10/x86_64-linux-musl/x86_64-linux-musl-native.tgz
tar -xvf x86_64-linux-musl-native.tgz
TOOLCHAIN_DIR=$(pwd)/x86_64-linux-musl-native

# graalvm need libz.a for static exec, so we build it here
wget https://zlib.net/current/zlib.tar.gz
tar -xvf zlib.tar.gz
ZLIB_DIR=$(find . -maxdepth 1 -type d -name 'zlib-*')
pushd $ZLIB_DIR
CC=$TOOLCHAIN_DIR/bin/gcc ./configure --prefix=$TOOLCHAIN_DIR --static
make
make install
popd
# cleanup and make compiler structure simpler, ./compiler/bin, .compiler/lib etc.
rm -rf zlib*
# move all files from x86_64-linux-musl-native folder to .compiler folder
find x86_64-linux-musl-native -mindepth 1 -maxdepth 1 -exec mv -t . -- {} +
rm -rf x86_64-linux-musl-native
popd
