__kernel void A(__global const char* a, __global const char* b, int c, __local char* d, __global const int* e, __local int* f, int g, int h, int i, __local int* j, __global const int* k, __global const int* l, __global int* m) {
  int n;
  int o[20];
  for (n = 0; n < 20; n++) {
    o[n] = 0;
  }
  int p = get_local_id(0);
  if (p < i) {
    j[p] = 0;
  }
  if (p < 128) {
    f[p] = e[p];
  }
  if (p < c) {
    d[p] = b[p];
  }

  barrier(1 | 2);

  int q = get_global_id(0);
  int r = 0;
  if (q != 0) {
    r = q * h;
  }

  n = 0;
  while (n <= h) {
    int s;
    int t = g;
    int u = 0;
    for (s = 0; s < i; s++) {
      int v = k[s];
      while (v >= 0 && d[v + u] == a[r + v + n]) {
        v--;
      }
      if (v < 0) {
        o[s]++;
      }
      int w = f[a[r + n + v]];
      if (w >= 1 && t > w) {
        t = w;
      }
      u = u + l[s];
    }
    n += t;
  }

  for (n = 0; n < i; n++) {
    atomic_add(&j[n], o[n]);
  }

  barrier(1 | 2);

  if (p == 0) {
    size_t x = get_group_id(0);
    for (n = 0; n < i; n++) {
      atomic_add(&m[n + x * i], j[n]);
    }
  }
}