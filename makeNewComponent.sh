#!/bin/sh
# Boris Nimcevic
# 2021 April 21
# Create new componet for esp idf target

# Make parent folder
mkdir $1
cd $1
touch CMakeLists.txt
touch $1.cpp
mkdir include
mkdir test

echo "idf_component_register(SRCS \"$1.cpp\"" >> CMakeLists.txt
echo "                    INCLUDE_DIRS "./include"" >> CMakeLists.txt
echo "                    ) " >> CMakeLists.txt

echo "#include \"$1.h\"" >> $1.cpp

# Configure include folder
cd include
touch $1.h

echo "#ifndef _$1_H_" >> $1.h
echo "#define _$1_H_" >> $1.h
echo "" >> $1.h
echo "#endif // _$1_H_" >> $1.h

cd ..

# Configure test folder
cd test
touch CMakeLists.txt
touch test_$1.cpp

echo "idf_component_register(SRC_DIRS \".\"" >> CMakeLists.txt
echo "                    INCLUDE_DIRS \".\"" >> CMakeLists.txt
echo "                    REQUIRES unity $1)" >> CMakeLists.txt

echo "#include \"unity.h\"" >> test_$1.cpp
echo "#include \"$1.h\"" >> test_$1.cpp
echo "" >> test_$1.cpp
echo "TEST_CASE(\"Test $1\", \"[Menu]\") {" >> test_$1.cpp
echo "  TEST_ASSERT_EQUAL(0, 1);" >> test_$1.cpp
echo "}" >> test_$1.cpp
