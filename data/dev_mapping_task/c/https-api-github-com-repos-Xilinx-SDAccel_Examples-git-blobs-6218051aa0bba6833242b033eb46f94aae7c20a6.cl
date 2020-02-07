kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(global const int* a, global const int* b, global int* c, const int d) {
  int e[256];
  for (int f = 0; f < d; f += 256) {
    int g = 256;

    if (f + g > d)
      g = d - f;

  readA:
    for (int h = 0; h < g; h++)
      e[h] = a[f + h];

  vadd_wrteC:
    for (int h = 0; h < g; h++)
      c[f + h] = e[h] + b[f + h];
  }
}