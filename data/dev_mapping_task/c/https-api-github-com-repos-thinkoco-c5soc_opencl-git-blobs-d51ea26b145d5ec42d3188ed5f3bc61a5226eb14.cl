unsigned char A(int a, int b, int c) {
  if (a > c)
    a = c;
  if (a < b)
    a = b;
  return (unsigned char)a;
}

__kernel void B(__global unsigned char* restrict a, unsigned int b, unsigned int c, __global unsigned char* restrict d, __global unsigned char* restrict e) {
  int f = get_global_id(0) * 2;
  int g = get_global_id(1);
  int h, i, j, k, l, m, n;

  int o = (g * b) + (f * 2);

  int p = (g * c) + (f * 4);

  int q = (g * b >> 1) + f;

  h = a[o + 0] - 16;
  i = a[o + 1] - 128;
  j = a[o + 2] - 16;
  k = a[o + 3] - 128;

  l = A(((74 * h) + (102 * k)) >> 6, 0, 255);
  m = A(((74 * h) - (52 * k) - (25 * i)) >> 6, 0, 255);
  n = A(((74 * h) + (129 * i)) >> 6, 0, 255);

  d[p + 0] = l;
  d[p + 1] = m;
  d[p + 2] = n;
  d[p + 3] = 255;
  e[q + 0] = A((77 * l + 151 * m + 28 * n) >> 8, 0, 255);

  l = A(((74 * j) + (102 * k)) >> 6, 0, 255);
  m = A(((74 * j) - (52 * k) - (25 * i)) >> 6, 0, 255);
  n = A(((74 * j) + (129 * i)) >> 6, 0, 255);

  d[p + 4] = l;
  d[p + 5] = m;
  d[p + 6] = n;
  d[p + 7] = 255;
  e[q + 1] = A((77 * l + 151 * m + 28 * n) >> 8, 0, 255);
}