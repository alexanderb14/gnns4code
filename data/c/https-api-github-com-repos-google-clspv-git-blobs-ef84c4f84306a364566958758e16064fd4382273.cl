void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global uint3* a, global float3* b, int c) {
  *a = ((global uint3*)b)[c];
}