int A(int a) {
  return a + 42;
}

int B(int a) {
  return a + 13;
}
void kernel __attribute__((reqd_work_group_size(1, 1, 1))) C(global int* a) {
  *a = A(*a);
}