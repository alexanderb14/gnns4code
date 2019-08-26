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
  int l = c * 16 * j + 16 * i + h + (1);
  int m = c * 16 * j + 16 * i + (c);
  int n = c * 16 * j + 16 * i;

  __local int o[16 + 1][16 + 1];
  __local int p[16][16];

  if (h == 0)
    o[h][0] = b[n];

  for (int q = 0; q < 16; q++)
    p[q][h] = a[k + c * q];

  barrier(1);

  o[h + 1][0] = b[m + c * h];

  barrier(1);

  o[0][h + 1] = b[l];

  barrier(1);

  for (int r = 0; r < 16; r++) {
    if (h <= r) {
      int s = h + 1;
      int t = r - h + 1;

      o[t][s] = A(o[t - 1][s - 1] + p[t - 1][s - 1], o[t][s - 1] - d, o[t - 1][s] - d);
    }

    barrier(1);
  }

  for (int r = 16 - 2; r >= 0; r--) {
    if (h <= r) {
      int s = h + 16 - r;
      int t = 16 - h;

      o[t][s] = A(o[t - 1][s - 1] + p[t - 1][s - 1], o[t][s - 1] - d, o[t - 1][s] - d);
    }

    barrier(1);
  }

  for (int q = 0; q < 16; q++)
    b[k + q * c] = o[q + 1][h + 1];
}

__kernel void C(__global int* a, __global int* b, int c, int d, int e, int f) {
  int g = get_group_id(0);
  int h = get_local_id(0);

  int i = g + f - e;
  int j = f - g - 1;

  int k = c * 16 * j + 16 * i + h + (c + 1);
  int l = c * 16 * j + 16 * i + h + (1);
  int m = c * 16 * j + 16 * i + (c);
  int n = c * 16 * j + 16 * i;

  __local int o[16 + 1][16 + 1];
  __local int p[16][16];

  for (int q = 0; q < 16; q++)
    p[q][h] = a[k + c * q];

  barrier(1);

  if (h == 0)
    o[h][0] = b[n];

  o[h + 1][0] = b[m + c * h];

  barrier(1);

  o[0][h + 1] = b[l];

  barrier(1);

  for (int r = 0; r < 16; r++) {
    if (h <= r) {
      int s = h + 1;
      int t = r - h + 1;

      o[t][s] = A(o[t - 1][s - 1] + p[t - 1][s - 1], o[t][s - 1] - d, o[t - 1][s] - d);
    }

    barrier(1);
  }

  for (int r = 16 - 2; r >= 0; r--) {
    if (h <= r) {
      int s = h + 16 - r;
      int t = 16 - h;

      o[t][s] = A(o[t - 1][s - 1] + p[t - 1][s - 1], o[t][s - 1] - d, o[t - 1][s] - d);
    }

    barrier(1);
  }

  for (int q = 0; q < 16; q++)
    b[k + q * c] = o[q + 1][h + 1];
}