__kernel void A(const unsigned int a, __global const float* restrict b, __global const float* restrict c, __global float* restrict d, __local float* restrict e, __local float* restrict f) {
  int g, h;
  float i = 0.0f;

  const int j = get_global_id(0);
  const int k = get_global_id(1);

  const int l = get_group_id(0);
  const int m = get_group_id(1);

  const int n = get_local_id(0);
  const int o = get_local_id(1);

  const int p = a / 16;

  int q = l * a * 16;
  const int r = 16;

  int s = m * 16;
  const int t = 16 * a;

  for (h = 0; h < p; h++) {
    e[o * 16 + n] = b[q + o * a + n];
    f[o * 16 + n] = c[s + o * a + n];

    barrier(1);

    for (g = 0; g < 16; g++)
      i += e[o * 16 + g] * f[g * 16 + n];

    barrier(1);
    q += r;
    s += t;
  }

  d[k * a + j] = i;
}