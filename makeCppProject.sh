#!/bin/sh
# Boris Nimcevic
# 2021 April 13
# A minimum setup for starting a cpp project.

mkdir $1
cd $1
mkdir build
mkdir components
mkdir scripts
touch main.cpp
touch CMakeLists.txt

# Make hellow world code:
echo "#include <iostream>" >> main.cpp
echo "#include \"ExampleComponent.h\"" >> main.cpp
echo "" >> main.cpp
echo "int main(){" >> main.cpp
echo "  std::cout << \"Hello World \" << add(1, 2) << std::endl;" >> main.cpp
echo "  return 0;" >> main.cpp
echo "}" >> main.cpp

# Make initial CMakeLists.txt:
echo "cmake_minimum_required(VERSION 3.0.0)" >> CMakeLists.txt
echo "project($1)" >> CMakeLists.txt
echo "" >> CMakeLists.txt
echo "enable_language(C)" >> CMakeLists.txt
echo "enable_language(CXX)" >> CMakeLists.txt
echo "" >> CMakeLists.txt
echo "set (PROJECT_VERSION_MAJOR 1)" >> CMakeLists.txt
echo "set (PROJECT_VERSION_MINOR 0)" >> CMakeLists.txt
echo "" >> CMakeLists.txt
echo "set (CMAKE_RUNTIME_OUTPUT_DIRECTORY \${PROJECT_BINARY_DIR}/bin)" >> CMakeLists.txt
echo "" >> CMakeLists.txt
echo "add_executable(\${PROJECT_NAME} main.cpp)" >> CMakeLists.txt
echo "" >> CMakeLists.txt
echo "add_subdirectory(components/ExampleComponent)" >> CMakeLists.txt
echo "" >> CMakeLists.txt
echo "target_link_libraries(\${PROJECT_NAME}" >> CMakeLists.txt
echo "    sub::examplecomponent" >> CMakeLists.txt
echo ")" >> CMakeLists.txt

# Make scripts
cd scripts
touch configure.sh
echo "#!/bin/zsh" >> configure.sh
echo "" >> configure.sh
echo "cmake -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=Debug -S . -B build/" >> configure.sh
echo "ln -sf build/compile_commands.json ." >> configure.sh

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

# Make an example component:
cd ../components
mkdir ExampleComponent
cd ExampleComponent
touch ExampleComponent.cpp
echo "#include \"ExampleComponent.h\"" >> ExampleComponent.cpp
echo "" >> ExampleComponent.cpp
echo "int add(int a, int b){" >> ExampleComponent.cpp
echo "  return a + b;" >> ExampleComponent.cpp
echo "}" >> ExampleComponent.cpp

touch CMakeLists.txt
echo "project (ExampleComponent)" >> CMakeLists.txt
echo "" >> CMakeLists.txt
echo "add_library(\${PROJECT_NAME}" >> CMakeLists.txt
echo "  ExampleComponent.cpp" >> CMakeLists.txt
echo ")" >> CMakeLists.txt
echo "" >> CMakeLists.txt
echo "add_library(sub::examplecomponent ALIAS \${PROJECT_NAME})" >> CMakeLists.txt
echo "" >> CMakeLists.txt
echo "target_include_directories(\${PROJECT_NAME}" >> CMakeLists.txt
echo "    PUBLIC " >> CMakeLists.txt
echo "    \${PROJECT_SOURCE_DIR}/include" >> CMakeLists.txt
echo ")" >> CMakeLists.txt

mkdir include
cd include
touch ExampleComponent.h
echo "#ifndef _EXAMPLE_COMPONENT_H_" >> ExampleComponent.h
echo "#define _EXAMPLE_COMPONENT_H_" >> ExampleComponent.h
echo "" >> ExampleComponent.h
echo "int add(int, int);" >> ExampleComponent.h
echo "" >> ExampleComponent.h
echo "#endif //_EXAMPLE_COMPONENT_H_" >> ExampleComponent.h
