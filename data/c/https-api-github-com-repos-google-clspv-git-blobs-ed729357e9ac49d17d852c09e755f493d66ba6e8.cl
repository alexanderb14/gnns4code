void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(float3 a, global float3* b) {
  (*b) = a.zxy;
}