inline void A(__local int* a, __local int* b, int c) {
  int d = get_local_id(0);
  int e = (d * 2) + 1;

  int f = 1 + (int)log2((float)c);
  for (int g = 0; g < f; g++) {
    barrier(1);
    int h = (0x1 << g) - 1;
    if ((d & h) == h) {
      int i = (0x1 << g);
      int j = e - i;
      if (!b[e]) {
        a[e] += a[j];
      }
      b[e] = b[e] | b[j];
    }
  }
}

inline void B(__local int* a, __local int* b, __local int* c, int d) {
  int e = get_local_id(0);
  int f = (e * 2) + 1;

  int g = (int)log2((float)d);
  for (int h = g; h > -1; h--) {
    barrier(1);
    int i = (0x1 << h) - 1;
    if ((e & i) == i) {
      int j = (0x1 << h);
      int k = f - j;
      int l = a[k];
      a[k] = a[f];
      if (c[k + 1]) {
        a[f] = 0;
      } else if (b[k]) {
        a[f] = l;
      } else {
        a[f] += l;
      }
      b[k] = 0;
    }
  }
}

inline void C(__local int* a, __local int* b, __local int* c, int d) {
  int e = get_local_id(0);
  int f = (e * 2) + 1;
  A(a, b, d);
  if (f == (d - 1)) {
    a[f] = 0;
  }
  B(a, b, c, d);
}
__kernel void D(__global int* a, __global int* b, __global int* c, __local int* d, __local int* e, __local int* f, int g) {
  int h = get_global_id(0);
  int i = (h * 2);
  int j = (h * 2) + 1;

  d[i] = a[i];
  d[j] = a[j];
  e[i] = b[i];
  e[j] = b[j];
  f[i] = c[i];
  f[j] = c[j];

  C(d, e, f, g);

  a[i] = d[i];
  a[j] = d[j];
}
__kernel void E(__global int* a, __global int* b, __global int* c, __local int* d, __local int* e, __local int* f, int g) {
  int h = get_global_id(0);
  int i = (h * 2);
  int j = (h * 2) + 1;
  int k = 2 * get_local_size(0);

  d[i] = i < g ? a[i] : 0;
  d[j] = j < g ? a[j] : 0;
  e[i] = i < g ? b[i] : 0;
  e[j] = j < g ? b[j] : 0;
  f[i] = i < g ? c[i] : 0;
  f[j] = j < g ? c[j] : 0;

  C(d, e, f, k);

  if (i < g)
    a[i] = d[i];
  if (j < g)
    a[j] = d[j];
}
__kernel void F(__global int* a, __global int* b, __global int* c, __global int* d, __global int* e, __global int* f, __local int* g, __local int* h, __local int* i, int j) {
  int k = get_local_size(0);

  int l = get_global_id(0);
  int m = (2 * l);
  int n = (2 * l) + 1;

  int o = get_local_id(0);
  int p = (2 * o);
  int q = (2 * o) + 1;
  int r = get_group_id(0);

  int s = k * 2;
  int t = get_num_groups(0);

  g[p] = (m < j) ? a[m] : 0;
  g[q] = (n < j) ? a[n] : 0;
  h[p] = (m < j) ? b[m] : 0;
  h[q] = (n < j) ? b[n] : 0;
  i[p] = (m < j) ? c[m] : 0;
  i[q] = (n < j) ? c[n] : 0;

  A(g, h, s);

  if (o == (k - 1)) {
    d[r] = g[q];
    e[r] = h[q];
  }

  if (o == 0) {
    f[r] = i[p];
  }

  a[m] = g[p];
  a[n] = g[q];
  b[m] = h[p];
  b[n] = h[q];
}
__kernel void G(__global int* a, __global int* b, __global int* c, __global int* d, __global int* e, __global int* f, __local int* g, __local int* h, __local int* i, int j) {
  int k = get_local_size(0);

  int l = get_global_id(0);
  int m = (2 * l);
  int n = (2 * l) + 1;

  int o = get_local_id(0);
  int p = (2 * o);
  int q = (2 * o) + 1;
  int r = get_group_id(0);

  int s = k * 2;
  int t = get_num_groups(0);

  g[p] = a[m];
  g[q] = a[n];
  h[p] = b[m];
  h[q] = b[n];
  i[p] = c[m];
  i[q] = c[n];

  if (o == (k - 1)) {
    g[q] = d[r];
    h[q] = e[r];
  }

  B(g, h, i, s);

  if (m < j)
    a[m] = g[p];
  if (n < j)
    a[n] = g[q];
}