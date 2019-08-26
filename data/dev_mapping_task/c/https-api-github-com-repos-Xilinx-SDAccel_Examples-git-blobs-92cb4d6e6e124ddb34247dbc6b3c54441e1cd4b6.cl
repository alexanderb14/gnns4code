__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(const __global int* a, const __global int* b, __global int* c, int d) {
  int e = get_global_id(0);
  int f = get_global_size(0);

  int g[8][5120] __attribute__((xcl_array_partition(complete, 1)));
  int h[8][5120] __attribute__((xcl_array_partition(complete, 1)));
  int i[8][5120] __attribute__((xcl_array_partition(complete, 1)));

  int j = 8 * 5120;

  for (int k = 0; k < d; k += j * f) {
    if ((k + j) > d)
      j = d - k;

    __attribute__((xcl_pipeline_loop)) readIn1 : for (int l = 0, m = 0, n = 0; l < j; l++, n++) {
      if (n == 5120) {
        n = 0;
        m++;
      }
      g[m][n] = a[e * 5120 + k + l];
    }

    __attribute__((xcl_pipeline_loop)) readIn2 : for (int l = 0, m = 0, n = 0; l < j; l++, n++) {
      if (n == 5120) {
        n = 0;
        m++;
      }
      h[m][n] = b[e * 5120 + k + l];
    }
    __attribute__((xcl_pipeline_loop)) vadd1 : for (int m = 0; m < 5120; m++) {
    vadd2:
      for (int n = 0; n < 8; n++) {
        i[n][m] = g[n][m] + h[n][m];
      }
    }

    __attribute__((xcl_pipeline_loop)) writeOut : for (int l = 0, m = 0, n = 0; l < j; l++, n++) {
      if (n == 5120) {
        n = 0;
        m++;
      }
      c[e * 5120 + k + l] = i[m][n];
    }
  }
  return;
}