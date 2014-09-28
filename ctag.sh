#!/bin/bash
#set -v on

echo $1
#exit

find $1  -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.java"   > cscope.files
cscope -Rbkq -i cscope.files
ccglue -S cscope.out -o cctree.out
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q  $1

