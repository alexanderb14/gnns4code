kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(__global int* a, __global int* b, __global int* c, int d) {
  __local int e[64][64];
  __local int f[64][64];
  __local int g[64][64];

read_in1:
  for (int h = 0, i = 0, j = 0; h < d * d; h++, j++) {
    if (j == d) {
      j = 0;
      i++;
    }
    e[i][j] = a[h];
  }
read_in2:
  for (int h = 0, i = 0, j = 0; h < d * d; h++, j++) {
    if (j == d) {
      j = 0;
      i++;
    }
    f[i][j] = b[h];
  }

  for (int i = 0; i < d; i++) {
    for (int j = 0; j < d; j++) {
      g[i][j] = 0;
    write_data:
      for (int k = 0; k < d; k++) {
        g[i][j] += e[i][k] * f[k][j];
      }
    }
  }

write_out:
  for (int h = 0, i = 0, j = 0; h < d * d; h++, j++) {
    if (j == d) {
      j = 0;
      i++;
    }
    c[h] = g[i][j];
  }
}