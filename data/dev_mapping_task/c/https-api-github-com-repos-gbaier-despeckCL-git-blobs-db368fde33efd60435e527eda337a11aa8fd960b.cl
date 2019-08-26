__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d, const int e, const int f, const int g, const int h, const int i, const int j) {
  const int k = f / g * (g - 2 * h);
  const int l = e / g * (g - 2 * h);

  const int m = get_global_id(0);
  const int n = get_global_id(1);

  const int o = 2 * (m / g) + i / g;
  const int p = 2 * (n / g) + j / g;

  const int q = m % g;
  const int r = n % g;

  const int s = o * g + q;
  const int t = p * g + r;

  const int u = o * (g - 2 * h) + (q - h);
  const int v = p * (g - 2 * h) + (r - h);

  float w = 1.0f;
  if (q < 2 * h || q >= g - 2 * h) {
    w *= 0.5f;
  }
  if (r < 2 * h || r >= g - 2 * h) {
    w *= 0.5f;
  }
  if (u < h || u >= k - h) {
    w *= 2.0f;
  }
  if (v < h || v >= l - h) {
    w *= 2.0f;
  }

  const float x = w * a[t * f + s];
  const float y = w * b[t * f + s];

  if (u >= 0 && u < k && v >= 0 && v < l) {
    c[v * k + u] += x;
    d[v * k + u] += y;
  }
}