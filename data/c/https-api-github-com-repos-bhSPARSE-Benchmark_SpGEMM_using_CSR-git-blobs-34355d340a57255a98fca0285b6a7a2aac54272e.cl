typedef double vT; inline void A(__local int* a, __local vT* b, const int c, const int d, const int e, const int f) {
  int g = c;
  int h, i;

  int j;
  vT k;

  while (g * 2 + 1 <= d) {
    h = g * 2 + 1;
    i = g;

    if (a[i * f + e] < a[h * f + e])
      i = h;

    if (h + 1 <= d && a[i * f + e] < a[(h + 1) * f + e])
      i = h + 1;

    if (i != g) {
      const int l = g * f + e;
      const int m = i * f + e;

      j = a[l];
      a[l] = a[m];
      a[m] = j;

      k = b[l];
      b[l] = b[m];
      b[m] = k;

      g = i;
    } else
      return;
  }
}

inline int B(__local int* a, __local vT* b, const int c, const int d, const int e) {
  int f = (c - 1) / 2;
  int g = c - 1;

  int h, i;

  while (f >= 0) {
    A(a, b, f, g, d, e);
    f--;
  }

  int j;
  vT k;

  h = g * e + d;

  j = a[d];
  a[d] = a[h];
  a[h] = j;

  k = b[d];
  b[d] = b[h];
  b[h] = k;

  g--;

  A(a, b, 0, g, d, e);

  f = c - 1;

  while (g >= 0) {
    i = g * e + d;

    if (a[d] == a[f * e + d]) {
      b[f * e + d] += b[d];

      a[d] = a[i];
      b[d] = b[i];
    } else {
      f--;

      h = f * e + d;

      if (g == f) {
        j = a[d];
        a[d] = a[i];
        a[i] = j;

        k = b[d];
        b[d] = b[i];
        b[i] = k;
      } else {
        a[h] = a[d];
        b[h] = b[d];

        a[d] = a[i];
        b[d] = b[i];
      }
    }

    g--;

    A(a, b, 0, g, d, e);
  }

  return f;
}

__kernel void C(__global const int* a, __global const int* b, __global const int* c, __global const vT* d, __global const int* e, __global const int* f, __global const vT* g, __global int* h, __global const int* i, __global int* j, __global vT* k, __local int* l, __local vT* m, const int n, const int o) {
  const int p = get_local_id(0);
  const int q = get_group_id(0);
  const int r = get_global_id(0);
  const int s = get_local_size(0);
  int t = 0;

  if (r < n) {
    int u, v = 0;
    int w, x;
    int y, z, aa;
    vT ab;

    int ac = a[6 * (o + r)];

    w = b[ac];
    x = b[ac + 1];

    for (u = w; u < x; u++) {
      y = c[u];
      ab = d[u];

      z = e[y];
      aa = e[y + 1];

      for (int ad = z; ad < aa; ad++) {
        t = v * s + p;
        l[t] = f[ad];
        m[t] = g[ad] * ab;

        v++;
      }
    }

    int ae = B(l, m, v, p, s);

    v -= ae;
    h[ac] = v;

    const int af = a[6 * (o + q * s + p) + 1];
    ;
    for (int u = 0; u < v; u++) {
      j[af + u] = l[(ae + u) * s + p];
      k[af + u] = m[(ae + u) * s + p];
    }
  }
}