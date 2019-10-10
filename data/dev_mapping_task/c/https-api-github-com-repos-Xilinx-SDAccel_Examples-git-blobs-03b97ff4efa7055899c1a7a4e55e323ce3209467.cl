kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(const __global int* a, const __global int* b, __global int* c, int d) {
  local int e[64 * 64];
  local int f[64 * 64];
  local int g[64 * 64];

  __attribute__((xcl_pipeline_loop)) readA : for (int h = 0; h < d * d; h++) {
    e[h] = a[h];
  }

  __attribute__((xcl_pipeline_loop)) readB : for (int h = 0; h < d * d; h++) {
    f[h] = b[h];
  }

lreorder1:
  for (int h = 0; h < d; h++) {
  lreorder2:
    for (int i = 0; i < 64; i++) {
      int j = 0;
      __attribute__((xcl_pipeline_loop)) lreorder3 : for (int k = 0; k < d; k++) {
        j += e[h * d + k] * f[k * d + i];
      }
      g[h * d + i] = j;
    }
  }

  __attribute__((xcl_pipeline_loop)) writeC : for (int h = 0; h < d * d; h++) {
    c[h] = g[h];
  }
}

kernel __attribute__((reqd_work_group_size(1, 1, 1))) void B(const __global int* a, const __global int* b, __global int* c, int d) {
  int e[64 * 64] __attribute__((xcl_array_partition(cyclic, 64, 1)));

  int f[64 * 64] __attribute__((xcl_array_partition(block, 64, 1)));
  int g[64 * 64];

  __attribute__((xcl_pipeline_loop)) readA : for (int h = 0, i = 0, j = 0; h < d * d; h++, j++) {
    if (j == d) {
      j = 0;
      i++;
    }
    e[i * 64 + j] = a[h];
  }

  __attribute__((xcl_pipeline_loop)) readB : for (int h = 0, i = 0, j = 0; h < d * d; h++, j++) {
    if (j == d) {
      j = 0;
      i++;
    }
    f[i * 64 + j] = b[h];
  }

lreorder1:
  for (int i = 0; i < d; i++) {
    __attribute__((xcl_pipeline_loop)) lreorder2 : for (int j = 0; j < d; j++) {
      int k = 0;
    lreorder3:
      for (int l = 0; l < 64; l++) {
        k += e[i * 64 + l] * f[l * 64 + j];
      }
      g[i * 64 + j] = k;
    }
  }

  __attribute__((xcl_pipeline_loop)) writeC : for (int h = 0, i = 0, j = 0; h < d * d; h++, j++) {
    if (j == d) {
      j = 0;
      i++;
    }
    c[h] = g[i * 64 + j];
  }
}