__kernel void A(__global const char* a, __global const char* b, __global const int* c, int d, int e, int f, __local int* g, __global const int* h, __global int* i) {
  int j;

  int k[20];
  for (j = 0; j < 20; j++) {
    k[j] = 0;
  }

  int l = get_local_id(0);

  if (l < f) {
    g[l] = 0;
  }

  barrier(1 | 2);

  int m = get_global_id(0);
  int n = 0;
  if (m != 0) {
    n = m * e;
  }

  j = 0;
  while (j <= e) {
    int o;
    int p = d;
    int q = 0;
    for (o = 0; o < f; o++) {
      int r = 0;
      int s = h[o];
      while (r < s && b[r + q] == a[n + r + j]) {
        r++;
      }
      if (r == s) {
        k[o]++;
      }
      int t = c[a[n + j + s]];
      if (t >= 1 && p > t) {
        p = t;
      }
      q = q + s;
    }
    j += p;
  }

  for (j = 0; j < f; j++) {
    atomic_add(&g[j], k[j]);
  }

  barrier(1 | 2);

  if (l == 0) {
    size_t u = get_group_id(0);
    for (j = 0; j < f; j++) {
      i[j + u * f] = g[j];
    }
  }
}