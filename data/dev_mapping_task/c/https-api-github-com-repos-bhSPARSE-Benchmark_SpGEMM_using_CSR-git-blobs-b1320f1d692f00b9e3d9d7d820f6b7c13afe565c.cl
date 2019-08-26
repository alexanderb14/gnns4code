typedef double vT; inline void A(__local int* a, __local vT* b, __local int* c, __local vT* d, const int e) {
  int f;
  vT g;

  if ((*a > *c) == e) {
    f = *a;
    *a = *c;
    *c = f;
    g = *b;
    *b = *d;
    *d = g;
  }
}

inline void B(__local int* a, __local vT* b, int c) {
  int d = 1;
  int e = get_local_id(0);

  for (int f = 2; f <= c; f <<= 1) {
    int g = f >> 1;
    int h = e & (g - 1);

    {
      barrier(1);
      int i = 2 * e - (e & (g - 1));
      A(&a[i], &b[i], &a[i + g], &b[i + g], d);

      g >>= 1;
    }

    for (; g > 0; g >>= 1) {
      barrier(1);
      int i = 2 * e - (e & (g - 1));
      if (h >= g)
        A(&a[i - g], &b[i - g], &a[i], &b[i], d);
    }
  }
}

inline void C(__local volatile short* a) {
  int b = get_local_id(0);
  int c, d;
  int e = 1 + 2 * b;
  int f = e + 1;
  short g;

  c = e - 1;
  d = f - 1;
  a[d] += a[c];
  if (b < 8) {
    c = 2 * e - 1;
    d = 2 * f - 1;
    a[d] += a[c];
  }
  if (b < 4) {
    c = 4 * e - 1;
    d = 4 * f - 1;
    a[d] += a[c];
  }
  if (b < 2) {
    c = 8 * e - 1;
    d = 8 * f - 1;
    a[d] += a[c];
  }
  if (b == 0) {
    a[31] += a[15];
    a[32] = a[31];
    a[31] = 0;
    g = a[15];
    a[15] = 0;
    a[31] += g;
  }
  if (b < 2) {
    c = 8 * e - 1;
    d = 8 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  if (b < 4) {
    c = 4 * e - 1;
    d = 4 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  if (b < 8) {
    c = 2 * e - 1;
    d = 2 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  c = e - 1;
  d = f - 1;
  g = a[c];
  a[c] = a[d];
  a[d] += g;
}

inline void D(__local volatile short* a) {
  int b = get_local_id(0);
  int c, d;
  int e = 1 + 2 * b;
  int f = e + 1;
  short g;

  c = e - 1;
  d = f - 1;
  a[d] += a[c];
  barrier(1);
  if (b < 16) {
    c = 2 * e - 1;
    d = 2 * f - 1;
    a[d] += a[c];
  }
  if (b < 8) {
    c = 4 * e - 1;
    d = 4 * f - 1;
    a[d] += a[c];
  }
  if (b < 4) {
    c = 8 * e - 1;
    d = 8 * f - 1;
    a[d] += a[c];
  }
  if (b < 2) {
    c = 16 * e - 1;
    d = 16 * f - 1;
    a[d] += a[c];
  }
  if (b == 0) {
    a[63] += a[31];
    a[64] = a[63];
    a[63] = 0;
    g = a[31];
    a[31] = 0;
    a[63] += g;
  }
  if (b < 2) {
    c = 16 * e - 1;
    d = 16 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  if (b < 4) {
    c = 8 * e - 1;
    d = 8 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  if (b < 8) {
    c = 4 * e - 1;
    d = 4 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  if (b < 16) {
    c = 2 * e - 1;
    d = 2 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  c = e - 1;
  d = f - 1;
  g = a[c];
  a[c] = a[d];
  a[d] += g;
}

inline void E(__local volatile short* a) {
  int b = get_local_id(0);
  int c, d;
  int e = 1 + 2 * b;
  int f = e + 1;
  short g;

  c = e - 1;
  d = f - 1;
  a[d] += a[c];
  barrier(1);
  if (b < 32) {
    c = 2 * e - 1;
    d = 2 * f - 1;
    a[d] += a[c];
  }
  barrier(1);
  if (b < 16) {
    c = 4 * e - 1;
    d = 4 * f - 1;
    a[d] += a[c];
  }
  if (b < 8) {
    c = 8 * e - 1;
    d = 8 * f - 1;
    a[d] += a[c];
  }
  if (b < 4) {
    c = 16 * e - 1;
    d = 16 * f - 1;
    a[d] += a[c];
  }
  if (b < 2) {
    c = 32 * e - 1;
    d = 32 * f - 1;
    a[d] += a[c];
  }
  if (b == 0) {
    a[127] += a[63];
    a[128] = a[127];
    a[127] = 0;
    g = a[63];
    a[63] = 0;
    a[127] += g;
  }
  if (b < 2) {
    c = 32 * e - 1;
    d = 32 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  if (b < 4) {
    c = 16 * e - 1;
    d = 16 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  if (b < 8) {
    c = 8 * e - 1;
    d = 8 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  if (b < 16) {
    c = 4 * e - 1;
    d = 4 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  if (b < 32) {
    c = 2 * e - 1;
    d = 2 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  barrier(1);
  c = e - 1;
  d = f - 1;
  g = a[c];
  a[c] = a[d];
  a[d] += g;
}

inline void F(__local volatile short* a) {
  int b = get_local_id(0);
  int c, d;
  int e = 1 + 2 * b;
  int f = e + 1;
  short g;

  c = e - 1;
  d = f - 1;
  a[d] += a[c];
  barrier(1);
  if (b < 64) {
    c = 2 * e - 1;
    d = 2 * f - 1;
    a[d] += a[c];
  }
  barrier(1);
  if (b < 32) {
    c = 4 * e - 1;
    d = 4 * f - 1;
    a[d] += a[c];
  }
  barrier(1);
  if (b < 16) {
    c = 8 * e - 1;
    d = 8 * f - 1;
    a[d] += a[c];
  }
  if (b < 8) {
    c = 16 * e - 1;
    d = 16 * f - 1;
    a[d] += a[c];
  }
  if (b < 4) {
    c = 32 * e - 1;
    d = 32 * f - 1;
    a[d] += a[c];
  }
  if (b < 2) {
    c = 64 * e - 1;
    d = 64 * f - 1;
    a[d] += a[c];
  }
  if (b == 0) {
    a[255] += a[127];
    a[256] = a[255];
    a[255] = 0;
    g = a[127];
    a[127] = 0;
    a[255] += g;
  }
  if (b < 2) {
    c = 64 * e - 1;
    d = 64 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  if (b < 4) {
    c = 32 * e - 1;
    d = 32 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  if (b < 8) {
    c = 16 * e - 1;
    d = 16 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  if (b < 16) {
    c = 8 * e - 1;
    d = 8 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  if (b < 32) {
    c = 4 * e - 1;
    d = 4 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  barrier(1);
  if (b < 64) {
    c = 2 * e - 1;
    d = 2 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  barrier(1);
  c = e - 1;
  d = f - 1;
  g = a[c];
  a[c] = a[d];
  a[d] += g;
}

inline void G(__local volatile short* a) {
  int b = get_local_id(0);
  int c, d;
  int e = 1 + 2 * b;
  int f = e + 1;
  short g;

  c = e - 1;
  d = f - 1;
  a[d] += a[c];
  barrier(1);
  if (b < 128) {
    c = 2 * e - 1;
    d = 2 * f - 1;
    a[d] += a[c];
  }
  barrier(1);
  if (b < 64) {
    c = 4 * e - 1;
    d = 4 * f - 1;
    a[d] += a[c];
  }
  barrier(1);
  if (b < 32) {
    c = 8 * e - 1;
    d = 8 * f - 1;
    a[d] += a[c];
  }
  barrier(1);
  if (b < 16) {
    c = 16 * e - 1;
    d = 16 * f - 1;
    a[d] += a[c];
  }
  if (b < 8) {
    c = 32 * e - 1;
    d = 32 * f - 1;
    a[d] += a[c];
  }
  if (b < 4) {
    c = 64 * e - 1;
    d = 64 * f - 1;
    a[d] += a[c];
  }
  if (b < 2) {
    c = 128 * e - 1;
    d = 128 * f - 1;
    a[d] += a[c];
  }
  if (b == 0) {
    a[511] += a[255];
    a[512] = a[511];
    a[511] = 0;
    g = a[255];
    a[255] = 0;
    a[511] += g;
  }
  if (b < 2) {
    c = 128 * e - 1;
    d = 128 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  if (b < 4) {
    c = 64 * e - 1;
    d = 64 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  if (b < 8) {
    c = 32 * e - 1;
    d = 32 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  if (b < 16) {
    c = 16 * e - 1;
    d = 16 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  if (b < 32) {
    c = 8 * e - 1;
    d = 8 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  barrier(1);
  if (b < 64) {
    c = 4 * e - 1;
    d = 4 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  barrier(1);
  if (b < 128) {
    c = 2 * e - 1;
    d = 2 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  barrier(1);
  c = e - 1;
  d = f - 1;
  g = a[c];
  a[c] = a[d];
  a[d] += g;
}

inline void H(__local volatile short* a, __local int* b, __local vT* c, const int d, const int e, const int f, const int g) {
  bool h = 1;
  bool i = 1;

  if (f < d && f > 0)
    h = (b[f] != b[f - 1]);
  if (g < d)
    i = (b[g] != b[g - 1]);

  a[f] = h;
  a[g] = i;
  barrier(1);

  switch (e) {
    case 16:
      C(a);
      break;
    case 32:
      D(a);
      break;
    case 64:
      E(a);
      break;
    case 128:
      F(a);
      break;
    case 256:
      G(a);
      break;
  }
  barrier(1);

  int j;
  short k, l;
  int m, n;
  vT o, p;

  if (f < d && h == 1) {
    k = a[f];
    m = b[f];
    o = c[f];
    j = f + 1;

    while (a[j] == a[j + 1]) {
      o += c[j];
      j++;
    }
  }

  if (g < d && i == 1) {
    l = a[g];
    n = b[g];
    p = c[g];
    j = g + 1;

    while (a[j] == a[j + 1] && j < 2 * e) {
      p += c[j];
      j++;
    }
  }
  barrier(1);

  if (f < d && h == 1) {
    b[k] = m;
    c[k] = o;
  }
  if (g < d && i == 1) {
    b[l] = n;
    c[l] = p;
  }
}

__kernel void I(__global const int* a, __global const int* b, __global const int* c, __global const vT* d, __global const int* e, __global const int* f, __global const vT* g, __global int* h, __global const int* i, __global int* j, __global vT* k, __local int* l, __local vT* m, __local volatile short* n, const int o, const int p) {
  int q = get_local_id(0);
  int r = get_group_id(0);
  int s = get_local_size(0);
  int t = s * 2;

  int u, v = 0;
  int w, x, y;
  int z;
  int aa = q + s;

  int ab;

  int ac;
  ac = a[6 * (o + r)];

  int ad, ae;
  int af, ag;
  vT ah;

  ad = b[ac];
  ae = b[ac + 1];

  for (u = ad; u < ae; u++) {
    ab = c[u];
    ah = d[u];

    af = e[ab];
    ag = e[ab + 1];

    w = ag - af;

    if (q < w) {
      x = v + q;
      y = af + q;

      l[x] = f[y];
      m[x] = g[y] * ah;
    }

    if (aa < w) {
      x = v + aa;
      y = af + aa;

      l[x] = f[y];
      m[x] = g[y] * ah;
    }

    v += w;
  }
  barrier(1);

  z = t - v;

  if (q < z)
    l[v + q] = p;

  barrier(1);

  B(l, m, t);
  barrier(1);

  H(n, l, m, v, s, q, aa);
  barrier(1);

  v = n[t] - z;
  if (q == 0)
    h[ac] = v;

  int ai = a[6 * (o + r) + 1];

  if (q < v) {
    y = ai + q;

    j[y] = l[q];
    k[y] = m[q];
  }
  if (aa < v) {
    y = ai + aa;

    j[y] = l[aa];
    k[y] = m[aa];
  }
}