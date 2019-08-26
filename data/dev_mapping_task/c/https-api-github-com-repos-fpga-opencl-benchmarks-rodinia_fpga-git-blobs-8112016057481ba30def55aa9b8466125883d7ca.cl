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

__kernel void B(__global int* a, __global int* b, int c, int d) {
  for (int e = 1; e < c - 1; ++e) {
    for (int f = 1; f < c - 1; ++f) {
      int g = e * c + f;
      b[g] = A(b[g - 1 - c] + a[g], b[g - 1] - d, b[g - c] - d);
    }
  }
}