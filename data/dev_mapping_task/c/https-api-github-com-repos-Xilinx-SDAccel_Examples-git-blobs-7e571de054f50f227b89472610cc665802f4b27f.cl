void __attribute__((always_inline)) A(__global int* a, int b[96][5 * 5], int c) {
  int d = c * 96 * 5 * 5;

  __attribute__((xcl_pipeline_loop)) readWt :

      for (int e = 0, f = 0, g = 0; e < 96 * 5 * 5; e++, g++) {
    if (g == 5 * 5) {
      g = 0;
      f++;
    }
    b[f][g] = a[d + e];
  }
}

void __attribute__((always_inline)) B(__global int* a, int b[27 * 27], int c) {
  int d = c * 27 * 27;

  __attribute__((xcl_pipeline_loop)) writeOut : for (int e = 0; e < 27 * 27; e++) {
    a[d + e] = b[e];
  }
}

void __attribute__((always_inline)) C(int a[96][27 * 27], int b[96][5 * 5], int c[27 * 27], int d, int e, int f, int g) {
  short h[96][5][5] __attribute__((xcl_array_partition(complete, 1)));

  int i = f * 1 - 2;
  int j = e * 1 - 2;

convYaxis:
  for (int k = 0; k < 5; k++, j++) {
    __attribute__((xcl_pipeline_loop))

    convXaxis : for (int l = 0, m = i; l < 5; l++, m++) {
    convInchan:
      for (int n = 0; n < 96; n++) {
        if (j >= 0 && j < 27 && m >= 0 && m < 27) {
          h[n][k][l] = (short)a[n][j * 27 + m] * (short)b[n][k * 5 + l];
        } else {
          h[n][k][l] = 0;
        }
      }
    }
  }

  short o = 0;
accJ:
  for (int l = 0; l < 5; l++)
    __attribute__((xcl_pipeline_loop)) accK : for (int p = 0; p < 5; p++) accI : for (int k = 0; k < g; k++) o += h[k][l][p];

  c[e * 27 + f] = o;
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void D(const __global int* a, const __global int* b, __global int* c, int d, int e, int f) {
  int g = get_global_id(0);
  int h = get_global_size(0);

  int i[96][27 * 27] __attribute__((xcl_array_partition(complete, 1)));

  int j[27 * 27];

  int k[96][5 * 5] __attribute__((xcl_array_partition(complete, 1)));

  __attribute__((xcl_pipeline_loop)) imgcopy : for (int l = 0, m = 0, n = 0; l < e * 27 * 27; l++, n++) {
    if (n == 27 * 27) {
      n = 0;
      m++;
    }
    i[m][n] = a[l];
  }

  int o = g * f / h;
  int p = (g + 1) * f / h;
outthread:
  for (int q = o; q < p; q++) {
    A(b, k, q);

  outYaxis:
    for (int r = 0; r < 27; r++) {
    outXaxis:
      for (int s = 0; s < 27; s++) {
        C(i, k, j, q, r, s, e);
      }
    }

    B(c, j, q);
  }

  return;
}