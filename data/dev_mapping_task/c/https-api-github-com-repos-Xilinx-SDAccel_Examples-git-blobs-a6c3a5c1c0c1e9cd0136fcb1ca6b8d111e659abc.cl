void A(__global int* a, int* b, int c) {
  for (int d = 0; d < c; d++) {
    b[d] = a[d];
  }
}

void B(int* a, int* b, int c, int d) {
  for (int e = 0; e < d; e++) {
    b[e] = a[e] + c;
  }
}

void C(__global int* a, int* b, int c) {
  for (int d = 0; d < c; d++) {
    a[d] = b[d];
  }
}
__kernel __attribute__((reqd_work_group_size(1, 1, 1))) __attribute__((xcl_dataflow)) void D(__global int* a, __global int* b, int c, int d) {
  int e[4096];
  int f[4096];

  A(a, e, d);
  B(e, f, c, d);
  C(b, f, d);
}