__kernel __attribute__((reqd_work_group_size(1, 1, 1))) __attribute__((xcl_dataflow)) void A(__global int* a, __global int* b, int c, int d) {
  int e[4096];
  int f[4096];

read:
  for (int g = 0; g < d; g++) {
    e[g] = a[g];
  }

compute:
  for (int g = 0; g < d; g++) {
    f[g] = e[g] + c;
  }

write:
  for (int g = 0; g < d; g++) {
    b[g] = f[g];
  }
}