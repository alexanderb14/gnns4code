typedef unsigned char fixed8; kernel void A(global short* a, const global unsigned char* b, const global short* c, const global int* d, int e, const global short* f, const global int* g, int h, int i, int j, int k, int l, int m, int n, int o, int p) {
  int q = get_global_id(0);
  int r = get_global_id(1);

  int s = get_global_size(0);
  int t = get_global_size(1);

  int u = r * o + d[q];
  int v = r * o + d[q + s];
  int w = (r + (l >> 1)) * o + d[q];
  int x = (r + (l >> 1)) * o + d[q + s];
  int y = o * l + (r) * (p) + g[q];
  int z = y + ((p) * (t));

  int aa = 0;
  int ab = 0;
  int ac = 0;
  int ad = 0;
  int ae = 0;
  int af = 0;

  int ag = e * q;
  int ah = e * (q + s);
  int ai = h * q;

  int aj;
  for (aj = 0; aj < e; aj++) {
    aa += b[u + aj] * c[ag + aj];
    ab += b[v + aj] * c[ah + aj];
    ac += b[w + aj] * c[ag + aj];
    ad += b[x + aj] * c[ah + aj];
    ae += b[y + aj] * f[ai + aj];
    af += b[z + aj] * f[ai + aj];
  }
  int ak = r * m;
  int al = (r + t) * m;

  a[ak + q] = ((aa >> 7) > ((1 << 15) - 1) ? ((1 << 15) - 1) : (aa >> 7));
  a[ak + q + s] = ((ab >> 7) > ((1 << 15) - 1) ? ((1 << 15) - 1) : (ab >> 7));
  a[al + q] = ((ac >> 7) > ((1 << 15) - 1) ? ((1 << 15) - 1) : (ac >> 7));
  a[al + q + s] = ((ad >> 7) > ((1 << 15) - 1) ? ((1 << 15) - 1) : (ad >> 7));

  int am = r * (n) + q + m * j;
  int an = r * (n) + q + m * j + ((n)*t);
  a[am] = ((ae >> 7) > ((1 << 15) - 1) ? ((1 << 15) - 1) : (ae >> 7));
  a[an] = ((af >> 7) > ((1 << 15) - 1) ? ((1 << 15) - 1) : (af >> 7));
}