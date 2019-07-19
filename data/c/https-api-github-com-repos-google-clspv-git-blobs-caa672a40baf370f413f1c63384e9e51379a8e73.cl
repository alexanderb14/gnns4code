void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float4* a, global float* b, int c) {
  ((global float*)a)[c] = *b;
}