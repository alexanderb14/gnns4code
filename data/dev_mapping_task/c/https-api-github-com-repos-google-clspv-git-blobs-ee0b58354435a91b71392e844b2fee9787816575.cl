void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float2* a, global int2* b, int c) {
  ((global int2*)a)[c] = *b;
}