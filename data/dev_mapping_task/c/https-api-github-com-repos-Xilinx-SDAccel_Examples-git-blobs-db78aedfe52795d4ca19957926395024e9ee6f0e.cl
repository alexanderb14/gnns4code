__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(__global int* a, __global int* b, __global int* c, int d) {
  local int e[256][256];
  local int f[256][256];
  local int g[256][256];

  int h = d * d;

  int i = 0, j = 0;
read_data_a:
  for (int k = 0; k < h; k++) {
    int l = a[k];
    e[i][j] = l;
    if (j == d - 1) {
      i++;
      j = 0;
    } else {
      j++;
    }
  }

read_data_b:
  for (int k = 0, i = 0, j = 0; k < h; k++) {
    int m = b[k];
    f[i][j] = m;
    if (j == d - 1) {
      i++;
      j = 0;
    } else {
      j++;
    }
  }

matrix_mult:
  for (int n = 0; n < d; n++) {
    for (int o = 0; o < d; o++) {
      int p = 0;
      __attribute__((xcl_pipeline_loop)) for (int q = 0; q < d; q++) {
        p += e[n][q] * f[q][o];
      }
      g[n][o] = p;
    }
  }

  int r = 0, s = 0;
write_data:
  for (int k = 0; k < h; k++) {
    int t = g[r][s];
    c[k] = t;
    if (s == d - 1) {
      r++;
      s = 0;
    } else {
      s++;
    }
  }
}