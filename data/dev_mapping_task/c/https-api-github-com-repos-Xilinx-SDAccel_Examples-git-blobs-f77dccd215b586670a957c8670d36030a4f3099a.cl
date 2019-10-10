__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(const __global int* a, const __global int* b, __global int* c, int d, int e, int f) {
  int g[96 * 27 * 27];
  int h[256 * 27 * 27];
  int i[256 * 96 * 5 * 5];

  __attribute__((xcl_pipeline_loop)) readImg : for (int j = 0; j < e * 27 * 27; j++) {
    g[j] = a[j];
  }

  __attribute__((xcl_pipeline_loop)) readWt :

      for (int j = 0; j < f * 96 * 5 * 5; j++) {
    i[j] = b[j];
  }

outputLoop:
  for (int k = 0, l = 0; k < f; k++) {
  outYAxis:
    for (int m = 0; m < 27; m++) {
    outXAxis:
      for (int n = 0; n < 27; n++) {
        short o = 0;

      convInchan:
        for (int p = 0; p < e; p++) {
        convILoop:
          for (int j = 0; j < 5; j++) {
            __attribute__((xcl_pipeline_loop)) convJLoop : for (int q = 0; q < 5; q++) {
              int r = n * 1 + q - 2, s = m * 1 + j - 2;

              if (s >= 0 && s < 27 && r >= 0 && r < 27) {
                o += (short)g[(p * 27 + s) * 27 + r] * (short)i[((k * e + p) * 5 + j) * 5 + q];
              }
            }
          }
        }

        h[l++] = o;
      }
    }
  }

  __attribute__((xcl_pipeline_loop)) writeOut : for (int j = 0; j < f * 27 * 27; j++) {
    c[j] = h[j];
  }

  return;
}