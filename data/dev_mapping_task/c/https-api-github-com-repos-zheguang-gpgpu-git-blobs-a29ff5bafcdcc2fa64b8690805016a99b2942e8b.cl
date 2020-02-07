__kernel void A(__global float* a, __global float* b, __global float* c, __local float* d, __local float* e, int f, int g) {
  int h = get_group_id(0);
  int i = get_group_id(1);

  int j = get_local_id(0);
  int k = get_local_id(1);

  int l = f * 64 * i;

  int m = l + f - 1;

  int n = 64;

  int o = 64 * h;

  int p = 64 * g;

  float q = 0.0f;

  for (int r = l, s = o; r <= m; r += n, s += p) {
    d[j + k * 64] = b[r + f * k + j];
    e[j + k * 64] = c[s + g * k + j];

    barrier(1);

    for (int t = 0; t < 64; ++t)
      q += d[t + k * 64] * e[j + t * 64];

    barrier(1);
  }

  a[get_global_id(1) * get_global_size(0) + get_global_id(0)] = q;
}