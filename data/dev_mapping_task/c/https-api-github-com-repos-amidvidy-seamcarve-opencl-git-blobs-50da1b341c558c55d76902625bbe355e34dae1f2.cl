__kernel void A(__global float* a, int b, int c, int d, int e) {
  const int f = b - e;
  const int g = get_local_id(0);
  const int h = get_local_size(0);
  const int i = f / get_local_size(0);
  const int j = g * i;
  const int k = (g == h - 1) ? f : j + i;

  for (int l = 1; l < c; ++l) {
    for (int m = j; m < k; ++m) {
      const float n = fmin((a)[((l - 1) * d + (max(m - 1, 0)))], fmin((a)[((l - 1) * d + (m))], (a)[((l - 1) * d + (min(m + 1, f)))]));
      (a)[((l)*d + (m))] += n;
    }
    barrier(2);
  }
}