typedef double vT; inline void A(__local int* a, __local vT* b, int c, vT d, int e, bool* f) {
  int g = 0;
  int h = e - 1;
  int i;
  int j;

  while (h >= g) {
    i = (h + g) / 2;
    j = a[i];

    if (c > j)
      g = i + 1;
    else if (c < j)
      h = i - 1;
    else {
      b[i] += d;
      *f = 0;
      break;
    }
  }
}

inline void B(__local int* a, __local vT* b, int c, vT d, int e) {
  int f = 0;
  int g = e - 1;
  int h;
  int i;

  while (g >= f) {
    h = (g + f) / 2;
    i = a[h];

    if (c > i)
      f = h + 1;
    else if (c < i)
      g = h - 1;
    else {
      b[h] -= d;
      break;
    }
  }
}

inline void C(__global int* a, __global vT* b, int c, vT d, int e, bool* f) {
  int g = 0;
  int h = e - 1;
  int i;
  int j;

  while (h >= g) {
    i = (h + g) / 2;
    j = a[i];

    if (c > j)
      g = i + 1;
    else if (c < j)
      h = i - 1;
    else {
      b[i] += d;
      *f = 0;
      break;
    }
  }
}

inline void D(__global int* a, __global vT* b, int c, vT d, int e) {
  int f = 0;
  int g = e - 1;
  int h;
  int i;

  while (g >= f) {
    h = (g + f) / 2;
    i = a[h];

    if (c > i)
      f = h + 1;
    else if (c < i)
      g = h - 1;
    else {
      b[h] -= d;
      break;
    }
  }
}

