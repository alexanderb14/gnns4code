typedef double vT; __kernel void A(__global const int* a, __global int* b, __global vT* c, __global const int* d, __global const int* e, __global const vT* f, __global const int* g, const int h, const int i) {
  int j = get_global_id(0);

  bool k = (j < h);

  int l = k ? g[6 * (i + j)] : 0;

  int m = k ? g[6 * (i + j) + 1] : 0;
  int n = k ? a[l] : 0;

  int o = k ? e[m] : 0;
  vT p = k ? f[m] : 0.0f;

  if (k) {
    b[n] = o;
    c[n] = p;
  }
}

__kernel void B(__global const int* a, __global int* b, __global vT* c, __global const int* d, __global const int* e, __global const vT* f, __global const int* g, const int h) {
  int i = get_local_id(0);
  int j = get_group_id(0);

  int k = g[6 * (h + j)];

  int l = g[6 * (h + j) + 1] + i;
  int m = a[k] + i;
  int n = a[k + 1];

  if (m < n) {
    b[m] = e[l];
    c[m] = f[l];
  }
}

__kernel void C(__global const int* a, __global int* b, __global vT* c, __global const int* d, __global const int* e, __global const vT* f, __global const int* g, const int h) {
  int i = get_local_id(0);
  int j = get_group_id(0);
  int k = get_local_size(0);

  int l = g[6 * (h + j)];

  int m = g[6 * (h + j) + 1];
  int n = a[l];
  int o = a[l + 1];
  int p = o - n;

  bool q;

  int r = __clc_ceil((float)p / (float)k);

  n += i;
  m += i;

  for (int s = 0; s < r; s++) {
    q = (n < o);

    if (q) {
      b[n] = e[m];
      c[n] = f[m];
    }

    n += k;
    m += k;
  }
}