__kernel void A(__global float* a, __global float* b, __global float* c, __local float* d, __local float* e, int f, int g, int h) {
  int i = get_group_id(0);
  int j = get_group_id(1);

  int k = get_local_id(0);
  int l = get_local_id(1);

  int m = f * 64 * j;

  int n = m + f - 1;

  int o = 64;

  int p = 64 * i;

  int q = 64 * g;

  float r = 0.0f;

  for (int s = m, t = p; s <= n; s += o, t += q) {
    d[k + l * 64] = b[s + f * l + k];
    e[k + l * 64] = c[t + g * l + k];

    barrier(1);

    for (int u = 0; u < 64; ++u)
      r += d[u + l * 64] * e[k + u * 64];

    barrier(1);
  }

  if (get_global_id(1) < h)

    a[get_global_id(1) * get_global_size(0) + get_global_id(0)] = r;
}