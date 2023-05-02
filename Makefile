CC = musl-gcc
CFLAGS = -ansi -static -nostdlib                 \
         -Os -fno-asynchronous-unwind-tables     \
         -Wl,-n,-N,--gc-sections,--build-id=none \
         -Wall -Wextra -Werror

hello: lib_64.s hello.c
	$(CC) $(CFLAGS) $^ -o $@
	strip --strip-unneeded -R .comment $@

.PHONY: docker
docker: hello
	docker build -t "n0thub/hello" .
