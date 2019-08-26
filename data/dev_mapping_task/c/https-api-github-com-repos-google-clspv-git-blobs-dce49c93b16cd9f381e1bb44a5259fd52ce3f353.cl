void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global int3* a, global int3* b) {
  *a = max(*b, 1);
}