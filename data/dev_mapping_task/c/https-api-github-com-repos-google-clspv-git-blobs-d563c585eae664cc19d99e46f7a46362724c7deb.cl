void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global int2* a, global int4* b, int c) {
  *b = ((global int4*)a)[c];
}