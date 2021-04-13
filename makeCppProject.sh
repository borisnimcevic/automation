#!/bin/sh
# Boris Nimcevic
# 2021 April 13
# A minimum setup for starting a cpp project.

mkdir $1
cd $1
mkdir build
touch $1.cpp
touch CMakeLists.txt

# Make hellow world code:
echo "#include <iostream>" >> $1.cpp
echo "" >> $1.cpp
echo "int main(){" >> $1.cpp
echo "  std::cout << \"Hello World\" << std::endl;" >> $1.cpp
echo "  return 0;" >> $1.cpp
echo "}" >> $1.cpp

# Make initial cmakefile:
echo "cmake_minimum_required(VERSION 3.0.0)" >> CMakeLists.txt
echo "project($1)" >> CMakeLists.txt
echo "add_executable(\${PROJECT_NAME} $1.cpp)" >> CMakeLists.txt
