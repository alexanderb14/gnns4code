kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(global int* a, global const int* b, global const int* c, const int d, const int e) {
  int f = 0;
  int g = 2147483647;
  int h[5];

  __attribute__((xcl_pipeline_loop)) for (int i = 0; i < e; ++i) {
    h[i] = c[i];
  }

find_best:
  for (int j = 0; j < d; ++j) {
    int k = 0;

    __attribute__((xcl_pipeline_loop)) dist_calc : for (int l = 0; l < e; ++l) {
      int m = b[e * j + l] - h[l];
      k += m * m;
    }

    if (k < g) {
      f = j;
      g = k;
    }
  }

  __attribute__((xcl_pipeline_loop)) write_best : for (int l = 0; l < e; ++l) {
    a[l] = b[f * e + l];
  }
}

kernel __attribute__((reqd_work_group_size(1, 1, 1))) void B(global int* a, global const int* b, global const int* c, const int d, const int e) {
  int f = 0;
  int g = 2147483647;
  int h[5];

  __attribute__((xcl_pipeline_loop)) for (int i = 0; i < e; ++i) {
    h[i] = c[i];
  }

  int j = 0;
  int k = d * e;

  __attribute__((xcl_pipeline_loop)) find_best : for (int l = 0, m = 0, n = 0; n < k; n++) {
    int o = b[e * l + m] - h[m];
    j += o * o;

    if (m == e - 1) {
      if (j < g) {
        f = l;
        g = j;
      }
      m = 0;
      j = 0;
      l++;
    } else {
      m++;
    }
  }
  __attribute__((xcl_pipeline_loop)) write_best : for (int m = 0; m < e; ++m) {
    a[m] = b[f * e + m];
  }
}