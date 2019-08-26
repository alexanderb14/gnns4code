__kernel void A(__global unsigned int* a, __global unsigned int* b, unsigned int c, unsigned int d, unsigned int e, unsigned int f, __global unsigned int* g, __global unsigned int* h, __global float* i) {
  float j, k, l, m, n;
  int o, p, q, r, s;
  int t, u, v;

  r = get_global_id(0);
  s = 0;

  for (int w = 0; w < f; w++) {
    k = 0.0f;
    l = 0.0f;
    m = 0.0f;
    p = 0;
    q = 0;

    o = get_global_id(0) * f + w;
    t = o / (c * d);

    v = (o % (c * d)) / c;
    u = o % c;

    for (int x = 0; x < e; x++) {
      o = t * (e * d * c) +

          x * (d * c) + v * (c) + u;
      p += a[o];
      q += b[t * e + x] - a[o];
    }

    for (int x = 0; x < e; x++) {
      o = t * (e * d * c) +

          x * (d * c) + v * (c) + u;

      j = ((float)b[t * e + x]) / (p + q);
      k -= (j <= (1.e-6)) ? 0.0f : j * log2(j);

      j = (p) ? (float)a[o] / p : 0.0f;
      l -= (j <= (1.e-6)) ? 0.0f : j * log2(j);

      j = (q) ? (float)(b[t * e + x] - a[o]) / q : 0.0f;
      m -= (j <= (1.e-6)) ? 0.0f : j * log2(j);
    }
    j = k - ((float)p / (p + q) * l + (float)q / (p + q) * m);

    if (!w || j > n) {
      n = j;
      r = u;
      s = v;
    }
  }

  g[get_global_id(0)] = r;
  h[get_global_id(0)] = s;
  i[get_global_id(0)] = n;
}