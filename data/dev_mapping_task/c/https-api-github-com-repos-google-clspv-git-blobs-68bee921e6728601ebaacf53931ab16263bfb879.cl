void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global uint4* a, global uint4* b) {
  *a = min(*b, (uint)1);
}