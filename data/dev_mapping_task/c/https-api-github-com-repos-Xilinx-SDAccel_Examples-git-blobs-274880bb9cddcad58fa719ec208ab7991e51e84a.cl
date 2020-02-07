kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(global int* a, global const int* b, global const int* c, global int* d, size_t e) {
  int f[256], g[256];
  int h = 0;
  for (int i = 0; i < e; i += 256) {
    int j = 256;
    if (i + j > e)
      j = e - i;

  readA:
    for (int k = 0; k < j; k++)
      f[k] = b[i + k];
  readB:
    for (int k = 0; k < j; k++)
      g[k] = c[i + k];

  writeC:
    for (int k = 0; k < (j - 1) / 2 + 1; k++)
      a[h + k] = f[2 * k] + g[2 * k];
    h = h + (j - 1) / 2 + 1;
  }
  d[0] = h;
}