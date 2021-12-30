CC = musl-gcc
CFLAGS = -std=c17                                \
         -nostdlib                               \
         -static                                 \
         -ffreestanding                          \
         -s                                      \
         -Os                                     \
         -fstack-usage                           \
         -fno-common                             \
         -fno-unwind-tables                      \
         -fno-asynchronous-unwind-tables         \
         -fno-stack-protector                    \
         -fdata-sections                         \
         -ffunction-sections                     \
         -Wl,-n,-N,--gc-sections,--build-id=none \
         -Wall                                   \
         -Wextra                                 \
         -Wformat=2                              \
         -Werror                                 \
         -Wshadow                                \
         -Wundef                                 \
         -Wconversion                            \
         -Wdouble-promotion                      \
         -Wno-unused-parameter

.PHONY: all
all: clean build

clean:
	-rm -f *.su
	-rm -f hello

build:
	$(CC) $(CFLAGS) lib_64.s hello.c -o hello
	strip -R .comment hello
