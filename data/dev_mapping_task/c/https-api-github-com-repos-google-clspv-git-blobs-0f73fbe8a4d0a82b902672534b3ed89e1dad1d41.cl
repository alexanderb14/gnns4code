void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float4* a, global float4* b, global float4* c) {
  *a = atan2(*b, *c);
}