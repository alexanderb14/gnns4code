kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(__global const int* a, __global const int* b, __global int* c, const size_t d) {
  int e[4096];
  int f[4096];

  for (int g = 0; g < d; g += 4096) {
    int h = 4096;
    if (g + h > d)
      h = d - g;

  readA:
    for (int i = 0; i < h; i++)
      e[i] = a[g + i];
  readB:
    for (int i = 0; i < h; i++)
      f[i] = b[g + i];

  writeC:
    for (int i = 0; i < h; i++)
      c[g + i] = e[i] + f[i];
  }
}