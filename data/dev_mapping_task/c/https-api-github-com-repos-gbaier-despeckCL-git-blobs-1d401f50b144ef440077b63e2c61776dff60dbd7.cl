__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d, const int e, const int f, const int g, const int h) {
  const int i = (f / g) * (g - 2 * h);
  const int j = (e / g) * (g - 2 * h);

  const int k = get_global_id(0);
  const int l = get_global_id(1);

  const int m = k / g;
  const int n = l / g;

  const int o = k % g;
  const int p = l % g;

  const int q = min(i - 1, max(0, m * (g - 2 * h) + (o - h)));
  const int r = min(j - 1, max(0, n * (g - 2 * h) + (p - h)));

  c[l * f + k] = a[r * i + q];
  d[l * f + k] = b[r * i + q];
}