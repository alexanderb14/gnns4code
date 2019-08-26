void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global int2* a, global int2* b, global int* c) {
  *a = min(*b, *c);
}