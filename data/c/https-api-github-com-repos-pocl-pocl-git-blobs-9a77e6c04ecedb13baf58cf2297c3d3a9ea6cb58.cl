__attribute__((reqd_work_group_size(2, 2, 2))) __kernel void A(__global const float4* a, __global const float4* b, __global float* c) {
  int d = get_global_id(0);

  c[d] = dot(a[d], b[d]);
}

__attribute__((reqd_work_group_size(3, 3, 3))) __kernel void B(__global const float4* a, __global const float4* b, __global float* c) {
  int d = get_global_id(0);

  c[d] = dot(a[d], b[d]);
}