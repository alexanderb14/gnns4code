__kernel void A(__global const char* a, __global const char* b, __global const int* c, __local int* d, int e, int f, __global int* g) {
  int h = get_local_id(0);
  int i;
  int j = 0;
  if (h == 0) {
    d[0] = 0;
  }

  barrier(1 | 2);

  int k = get_global_id(0);
  int l = 0;
  if (k != 0) {
    l = (k * f) - e + 1;
  }

  i = 0;
  int m;
  while (i < f) {
    m = 0;
    while ((m < e) && (b[m] == a[l + i + m])) {
      m++;
    }
    if (m == e) {
      j++;
    }
    i += c[a[(l + i + e)]];
  }

  atomic_add(&d[0], j);

  barrier(1 | 2);

  int n = get_group_id(0);
  if (h == 0) {
    g[n] = d[0];
  }
}