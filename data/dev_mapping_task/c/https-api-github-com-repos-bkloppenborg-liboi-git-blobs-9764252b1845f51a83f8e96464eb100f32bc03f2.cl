float2 A(float2 a, float2 b); float2 B(float2 a, float2 b, float2 c); float2 A(float2 a, float2 b) {
  float2 c;

  c.s0 = a.s0 * b.s0 - a.s1 * b.s1;

  c.s1 = a.s1 * b.s0 + a.s0 * b.s1;

  return c;
}

float2 B(float2 a, float2 b, float2 c) {
  a = A(a, b);
  return A(a, c);
}

__kernel void C(__global float2* a, __global uint4* b, __global short4* c, __private unsigned int d, __private unsigned int e, __global float* f) {
  size_t g = get_global_id(0);

  uint4 h = b[g];
  float2 i = a[h.s0];
  float2 j = a[h.s1];
  float2 k = a[h.s2];

  short4 l = c[g];
  i.s1 *= l.s0;
  j.s1 *= l.s1;
  k.s1 *= l.s2;

  k.s1 *= -1;

  float2 m = B(i, j, k);

  if (g < e) {
    f[d + g] = m.s0;
    f[d + e + g] = m.s1;
  }
}