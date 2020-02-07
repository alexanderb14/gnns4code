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

__kernel void B(__global int* a, __global int* b, int c, int d, int e, int f) {
  int g = get_group_id(0);
  int h = get_local_id(0);

  int i = g;
  int j = e - 1 - g;
  int k = c * 16 * j + 16 * i + h + (c + 1);

  for (int l = 0; l < 16; l++) {
    if (h <= l) {
      int m = k + (l - h) * c;

      b[m] = A(b[m - (c + 1)] + a[m], b[m - 1] - d, b[m - c] - d);
    }

    barrier(2);
  }

  for (int l = 16 - 2; l >= 0; l--) {
    if (h <= l) {
      int m = k + (l - h) * c + (c + 1) * (16 - 1 - l);

      b[m] = A(b[m - (c + 1)] + a[m], b[m - 1] - d, b[m - c] - d);
    }

    barrier(2);
  }
}

__kernel void C(__global int* a, __global int* b, int c, int d, int e, int f) {
  int g = get_group_id(0);
  int h = get_local_id(0);

  int i = g + f - e;
  int j = f - g - 1;
  int k = c * 16 * j + 16 * i + h + (c + 1);

  for (int l = 0; l < 16; l++) {
    if (h <= l) {
      int m = k + (l - h) * c;

      b[m] = A(b[m - (c + 1)] + a[m], b[m - 1] - d, b[m - c] - d);
    }

    barrier(2);
  }

  for (int l = 16 - 2; l >= 0; l--) {
    if (h <= l) {
      int m = k + (l - h) * c + (c + 1) * (16 - 1 - l);

      b[m] = A(b[m - (c + 1)] + a[m], b[m - 1] - d, b[m - c] - d);
    }

    barrier(2);
  }
}