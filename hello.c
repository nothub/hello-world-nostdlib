long int write(int fd, const void *buf, long unsigned int count);

int main() {
    write(1, "👋\n", 5);
    return 0;
}
