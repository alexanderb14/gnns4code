__kernel void A(__global const char* a, __global const char* b, int c, __local char* d, __global const int* e, __local int* f, int g, int h, int i, __local int* j, __global const int* k, __global int* l) {
  int m;
  int n[20];
  for (m = 0; m < 20; m++) {
    n[m] = 0;
  }

  int o = get_local_id(0);
  if (o < i) {
    j[o] = 0;
  }
  if (o < 128) {
    f[o] = e[o];
  }
  if (o < c) {
    d[o] = b[o];
  }

  barrier(1 | 2);

  int p = get_global_id(0);
  int q = 0;
  if (p != 0) {
    q = p * h;
  }

  m = 0;
  while (m <= h) {
    int r;
    int s = g;
    int t = 0;
    for (r = 0; r < i; r++) {
      int u = 0;
      int v = k[r];
      while (u < v && d[u + t] == a[q + u + m]) {
        u++;
      }
      if (u == v) {
        n[r]++;
      }
      int w = f[a[q + m + v]];
      if (w >= 1 && s > w) {
        s = w;
      }
      t = t + v;
    }
    m += s;
  }

  for (m = 0; m < i; m++) {
    atomic_add(&j[m], n[m]);
  }

  barrier(1 | 2);

  if (o == 0) {
    size_t x = get_group_id(0);
    for (m = 0; m < i; m++) {
      l[m + x * i] = j[m];
    }
  }
}