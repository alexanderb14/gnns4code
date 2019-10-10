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

__attribute__((num_simd_work_items(4))) __attribute__((reqd_work_group_size(16, 1, 1))) __kernel void B(int a, __global int* b, __global int* c, __attribute__((local_mem_size(sizeof(int) * 16 * 16 * 2))) __local int* d, __attribute__((local_mem_size(sizeof(int) * 16 * 16))) __local int* e, int f, int g, int h, int i, int j, int k) {
  int l = get_group_id(0);

  int m = get_local_id(0);

  int n = i * f + j;

  int o = k ? l : (l + h - a);
  int p = k ? (a - 1 - l) : (h - l - 1);

  int q = n + f * 16 * p + 16 * o + m + (f + 1);
  int r = n + f * 16 * p + 16 * o + m + (1);
  int s = n + f * 16 * p + 16 * o + (f);
  int t = n + f * 16 * p + 16 * o;

  if (m == 0) {
    d[0 + m * (16 + 1)] = c[t];
  }

  for (int u = 0; u < 16; u++) {
    e[m + u * 16] = b[q + f * u];
  }

  barrier(1);

  d[0 + (m + 1) * (16 + 1)] = c[s + f * m];

  barrier(1);

  d[(m + 1) + 0 * (16 + 1)] = c[r];

  barrier(1);

  for (int v = 0; v < 16; v++) {
    if (m <= v) {
      int w = m + 1;
      int x = v - m + 1;
      d[w + x * (16 + 1)] = A(d[(w - 1) + (x - 1) * (16 + 1)] + e[(w - 1) + (x - 1) * 16], d[(w - 1) + (x) * (16 + 1)] - (g), d[(w) + (x - 1) * (16 + 1)] - (g));
    }
    barrier(1);
  }

  for (int v = 16 - 2; v >= 0; v--) {
    if (m <= v) {
      int w = m + 16 - v;
      int x = 16 - m;

      d[w + x * (16 + 1)] = A(d[(w - 1) + (x - 1) * (16 + 1)] + e[(w - 1) + (x - 1) * 16], d[(w - 1) + (x) * (16 + 1)] - (g), d[(w) + (x - 1) * (16 + 1)] - (g));
    }

    barrier(1);
  }

  for (int u = 0; u < 16; u++) {
    c[q + u * f] = d[(m + 1) + (u + 1) * (16 + 1)];
  }

  return;
}