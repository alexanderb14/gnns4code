void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float* a, int b, int c) {
  float d[7];
  for (int e = 0; e < 7; e++) {
    d[e] = e;
  }
  for (int e = 0; e < 7; e++) {
    a[b + e] = d[e];
  }
}