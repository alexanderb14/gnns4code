void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global int* a) {
  const int b = *a;

  const bool c = (b < 42);

  const int d = c;

  *a = d;
}