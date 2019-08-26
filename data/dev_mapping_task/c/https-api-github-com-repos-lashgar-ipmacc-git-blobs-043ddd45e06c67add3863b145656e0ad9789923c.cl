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

__kernel void B(__global int* a, __global int* b, __global int* c, __local int* d, __local int* e, int f, int g, int h, int i, int j, int k, int l) {
  int m = get_group_id(0);

  int n = get_local_id(0);

  int o = k * f + l;

  int p = m;
  int q = h - 1 - m;

  int r = o + f * 16 * q + 16 * p + n + (f + 1);
  int s = o + f * 16 * q + 16 * p + n + (1);
  int t = o + f * 16 * q + 16 * p + (f);
  int u = o + f * 16 * q + 16 * p;

  if (n == 0) {
    d[0 + n * (16 + 1)] = b[u + n];
  }

  barrier(1);

  for (int v = 0; v < 16; v++)
    e[n + v * 16] = a[r + f * v];

  barrier(1);

  d[0 + (n + 1) * (16 + 1)] = b[t + f * n];

  barrier(1);

  d[(n + 1) + 0 * (16 + 1)] = b[s];

  barrier(1);

  for (int w = 0; w < 16; w++) {
    if (n <= w) {
      int x = n + 1;
      int y = w - n + 1;

      d[x + y * (16 + 1)] = A(d[(x - 1) + (y - 1) * (16 + 1)] + e[(x - 1) + (y - 1) * 16], d[(x - 1) + (y) * (16 + 1)] - (g), d[(x) + (y - 1) * (16 + 1)] - (g));
    }
    barrier(1);
  }

  barrier(1);

  for (int w = 16 - 2; w >= 0; w--) {
    if (n <= w) {
      int x = n + 16 - w;
      int y = 16 - n;

      d[x + y * (16 + 1)] = A(d[(x - 1) + (y - 1) * (16 + 1)] + e[(x - 1) + (y - 1) * 16], d[(x - 1) + (y) * (16 + 1)] - (g), d[(x) + (y - 1) * (16 + 1)] - (g));
    }

    barrier(1);
  }

  for (int v = 0; v < 16; v++)
    b[r + f * v] = d[(n + 1) + (v + 1) * (16 + 1)];

  return;
}

__kernel void C(__global int* a, __global int* b, __global int* c, __local int* d, __local int* e, int f, int g, int h, int i, int j, int k, int l) {
  int m = get_group_id(0);

  int n = get_local_id(0);

  int o = k * f + l;

  int p = m + i - h;
  int q = i - m - 1;

  int r = o + f * 16 * q + 16 * p + n + (f + 1);
  int s = o + f * 16 * q + 16 * p + n + (1);
  int t = o + f * 16 * q + 16 * p + (f);
  int u = o + f * 16 * q + 16 * p;

  if (n == 0)
    d[0 + n * (16 + 1)] = b[u];

  for (int v = 0; v < 16; v++)
    e[n + v * 16] = a[r + f * v];

  barrier(1);

  d[0 + (n + 1) * (16 + 1)] = b[t + f * n];

  barrier(1);

  d[(n + 1) + 0 * (16 + 1)] = b[s];

  barrier(1);

  for (int w = 0; w < 16; w++) {
    if (n <= w) {
      int x = n + 1;
      int y = w - n + 1;

      d[x + y * (16 + 1)] = A(d[(x - 1) + (y - 1) * (16 + 1)] + e[(x - 1) + (y - 1) * 16], d[(x - 1) + (y) * (16 + 1)] - (g), d[(x) + (y - 1) * (16 + 1)] - (g));
    }
    barrier(1);
  }

  for (int w = 16 - 2; w >= 0; w--) {
    if (n <= w) {
      int x = n + 16 - w;
      int y = 16 - n;

      d[x + y * (16 + 1)] = A(d[(x - 1) + (y - 1) * (16 + 1)] + e[(x - 1) + (y - 1) * 16], d[(x - 1) + (y) * (16 + 1)] - (g), d[(x) + (y - 1) * (16 + 1)] - (g));
    }

    barrier(1);
  }

  for (int v = 0; v < 16; v++)
    b[r + v * f] = d[(n + 1) + (v + 1) * (16 + 1)];

  return;
}