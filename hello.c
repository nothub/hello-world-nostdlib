int write(int fd, const void *buf, int count);  /* declaring int count instead of size_t count is a lazy hack to skip some compiler warnings */

int main(int argc, char *argv[], char* envp[]) {
    write(1, "Henlo World! :3\n", 16);
    return 0;
}
