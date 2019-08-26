__kernel void __attribute__((reqd_work_group_size(1, 1, 1))) A(__global int* a, __global int* b, const int c) {
  int d[256];
  int e[256];
  int f[256];
  int g[256];
  for (int h = 0; h < c; h += 256) {
    int i = 256;
    if (h + i > c)
      i = c - h;

    __attribute__((xcl_pipeline_loop)) readA : for (int j = 0; j < 4 * i; j++) {
      int k = a[h + j];
      switch (j % 4) {
        case 0:
          d[j / 4] = k;
          break;
        case 1:
          e[j / 4] = k;
          break;
        case 2:
          f[j / 4] = k;
          break;
        case 3:
          g[j / 4] = k;
          break;
      }
    }
  vadd_writeC:
    for (int j = 0; j < i; j++)
      b[j] = d[j] + e[j] + f[j] + g[j];
  }
  return;
}