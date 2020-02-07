inline int A(const int a) {
  int b = a - 4;
  int c = min(b, 8 - b);
  return clamp(c, -3, 3);
}

inline int B(const int a) {
  return A((a + 4) & 15);
}

inline int C(const int a, const int b) {
  return b * 640 + a;
}

inline int D(const int a, const int b, const int c) {
  return (a >= b + c);
}

inline int E(const int a, const int b, const int c) {
  return (a <= b - c);
}

inline int F(__local int* a, const int b, const int c, const int d, const int e) {
  return -E(a[C(d, e)], b, c) | D(a[C(d, e)], b, c);
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void G(__global int* a, const int b, const int c, __global int* d, const int e, const unsigned f) {
  __local int g[(16 + 3 * 2) * 640];

  for (int h = 3; h < c - 3; h += 16) {
    size_t i = (h - 3) * 640;
    size_t j = ((h - 3 + 16 + 3 * 2) > c) ? (c - h + 3) * 640 : (16 + 3 * 2) * 640;
    event_t k;
    k = async_work_group_copy(g, a + i, j, 0);
    wait_group_events(1, &k);

    for (int l = 0; l < 16; l++) {
      for (int m = 3; m < b - 3; m++) {
        int n = m;
        int o = h + l;
        int p = n;
        int q = l + 3;

        int r = g[C(p, q)];

        int s = F(g, r, e, p - 3, q + 0) | F(g, r, e, p + 3, q + 0);
        if (s == 0)
          continue;

        s &= F(g, r, e, p - 2, q + 2) | F(g, r, e, p + 2, q - 2);
        s &= F(g, r, e, p + 0, q + 3) | F(g, r, e, p + 0, q - 3);
        s &= F(g, r, e, p + 2, q + 2) | F(g, r, e, p - 2, q - 2);
        if (s == 0)
          continue;

        s &= F(g, r, e, p - 3, q + 1) | F(g, r, e, p + 3, q - 1);
        s &= F(g, r, e, p - 1, q + 3) | F(g, r, e, p + 1, q - 3);
        s &= F(g, r, e, p + 1, q + 3) | F(g, r, e, p - 1, q - 3);
        s &= F(g, r, e, p + 3, q + 1) | F(g, r, e, p - 3, q - 1);
        if (s == 0)
          continue;

        int t = 0;

        for (int h = 0; h < 9; h++)
          t += F(g, r, e, p + B(h), q + A(h));

        int u = 0, v = 0;
        u = max(u, t);
        v = min(v, t);

        for (int h = 9; h < 16; h++) {
          t -= F(g, r, e, p + B(h - 9), q + A(h - 9));
          t += F(g, r, e, p + B(h), q + A(h));
          u = max(u, t);
          v = min(v, t);
        }

        for (int h = 0; h < 9 - 1; h++) {
          t -= F(g, r, e, p + B(16 - 9 + h), q + A(16 - 9 + h));
          t += F(g, r, e, p + B(h), q + A(h));
          u = max(u, t);
          v = min(v, t);
        }

        if (u == 9 || v == -9) {
          int w = 0, x = 0;

          for (int h = 0; h < 16; h++) {
            int y = g[p + C(B(h), q + A(h))];
            int z = abs((int)y - (int)r) - e;
            w += D(y, r, e) * z;
            x += E(y, r, e) * z;
          }

          d[n + b * o] = (w < x) ? (x) : (w);
        }
      }
    }
  }
}