inline void E(__local volatile short* a, const int b) {
  int c, d;
  int e = 1 + 2 * b;
  int f = e + 1;
  short g;

  if (b < 16) {
    c = e - 1;
    d = f - 1;
    a[d] += a[c];
  }
  barrier(1);
  if (b < 8) {
    c = 2 * e - 1;
    d = 2 * f - 1;
    a[d] += a[c];
  }
  barrier(1);
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
  barrier(1);
  if (b < 16) {
    c = e - 1;
    d = f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
}

inline void F(__local volatile short* a, const int b) {
  int c, d;
  int e = 1 + 2 * b;
  int f = e + 1;
  short g;

  if (b < 32) {
    c = e - 1;
    d = f - 1;
    a[d] += a[c];
  }
  barrier(1);
  if (b < 16) {
    c = 2 * e - 1;
    d = 2 * f - 1;
    a[d] += a[c];
  }
  barrier(1);
  if (b < 8) {
    c = 4 * e - 1;
    d = 4 * f - 1;
    a[d] += a[c];
  }
  barrier(1);
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
  barrier(1);
  if (b < 16) {
    c = 2 * e - 1;
    d = 2 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  barrier(1);
  if (b < 32) {
    c = e - 1;
    d = f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
}

inline void G(__local volatile short* a, const int b) {
  int c, d;
  int e = 1 + 2 * b;
  int f = e + 1;
  short g;

  if (b < 64) {
    c = e - 1;
    d = f - 1;
    a[d] += a[c];
  }
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
  barrier(1);
  if (b < 8) {
    c = 8 * e - 1;
    d = 8 * f - 1;
    a[d] += a[c];
  }
  barrier(1);
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
  barrier(1);
  if (b < 16) {
    c = 4 * e - 1;
    d = 4 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  barrier(1);
  if (b < 32) {
    c = 2 * e - 1;
    d = 2 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  barrier(1);
  if (b < 64) {
    c = e - 1;
    d = f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
}

inline void H(__local volatile short* a, const int b) {
  int c, d;
  int e = 1 + 2 * b;
  int f = e + 1;
  short g;

  if (b < 128) {
    c = e - 1;
    d = f - 1;
    a[d] += a[c];
  }
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
  barrier(1);
  if (b < 8) {
    c = 16 * e - 1;
    d = 16 * f - 1;
    a[d] += a[c];
  }
  barrier(1);
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
  barrier(1);
  if (b < 16) {
    c = 8 * e - 1;
    d = 8 * f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
  barrier(1);
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
  if (b < 128) {
    c = e - 1;
    d = f - 1;
    g = a[c];
    a[c] = a[d];
    a[d] += g;
  }
}

inline void I(__local volatile short* a, const int b, const int c) {
  switch (c) {
    case 32:
      E(a, b);
      break;
    case 64:
      F(a, b);
      break;
    case 128:
      G(a, b);
      break;
    case 256:
      H(a, b);
      break;
  }
}

inline bool J(int a, int b) {
  return a < b ? true : false;
}

inline int K(__local int* a, const int b, __local int* c, const int d, const int e) {
  int f = max(0, e - d);
  int g = min(e, b);
  int h;
  int i, j;
  bool k;

  while (f < g) {
    h = (f + g) >> 1;

    i = a[h];
    j = c[e - 1 - h];

    k = J(i, j);

    if (k)
      f = h + 1;
    else
      g = h;
  }
  return f;
}

inline void L(__local int* a, __local vT* b, int c, const int d, int e, const int f, int* g, vT* h, const int i) {
  int j = a[c];
  int k = a[e];
  bool l;

  for (int m = 0; m < i; ++m) {
    l = (e >= f) || ((c < d) && !J(k, j));

    g[m] = l ? j : k;
    h[m] = l ? b[c] : b[e];

    if (l)
      j = a[++c];
    else
      k = a[++e];
  }
}

inline void M(__local int* a, __local vT* b, int* c, vT* d, const int e, const int f) {
  int g = __clc_ceil((e + f) / (float)get_local_size(0));
  int h = g * get_local_id(0);
  int i = K(a, e, &a[e], f, h);

  L(a, b, i, e, e + h - i, e + f, c, d, g);
  barrier(1);

  for (int j = 0; j < g; j++) {
    a[h + j] = c[j];
    b[h + j] = d[j];
  }
}

inline int N(__global int* a, const int b, __global int* c, const int d, const int e) {
  int f = max(0, e - d);
  int g = min(e, b);
  int h;
  int i, j;
  bool k;

  while (f < g) {
    h = (f + g) >> 1;

    i = a[h];
    j = c[e - 1 - h];

    k = J(i, j);

    if (k)
      f = h + 1;
    else
      g = h;
  }
  return f;
}

inline void O(__global int* a, __global vT* b, int c, const int d, int e, const int f, int* g, vT* h, const int i) {
  int j = a[c];
  int k = a[e];
  bool l;

  for (int m = 0; m < i; ++m) {
    l = (e >= f) || ((c < d) && !J(k, j));

    g[m] = l ? j : k;
    h[m] = l ? b[c] : b[e];

    if (l)
      j = a[++c];
    else
      k = a[++e];
  }
}

inline void P(__global int* a, __global vT* b, __local int* c, __local vT* d, const int e, const int f, const bool g) {
  int h = get_local_id(0);
  int i = get_local_size(0);

  int j, k, l;
  int m = __clc_ceil((float)e / (float)i);

  for (int n = 0; n < m; n++) {
    j = n != m - 1 ? i : e - n * i;
    k = n * i + h;
    l = f + k;

    if (h < j) {
      if (g) {
        a[l] = c[k];
        b[l] = d[k];
      } else {
        c[k] = a[l];
        d[k] = b[l];
      }
    }
  }
}

inline void Q(__global int* a, __global vT* b, __global int* c, __global vT* d, const int e, const int f, const bool g) {
  int h = get_local_id(0);
  int i = get_local_size(0);

  int j, k, l;
  int m = __clc_ceil((float)e / (float)i);

  for (int n = 0; n < m; n++) {
    j = n != m - 1 ? i : e - n * i;
    k = n * i + h;
    l = f + k;

    if (h < j) {
      if (g) {
        a[l] = c[k];
        b[l] = d[k];
      } else {
        c[k] = a[l];
        d[k] = b[l];
      }
    }
  }
}

__kernel void R(__global int* a, __global const int* b, __global const int* c, __global const vT* d, __global const int* e, __global const int* f, __global const vT* g, __global int* h, __global const int* i, __global int* j, __global vT* k, __local int* l, __local vT* m, __local volatile short* n, const int o, const int p) {
  int q = 6 * (o + get_group_id(0));

  int r = a[q + 2];

  int s = get_local_id(0);
  int t = a[q];

  int u = get_local_size(0);
  float v = u;

  int w, x;
  int y;

  int z;
  vT aa;
  vT ab;

  int ac, ad;
  int ae, af;

  int ag, ah;

  bool ai;
  bool aj;
  int ak, al, am;
  int an[16];
  vT ao[16];

  ac = b[t];
  ad = b[t + 1];

  if (r == 0) {
    aj = false;

    y = c[ac];
    ab = d[ac];

    ae = e[y];
    af = e[y + 1];

    w = af - ae;
    x = __clc_ceil(w / v);

    ae += s;

    for (ag = 0; ag < x; ag++) {
      y = ag != x - 1 ? u : w - ag * u;

      if (r + y > p) {
        if (s == 0) {
          a[q + 2] = r;
          a[q + 3] = ac;
          a[q + 4] = ae;
        }

        y = a[q + 1];
        P(j, k, l, m, r, y, 1);

        return;
      }

      if (ae < af) {
        z = f[ae];
        aa = g[ae] * ab;

        l[r + s] = z;
        m[r + s] = aa;
      }
      barrier(1);

      r += y;
      ae += u;
    }

    ac++;
  } else {
    aj = true;
    ac = a[q + 3];

    y = a[q + 5];
    P(j, k, l, m, r, y, 0);
  }
  barrier(1);

  while (ac < ad) {
    y = c[ac];
    ab = d[ac];

    ae = aj ? a[q + 4] : e[y];
    aj = false;
    af = e[y + 1];

    w = af - ae;
    x = __clc_ceil(w / v);

    ae += s;

    for (ag = 0; ag < x; ag++) {
      barrier(1);
      ai = 0;

      if (ae < af) {
        z = f[ae];
        aa = g[ae] * ab;

        ai = 1;
        A(l, m, z, aa, r, &ai);
      }

      n[s] = ai;
      barrier(1);

      I(n, s, u);
      barrier(1);

      if (n[u] == 0) {
        ae += u;
        continue;
      }

      if (r + n[u] > p) {
        if (ae < af) {
          B(l, m, z, aa, r);
        }
        barrier(1);

        if (s == 0) {
          a[q + 2] = r;
          a[q + 3] = ac;
          a[q + 4] = ae;
        }

        y = a[q + 1];
        P(j, k, l, m, r, y, 1);

        return;
      }

      if (ai) {
        y = r + n[s];
        l[y] = z;
        m[y] = aa;
      }
      barrier(1);

      y = n[u];

      ak = __clc_ceil((r + y) / v);

      al = ak * s;
      am = K(l, r, &l[r], y, al);

      L(l, m, am, r, r + al - am, r + y, an, ao, ak);
      barrier(1);

      for (ah = 0; ah < ak; ah++) {
        l[al + ah] = an[ah];
        m[al + ah] = ao[ah];
      }
      barrier(1);

      r += y;
      ae += u;
    }

    ac++;
  }
  barrier(1);

  if (s == 0) {
    h[t] = r;
    a[q + 2] = -1;
  }

  y = a[q + 1];
  P(j, k, l, m, r, y, 1);
}

__kernel void S(__global int* a, __global const int* b, __global const int* c, __global const vT* d, __global const int* e, __global const int* f, __global const vT* g, __global int* h, __global const int* i, __global int* j, __global vT* k, __local int* l, __local vT* m, __local volatile short* n, const int o, const int p) {
  int q = 6 * (o + get_group_id(0));

  int r = a[q + 2];
  int s = 0;

  int t = get_local_id(0);
  int u = a[q];

  int v = get_local_size(0);
  float w = v;

  int x, y;
  int z;

  int aa;
  vT ab;
  vT ac;

  int ad, ae;
  int af, ag;

  int ah, ai;

  bool aj;
  bool ak;
  int al, am, an;
  int ao[80];
  vT ap[80];

  ad = b[u];
  ae = b[u + 1];

  ak = true;
  ad = a[q + 3];

  z = a[q + 1];
  __global int* aq = &j[z];
  __global vT* ar = &k[z];

  z = a[q + 5];
  Q(j, k, aq, ar, r, z, 0);
  barrier(2);

  while (ad < ae) {
    z = c[ad];
    ac = d[ad];

    af = ak ? a[q + 4] : e[z];
    ak = false;
    ag = e[z + 1];

    x = ag - af;
    y = __clc_ceil(x / w);

    af += t;

    for (ah = 0; ah < y; ah++) {
      barrier(1);
      aj = 0;

      if (af < ag) {
        aa = f[af];
        ab = g[af] * ac;

        aj = 1;

        C(aq, ar, aa, ab, r, &aj);

        if (aj == 1)
          A(l, m, aa, ab, s, &aj);
      }

      n[t] = aj;
      barrier(1);

      I(n, t, v);
      barrier(1);

      if (n[v] == 0) {
        af += v;
        continue;
      }

      if (s + n[v] > p) {
        if (af < ag) {
          D(aq, ar, aa, ab, r);

          B(l, m, aa, ab, s);
        }
        barrier(1);

        if (t == 0) {
          a[q + 2] = r + s;
          a[q + 3] = ad;
          a[q + 4] = af;
        }

        P(aq, ar, l, m, s, r, 1);
        barrier(2);

        al = __clc_ceil((r + s) / w);
        am = al * t;
        an = N(aq, r, &aq[r], s, am);

        O(aq, ar, an, r, r + am - an, r + s, ao, ap, al);
        barrier(2);

        for (ai = 0; ai < al; ai++) {
          aq[am + ai] = ao[ai];
          ar[am + ai] = ap[ai];
        }

        return;
      }

      if (aj) {
        z = s + n[t];
        l[z] = aa;
        m[z] = ab;
      }
      barrier(1);

      z = n[v];

      al = __clc_ceil((s + z) / w);
      am = al * t;
      an = K(l, s, &l[s], z, am);

      L(l, m, an, s, s + am - an, s + z, ao, ap, al);
      barrier(1);

      for (ai = 0; ai < al; ai++) {
        l[am + ai] = ao[ai];
        m[am + ai] = ap[ai];
      }
      barrier(1);

      s += z;
      af += v;
    }

    ad++;
  }
  barrier(1);

  if (t == 0) {
    h[u] = r + s;
    a[q + 2] = -1;
  }

  P(aq, ar, l, m, s, r, 1);
  barrier(2);

  al = __clc_ceil((r + s) / w);
  am = al * t;
  an = N(aq, r, &aq[r], s, am);

  O(aq, ar, an, r, r + am - an, r + s, ao, ap, al);
  barrier(2);

  for (ai = 0; ai < al; ai++) {
    aq[am + ai] = ao[ai];
    ar[am + ai] = ap[ai];
  }
}