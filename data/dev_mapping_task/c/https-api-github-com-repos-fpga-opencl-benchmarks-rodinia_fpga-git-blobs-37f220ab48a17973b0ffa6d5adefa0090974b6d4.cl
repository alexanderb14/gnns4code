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

__kernel void B(__global int* a, __global int volatile* b, __global int* c, int d, int e, int f, int g) {
  int h = 64 * f + 1 + d * (64 * g + 1);
  int i[64];

  for (int j = 0; j < 64; ++j) {
    i[j] = b[h - d + j];
  }

  for (int k = 0; k < 64; ++k) {
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