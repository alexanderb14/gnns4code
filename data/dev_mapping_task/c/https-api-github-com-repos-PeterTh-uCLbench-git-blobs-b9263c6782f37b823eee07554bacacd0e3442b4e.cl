__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(__global uint* a, __global uint* b, uint c) {
  uint d = 0;

  int e;
  __local uint f[1024];
  for (e = 0; e < 1024;) {
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
    f[e] = a[e];
    ++e;
  }

  uint g = 0;
  for (int e = 0; e < c; ++e) {
    do {
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      g = f[g];
      d += g;
    } while (g);
  }
  *b = d;
}