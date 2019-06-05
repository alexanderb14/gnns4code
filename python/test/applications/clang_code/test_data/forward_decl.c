int max(int a, int b);

int bar(int a) {
    return max(a+9, 3) + max(a, 2);
}