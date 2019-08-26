__kernel void __attribute__((reqd_work_group_size(1, 1, 1))) A(__global int* a, __global int* b, __global int* c, const int d) {
  int e[128];
  int f = d / 128;
  for (int g = 0; g < f; g++) {
    int h;
  read_a:
    __attribute__((xcl_pipeline_loop)) for (h = 0; h < 128; h++) e[h] = a[g * 128 + h];

  read_b_write_c:
    __attribute__((xcl_pipeline_loop)) for (h = 0; h < 128; h++) c[g * 128 + h] = e[h] * b[g * 128 + h];
  }

  return;
}