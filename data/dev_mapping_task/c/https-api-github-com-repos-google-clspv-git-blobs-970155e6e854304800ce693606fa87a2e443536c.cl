void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float* a, global float4* b, int c) {
  *b = ((global float4*)a)[c];
}