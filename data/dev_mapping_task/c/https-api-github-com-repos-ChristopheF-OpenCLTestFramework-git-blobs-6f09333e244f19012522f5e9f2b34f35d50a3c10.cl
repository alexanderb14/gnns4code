__kernel void A(__global const float4* a, const long b, __global float4* c) {
  int d = get_global_id(0);

  c[d] = a[d];
}