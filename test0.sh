#!/bin/dash

# COMP2041/9044 Assignment2
# test0.sh
#
# This program was written by Melina Salardini (z5393518)
# on july 14, 2024
#
# A test Script containing tests for grip-init


# color for the output
GREEN='\033[0;32m'
RED='\033[0;31m'
NOCOL='\033[0m'

PATH="$PATH:$(pwd)"


# test 01: succesfully creating a new .grip dir
expected_output="Initialized empty grip repository in .grip"

output=$(./grip-init)

if [ "$output" = "$expected_output" ]; then
    echo "Test 01: grip-init (successfully creating a .grip dir) - ${GREEN}passed${NOCOL}"
else
    echo "Test 01: grip-init (successfully creating a .grip dir) - ${RED}failed${NOCOL}"
fi


# test 02: error for already existing .grip dir
expected_output="grip-init: error: .grip already exists"

output=$(./grip-init)
echo "$output"

if [ "$output" = "$expected_output" ]; then
    echo "Test 02: grip-init (already existing dir) - ${GREEN}passed${NOCOL}"
else
    echo "Test 02: grip-init (already existing dir) - ${RED}failed${NOCOL}"
fi


# remove the .grip dir
rm -rf .grip