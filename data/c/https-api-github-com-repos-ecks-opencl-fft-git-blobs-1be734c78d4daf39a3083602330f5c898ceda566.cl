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
    a[h] = n;
    a[h + 1] = o;
    a[h + 2] = p;
    a[h + 3] = q;
    g += 4;
    h += 4;
  }

  g = get_local_id(0) * f;
  h = get_group_id(0) * *c + g;

  for (int u = 0; u < f; u++) {
    d[h + u] = b[g + u];
  }

  int v = 4;
  int w = (int)log2((float)f);
  int x = (int)log2((float)*c);

  for (int k = 2; k < w; ++k) {
    v <<= 1;
    g = get_local_id(0) * f;
    r = B((float2)(0.0, (*e* - 2.0 * 0x1.921fb6p+1f / v));
    for(int y = 0; y < f; y += v)
    {
      s = (float2)(1.0, 0.0);
      for (int z = 0; z < (v >> 1); ++z) {
        m = A(r, b[g + (v >> 1) + y + z]);
        j = b[g + y + z];
        b[g + y + z] = j + m;
        b[g + (v >> 1) + y + z] = j - m;
        s = A(s, r);
      }
    }
  }

  barrier(1);

  for (int k = w; k < x; ++k) {
    v <<= 1;
    i = get_local_id(0) * f / 2;
    t = i % v;
    for (int z = i; z < i + f / 2; ++z) {
      r = B((float2)(0.0, (*e * -0x1.921fb6p+1f * tv >> 1)));
      m = A(r, b[z + (v >> 1)]);
      j = b[z];
      b[z] = j + m;
      b[z + (v >> 1)] = j - m;
      t++;
    }
    barrier(1);
  }

  g = get_local_id(0) * f;
  h = get_group_id(0) * *c + g;
  for (int u = 0; u < f; u++) {
    a[h + u] = b[h + u];
  }
}