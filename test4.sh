#!/bin/dash

# COMP2041/9044 Assignment2
# test4.sh
#
# This program was written by Melina Salardini (z5393518)
# on july 21, 2024
#
# A test Script containing tests for grip-show

# color for the output
GREEN='\033[0;32m'
RED='\033[0;31m'
NOCOL='\033[0m'

PATH="$PATH:$(pwd)"


# test 01: .grip dir doesnt exists
expected_output="grip-show: error: grip repository directory .grip not found"

output=$(./grip-show)

if [ "$output" = "$expected_output" ]; then
    echo "Test 01: grip-show (no .grip dir) - ${GREEN}passed${NOCOL}"
else
    echo "Test 01: grip-show (no .grip dir) - ${RED}failed${NOCOL}"
fi

# initilize the .grip dir
./grip-init

# test 02: not given the correct number of arguments
expected_output="usage: grip-show <commit>:<filename>"

output=$(./grip-show)

if [ "$output" = "$expected_output" ]; then
    echo "Test 02: grip-show (incorrect num arguments) - ${GREEN}passed${NOCOL}"
else
    echo "Test 02: grip-show (incorrect num arguments) - ${RED}failed${NOCOL}"
fi


# adding some files
./grip-add a

# test 03: when there is no commit cause the file is in the index dir but not
#           in the commit dir yet
expected_output="grip-show: error: unknown commit '0'"

output=$(./grip-show 0:a)

if [ "$output" = "$expected_output" ]; then
    echo "Test 03: grip-show (no commits) - ${GREEN}passed${NOCOL}"
else
    echo "Test 03: grip-show (no commits) - ${RED}failed${NOCOL}"
fi

# add some commits
./grip-commit -m "this is the first commit"


# test 04: successfully showing the commit
expected_output="line 1"

output=$(./grip-show 0:a)

if [ "$output" = "$expected_output" ]; then
    echo "Test 04: grip-show (successfull showing) - ${GREEN}passed${NOCOL}"
else
    echo "Test 04: grip-show (successfull showing) - ${RED}failed${NOCOL}"
fi


# test 05: file not found the commits
expected_output="grip-show: error: 'b' not found in commit 0"

output=$(./grip-show 0:b)

if [ "$output" = "$expected_output" ]; then
    echo "Test 04: grip-show (file not found in the commit) - ${GREEN}passed${NOCOL}"
else
    echo "Test 04: grip-show (file not found in the commit) - ${RED}failed${NOCOL}"
fi

# not ommited a commit and need to look into index dir
expected_output="line 1"

output=$(./grip-show :a)

if [ "$output" = "$expected_output" ]; then
    echo "Test 05: grip-show (successfull showing) - ${GREEN}passed${NOCOL}"
else
    echo "Test 05: grip-show (successfull showing) - ${RED}failed${NOCOL}"
fi


# remove the .grip dir
rm -rf .grip
