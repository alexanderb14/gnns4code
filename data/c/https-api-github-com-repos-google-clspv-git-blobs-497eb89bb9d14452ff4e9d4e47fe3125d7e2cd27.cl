void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(float4 a, global float2* b, global float2* c) {
  (*b) = a.hi;
  (*c) = a.lo;
}