__kernel void A(__global float* a, __constant float* b, __global float* c, const int d) {
  int e = get_global_id(0);
  int f = get_global_size(0);

  float g = 0.f;

  const int h = ((e + d / 2) >= f) ? e + d / 2 + 1 - f : 0;
  const int i = ((e - d / 2) < 0) ? e + d / 2 + 1 : d;
  const int j = e + d / 2;

  for (int k = h; k < i; ++k)
    g += b[k] * a[j - k];

  c[e] = g;
}

__kernel void B(__global float* a, __constant float* b, __global float* c, const int d, const int e) {
  int f = get_global_id(0);
  int g = get_global_id(1);

  int h = get_global_size(0);
  int i = get_global_size(1);

  float j = 0.f;

  const int k = ((f + e / 2) >= h) ? f + e / 2 + 1 - h : 0;
  const int l = ((f - e / 2) < 0) ? f + e / 2 + 1 : e;
  const int m = f + e / 2;

  const int n = ((g + d / 2) >= i) ? g + d / 2 + 1 - i : 0;
  const int o = ((g - d / 2) < 0) ? g + d / 2 + 1 : d;
  const int p = g + d / 2;

  for (int q = k; q < l; ++q)
    for (int r = n; r < o; ++r)
      j += b[q + r * e] * a[m - q + (p - r) * h];

  c[f + g * h] = j;
}

__kernel void C(__global float* a, __constant float* b, __global float* c, const int d, const int e, const int f) {
  int g = get_global_id(0);
  int h = get_global_id(1);
  int i = get_global_id(2);

  int j = get_global_size(0);
  int k = get_global_size(1);
  int l = get_global_size(2);

  float m = 0.f;
  const int n = ((g + f / 2) >= j) ? g + f / 2 + 1 - j : 0;
  const int o = ((g - f / 2) < 0) ? g + f / 2 + 1 : f;
  const int p = g + f / 2;

  const int q = ((h + e / 2) >= k) ? h + e / 2 + 1 - k : 0;
  const int r = ((h - e / 2) < 0) ? h + e / 2 + 1 : e;
  const int s = h + e / 2;

  const int t = ((i + d / 2) >= l) ? i + d / 2 + 1 - l : 0;
  const int u = ((i - d / 2) < 0) ? i + d / 2 + 1 : d;
  const int v = i + d / 2;

  for (int w = n; w < o; ++w)
    for (int x = q; x < r; ++x)
      for (int y = t; y < u; ++y)
        m += b[w + x * f + y * f * e] * a[p - w + (s - x) * j + (v - y) * j * k];

  c[g + h * j + i * j * k] = m;
}