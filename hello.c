long int write(int fd, const void *buf, long unsigned int count);

int main(int argc, char *argv[], char* envp[]) {
    write(1, "Hello, World!\n", 14);
    return 0;
}
