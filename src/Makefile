.PHONY: all test test_cat test_grep s21_cat s21_cat.o s21_grep s21_grep.o clean rebuild check
CC=gcc
CC2=gcc
CFLAGS=-c
LDFLAGS=-Wall -Wextra -Werror
LIBFLAGS=-lpcre
OS := $(shell uname -s)

ifeq ($(OS), Darwin)
	CC2 += -D OS_MAC
else
	CC2 += -D OS_LINUX
endif

default: all

all:	s21_cat s21_grep 
test: test_cat test_grep

test_cat: clean s21_cat
	#TEST CAT START
	chmod +x test/test_c.sh
	test/test_c.sh
	#TEST CAT END
test_grep: clean s21_grep
	#TEST GREP START
	chmod +x test/test_g.sh
	test/test_g.sh
	#TEST GREP END

s21_cat: s21_cat.o
	$(CC2) $(LDFLAGS) cat/s21_cat.o -o cat/s21_cat $(LIBFLAGS)

s21_cat.o:
	$(CC2) $(LDFLAGS) -c -o cat/s21_cat.o cat/s21_cat.c $(LIBFLAGS)

s21_grep: s21_grep.o
	$(CC2) $(LDFLAGS) grep/s21_grep.o -o grep/s21_grep $(LIBFLAGS)

s21_grep.o:
	$(CC2) $(LDFLAGS) -c -o grep/s21_grep.o grep/s21_grep.c $(LIBFLAGS)

clean:
	rm -rf test*.txt cat/*.o grep/*.o cat/s21_cat grep/s21_grep test_gen test_cmp 
	rm -rf test/test_grep.* test/test_cat.*  test/test_s21_grep.* test/test_s21_cat.*
	rm -rf test/test_cmp test/test_gen test/test_gen_grep 
	rm -rf a.out cat/a.out grep/a.out test/a.out
	clear

rebuild: clean all

check:
	cppcheck grep/*.c cat/*.c
	cp ../materials/linters/CPPLINT.cfg CPPLINT.cfg
	python3 ../materials/linters/cpplint.py --extension=c cat/*.c grep/*.c
	#CK_FORK=no leaks --atExit -- ./test







