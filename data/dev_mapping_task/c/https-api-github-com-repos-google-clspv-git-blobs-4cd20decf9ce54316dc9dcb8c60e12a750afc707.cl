void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global uint2* a, global uint2* b) {
  *a = min(*b, (uint)1);
}