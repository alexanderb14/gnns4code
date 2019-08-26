__kernel void A(__global const char* a, __global const char* b, __global const int* c, int d, int e, int f, __local int* g, __global const int* h, __global const int* i, __global int* j) {
  int k;

  int l[20];
  for (k = 0; k < 20; k++) {
    l[k] = 0;
  }

  int m = get_local_id(0);

  if (m < f) {
    g[m] = 0;
  }

  barrier(1 | 2);

  int n = get_global_id(0);
  int o = 0;
  if (n != 0) {
    o = n * e;
  }

  k = 0;
  while (k <= e) {
    int p;
    int q = d;
    int r = 0;
    for (p = 0; p < f; p++) {
      int s = h[p];
      while (s >= 0 && b[s + r] == a[o + s + k]) {
        s--;
      }
      if (s < 0) {
        l[p]++;
      }
      int t = c[(int)a[o + k + s]];
      if (t >= 1 && q > t) {
        q = t;
      }
      r = r + i[p];
    }
    k += q;
  }

  for (k = 0; k < f; k++) {
    atomic_add(&g[k], l[k]);
  }

  barrier(1 | 2);

  if (m == 0) {
    size_t u = get_group_id(0);
    for (k = 0; k < f; k++) {
      j[k + u * f] = g[k];
    }
  }
}