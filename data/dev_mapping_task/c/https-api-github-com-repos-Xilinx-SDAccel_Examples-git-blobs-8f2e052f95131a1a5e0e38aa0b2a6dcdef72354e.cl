kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(__global int* a, __global int* b, __global int* c, int d) {
  for (int e = 0; e < d; e++) {
    for (int f = 0; f < d; f++) {
      c[e * d + f] = 0;
      for (int g = 0; g < d; g++) {
        c[e * d + f] += a[e * d + g] * b[g * d + f];
      }
    }
  }
}