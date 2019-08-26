__kernel void A(__global float4* a, __global float4* b, __global float* c) {
  int d = get_global_id(0);
  c[d] = dot(a[d], b[d]);
}