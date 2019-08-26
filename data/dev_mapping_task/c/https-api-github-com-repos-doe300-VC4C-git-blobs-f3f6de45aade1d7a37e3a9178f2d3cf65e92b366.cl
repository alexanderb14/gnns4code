typedef unsigned char fixed8; kernel void A(global unsigned char* a, const global short* b, const global short* c, int d, const global short* e, int f, const global int* g, const global int* h, int i, int j, int k, int l, int m, int n, int o, int p) {
  const unsigned char q[8] = {64, 64, 64, 64, 64, 64, 64, 64};

  int r = get_global_id(0);
  int s = get_global_id(1);

  int t = get_global_size(0);
  int u = get_global_size(1);
  const unsigned char* v;
  const unsigned char* w;

  v = q;
  w = q;

  int x = (g[s]) * o + r;
  int y = (g[s]) * o + r + (t);
  int z = (g[s + u]) * o + r;
  int aa = (g[s + u]) * o + r + t;
  int ab = m * l + (h[s]) * n + (r);
  int ac = m * l + (n * (l >> 1)) + (h[s]) * n + r;

  int ad = (v[r & 7] << 12);
  int ae = (v[(r + t) & 7] << 12);
  int af = (w[r & 7] << 12);
  int ag = (w[(r + t) & 7] << 12);
  int ah = (v[r & 7] << 12);
  int ai = (v[(r + 3) & 7] << 12);

  int aj;
  int ak = s * d;
  int al = (s + u) * d;
  for (aj = 0; aj < d; aj++) {
    ad += b[x] * c[ak + aj];
    x += o;
    ae += b[y] * c[ak + aj];
    y += o;
    af += b[z] * c[al + aj];
    z += o;
    ag += b[aa] * c[al + aj];
    aa += o;
    ah += b[ab] * e[ak + aj];
    ai += b[ac] * e[ak + aj];
    ab += n;
    ac += n;
  }
  a[s * m + r] = (((ad >> 19) & (~0xFF)) ? ((-(ad >> 19)) >> 31) : (ad >> 19));
  a[s * m + r + t] = (((ae >> 19) & (~0xFF)) ? ((-(ae >> 19)) >> 31) : (ae >> 19));
  a[(s + u) * m + r] = (((af >> 19) & (~0xFF)) ? ((-(af >> 19)) >> 31) : (af >> 19));
  a[(s + u) * m + r + t] = (((ag >> 19) & (~0xFF)) ? ((-(ag >> 19)) >> 31) : (ag >> 19));
  ;

  int am = m * j + s * (n) + (r);
  int an = (n * u) + am;
  a[am] = (((ah >> 19) & (~0xFF)) ? ((-(ah >> 19)) >> 31) : (ah >> 19));
  a[an] = (((ai >> 19) & (~0xFF)) ? ((-(ai >> 19)) >> 31) : (ai >> 19));
}