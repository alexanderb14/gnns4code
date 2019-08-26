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
  __local int g[((17 + 3 * 2) * 640)];
  __local int h[((16 + 3 * 2) * 640)];

  for (int i = 3; i < c - 3; i += 17) {
    size_t j = ((i - 3) * 640);
    size_t k = ((i - 3 + 17 + 3 * 2) > c) ? (c - i + 3) * 640 : (17 + 3 * 2) * 640;
    event_t l;
    l = async_work_group_copy(g, a + j, k, 0);
    wait_group_events(1, &l);

    for (int m = 0; m < ((16 + 3 * 2) * 640); m++) {
      h[m] = 0;
    }

    for (int n = 0; n < 17; n++) {
      for (int m = 3; m < b - 3; m++) {
        int o = m;
        int p = i + n;
        int q = o;
        int r = n + 3;

        int s = g[C(q, r)];

        int t = F(g, s, e, q - 3, r + 0) | F(g, s, e, q + 3, r + 0);
        if (t == 0)
          continue;

        t &= F(g, s, e, q - 2, r + 2) | F(g, s, e, q + 2, r - 2);
        t &= F(g, s, e, q + 0, r + 3) | F(g, s, e, q + 0, r - 3);
        t &= F(g, s, e, q + 2, r + 2) | F(g, s, e, q - 2, r - 2);
        if (t == 0)
          continue;

        t &= F(g, s, e, q - 3, r + 1) | F(g, s, e, q + 3, r - 1);
        t &= F(g, s, e, q - 1, r + 3) | F(g, s, e, q + 1, r - 3);
        t &= F(g, s, e, q + 1, r + 3) | F(g, s, e, q - 1, r - 3);
        t &= F(g, s, e, q + 3, r + 1) | F(g, s, e, q - 3, r - 1);
        if (t == 0)
          continue;

        int u = 0;

        for (int i = 0; i < 9; i++)
          u += F(g, s, e, q + B(i), r + A(i));

        int v = 0, w = 0;
        v = max(v, u);
        w = min(w, u);

        for (int i = 9; i < 16; i++) {
          u -= F(g, s, e, q + B(i - 9), r + A(i - 9));
          u += F(g, s, e, q + B(i), r + A(i));
          v = max(v, u);
          w = min(w, u);
        }

        for (int i = 0; i < 9 - 1; i++) {
          u -= F(g, s, e, q + B(16 - 9 + i), r + A(16 - 9 + i));
          u += F(g, s, e, q + B(i), r + A(i));
          v = max(v, u);
          w = min(w, u);
        }

        if (v == 9 || w == -9) {
          int x = 0, y = 0;

          for (int i = 0; i < 16; i++) {
            int z = g[q + C(B(i), r + A(i))];
            int aa = abs((int)z - (int)s) - e;
            x += D(z, s, e) * aa;
            y += E(z, s, e) * aa;
          }

          h[C(q, r)] = (x < y) ? (y) : (x);
        }
      }
    }

    for (int n = 0; n < 16; n++) {
      for (int m = 3; m < b - 3; m++) {
        int o = m;
        int p = i + n;
        int q = o;
        int r = n + 3;

        int ab = h[C(q, r)];

        if (ab != 0) {
          int ac = h[C(q - 1, r - 1)];
          ac = (ac < h[C(q - 1, r)]) ? (h[C(q - 1, r)]) : (ac);
          ac = (ac < h[C(q - 1, r + 1)]) ? (h[C(q - 1, r + 1)]) : (ac);
          ac = (ac < h[C(q, r - 1)]) ? (h[C(q, r - 1)]) : (ac);
          ac = (ac < h[C(q, r + 1)]) ? (h[C(q, r + 1)]) : (ac);
          ac = (ac < h[C(q + 1, r + 1)]) ? (h[C(q + 1, r + 1)]) : (ac);
          ac = (ac < h[C(q + 1, r)]) ? (h[C(q + 1, r)]) : (ac);
          ac = (ac < h[C(q + 1, r - 1)]) ? (h[C(q + 1, r - 1)]) : (ac);
          if (ab > ac)
            d[C(o, p)] = ab;
        }
      }
    }
  }
}