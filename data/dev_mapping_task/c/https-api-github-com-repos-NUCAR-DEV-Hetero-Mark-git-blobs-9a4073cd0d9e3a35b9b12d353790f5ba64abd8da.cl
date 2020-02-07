__kernel void A(uint a, __global uint* b, __global uint* c, __global float* d, __local float* e, __global float* f, __global float* g) {
  int h = get_global_id(0);
  int i = get_local_id(0);
  int j = h / 64;
  int k = h & (64 - 1);
  int l = j;

  if (l < a) {
    g[l] = 0.0;
    int m = b[l];
    int n = b[l + 1];

    e[i] = 0;
    for (int o = m + k; o < n; o += 64)
      e[i] += d[o] * f[c[o]];

    if (k < 32)
      e[i] += e[i + 32];
    if (k < 16)
      e[i] += e[i + 16];
    if (k < 8)
      e[i] += e[i + 8];
    if (k < 4)
      e[i] += e[i + 4];
    if (k < 2)
      e[i] += e[i + 2];
    if (k < 1)
      e[i] += e[i + 1];
    if (k == 0)
      g[l] += e[i];
  }
}