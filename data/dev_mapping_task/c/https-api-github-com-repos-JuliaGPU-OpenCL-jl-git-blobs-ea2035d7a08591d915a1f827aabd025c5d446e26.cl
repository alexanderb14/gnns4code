__kernel void A(int a, int b, int c, __global float* d, __global float* e, __global float* f, __local float* g, __local float* h) {
  int i = get_group_id(0);
  int j = get_group_id(1);

  int k = get_local_id(0);
  int l = get_local_id(1);

  int m = a * 16 * j;

  int n = m + a - 1;

  int o = 16;

  int p = 16 * i;

  int q = 16 * b;

  float r = 0.0f;

  for (int s = m, t = p; s <= n; s += o, t += q) {
    g[k + l * 16] = d[s + a * l + k];
    h[k + l * 16] = e[t + b * l + k];

    barrier(1);

    for (int u = 0; u < 16; ++u)
      r += g[u + l * 16] * h[k + u * 16];

    barrier(1);
  }

  f[get_global_id(1) * get_global_size(0) + get_global_id(0)] = r;
}