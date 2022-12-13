#!/bin/bash

echo "" > test/test_grep.sh
echo "" > test/test_grep.txt
echo "" > test/test_s21_grep.txt

gcc test/test_gen_grep.c -o test/test_gen_grep
test/test_gen_grep
chmod +x test/test_grep.sh
test/test_grep.sh
gcc test/test_cmp.c -o test/test_cmp
test/test_cmp grep