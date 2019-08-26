int A(int2 a, __global int* b) {
  int c, d, e, f, g, h, i, j;

  c = (a.x >> 12) & ((1 << ((5 + 4 - 1) - 1)) - 1);
  e = ((a.y >> 12) & ((1 << ((5 + 4 - 1) - 1)) - 1)) * (1 << ((5 + 4 - 1) - 1));

  d = ((a.x >> 12) + 1) & ((1 << ((5 + 4 - 1) - 1)) - 1);
  f = (((a.y >> 12) + 1) & ((1 << ((5 + 4 - 1) - 1)) - 1)) * (1 << ((5 + 4 - 1) - 1));

  g = a.x & 4095;
  h = a.y & 4095;

  i = ((4096 - g) * b[e + c] + g * b[e + d]) >> 12;
  j = ((4096 - g) * b[f + c] + g * b[f + d]) >> 12;

  return ((4096 - h) * i + h * j) >> 12;
}
__kernel void B(__global float4* a, __global int* b, float4 c, float d, float e, unsigned int f, uint2 g) {
  unsigned int h = get_global_id(0);
  unsigned int i = get_global_id(1);
  if ((h >= g.x) || (i >= g.y))
    return;
  unsigned int j = i * g.x + h;

  __global int* k = b;
  float2 l = c.xz + a[j].xz;
 int2 m = (int2)((int)(lx*e(ly*eigned int n, o = f / 4;
 float p=0.f;
 for(n=0;n<o;n++){
    p += (float)A(m, k);
    m.x = m.x << 4;
    m.y = m.y << 4;
    k += ((1 << ((5 + 4 - 1) - 1)) * (1 << ((5 + 4 - 1) - 1)));
 }

 a[j].y += d*p/(1<<(15 -1));
}