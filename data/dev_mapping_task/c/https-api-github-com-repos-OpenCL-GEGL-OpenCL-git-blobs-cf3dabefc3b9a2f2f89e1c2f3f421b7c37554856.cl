__kernel void A(__global const float4* a, __global float4* b, float3 c, float3 d, int3 e) {
  int f = get_global_id(0);
  float4 g = a[f];
  float3 h = (float3)(1.0f, 1.0f, 1.0f);
  float3 i = 0.5f * (h + sin((2.0f * g.xyz - h) * c.xyz + d.xyz));
  float4 j;

  j.xyz = e.xyz ? g.xyz : i;
  j.w = g.w;
  b[f] = j;
}