struct test {
  int a;
  int b;
  int c;
  int d;
};

struct test A(void) {
  struct test a;
  return a;
}

void kernel __attribute__((reqd_work_group_size(1, 1, 1))) B(void) {
  A();
}