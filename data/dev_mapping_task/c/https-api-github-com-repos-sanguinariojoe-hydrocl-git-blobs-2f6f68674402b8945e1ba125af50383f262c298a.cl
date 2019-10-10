__kernel void A(__global float4* a, __global float2* b, __global float* c, __global float* d, __global float* e, float4 f, float g, unsigned int h, uint2 i) {
  unsigned int j = get_global_id(0);
  unsigned int k = get_global_id(1);
  if ((j >= i.x) || (k >= i.y))
    return;
  unsigned int l = k * i.x + j;

  float2 m = f.xz + a[l].xz;
  float n, o, p, q;
  unsigned int r;
  for (r = 0; r < h; r++) {
    n = dot(b[r], m);
    o = 1.5625f * d[r] * d[r];
    a[l].y += c[r] * sin(2.f * 3.14 * (g / d[r] - n / o) + e[r]);
  }
}