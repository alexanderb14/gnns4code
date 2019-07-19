__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(__global int* restrict a, __global int* restrict b, __global int* restrict c, long d) {
  int e[11];
read_coef:
  for (int f = 0; f < 11; f++)
    e[f] = c[f];

outer_loop:
  for (int g = 0; g < d; g++) {
    int h = 0;
  shift_loop:
    __attribute__((xcl_pipeline_loop)) for (int f = min(g, 11 - 1); f >= 0; f--) {
      h += b[g - f] * e[f];
    }
    a[g] = h;
  }
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void B(__global int* restrict a, __global int* restrict b, __global int* restrict c, long d) {
  int e[11];

  int f[11] __attribute__((xcl_array_partition(complete, 0)));

init_loop:
  for (int g = 0; g < 11; g++) {
    f[g] = 0;
    e[g] = c[g];
  }

outer_loop:
  for (int h = 0; h < d; h++) {
    int i = 0;
    int j = b[h];

  shift_loop:
    for (int g = 11 - 1; g >= 0; g--) {
      if (g == 0) {
        i += j * e[0];
        f[0] = j;
      } else {
        f[g] = f[g - 1];
        i += f[g] * e[g];
      }
    }
    a[h] = i;
  }
}