float2 A(float2 a, float2 b); float B(float2 a); float C(float2 a); float2 A(float2 a, float2 b) {
  float2 c;

  c.s0 = a.s0 * b.s0 - a.s1 * b.s1;

  c.s1 = a.s1 * b.s0 + a.s0 * b.s1;

  return c;
}

float B(float2 a) {
  return sqrt(a.s0 * a.s0 + a.s1 * a.s1);
}

float C(float2 a) {
  return atan2(a.s1, a.s0);
}

__kernel void D(__global float* a, __global float* b, __global float* c, __global float* d, __private unsigned int e, __private unsigned int f) {
  size_t g = get_global_id(0);
  size_t h = e + g;

  float2 i;
  i.s0 = a[h];
  i.s1 = a[f + h];

  float2 j;
  j.s0 = b[h];
  j.s1 = i.s0 * b[f + h];

  float2 k;
  k.s0 = c[h];
  k.s1 = c[f + h];

  float2 l;
  l.s0 = cos(i.s1);
  l.s1 = -sin(i.s1);

  i = A(i, l);
  k = A(k, l);

  if (g < f) {
    d[h] = (B(i) - B(k)) / j.s0;
    d[f + h] = (C(i) - C(k)) / (B(i) * j.s1);
  }
}