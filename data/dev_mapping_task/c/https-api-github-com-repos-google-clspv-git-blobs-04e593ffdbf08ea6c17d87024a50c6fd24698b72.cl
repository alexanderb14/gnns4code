void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global int3* a, global float3* b, int c) {
  *a = ((global int3*)b)[c];
}