void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global int2* a, global int2* b) {
  *a = mad24(*b, 42, 3);
}