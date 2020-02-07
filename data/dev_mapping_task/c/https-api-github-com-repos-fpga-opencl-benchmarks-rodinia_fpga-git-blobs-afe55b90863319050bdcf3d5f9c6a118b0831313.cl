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

__kernel void B(int a, __global int* b, __global int* c, __attribute__((local_mem_size(sizeof(int) * 16 * 16 * 2))) __local int* d, __attribute__((local_mem_size(sizeof(int) * 16 * 16))) __local int* e, int f, int g, int h, int i) {
  int j = get_group_id(0);

  int k = get_local_id(0);

  int l = h * f + i;

  int m = j;
  int n = a - 1 - j;

  int o = l + f * 16 * n + 16 * m + k + (f + 1);
  int p = l + f * 16 * n + 16 * m + k + (1);
  int q = l + f * 16 * n + 16 * m + (f);
  int r = l + f * 16 * n + 16 * m;

  if (k == 0) {
    d[0 + k * (16 + 1)] = c[r + k];
  }

  barrier(1);

  for (int s = 0; s < 16; s++) {
    e[k + s * 16] = b[o + f * s];
  }

  barrier(1);

  d[0 + (k + 1) * (16 + 1)] = c[q + f * k];

  barrier(1);

  d[(k + 1) + 0 * (16 + 1)] = c[p];

  barrier(1);

  for (int t = 0; t < 16; t++) {
    if (k <= t) {
      int u = k + 1;
      int v = t - k + 1;

      d[u + v * (16 + 1)] = A(d[(u - 1) + (v - 1) * (16 + 1)] + e[(u - 1) + (v - 1) * 16], d[(u - 1) + (v) * (16 + 1)] - (g), d[(u) + (v - 1) * (16 + 1)] - (g));
    }
    barrier(1);
  }

  barrier(1);

  for (int t = 16 - 2; t >= 0; t--) {
    if (k <= t) {
      int u = k + 16 - t;
      int v = 16 - k;

      d[u + v * (16 + 1)] = A(d[(u - 1) + (v - 1) * (16 + 1)] + e[(u - 1) + (v - 1) * 16], d[(u - 1) + (v) * (16 + 1)] - (g), d[(u) + (v - 1) * (16 + 1)] - (g));
    }

    barrier(1);
  }

  for (int s = 0; s < 16; s++) {
    c[o + f * s] = d[(k + 1) + (s + 1) * (16 + 1)];
  }

  return;
}

__kernel void C(__global int* a, __global int* b, __attribute__((local_mem_size(sizeof(int) * 16 * 16 * 2))) __local int* c, __attribute__((local_mem_size(sizeof(int) * 16 * 16))) __local int* d, int e, int f, int g, int h, int i, int j) {
  int k = get_group_id(0);

  int l = get_local_id(0);

  int m = i * e + j;

  int n = k + h - g;
  int o = h - k - 1;

  int p = m + e * 16 * o + 16 * n + l + (e + 1);
  int q = m + e * 16 * o + 16 * n + l + (1);
  int r = m + e * 16 * o + 16 * n + (e);
  int s = m + e * 16 * o + 16 * n;

  if (l == 0) {
    c[0 + l * (16 + 1)] = b[s];
  }

  for (int t = 0; t < 16; t++) {
    d[l + t * 16] = a[p + e * t];
  }

  barrier(1);

  c[0 + (l + 1) * (16 + 1)] = b[r + e * l];

  barrier(1);

  c[(l + 1) + 0 * (16 + 1)] = b[q];

  barrier(1);

  for (int u = 0; u < 16; u++) {
    if (l <= u) {
      int v = l + 1;
      int w = u - l + 1;

      c[v + w * (16 + 1)] = A(c[(v - 1) + (w - 1) * (16 + 1)] + d[(v - 1) + (w - 1) * 16], c[(v - 1) + (w) * (16 + 1)] - (f), c[(v) + (w - 1) * (16 + 1)] - (f));
    }
    barrier(1);
  }

  for (int u = 16 - 2; u >= 0; u--) {
    if (l <= u) {
      int v = l + 16 - u;
      int w = 16 - l;

      c[v + w * (16 + 1)] = A(c[(v - 1) + (w - 1) * (16 + 1)] + d[(v - 1) + (w - 1) * 16], c[(v - 1) + (w) * (16 + 1)] - (f), c[(v) + (w - 1) * (16 + 1)] - (f));
    }

    barrier(1);
  }

  for (int t = 0; t < 16; t++) {
    b[p + t * e] = c[(l + 1) + (t + 1) * (16 + 1)];
  }

  return;
}