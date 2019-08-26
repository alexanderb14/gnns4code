kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(global int* a, global const int* b, global const int* c, const int d) {
  int e[256];
  int f[256];
  for (int g = 0; g < d; g += 256) {
    int h = 256;
    if (g + h > d)
      h = d - g;
  readA:
    for (int i = 0; i < h; i++)
      e[i] = b[g + i];
  readB:
    for (int i = 0; i < h; i++)
      f[i] = c[g + i];
  vadd_writeC:
    for (int i = 0; i < h; i++)
      a[g + i] = e[i] + f[i];
  }
}