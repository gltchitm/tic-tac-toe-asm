#/bin/sh

cd $(dirname "$0")
mkdir build
nasm -felf64 src/main.asm -o build/tictactoe.o
ld build/tictactoe.o -o build/tictactoe.out
./build/tictactoe.out
