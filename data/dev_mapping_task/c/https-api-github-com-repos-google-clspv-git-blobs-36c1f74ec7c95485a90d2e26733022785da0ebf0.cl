void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global uint3* a, global uint3* b) {
  *a = min(*b, (uint)1);
}