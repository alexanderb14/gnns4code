__kernel void A(__global float4* a, __global float4* b, __global float4* c, float d, float e) {
  unsigned int f = get_global_id(0);

  float4 g = a[f];
  float4 h = c[f];
  g.xyz += h.xyz;

  if (g.x >= e) {
    g.x = -2.0f * e + g.x;
  } else if (g.x <= -e) {
    g.x = 2.0f * e - g.x;
  }

  if (g.y >= e) {
    g.y = -2.0f * e + g.y;
  } else if (g.y <= -e) {
    g.y = 2.0f * e - g.y;
  }

  a[f] = g;
  c[f] = h;
}