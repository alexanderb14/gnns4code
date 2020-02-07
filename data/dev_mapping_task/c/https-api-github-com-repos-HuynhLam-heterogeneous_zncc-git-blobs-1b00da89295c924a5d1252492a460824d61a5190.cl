__kernel void A(__global uchar* a, __global uchar* b, __global uchar* c, int d, int e, int f, int g, int h, int i, int j) {
  const int k = get_global_id(0);
  const int l = get_global_id(1);

  int m, n, o, p;
  float q, r, s, t, u, v;
  float w, x;

  p = j;
  x = -1;
  for (o = i; o <= j; o++) {
    q = r = 0;
    for (m = -g; m < g; m++) {
      for (n = -f; n < f; n++) {
        if (0 <= k + m && k + m < e && 0 <= l + n && l + n < d && 0 <= l + n - o && l + n - o < d) {
          q += a[(k + m) * d + (l + n)];
          r += b[(k + m) * d + (l + n - o)];
        }
      }
    }
    q /= h;
    r /= h;
    u = v = w = 0;

    for (m = -g; m < g; m++) {
      for (n = -f; n < f; n++) {
        if (0 <= k + m && k + m < e && 0 <= l + n && l + n < d && 0 <= l + n - o && l + n - o < d) {
          s = a[(k + m) * d + (l + n)] - q;
          t = b[(k + m) * d + (l + n - o)] - r;
          w += s * t;
          u += s * s;
          v += t * t;
        }
      }
    }

    w /= sqrt(u) * sqrt(v);

    if (w > x) {
      x = w;
      p = o;
    }
  }
  c[k * d + l] = (uint)abs(p);
}