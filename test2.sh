#!/bin/dash

# COMP2041/9044 Assignment2
# test2.sh
#
# This program was written by Melina Salardini (z5393518)
# on july 14, 2024
#
# A test Script containing tests for grip-commit

# color for the output
GREEN='\033[0;32m'
RED='\033[0;31m'
NOCOL='\033[0m'

PATH="$PATH:$(pwd)"


# test 01: when the .grip dir doesnt exists
expected_output="grip-commit: error: grip repository directory .grip not found"

output=$(./grip-commit)

if [ "$output" = "$expected_output" ]; then
    echo "Test 01: grip-commit (.grip dir doesnt exists) - ${GREEN}passed${NOCOL}"
else
    echo "Test 01: grip-commit (.grip dir doesnt exists) - ${RED}failed${NOCOL}"
fi

./grip-init

# test 02: incorrect number of arguments
expected_output="usage: grip-commit [-a] -m commit-message"

output=$(./grip-commit)

if [ "$output" = "$expected_output" ]; then
    echo "Test 02: grip-commit (incorrect num arguments) - ${GREEN}passed${NOCOL}"
else
    echo "Test 02: grip-commit (incorrect num arguments) - ${RED}failed${NOCOL}"
fi

# test 03: nothing to commit
expected_output="nothing to commit"

output=$(./grip-commit -m firstcommit)

if [ "$output" = "$expected_output" ]; then
    echo "Test 03: grip-commit (nothing to commit) - ${GREEN}passed${NOCOL}"
else
    echo "Test 03: grip-commit (nothing to commit) - ${RED}failed${NOCOL}"
fi

./grip-add a

# test 04: commiting successfully
expected_output="Committed as commit 0"

output=$(./grip-commit -m firstcommit)

if [ "$output" = "$expected_output" ]; then
    echo "Test 04: grip-commit (successful commit) - ${GREEN}passed${NOCOL}"
else
    echo "Test 04: grip-commit (successful commit) - ${RED}failed${NOCOL}"
fi

# test 05: nothing to commit after commitng everything in the index dir
expected_output="nothing to commit"

output=$(./grip-commit -m firstcommit)

if [ "$output" = "$expected_output" ]; then
    echo "Test 05: grip-commit (already commited everything) - ${GREEN}passed${NOCOL}"
else
    echo "Test 05: grip-commit (already commited everything) - ${RED}failed${NOCOL}"
fi


# remove the .grip dir
rm -rf .grip