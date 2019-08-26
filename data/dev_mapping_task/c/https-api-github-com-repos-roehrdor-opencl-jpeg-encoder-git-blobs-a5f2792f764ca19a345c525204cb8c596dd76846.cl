__kernel void A(__global unsigned int* a, __global unsigned char* b, unsigned int c) {
  size_t d = get_global_id(0);

  if (d < c) {
    d *= 3;

    unsigned char e = b[d + 0];
    unsigned char f = b[d + 1];
    unsigned char g = b[d + 2];

    unsigned int h = a[0 + e * 3 + 0];
    unsigned int i = a[0 + e * 3 + 1];
    unsigned int j = a[0 + e * 3 + 2];

    unsigned int k = a[0x300 + f * 3 + 0];
    unsigned int l = a[0x300 + f * 3 + 1];
    unsigned int m = a[0x300 + f * 3 + 2];

    unsigned int n = a[0x600 + g * 3 + 0];
    unsigned int o = a[0x600 + g * 3 + 1];
    unsigned int p = a[0x600 + g * 3 + 2];

    b[d + 0] = ((unsigned char)((h + k + n) >> 0x10));
    b[d + 1] = ((unsigned char)((j + m + p) >> 0x10));
    b[d + 2] = ((unsigned char)((i + l + o) >> 0x10));
  }
}

__kernel void B(__global short* a, __global unsigned char* b, unsigned int c, unsigned int d, unsigned int e, unsigned int f, unsigned int g) {
  size_t h = get_global_id(0);

  size_t i = h >> 0x8;

  size_t j = i % c;
  size_t k = i / c;

  size_t l = (h & 0xFF) >> 0x6;
  size_t m = l & 0x1;
  size_t n = l >> 0x1;

  size_t o = h & 0x3F;
  size_t p = o & 0x7;
  size_t q = o >> 0x3;

  size_t r = (j << 0x4) | (m << 0x3) | p;
  size_t s = (k << 0x4) | (n << 0x3) | q;

  if (r >= f)
    r = f - 1;
  if (s >= g)
    s = g - 1;

  a[h] = (short)b[(r + (s * f)) * 3] - (short)0x80;
}

