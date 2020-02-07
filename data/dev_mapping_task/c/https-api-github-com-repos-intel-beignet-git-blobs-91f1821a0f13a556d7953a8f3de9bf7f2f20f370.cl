__kernel void A(__global int2* a, __global int* b, __global uint2* c, int d) {
  int e, f, g;
  uint2 h;
  unsigned int i, j, k, l;
  int2 m;
  int n = get_global_id(0);
  f = b[n];
  int o = 0;
  m = a[f];
  for (e = 0; e < d; e++, o += 8) {
    if (o + 0 >= m.x) {
      f++;
      m = a[f];
    }
    i = m.y;
    if (o + 1 >= m.x) {
      f++;
      m = a[f];
    }
    j = m.y;
    if (o + 2 >= m.x) {
      f++;
      m = a[f];
    }
    k = m.y;
    if (o + 3 >= m.x) {
      f++;
      m = a[f];
    }
    l = m.y;
    h.x = (l << 24) | (k << 16) | (j << 8) | (i);
    if (o + 4 >= m.x) {
      f++;
      m = a[f];
    }
    i = m.y;
    if (o + 5 >= m.x) {
      f++;
      m = a[f];
    }
    j = m.y;
    if (o + 6 >= m.x) {
      f++;
      m = a[f];
    }
    k = m.y;
    if (o + 7 >= m.x) {
      f++;
      m = a[f];
    }
    l = m.y;
    h.y = (l << 24) | (k << 16) | (j << 8) | (i);

    c[n * d + e] = h;
  }
}