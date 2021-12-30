long int write(int fd, const void *buf, long unsigned int count);

int main(int argc, char *argv[], char* envp[]) {
    write(1, "Henlo World! :3\n", 16);
    return 0;
}
