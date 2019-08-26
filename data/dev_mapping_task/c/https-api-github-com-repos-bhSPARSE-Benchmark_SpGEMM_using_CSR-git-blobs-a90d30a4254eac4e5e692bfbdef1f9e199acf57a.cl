typedef double vT; __kernel void A(__global const int* a, __global int* b, const int c, const int d) {
  int e = get_global_id(0);

  if (e < c) {
    int f = a[6 * (d + e)];
    b[f] = 0;
  }
}

__kernel void B(__global const int* a, __global const int* b, __global const int* c, __global const vT* d, __global const int* e, __global const int* f, __global const vT* g, __global int* h, __global const int* i, __global int* j, __global vT* k, const int l, const int m) {
  int n = get_global_id(0);

  if (n < l) {
    int o = a[6 * (m + n)];
    h[o] = 1;

    int p = a[6 * (m + n) + 1];

    int q = b[o];
    int r = b[o + 1];

    for (int s = q; s < r; s++) {
      int t = c[s];
      int u = e[t];

      if (u == e[t + 1])
        continue;

      vT v = d[s];

      j[p] = f[u];
      k[p] = g[u] * v;

      break;
    }
  }
}