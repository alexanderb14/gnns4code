void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global int2* a, global int2* b) {
  *a = max(*b, 1);
}