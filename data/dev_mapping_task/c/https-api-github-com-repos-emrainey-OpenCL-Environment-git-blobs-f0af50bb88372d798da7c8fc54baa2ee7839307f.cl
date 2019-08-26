uchar A(float a, uchar b, uchar c) {
  if ((uint)a > (uint)c)
    return c;
  if ((int)a < (int)b)
    return b;
  return (uchar)a;
}

__kernel void B(uint a, uint b, __global uchar* c, int d, __global uchar* e, int f, __global char* g, uint h, uint i, uint j) {
  const int k = get_global_id(0);
  const int l = get_global_id(1);
  int m, n;
  int o, p;
  int q, r, s;
  int t;
  int u = h >> 1;
  int v = 0;
  int w = 0;
  float x = 0;
  for (q = 0; q < 2; q++) {
    v = 0;
    for (r = 0, p = l - u; r < h, p <= l + u; r++, p++) {
      if (p < 0)
        continue;
      if (p >= b)
        continue;

      for (s = 0, o = k - u; s < h, o <= k + u; s++, o++) {
        if (o < 0)
          continue;
        if (o >= a)
          continue;

        m = (p * d) + o;

        t = (q * h * h) + (r * h) + s;
        v += (int)((int)g[t] * (uint)c[m]);
      }
    }
    w += (v * v);
  }
  n = (l * f) + k;
  x = sqrt((float)w);
  e[n] = ((x / i) * j);
}

__kernel void C(uint a, uint b, __global uchar* c, int d, __global uchar* e, int f, __global char* g, uint h, uint i, uint j, __local uchar* k, __local char* l) {
  const int m = get_global_id(0);
  const int n = get_global_id(1);
  int o, p;
  int q, r;
  int s, t, u;
  int v;
  int w = h >> 1;
  int x = 0;
  int y = 0;
  float z = 0;

  for (s = 0; s < 2; s++) {
    for (t = 0, r = n - w; t < h, r <= n + w; t++, r++) {
      for (u = 0, q = m - w; u < h, q <= m + w; u++, q++) {
        o = (r * d) + q;
        v = (s * h * h) + (t * h) + u;

        if ((r < 0) || (r >= b) || (q < 0) || (q >= a)) {
          k[v] = 0;
        } else {
          k[v] = c[o];
        }
        l[v] = g[v];
      }
    }
  }
  barrier(1);

  x += l[0] * k[0] + l[1] * k[1] + l[2] * k[2];
  x += l[3] * k[3] + l[4] * k[4] + l[5] * k[5];
  x += l[6] * k[6] + l[7] * k[7] + l[8] * k[8];
  y += (x * x);

  x += l[9] * k[0] + l[10] * k[1] + l[11] * k[2];
  x += l[12] * k[3] + l[13] * k[4] + l[14] * k[5];
  x += l[15] * k[6] + l[16] * k[7] + l[17] * k[8];
  y += (x * x);

  z = sqrt((float)y);

  p = (n * f) + m;

  e[p] = ((z / i) * j);
}