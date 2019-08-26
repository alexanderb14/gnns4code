kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(global int* restrict a, global const int* restrict b, global const int* restrict c, const int d) {
vadd_loop:
  for (int e = 0; e < d; ++e) {
    a[e] = b[e] + c[e];
  }
}

kernel __attribute__((reqd_work_group_size(1, 1, 1))) void B(global int* restrict a, global const int* restrict b, global const int* restrict c, const int d) {
  int e[128];
  int f = d / 128;

  for (int g = 0; g < f; g++) {
  read_a:
    __attribute__((xcl_pipeline_loop)) for (int h = 0; h < 128; ++h) {
      e[h] = b[g * 128 + h];
    }
  read_b:
    __attribute__((xcl_pipeline_loop)) for (int h = 0; h < 128; ++h) {
      e[h] += c[g * 128 + h];
    }
  write:
    __attribute__((xcl_pipeline_loop)) for (int h = 0; h < 128; ++h) {
      a[g * 128 + h] = e[h];
    }
  }
}