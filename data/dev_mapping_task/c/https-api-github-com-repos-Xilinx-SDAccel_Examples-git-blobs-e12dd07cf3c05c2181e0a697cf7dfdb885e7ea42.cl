__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(__global int* a, int b, int c) {
  local int d[256];

  for (int e = 0; e < b; e += 256) {
    int f = 256;

    if ((e + 256) > b)
      f = b - e;

    __attribute__((xcl_pipeline_loop)) read_buf : for (int g = 0; g < f; g++) {
      d[g] = a[e + g];
    }
    __attribute__((xcl_pipeline_loop)) calc_write : for (int g = 0; g < f; g++) {
      d[g] = d[g] + c;
      a[e + g] = d[g];
    }
  }
}