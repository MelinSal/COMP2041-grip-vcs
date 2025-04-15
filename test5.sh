#!/bin/dash

# COMP2041/9044 Assignment2
# test5.sh
#
# This program was written by Melina Salardini (z5393518)
# on july 27, 2024
#
# A test Script containing tests for grip-rm

# color for the output
GREEN='\033[0;32m'
RED='\033[0;31m'
NOCOL='\033[0m'

PATH="$PATH:$(pwd)"


# test 01: .grip dir doesnt exists
expected_output="grip-rm: error: grip repository directory .grip not found"

output=$(./grip-rm)

if [ "$output" = "$expected_output" ]; then
    echo "Test 01: grip-rm (no .grip dir) - ${GREEN}passed${NOCOL}"
else
    echo "Test 01: grip-rm (no .grip dir) - ${RED}failed${NOCOL}"
fi

# initilize the .grip dir
./grip-init


# test 02: not given the correct number of arguments
expected_output="usage: grip-rm [--force] [--cached] <filenames>"

output=$(./grip-rm)

if [ "$output" = "$expected_output" ]; then
    echo "Test 02: grip-rm (incorrect num arguments) - ${GREEN}passed${NOCOL}"
else
    echo "Test 02: grip-rm (incorrect num arguments) - ${RED}failed${NOCOL}"
fi


# test 03: the file hasnt been added to the gip repository yet
expected_output="grip-rm: error: 'a' is not in the grip repository"

output=$(./grip-rm a)

if [ "$output" = "$expected_output" ]; then
    echo "Test 03: grip-rm (file not in repositpry) - ${GREEN}passed${NOCOL}"
else
    echo "Test 03: grip-rm (file not in repository) - ${RED}failed${NOCOL}"
fi


# adding and commiting the file to the repository
echo "hello" > a
./grip-add a
./grip-commit -m "this is my first commit"
# change the file and not commiting
echo "hi again changing the file" > a


# test 04: uncommited changes
expected_output="grip-rm: error: 'a' in the repository is different to the working file"

output=$(./grip-rm a)

if [ "$output" = "$expected_output" ]; then
    echo "Test 04: grip-rm (uncommited changes) - ${GREEN}passed${NOCOL}"
else
    echo "Test 04: grip-rm (uncommited changes) - ${RED}failed${NOCOL}"
fi


# test 05: remove successfully if there is a forced opption
#           with uncommitted changes

expected_output=""

output=$(./grip-rm a)

if [ "$output" = "$expected_output" ]; then
    echo "Test 05: grip-rm (force uncommited changes) - ${GREEN}passed${NOCOL}"
else
    echo "Test 05: grip-rm (force uncommited changes) - ${RED}failed${NOCOL}"
fi


# commit the new changes
./grip-add a
./grip-commit -m "this is the second commit"


# test 06: successfully remove
expected_output=""

output=$(./grip-rm a)

if [ "$output" = "$expected_output" ]; then
    echo "Test 06: grip-rm (remove successfully) - ${GREEN}passed${NOCOL}"
else
    echo "Test 06: grip-rm (remove successfully) - ${RED}failed${NOCOL}"
fi