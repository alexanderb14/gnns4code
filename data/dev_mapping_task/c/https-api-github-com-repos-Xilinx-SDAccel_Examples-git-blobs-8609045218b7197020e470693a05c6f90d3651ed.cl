kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(global int* a, const int b, const int c, const int d) {
mscale:
  for (int e = 0; e < c * d; ++e)
    a[e] = a[e] * b;
}

kernel __attribute__((reqd_work_group_size(1, 1, 1))) void B(global int* a, global const int* b, global const int* c, const int d, const int e) {
  int f[64 * 64];
  int g[64 * 64];

madd_readA:
  for (int h = 0; h < d * e; ++h)
    f[h] = b[h];
madd_readB:
  for (int h = 0; h < d * e; ++h)
    g[h] = c[h];
madd_writeC:
  for (int h = 0; h < d * e; ++h)
    a[h] = f[h] + g[h];
}

kernel __attribute__((reqd_work_group_size(1, 1, 1))) void C(global int* a, global const int* b, global const int* c, const int d, const int e) {
  int f[64 * 64];
  int g[64 * 64];
madd_readA:
  for (int h = 0; h < d * e; ++h)
    f[h] = b[h];
madd_readB:
  for (int h = 0; h < d * e; ++h)
    g[h] = c[h];

  for (int i = 0; i < e; ++i) {
    for (int h = 0; h < d; ++h) {
      int j = 0;
      for (int k = 0; k < e; ++k)
        j += f[k + h * d] * g[i + k * d];

      a[h + i * d] = j;
    }
  }
}