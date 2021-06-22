#/bin/sh

cd $(dirname "$0")
if [ ! -d build ]; then
    mkdir build
fi
nasm -felf64 src/main.asm -o build/tictactoe.o
ld build/tictactoe.o -o build/tictactoe.out
./build/tictactoe.out
