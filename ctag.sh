#!/bin/bash
#set -v on

echo $1
#exit

find $1  -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.java"   > cscope.files
cscope -Rbkq -i cscope.files
ccglue -S cscope.out -o cctree.out

find $1 -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.cc" -o -name "*.m" -o -name "*.mm" -o -name "*.java" -o -name "*.py" -o -name "*.mk"  > src.files
ctags -R --c++-kinds=+px --fields=+iaS --extra=+q -L src.files

