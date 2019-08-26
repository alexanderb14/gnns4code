void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global int4* a, global int4* b, global int* c) {
  *a = max(*b, *c);
}