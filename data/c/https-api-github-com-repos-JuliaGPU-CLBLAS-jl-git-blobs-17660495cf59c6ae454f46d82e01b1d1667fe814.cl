__kernel void A(int a, int b, __global float* c, __global float* d, __global float* e, __local float* f, __local float* g) {
  int h = get_group_id(0);
  int i = get_group_id(1);

  int j = get_local_id(0);
  int k = get_local_id(1);

  int l = a * 16 * i;

  int m = l + a - 1;

  int n = 16;

  int o = 16 * h;

  int p = 16 * b;

  float q = 0.0f;

  for (int r = l, s = o; r <= m; r += n, s += p) {
    f[j + k * 16] = d[r + a * k + j];
    g[j + k * 16] = e[s + b * k + j];

    barrier(1);

    for (int t = 0; t < 16; ++t)
      q += f[t + k * 16] * g[j + t * 16];

    barrier(1);
  }

  int u = b * 16 * i + 16 * h;
  c[u + b * k + j] = q;
}