void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float* a, global int2* b, int c) {
  *b = ((global int2*)a)[c];
}