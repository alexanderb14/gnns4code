constant uint Ga = 42; void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global uint* a) {
  *a = Ga;
}