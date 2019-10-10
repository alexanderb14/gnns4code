int A(int a, int b, int c) {
  int d;
  if (a <= b)
    d = b;
  else
    d = a;

  if (d <= c)
    return (c);
  else
    return (d);
}

__kernel void B(__global int* a, __global int volatile* b, __global int* c, int d, int e, int f) {
  int g = d;
  int h = 64 * f + 1;

  int i[64];

  for (int j = 0; j < 64; ++j) {
    i[j] = b[h + j];
  }

  for (int k = 1; k < g - 1; ++k) {
    int l = b[h + d * k - 1 - d];
    int m = b[h + d * k - 1];

    for (int j = 0; j < 64; ++j) {
      int n = h + j + d * k;
      int o = i[j];
      int p = A(l + a[n], m - e, o - e);
      l = o;
      m = p;
      i[j] = p;
      c[n] = p;
    }
  }
}