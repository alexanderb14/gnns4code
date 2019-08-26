kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(const __global int* a, const __global int* b, __global int* c, int d) {
  local int e[64][64];
  local int f[64][64];
  local int g[64][64];
  local int h[64];

  __attribute__((xcl_pipeline_loop)) readA : for (int i = 0, j = 0, k = 0; i < d * d; i++, k++) {
    if (k == d) {
      k = 0;
      j++;
    }
    e[j][k] = a[i];
  }

  __attribute__((xcl_pipeline_loop)) readB : for (int i = 0, j = 0, k = 0; i < d * d; i++, k++) {
    if (k == d) {
      k = 0;
      j++;
    }
    f[j][k] = b[i];
  }

nopart1:
  for (int j = 0; j < d; j++) {
    __attribute__((xcl_pipeline_loop)) nopart2 : for (int l = 0; l < d; l++) {
    nopart3:
      for (int k = 0; k < 64; k++) {
        int m = (l == 0) ? 0 : h[k];
        m += e[j][l] * f[l][k];
        h[k] = m;
        if (l == d - 1)
          g[j][k] = m;
      }
    }
  }

  __attribute__((xcl_pipeline_loop)) writeC : for (int i = 0, j = 0, k = 0; i < d * d; i++, k++) {
    if (k == d) {
      k = 0;
      j++;
    }
    c[i] = g[j][k];
  }
}

kernel __attribute__((reqd_work_group_size(1, 1, 1))) void B(const __global int* a, const __global int* b, __global int* c, int d) {
  int e[64][64];

  int f[64][64] __attribute__((xcl_array_partition(complete, 2)));

  int g[64][64] __attribute__((xcl_array_partition(complete, 2)));

  int h[64] __attribute__((xcl_array_partition(complete, 1)));

  __attribute__((xcl_pipeline_loop)) readA : for (int i = 0, j = 0, k = 0; i < d * d; i++, k++) {
    if (k == d) {
      k = 0;
      j++;
    }
    e[j][k] = a[i];
  }

  __attribute__((xcl_pipeline_loop)) readB : for (int i = 0, j = 0, k = 0; i < d * d; i++, k++) {
    if (k == d) {
      k = 0;
      j++;
    }
    f[j][k] = b[i];
  }

arraypart1:
  for (int j = 0; j < d; j++) {
    __attribute__((xcl_pipeline_loop)) arraypart2 : for (int l = 0; l < d; l++) {
    arraypart3:
      for (int k = 0; k < 64; k++) {
        int m = (l == 0) ? 0 : h[k];
        m += e[j][l] * f[l][k];
        h[k] = m;
        if (l == d - 1)
          g[j][k] = m;
      }
    }
  }

  __attribute__((xcl_pipeline_loop)) writeC : for (int i = 0, j = 0, k = 0; i < d * d; i++, k++) {
    if (k == d) {
      k = 0;
      j++;
    }
    c[i] = g[j][k];
  }
}