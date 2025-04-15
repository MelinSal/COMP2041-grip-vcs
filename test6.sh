#!/bin/dash

# COMP2041/9044 Assignment2
# test6.sh
#
# This program was written by Melina Salardini (z5393518)
# on july 28, 2024
#
# A test Script containing tests for grip-status

# color for the output
GREEN='\033[0;32m'
RED='\033[0;31m'
NOCOL='\033[0m'

PATH="$PATH:$(pwd)"

# test 01: .grip dir doesnt exists
expected_output="grip-status: error: grip repository directory .grip not found"

output=$(./grip-status)

if [ "$output" = "$expected_output" ]; then
    echo "Test 01: grip-status (no .grip dir) - ${GREEN}passed${NOCOL}"
else
    echo "Test 01: grip-status (no .grip dir) - ${RED}failed${NOCOL}"
fi 

./grip-init
touch a
./grip-add a

# test 02: file in the dir but not in index and commit dir
expected_output="a - added to index, file changed"

output=$(./grip-status)

if [ "$output" = "$expected_output" ]; then
    echo "Test 02: grip-status (added to index) - ${GREEN}passed${NOCOL}"
else
    echo "Test 02: grip-status (added to index) - ${RED}failed${NOCOL}"
fi 


./grip-commit -m "first commit"


# test 03: status of a file that is the same in all index, commit
#           and the current dir
expected_output="a - same as repo"

output=$(./grip-status)

if [ "$output" = "$expected_output" ]; then
    echo "Test 03: grip-status (same as repo) - ${GREEN}passed${NOCOL}"
else
    echo "Test 03: grip-status (same as repo) - ${RED}failed${NOCOL}"
fi 


echo bye > a

# test04: when the file is different in the current dir from the index dir
expected_output="a - file changed, changes not staged for commit"

output=$(./grip-status)

if [ "$output" = "$expected_output" ]; then
    echo "Test 04: grip-status (index and curr dir dif) - ${GREEN}passed${NOCOL}"
else
    echo "Test 04: grip-status (index and curr dir dif) - ${RED}failed${NOCOL}"
fi 