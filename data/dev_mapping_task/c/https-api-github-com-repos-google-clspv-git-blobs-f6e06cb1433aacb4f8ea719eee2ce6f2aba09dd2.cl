void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float3* a, global float3* b, global int3* c) {
  *a = ldexp(*b, *c);
}