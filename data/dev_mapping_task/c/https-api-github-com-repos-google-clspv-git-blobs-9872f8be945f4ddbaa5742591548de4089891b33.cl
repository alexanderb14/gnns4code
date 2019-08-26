struct test {
  int a[128];
};

void A(struct test a) {
}

void kernel __attribute__((reqd_work_group_size(1, 2, 3))) B(void) {
  struct test a;
  A(a);
}