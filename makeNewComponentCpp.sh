#!/bin/sh
# Boris Nimcevic
# 2021 May 2
# Create new componet for a cpp project

#TODO
# figure out how to add the date and how to capitalize the letters

# Make parent folder
mkdir $1
cd $1
mkdir include

touch CMakeLists.txt
echo "project ($1)" >> CMakeLists.txt
echo "" >> CMakeLists.txt
echo "add_library(\${PROJECT_NAME}" >> CMakeLists.txt
echo "  $1.cpp" >> CMakeLists.txt
echo ")" >> CMakeLists.txt
echo "" >> CMakeLists.txt
echo "add_library(sub::$1lib ALIAS \${PROJECT_NAME})" >> CMakeLists.txt
echo "" >> CMakeLists.txt
echo "target_include_directories(\${PROJECT_NAME}" >> CMakeLists.txt
echo "    PUBLIC " >> CMakeLists.txt
echo "    \${PROJECT_SOURCE_DIR}/include" >> CMakeLists.txt
echo ")" >> CMakeLists.txt

touch $1.cpp
echo "#include \"$1.h\"" >> $1.cpp
echo "" >> $1.cpp
echo "int multiply(int a, int b){" >> $1.cpp
echo "  return a * b;" >> $1.cpp
echo "}" >> $1.cpp

cd include
touch $1.h
echo "#ifndef _$1_H_" >> $1.h # figure out how to make it caps
echo "#define _$1_H_" >> $1.h
echo "" >> $1.h
echo "int multiply(int, int);" >> $1.h
echo "" >> $1.h
echo "#endif //_$1_H_" >> $1.h
