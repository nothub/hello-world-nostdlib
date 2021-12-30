int write(int fd, void *bug, int count);

int main(int argc, char *argv[], char* envp[]) {
    write(1, "hi :3\n", 6);
    return 0;
}
