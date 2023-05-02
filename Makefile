CC = musl-gcc
CFLAGS = -std=c17                                \
         -nostdlib                               \
         -static                                 \
         -s                                      \
         -Os                                     \
         -fstack-usage                           \
         -ffreestanding                          \
         -fdata-sections                         \
         -ffunction-sections                     \
         -fno-common                             \
         -fno-unwind-tables                      \
         -fno-asynchronous-unwind-tables         \
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

hello: lib_64.s hello.c
	$(CC) $(CFLAGS) $^ -o $@
	strip -R .comment $@

.PHONY: container
container: hello
	docker build -t "n0thub/hello" .
	docker images --filter=reference='n0thub/hello' --format "{{.Size}}"
