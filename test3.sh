#!/bin/dash

# COMP2041/9044 Assignment2
# test3.sh
#
# This program was written by Melina Salardini (z5393518)
# on july 21, 2024
#
# A test Script containing tests for grip-log

# color for the output
GREEN='\033[0;32m'
RED='\033[0;31m'
NOCOL='\033[0m'

PATH="$PATH:$(pwd)"


# test 01: .grip dir doesnt exists
expected_output="grip-log: error: grip repository directory .grip not found"

output=$(./grip-log)

if [ "$output" = "$expected_output" ]; then
    echo "Test 01: grip-log (no .grip dir) - ${GREEN}passed${NOCOL}"
else
    echo "Test 01: grip-log (no .grip dir) - ${RED}failed${NOCOL}"
fi

# initlize the .grip dir
./grip-init

# test 02: when there is no commit to log
expected_output=""

output=$(./grip-log)

if [ "$output" = "$expected_output" ]; then
    echo "Test 02: grip-log (no commit) - ${GREEN}passed${NOCOL}"
else
    echo "Test 02: grip-log (no commit) - ${RED}failed${NOCOL}"
fi

# adding some files
./grip-add a

# test 03: when there is no commit but some adds
expected_output=""

output=$(./grip-log)

if [ "$output" = "$expected_output" ]; then
    echo "Test 03: grip-log (no commit) - ${GREEN}passed${NOCOL}"
else
    echo "Test 03: grip-log (no commit) - ${RED}failed${NOCOL}"
fi

# commiting some files
./grip-commit -m "first commit"


# test 04: successfully showing some commits
expected_output="0 first commit"

output=$(./grip-log)

if [ "$output" = "$expected_output" ]; then
    echo "Test 04: grip-log (successfull log) - ${GREEN}passed${NOCOL}"
else
    echo "Test 04: grip-log (successfull log) - ${RED}failed${NOCOL}"
fi

# nothing to commit
expected_output="nothing to commit"

output=$(./grip-log)

if [ "$output" = "$expected_output" ]; then
    echo "Test 05: grip-log (nothing to commit) - ${GREEN}passed${NOCOL}"
else
    echo "Test 05: grip-log (nothing to commit) - ${RED}failed${NOCOL}"
fi


# remove the .grip dir
rm -rf .grip