#!/bin/sh
# Boris Nimcevic
# 2021 April 13
# A minimum setup for starting a cpp project.

mkdir $1
cd $1
mkdir build
mkdir scripts
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
echo "set (CMAKE_RUNTIME_OUTPUT_DIRECTORY \${PROJECT_BINARY_DIR}/bin)" >> CMakeLists.txt
echo "add_executable(\${PROJECT_NAME} $1.cpp)" >> CMakeLists.txt

# Make scripts
cd scripts
touch configure.sh
echo "#!/bin/zsh" >> configure.sh
echo "" >> configure.sh
echo "cmake -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=Debug -S . -B build/" >> configure.sh

touch build.sh
echo "#!/bin/zsh" >> build.sh
echo "" >> build.sh
echo "cd build" >> build.sh
echo "make" >> build.sh

touch run.sh
echo "#!/bin/zsh" >> run.sh
echo "" >> run.sh
echo "cd build/bin" >> run.sh
echo "./$1" >> run.sh

chmod u+x configure.sh
chmod u+x build.sh
chmod u+x run.sh