__kernel void C(__global short* a, __global short* b, __global unsigned char* c, unsigned int d, unsigned int e, unsigned int f, unsigned int g, unsigned int h) {
  size_t i = get_global_id(0);

  size_t j = i >> 0x6;

  size_t k = j % d;
  size_t l = j / d;

  size_t m = (i & 0x7) > 0x3;
  size_t n = (i & 0x3F) > 0x1F;

  size_t o = i & 0x3F;
  size_t p = (o & 0x7) << 0x1;
  size_t q = (o >> 0x3) << 0x1;

  size_t r = (k << 0x4) | (m << 0x3) | p;
  size_t s = (l << 0x4) | (n << 0x3) | q;

  size_t t = r;
  size_t u = r + 1;
  size_t v = s;
  size_t w = s + 1;

  if (t >= g)
    t = g - 1;
  if (u >= g)
    u = g - 1;
  if (v >= h)
    v = h - 1;
  if (w >= h)
    w = h - 1;

  size_t x = (t + (v * g));
  size_t y = (u + (v * g));
  size_t z = (t + (w * g));
  size_t aa = (u + (w * g));

  long ab = 0;
  long ac = 0;

  size_t ad = x * 3;
  ab += (long)c[ad + 1];
  ac += (long)c[ad + 2];

  ad = y * 3;
  ab += (long)c[ad + 1];
  ac += (long)c[ad + 2];

  ad = z * 3;
  ab += (long)c[ad + 1];
  ac += (long)c[ad + 2];

  ad = aa * 3;
  ab += (long)c[ad + 1];
  ac += (long)c[ad + 2];

  int ae = 0x1 << (i & 0x1);
  ab += ae;
  ac += ae;

  a[i] = (short)(ab >> 0x2) - (short)0x80;
  b[i] = (short)(ac >> 0x2) - (short)0x80;
}
__kernel void D(__global short* a, __global short* b, unsigned int c, __global short* d, __global int* e, __global int* f, __global char* g, __global short* h) {
  unsigned int i;
  unsigned short j, k;
  short l, m, n, o;
  short p, q, r, s, t, u;
  int v;
  __local short* w;
  int x;

  size_t y = get_global_id(0);
  size_t z = get_local_id(0);

  short aa = z >> 0x3;
  short ab = (aa) << 0x3;
  short ac = z & 0x7;

  __local short ad[0x40];
  ad[z] = a[y];
  barrier(1);
  w = &ad[ab];

  l = ac << 0x3;
  m = ac << 0x2;
  n = ac << 0x1;
  o = ac << 0x1;
  p = w[f[l + 0]] + (w[f[l + 1]] * e[n + 0]);
  q = w[f[l + 2]] + (w[f[l + 3]] * e[n + 0]);
  r = w[f[l + 4]] + (w[f[l + 5]] * e[n + 0]);
  s = w[f[l + 6]] + (w[f[l + 7]] * e[n + 0]);
  v = p * d[m + 0] + (q + p) * d[m + 1] + (r + p) * d[m + 2] + ((p + q) + ((r + s) * e[n + 1])) * d[m + 3];
  t = (short)(((v) + (1 << ((0xB) - 1))) >> (0xB)) * g[o + 0] + ((int)((unsigned int)(v) << (0x2))) * g[o + 1];

  barrier(1);
  ad[z] = t;
  barrier(1);

  w = &ad[ac];

  l = aa << 0x3;
  m = aa << 0x2;
  n = aa << 0x1;
  p = w[f[l + 0] << 0x3] + (w[f[l + 1] << 0x3] * e[n + 0]);
  q = w[f[l + 2] << 0x3] + (w[f[l + 3] << 0x3] * e[n + 0]);
  r = w[f[l + 4] << 0x3] + (w[f[l + 5] << 0x3] * e[n + 0]);
  s = w[f[l + 6] << 0x3] + (w[f[l + 7] << 0x3] * e[n + 0]);
  v = p * d[m + 0] + (q + p) * d[m + 1] + (r + p) * d[m + 2] + ((p + q) + ((r + s) * e[n + 1])) * d[m + 3];
  t = (((v) + (1 << ((0x2 + h[aa]) - 1))) >> (0x2 + h[aa]));

  j = b[c + z + 0x40 * 0];
  k = b[c + z + 0x40 * 1];
  x = b[c + z + 0x40 * 3];
  u = t < 0 ? -1 : 1;
  t *= u;
  i = (unsigned int)(t + k) * j;
  i >>= x + sizeof(short) * 8;
  t = (short)i;
  t *= u;
  a[y] = (short)t;
}

__kernel void E(__global short* a, unsigned int b, unsigned int c, unsigned int d) {
  size_t e = get_global_id(0);
  size_t f = b - 1;
  if ((f << 0x1) + 1 >= d) {
    size_t g = e >> 0x7;
    size_t h = (g * b) + f;
    size_t i = (e & 0x7F) > 0x3F ? 3 : 1;
    size_t j = (e & 0x3F);
    size_t k = ((h << 0x8) | (i << 0x6) | j);
    if (j == 0) {
      size_t l = ((h << 0x8) | ((i - 1) << 0x6) | j);
      a[k] = a[l];
    } else {
      a[k] = 0;
    }
  }
}

__kernel void F(__global short* a, unsigned int b, unsigned int c, unsigned int d) {
  size_t e = get_global_id(0);
  size_t f = c - 1;
  if ((f << 0x1) + 1 >= d) {
    size_t g = e >> 0x7;
    size_t h = (f * b) + g;
    size_t i = (e & 0x7F) > 0x3F ? 3 : 2;
    size_t j = (e & 0x3F);
    size_t k = ((h << 0x8) | (i << 0x6) | j);

    a[k] = 0;
  }
}