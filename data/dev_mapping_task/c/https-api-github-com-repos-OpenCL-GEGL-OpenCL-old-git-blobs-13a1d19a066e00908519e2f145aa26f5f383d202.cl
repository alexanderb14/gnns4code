__kernel void A(__global const float4* a, __global const float4* b, __global float4* c) {
  int d = get_global_id(0);
  float4 e = a[d];
  float4 f = b[d];
  float4 g;
  g.xyz = f.xyz + e.xyz * (1.0f - f.w);
  g.w = f.w + e.w - f.w * e.w;
  c[d] = g;
}