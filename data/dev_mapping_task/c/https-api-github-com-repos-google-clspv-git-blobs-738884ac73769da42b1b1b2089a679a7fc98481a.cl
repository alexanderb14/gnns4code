void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float* a, uint b, float4 c) {
  a[b] = c.x;
}