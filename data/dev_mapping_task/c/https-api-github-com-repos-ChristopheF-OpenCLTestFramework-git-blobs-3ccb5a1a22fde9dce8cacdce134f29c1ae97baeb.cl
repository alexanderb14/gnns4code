__kernel void A(__global const float4* a, const float4 b, const long c, __global float4* d) {
  int e = get_global_id(0);

  d[e] = a[e] + b;
}