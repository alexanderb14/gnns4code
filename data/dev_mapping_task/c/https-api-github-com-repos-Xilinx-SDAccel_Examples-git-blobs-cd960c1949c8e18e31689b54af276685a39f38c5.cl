__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(__global int* a, __global int* b, __global int* c, int d, int e, int f) {
  int g = e;
  int h = d;
  int i = f;

  int j[16][16] __attribute__((xcl_array_partition(complete, 1)));
  ;
  int k[16][16] __attribute__((xcl_array_partition(complete, 2)));
  ;
  int l[16][16] __attribute__((xcl_array_partition(complete, 0)));
  ;

  __attribute__((xcl_pipeline_loop)) readA : for (int m = 0, n = 0, o = 0; m < d * e; m++, o++) {
    if (o == e) {
      n++;
      o = 0;
    }
    j[n][o] = a[m];
  }

  __attribute__((xcl_pipeline_loop)) readB : for (int m = 0, n = 0, o = 0; m < g * f; m++, o++) {
    if (o == f) {
      n++;
      o = 0;
    }
    k[n][o] = b[m];
  }
  __attribute__((xcl_pipeline_loop)) systolic1 : for (int p = 0; p < e; p++) {
  systolic2:
    for (int n = 0; n < 16; n++) {
    systolic3:
      for (int o = 0; o < 16; o++) {
        int q = (p == 0) ? 0 : l[n][o];

        int r = (n < d && p < e) ? j[n][p] : 0;
        int s = (p < g && o < f) ? k[p][o] : 0;
        int t = q + r * s;

        l[n][o] = t;
      }
    }
  }

  __attribute__((xcl_pipeline_loop)) writeC : for (int m = 0, n = 0, o = 0; m < h * i; m++, o++) {
    if (o == i) {
      n++;
      o = 0;
    }
    c[m] = l[n][o];
  }
}