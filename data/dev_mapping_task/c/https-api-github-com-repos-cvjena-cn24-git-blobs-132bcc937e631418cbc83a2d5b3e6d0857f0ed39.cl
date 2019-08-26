__kernel void A(__global float* a, __global float* b, int c, int d, int e, int f, int g, int h, int i, int j, int k, int l, int m, int n, int o) {
  const int p = get_global_id(0);
  const int q = get_global_id(1);
  const int r = get_global_id(2);

  const int s = p % g;
  const int t = p / g;

  const int u = q % j;
  const int v = (q / j) % k;
  const int w = q / (j * k);

  const int x = t * m - o + v;
  const int y = s * l - n + u;

  if (x >= 0 && x < d && y >= 0 && y < c && w < e && r < f) {
    b[(q * f * g * h) + (r * h + t) * g + s] = a[(r * e * c * d) + (w * d + x) * c + y];
  } else {
    b[(q * f * g * h) + (r * h + t) * g + s] = 0.0;
  }
}

__kernel void B(__global float* a, __global float* b, int c, int d, int e, int f, int g, int h, int i, int j, int k, int l, int m, int n, int o) {
  const int p = get_global_id(0);
  const int q = get_global_id(1);
  const int r = get_global_id(2);

  const int s = p / c;
  const int t = p % c;

  float u = 0;
  for (int v = 0; v < k; v++) {
    const int w = (o + s - v) / m;
    if (w >= 0 && w < h && ((o + s - v) % m == 0)) {
      for (int x = 0; x < j; x++) {
        const int y = (n + t - x) / l;
        if (y >= 0 && y < g && ((n + t - x) % l == 0)) {
          const int z = (j * k) * q + (j * v) + x;

          u += b[(z * f * g * h) + (r * h + w) * g + y];
        }
      }
    }
  }

  a[(r * e * c * d) + (q * c * d) + p] = u;
}