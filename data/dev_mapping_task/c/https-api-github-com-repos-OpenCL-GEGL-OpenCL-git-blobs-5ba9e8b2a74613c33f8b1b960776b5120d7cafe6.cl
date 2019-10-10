__kernel void A(__global const float4* a, __global float4* b, float c) {
  int d = get_global_id(0);
  float4 e = a[d];

  e.xyz = __clc_trunc(e.xyz * c + (float3)(0.5f)) / c;
  b[d] = e;
}