__kernel void A(__global float3* a, __global float3* b, __global float3* c) {
  int d = get_global_id(0);

  c[d] = cross(a[d], b[d]);
}