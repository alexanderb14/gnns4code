__kernel void __attribute__((reqd_work_group_size(1, 1, 1))) A(__global int* a, __global int* b, __global int* c, __global int* d, const int e) {
  int f = 0;
  for (int g = 0; g < e; g++) {
    f = g + e;
    d[g] = a[g] * a[f] + b[g] * b[f] + c[g] * c[f];
  }

  return;
}