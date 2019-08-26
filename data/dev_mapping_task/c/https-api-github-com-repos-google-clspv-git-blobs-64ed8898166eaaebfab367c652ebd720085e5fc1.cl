void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float2* a, global float4* b, int c) {
  *a = ((global float2*)b)[c];
}