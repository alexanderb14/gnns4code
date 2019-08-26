__kernel void A(__global float* a, __constant float* b, __global float* c, const int d) {
  int e = get_global_id(0);
  int f = get_global_id(1);

  int g = get_global_size(0);
  int h = get_global_size(1);

  float i = 0.f;

  const int j = ((e + d / 2) >= g) ? e + d / 2 + 1 - g : 0;
  const int k = ((e - d / 2) < 0) ? e + d / 2 + 1 : d;
  const int l = e + d / 2;

  for (int m = j; m < k; ++m)
    i += b[m] * a[l - m + f * g];

  c[e + f * g] = i;
}

__kernel void B(__global float* a, __constant float* b, __global float* c, const int d) {
  int e = get_global_id(0);
  int f = get_global_id(1);

  int g = get_global_size(0);
  int h = get_global_size(1);

  float i = 0.f;

  const int j = ((f + d / 2) >= h) ? f + d / 2 + 1 - h : 0;
  const int k = ((f - d / 2) < 0) ? f + d / 2 + 1 : d;
  const int l = f + d / 2;

  for (int m = j; m < k; ++m)
    i += b[m] * a[(l - m) * g + e];

  c[e + f * g] = i;
}

__kernel void C(__global float* a, __constant float* b, __global float* c, const int d) {
  int e = get_global_id(0);
  int f = get_global_id(1);
  int g = get_global_id(2);

  int h = get_global_size(0);
  int i = get_global_size(1);
  int j = get_global_size(2);

  float k = 0.f;

  const int l = ((e + d / 2) >= h) ? e + d / 2 + 1 - h : 0;
  const int m = ((e - d / 2) < 0) ? e + d / 2 + 1 : d;
  const int n = e + d / 2;

  for (int o = l; o < m; ++o)
    k += b[o] * a[n - o + f * h + g * h * i];

  c[e + f * h + g * h * i] = k;
}

__kernel void D(__global float* a, __constant float* b, __global float* c, const int d) {
  int e = get_global_id(0);
  int f = get_global_id(1);
  int g = get_global_id(2);

  int h = get_global_size(0);
  int i = get_global_size(1);
  int j = get_global_size(2);

  float k = 0.f;

  const int l = ((f + d / 2) >= i) ? f + d / 2 + 1 - i : 0;
  const int m = ((f - d / 2) < 0) ? f + d / 2 + 1 : d;
  const int n = f + d / 2;

  for (int o = l; o < m; ++o)
    k += b[o] * a[e + (n - o) * h + g * h * i];

  c[e + f * h + g * h * i] = k;
}

__kernel void E(__global float* a, __constant float* b, __global float* c, const int d) {
  int e = get_global_id(0);
  int f = get_global_id(1);
  int g = get_global_id(2);

  int h = get_global_size(0);
  int i = get_global_size(1);
  int j = get_global_size(2);

  float k = 0.f;

  const int l = ((g + d / 2) >= j) ? g + d / 2 + 1 - j : 0;
  const int m = ((g - d / 2) < 0) ? g + d / 2 + 1 : d;
  const int n = g + d / 2;

  for (int o = l; o < m; ++o)
    k += b[o] * a[e + f * h + (n - o) * h * i];

  c[e + f * h + g * h * i] = k;
}