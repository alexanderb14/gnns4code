inline int A(const int a) {
  int b = a - 4;
  int c = min(b, 8 - b);
  return clamp(c, -3, 3);
}

inline int B(const int a) {
  return A((a + 4) & 15);
}

inline int C(const int a, const int b) {
  return ((get_local_id(0) + 3 + a) + (get_local_size(0) + 6) * (get_local_id(1) + 3 + b));
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

void G(__local int* a, __global int* b, const int c, const int d, const int e, int f, int g, const unsigned h) {
  if (f >= c - h || g >= d - h)
    return;

  int i = a[C(0, 0)];

  int j = F(a, i, e, -3, 0) | F(a, i, e, 3, 0);
  if (j == 0)
    return;

  j &= F(a, i, e, -2, 2) | F(a, i, e, 2, -2);
  j &= F(a, i, e, 0, 3) | F(a, i, e, 0, -3);
  j &= F(a, i, e, 2, 2) | F(a, i, e, -2, -2);
  if (j == 0)
    return;

  j &= F(a, i, e, -3, 1) | F(a, i, e, 3, -1);
  j &= F(a, i, e, -1, 3) | F(a, i, e, 1, -3);
  j &= F(a, i, e, 1, 3) | F(a, i, e, -1, -3);
  j &= F(a, i, e, 3, 1) | F(a, i, e, -3, -1);
  if (j == 0)
    return;

  int k = 0;

  for (int l = 0; l < 9; l++)
    k += F(a, i, e, B(l), A(l));

  int m = 0, n = 0;
  m = max(m, k);
  n = min(n, k);

  for (int l = 9; l < 16; l++) {
    k -= F(a, i, e, B(l - 9), A(l - 9));
    k += F(a, i, e, B(l), A(l));
    m = max(m, k);
    n = min(n, k);
  }

  for (int l = 0; l < 9 - 1; l++) {
    k -= F(a, i, e, B(16 - 9 + l), A(16 - 9 + l));
    k += F(a, i, e, B(l), A(l));
    m = max(m, k);
    n = min(n, k);
  }

  if (m == 9 || n == -9) {
    int o = 0, p = 0;
    for (int l = 0; l < 16; l++) {
      int q = a[C(B(l), A(l))];
      int r = abs((int)q - (int)i) - e;
      o += D(q, i, e) * r;
      p += E(q, i, e) * r;
    }

    b[f + c * g] = (o < p) ? (p) : (o);
  }
}

void H(__global const int* a, const int b, const int c, __local int* d, unsigned e, unsigned f, unsigned g, unsigned h, unsigned i, unsigned j, unsigned k, unsigned l) {
  if (e < k && f < l && i - 3 < b && j - 3 < c) {
    d[(e) + (g + 6) * (f)] = a[(i - 3) + b * (j - 3)];
    if (i + k - 3 < b)
      d[(e + k) + (g + 6) * (f)] = a[(i + k - 3) + b * (j - 3)];
    if (j + l - 3 < c)
      d[(e) + (g + 6) * (f + l)] = a[(i - 3) + b * (j + l - 3)];
    if (i + k - 3 < b && j + l - 3 < c)
      d[(e + k) + (g + 6) * (f + l)] = a[(i + k - 3) + b * (j + l - 3)];
  }
}

__kernel __attribute__((reqd_work_group_size(16, 16, 1))) void I(__global const int* a, const int b, const int c, __global int* d, const int e, const unsigned f, __local int* g) {
  unsigned h = get_local_id(0);
  unsigned i = get_local_id(1);
  unsigned j = get_local_size(0);
  unsigned k = get_local_size(1);
  unsigned l = j * get_group_id(0) + h + f;
  unsigned m = k * get_group_id(1) + i + f;
  unsigned n = j / 2 + 3;
  unsigned o = k / 2 + 3;

  H(a, b, c, g, h, i, j, k, l, m, n, o);
  barrier(1);
  G(g, d, b, c, e, l, m, f);
}