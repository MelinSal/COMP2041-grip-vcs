#!/bin/dash

# COMP2041/9044 Assignment2
# test1.sh
#
# This program was written by Melina Salardini (z5393518)
# on july 14, 2024
#
# A test Script containing tests for grip-add


# color for the output
GREEN='\033[0;32m'
RED='\033[0;31m'
NOCOL='\033[0m'

PATH="$PATH:$(pwd)"


# test 01: when the .grip dir doesnt exists
expected_output="grip-add: error: grip repository directory .grip not found"

output=$(./grip-add)

if [ "$output" = "$expected_output" ]; then
    echo "Test 01: grip-add (.grip dir doesnt exists) - ${GREEN}passed${NOCOL}"
else
    echo "Test 01: grip-add (.grip dir doesnt exists) - ${RED}failed${NOCOL}"
fi

# grip-init
./grip-init

# test 02: when not given the correct number of arguments
expected_output="usage: grip-add <filenames>"

output=$(./grip-add)

if [ "$output" = "$expected_output" ]; then
    echo "Test 02: grip-add (inccorect num arguments) - ${GREEN}passed${NOCOL}"
else
    echo "Test 02: grip-add (inccorect num arguments) - ${RED}failed${NOCOL}"
fi


# tet 03: when successfully adding the file
expected_output=""

output=$(./grip-add a)

if [ "$output" = "$expected_output" ]; then
    echo "Test 03: grip-add (successfully adding) - ${GREEN}passed${NOCOL}"
else
    echo "Test 03: grip-add (successfully adding) - ${RED}failed${NOCOL}"
fi

# test 04: when the filename is not valid
expected_output="grip-add: error: invalid filename 's@lam'"

output=$(./grip-add s@lam)

if [ "$output" = "$expected_output" ]; then
    echo "Test 04: grip-add (invalid filename) - ${GREEN}passed${NOCOL}"
else
    echo "Test 04: grip-add (invalid filename) - ${RED}failed${NOCOL}"
fi

# when the filename doesnt exists
expected_output="grip-add: error: can not open 'b'"

output=$(./grip-add b)

if [ "$output" = "$expected_output" ]; then
    echo "Test 05: grip-add (not existing filename) - ${GREEN}passed${NOCOL}"
else
    echo "Test 05: grip-add (not existing filename) - ${RED}failed${NOCOL}"
fi

# remove the .grip dir
rm -rf .grip