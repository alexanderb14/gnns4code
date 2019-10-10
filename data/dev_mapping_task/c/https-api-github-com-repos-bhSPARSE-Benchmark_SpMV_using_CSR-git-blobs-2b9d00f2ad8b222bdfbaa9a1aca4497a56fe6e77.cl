typedef float vT; __kernel void A(const int a, __global const int* b, __global const int* c, __global const vT* d, __global const vT* e, __global vT* f, volatile __local vT* g, volatile __local int* h, const unsigned int i, const unsigned int j) {
  const int k = get_local_id(0);

  const int l = k % j;
  const int m = get_global_id(0) / j;
  const int n = k / j;
  const int o = i * get_num_groups(0);

  for (int p = m; p < a; p += o) {
    if (l < 2)
      h[n * 2 + l] = b[p + l];

    const int q = h[n * 2 + 0];
    const int r = h[n * 2 + 1];

    vT s = 0;

    if (j == 64 && r - q > 64) {
      int t = q - (q & (j - 1)) + l;

      if (t >= q && t < r)
        s += d[t] * e[c[t]];

      for (t += j; t < r; t += j)
        s += d[t] * e[c[t]];
    } else {
      for (int t = q + l; t < r; t += j)
        s += d[t] * e[c[t]];
    }

    g[k] = s;

    if (j > 32)
      g[k] = s = s + g[k + 32];
    if (j > 16)
      g[k] = s = s + g[k + 16];
    if (j > 8)
      g[k] = s = s + g[k + 8];
    if (j > 4)
      g[k] = s = s + g[k + 4];
    if (j > 2)
      g[k] = s = s + g[k + 2];
    if (j > 1)
      g[k] = s = s + g[k + 1];

    if (l == 0)
      f[p] = g[k];
  }
}