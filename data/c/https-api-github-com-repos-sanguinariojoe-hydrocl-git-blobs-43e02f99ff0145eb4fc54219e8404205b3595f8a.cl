__kernel void A(__global float4* a, __global float4* b, __global float4* c, __global float4* d, uint2 e) {
  unsigned int f = get_global_id(0);
  unsigned int g = get_global_id(1);
  if ((f >= e.x) || (g >= e.y))
    return;
  unsigned int h = g * e.x + f;

  a[h] = c[h];
  b[h] = d[h];
}

__kernel void B(__global float4* a, uint2 b) {
  unsigned int c = get_global_id(0);
  unsigned int d = get_global_id(1);
  if ((c < 1) || (d < 1))
    return;
  if ((c >= b.x - 1) || (d >= b.y - 1))
    return;
  unsigned int e = d * b.x + c;

  a[e].y = 0.2f * (a[e].y + a[e - 1].y + a[e + 1].y + a[e - b.x].y + a[e + b.x].y);
}

__kernel void C(__global float4* a, __global float4* b, uint2 c) {
  unsigned int d = get_global_id(0);
  unsigned int e = get_global_id(1);
  if ((d >= c.x) || (e >= c.y))
    return;
  unsigned int f = e * c.x + d;

  if ((d < 1) || (e < 1) || (d >= c.x - 1) || (e >= c.y - 1)) {
    b[f] = (float4)(0.f, -1.f, 0.f, 0.f);
    return;
  }

  float4 g, h;
  g = a[f - 1] - a[f + 1];
  h = a[f - c.x] - a[f + c.x];
  b[f] = normalize(cross(h, g));
}
__kernel void D(__global float4* a, __global float4* b, __global float4* c, float4 d, float e, float f, uint2 g) {
  unsigned int h = get_global_id(0);
  unsigned int i = get_global_id(1);
  if ((h < 1) || (i < 1) || (h >= g.x - 1) || (i >= g.y - 1))
    return;
  unsigned int j = i * g.x + h;

  float k, l;
  float2 m, n, o;

  m = __clc_fabs(normalize(d.xz));
  n = (float2)(-m, m);

  k = distance(b[j].xz, b[j + g.x].xz);
  l = distance(b[j].xz, b[j + 1].xz);
  o = c[j].xz * (m * k + n * l) * e;

  a[j].xz = b[j].xz + f * o;
}
__kernel void E(__global float4* a, float4 b, float4 c, float4 d, float4 e, uint2 f) {
  unsigned int g = get_global_id(0);
  unsigned int h = get_global_id(1);
  if ((g >= f.x) || (h >= f.y))
    return;
  unsigned int i = h * f.x + g;

  float2 j, k;
  float4 l;
  float m;

  j.x = g / (float)f.x;
  j.y = h / (float)f.y;
  k = (float2)(1.f, 1.f) - j;

  l.x = k.y * (k.x * b.x + j.x * c.x) + j.y * (k.x * d.x + j.x * e.x);
  l.z = k.y * (k.x * b.z + j.x * c.z) + j.y * (k.x * d.z + j.x * e.z);
  l.w = k.y * (k.x * b.w + j.x * c.w) + j.y * (k.x * d.w + j.x * e.w);

  m = 1.f / l.w;
  l.x *= m;
  l.z *= m;

  a[i].x = l.x;
  a[i].z = l.z;

  a[i].w = 1.f;
}

__kernel void F(__global float4* a, float b, uint2 c) {
  unsigned int d = get_global_id(0);
  unsigned int e = get_global_id(1);
  if ((d >= c.x) || (e >= c.y))
    return;
  unsigned int f = e * c.x + d;

  a[f].y = -b;
}