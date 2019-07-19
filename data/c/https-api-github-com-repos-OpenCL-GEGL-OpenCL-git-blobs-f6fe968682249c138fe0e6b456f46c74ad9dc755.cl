__kernel void A(__global const float4* a, __global float4* b) {
  int c = get_global_id(0);
  float4 d = a[c];
  float4 e;
  e.xyz = (1.0f - d.xyz);
  e.w = d.w;
  b[c] = e;
}