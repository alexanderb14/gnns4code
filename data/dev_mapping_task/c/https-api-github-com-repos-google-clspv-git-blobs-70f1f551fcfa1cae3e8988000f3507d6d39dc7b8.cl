void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float* a, int b, int c) {
  float d[25];
  float e[20];
  for (int f = 0; f < 20; f++) {
    e[f] = a[f];
  }
  for (int f = 0; f < 20; f++) {
    d[b + f] = a[f];
  }
  a[b] = d[c] + e[c];
}