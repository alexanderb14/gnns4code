__kernel void A(__global const float4* a, __global float4* b, float3 c, float3 d, float3 e) {
  int f = get_global_id(0);
  float4 g = a[f];
  float4 h;

  if (g.x > d.x && g.x < e.x && g.y > d.y && g.y < e.y && g.z > d.z && g.z < e.z) {
    h.x = clamp(g.x + c.x, 0.0f, 1.0f);
    h.y = clamp(g.y + c.y, 0.0f, 1.0f);
    h.z = clamp(g.z + c.z, 0.0f, 1.0f);
  } else {
    h.xyz = g.xyz;
  }

  h.w = g.w;
  b[f] = h;
}