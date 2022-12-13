#!/bin/bash
echo "" > test/test_cat.sh
echo "" > test/test_cat.txt
echo "" > test/test_s21_cat.txt
gcc test/test_gen.c -o test/test_gen
test/test_gen
chmod +x test/test_cat.sh
test/test_cat.sh
gcc test/test_cmp.c -o test/test_cmp
test/test_cmp cat