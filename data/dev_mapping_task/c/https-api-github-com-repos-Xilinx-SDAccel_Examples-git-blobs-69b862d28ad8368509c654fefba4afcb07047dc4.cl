__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(const __global int* a, const __global int* b, __global int* c, int d) {
  int e = get_global_id(0);
  int f = get_global_size(0);

  int g[5120];
  int h[5120];
  int i[5120];

  int j = 5120;

  for (int k = 0; k < d; k += j * f) {
    if ((k + j) > d)
      j = d - k;

    __attribute__((xcl_pipeline_loop)) readIn1 : for (int l = 0; l < j; l++) {
      g[l] = a[e * 5120 + k + l];
    }

    __attribute__((xcl_pipeline_loop)) readIn2 : for (int l = 0; l < j; l++) {
      h[l] = b[e * 5120 + k + l];
    }
    __attribute__((xcl_pipeline_loop)) vadd : for (int m = 0; m < 5120; m++) {
      i[m] = g[m] + h[m];
    }

    __attribute__((xcl_pipeline_loop)) writeOut : for (int l = 0; l < j; l++) {
      c[e * 5120 + k + l] = i[l];
    }
  }
  return;
}