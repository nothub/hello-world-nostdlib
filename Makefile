CC = gcc
CFLAGS = -std=c17              \
         -pedantic             \
         -nostdlib             \
         -static               \
         -s                    \
         -Os                   \
         -fstack-usage         \
         -fno-common           \
         -Wall                 \
         -Wextra               \
         -Wformat=2            \
         -Werror               \
         -Wshadow              \
         -Wundef               \
         -Wconversion          \
         -Wdouble-promotion    \
         -Wno-unused-parameter   # hide unused-parameter warnings

.PHONY: all
all: clean build

build:
	$(CC) $(CFLAGS) hello.s hello.c -o hello.o
	strip -R .comment hello.o

clean:
	-rm -f *.o
	-rm -f *.su
