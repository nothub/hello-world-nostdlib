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

REQUIRED_BINS := $(CC) strip
$(foreach bin,$(REQUIRED_BINS),\
    $(if $(shell command -v $(bin) 2> /dev/null),$(),$(error please install missing build requirement: `$(bin)`)))

.PHONY: all
all: clean build

clean:
	-rm -f *.su
	-rm -f hello

build:
	$(CC) $(CFLAGS) lib_64.s hello.c -o hello
	strip -R .comment hello
