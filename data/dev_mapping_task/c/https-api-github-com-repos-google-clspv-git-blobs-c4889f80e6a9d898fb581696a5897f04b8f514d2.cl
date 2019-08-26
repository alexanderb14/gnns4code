void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float* a, global float2* b, int c) {
  *b = ((global float2*)a)[c];
}