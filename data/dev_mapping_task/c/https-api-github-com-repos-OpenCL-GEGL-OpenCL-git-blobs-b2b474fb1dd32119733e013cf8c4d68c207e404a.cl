__kernel void A(__global const float4* a, __global float4* b, float c, float d) {
  int e = get_global_id(0);
  float4 f = a[e];
  float4 g;
  g.xyz = (f.xyz - 0.5f) * c + d + 0.5f;
  g.w = f.w;
  b[e] = g;
}