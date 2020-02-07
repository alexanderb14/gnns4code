__kernel void A( int a, int b, int c, int d, double e, __global int* f, __global int* g, __global int* h, __global double* i, double j, double k, double l, double m, double n, __read_only image2d_t o, __global double* p, __global double* q, __global double* r ) {
  const sampler_t s = 0x0000 | 0x0000 | 0x0000;

  int t = get_global_id(0);

  if (t < b) {
    int u = t + c;

    double v = i[u * 3 + 0];
    double w = i[u * 3 + 1];
    double x = i[u * 3 + 2];

    int n = g[t];

    int y = f[t];

    double z = 0.0;
    double aa = 0.0;
    double ab = 0.0;
    double ac = 0.0;
    double ad = 0.0;
    double ae = 0.0;
    double af = 0.0;
    double ag = 0.0;
    double ah = 0.0;
    double ai = 0.0;

    int aj;
    for (aj = 0; aj < y; aj++) {
      int ak = h[n + aj];

      double al;

      if (ak < d)
        al = 1.0;
      else {
        int am = ak / d;
        float4 an = read_imagef(o, s, (int2)(0, amm));
        al = __builtin_astype(an.xy, double);
        ak %= d;
      }

      double ao = v - i[ak * 3 + 0];
      double ap = w - i[ak * 3 + 1];
      double aq = x - i[ak * 3 + 2];
      double ar = ao * ao + ap * ap + aq * aq;

      if (ar < e) {
        double as = 1.0 / ar;
        double at = as * as * as;
        double au = at * (j * at - k);
        double av = al * au * as;

        z += ao * av;
        aa += ap * av;
        ab += aq * av;

        if (a == 1) {
          double aw = at * (l * at - m) - n;
          aw *= al;
          ac += aw;

          ad += 0.5 * ao * ao * av;
          ae += 0.5 * ap * ap * av;
          af += 0.5 * aq * aq * av;
          ag += 0.5 * ao * ap * av;
          ah += 0.5 * ao * aq * av;
          ai += 0.5 * ap * aq * av;
        }
      }
    }

    p[u * 3 + 0] = z;
    p[u * 3 + 1] = aa;
    p[u * 3 + 2] = ab;

    if (a == 1) {
      q[u] = ac;
      r[u * 6 + 0] = ad;
      r[u * 6 + 1] = ae;
      r[u * 6 + 2] = af;
      r[u * 6 + 3] = ag;
      r[u * 6 + 4] = ah;
      r[u * 6 + 5] = ai;
    }
  }
}