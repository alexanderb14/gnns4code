float2 A(float2 a, float2 b) {
  return (float2)(a.s0 * b.s0 - a.s1 * b.s1, a.s0 * b.s1 + a.s1 * b.s0);
}

float2 B(float2 a) {
  return (float2)(exp(a.s0) * cos(a.s1), exp(a.s0) * sin(a.s1));
}

__kernel void C(__global float2* a, __local float2* b, __global const uint* c, __global float2* d, __global const int* e) {
  int f = *c / get_local_size(0);
  int g = get_local_id(0) * f;
  int h = get_group_id(0) * *c + g;
  int i;

  float2 j;
  float2 k;
  float2 l;
  float2 m;

  float2 n;
  float2 o;
  float2 p;
  float2 q;

  float2 r;
  float2 s;
  int t;

  for (int u = 0; u < f; u += 4) {
    j = a[h];
    k = a[h + 1];
    l = a[h + 2];
    m = a[h + 3];

    n = j + k;
    o = j - k;
    p = l + m;
    q = (float2)(l.s1 - m.s1, m.s0 - l.s0) * (*e);
    b[g] = n + p;
    b[g + 1] = o + q;
    b[g + 2] = n - p;
    b[g + 3] = o - q;
    g += 4;
    h += 4;
  }

  g = get_local_id(0) * f;
  h = get_group_id(0) * *c + g;
  int v = 4;
  int w = (int)log2((float)f);
  int x = (int)log2((float)*c);
  barrier(1);

  for (int k = w; k < x; ++k) {
    v <<= 1;
    i = (get_local_id(0) + (get_local_id(0) / (v >> 2)) * (v >> 2)) * (f / 2);
    t = i % v;
    for (int y = i; y < i + f / 2; ++y) {
      r = B((float2)(0.0, (*e * -0x1.921fb6p+1f * tv >> 1)));
      m = A(r, b[y + (v >> 1)]);
      j = b[y];
      b[y] = j + m;
      b[y + (v >> 1)] = j - m;
      t++;
    }
    barrier(1);
  }

  g = get_local_id(0) * f;
  h = get_group_id(0) * *c + g;
  for (int u = 0; u < f; u++) {
    a[h + u] = b[g + u];
  }
}

__kernel void D(__global float2* a, __global const uint* b, __global const uint* c, __global const int* d) {
  int e = *c / get_local_size(0);
  int f = (get_global_id(0) + (get_global_id(0) / (*b >> 2)) * (*b >> 2)) * (e / 2);
  int g = f % *b;
  float2 h;

  float2 i;
  float2 j;

  for (int k = f; k < f + e / 2; ++k) {
    h = B((float2)(0.0, (*d * -0x1.921fb6p+1f * g * b >> 1)));
    i = A(h, a[k + (*b >> 1)]);
    j = a[k];
    a[k] = j + i;
    a[k + (*b >> 1)] = j - i;
    g++;
  }
}