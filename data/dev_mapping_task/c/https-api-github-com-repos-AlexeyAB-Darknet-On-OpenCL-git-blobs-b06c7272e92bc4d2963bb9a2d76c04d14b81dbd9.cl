__kernel void A(__global float* a, int b, __global float* c) {
  int d = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (d >= b)
    return;
  c[d] = (a[d] >= 0) ? 1 : -1;
}

__kernel void B(__global float* a, int b, int c, __global float* d) {
  int e = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (e >= c)
    return;
  int f = 0;
  float g = 0;
  for (f = 0; f < b; ++f) {
    g += __clc_fabs(a[f * c + e]);
  }
  g = g / b;
  for (f = 0; f < b; ++f) {
    d[f * c + e] = (a[f * c + e] > 0) ? g : -g;
  }
}

__kernel void C(__global float* a, int b, int c, __global float* d) {
  int e = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (e >= b)
    return;
  int f = 0;
  float g = 0;
  for (f = 0; f < c; ++f) {
    g += __clc_fabs(a[e * c + f]);
  }
  g = g / c;
  for (f = 0; f < c; ++f) {
    d[e * c + f] = (a[e * c + f] > 0) ? g : -g;
  }
}

__kernel void D(__global float* a, int b, int c, int d, int e, int f, float g, __global float* h) {
  int i = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (i >= b)
    return;

  int j = i % c;
  i /= c;
  int k = i % d;
  i /= d;
  int l = i % e;
  i /= e;
  int m = i;

  int n = -(f / 2.f);
  int o = -(f / 2.f);

  int p = j + c * (k + d * (l + e * m));
  int q, r;
  for (q = 0; q < f; ++q) {
    for (r = 0; r < f; ++r) {
      int s = o + k + q;
      int t = n + j + r;
      int u = t + c * (s + d * (l + m * e));
      int v = (s >= 0 && s < d && t >= 0 && t < c);
      h[p] += v ? g * (a[u] - a[p]) : 0;
    }
  }
}