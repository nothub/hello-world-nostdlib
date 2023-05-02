#!/usr/bin/env sh

musl-gcc -ansi -static -nostdlib \
    -Os -fno-asynchronous-unwind-tables \
    -Wl,-n,-N,--gc-sections,--build-id=none \
    -Wall -Wextra -Werror lib_64.s hello.c -o hello

strip --strip-unneeded -R .comment hello

token="726f64617461" # rodata
size=$(echo $(($(xxd -p hello | tr -d '\n' | grep -o '.*'"${token}" | wc -m) / 2)) | bc -l)
dd if=hello of=stripped bs=1 skip=0 count="${size}" # 🙈
mv stripped hello

chmod +x hello
docker build -t "n0thub/hello" .

printf "bin size: %sB\n" "$(wc -c <hello)"
printf "img size: %s\n" "$(docker images --filter=reference="n0thub/hello:latest" --format "{{.Size}}")"

docker run -it --rm "n0thub/hello"
