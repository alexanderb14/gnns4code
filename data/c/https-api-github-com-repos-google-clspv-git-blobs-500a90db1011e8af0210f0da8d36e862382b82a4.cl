void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global int* a, global int* b) {
  *a = mul24(*b, 42);
}