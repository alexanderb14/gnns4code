__kernel void A(__global const char* a, __global const char* b, __local char* c, __global const int* d, __local int* e, __local int* f, int g, int h, __global int* i) {
  int j = get_local_id(0);
  int k;
  int l = 0;
  if (j == 0) {
    for (k = 0; k < g; k++) {
      c[k] = b[k];
    }
    f[0] = 0;
  }
  if (j < 128) {
    e[j] = d[j];
  }

  barrier(1 | 2);

  int m = get_global_id(0);
  int n = 0;
  if (m != 0) {
    n = (m * h) - g + 1;
  }

  k = 0;
  int o;
  while (k < h) {
    o = 0;
    while ((o < g) && (c[o] == a[n + k + o])) {
      o++;
    }
    if (o == g) {
      l++;
    }
    if (e[a[(n + k + g)]] > 1) {
      k += e[a[(n + k + g)]];
    } else {
      k++;
    }
  }

  atomic_add(&f[0], l);

  barrier(1 | 2);

  if (j == 0) {
    int p = get_group_id(0);
    i[p] = f[0];
  }
}