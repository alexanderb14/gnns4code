void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global int* a, int b, int c) {
  bool d = b < 100;
  bool e = c > 50;
  if (d && e) {
    *a = 1;
  }
}