void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global uint2* a, global uint2* b) {
  *a = mad24(*b, (uint)42, (uint)3);
}