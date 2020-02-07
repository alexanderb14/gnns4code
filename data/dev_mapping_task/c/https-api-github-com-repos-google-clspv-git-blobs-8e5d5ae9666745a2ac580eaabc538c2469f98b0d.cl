void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float3* a, global float3* b) {
  *a = mad(*b, 42.0f, 1.0f);
}