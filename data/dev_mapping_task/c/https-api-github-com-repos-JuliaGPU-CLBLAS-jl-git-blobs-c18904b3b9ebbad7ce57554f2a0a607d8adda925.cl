__kernel void A(int a, int b, const float c, const float d, __global float* e, __global float* f, __global float* g, __local float* h, __local float* i) {
  int j = get_group_id(0);
  int k = get_group_id(1);

  int l = get_local_id(0);
  int m = get_local_id(1);

  int n = a * 32 * k;

  int o = n + a - 1;

  int p = 32;

  int q = 32 * j;

  int r = 32 * b;

  float s = 0.0f;

  for (int t = n, u = q; t <= o; t += p, u += r) {
    h[l + m * 32] = f[t + a * m + l];
    i[l + m * 32] = g[u + b * m + l];

    barrier(1);

    for (int v = 0; v < 32; ++v)
      s += c * h[v + m * 32] * i[l + v * 32];

    barrier(1);
  }

  int w = b * 32 * k + 32 * j;
  e[w + b * m + l] = s;
}