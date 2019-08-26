__kernel void A(__global float* a, __local float* b, int c, int d, int e) {
  int f = get_local_id(0);
  int g = get_local_id(1);

  int h = get_global_id(0);
  int i = get_global_id(1);

  b[((f) * (d) + (g))] = a[((h) * (c) + (i))];
  barrier(1);

  int j;
  float k, l, m, n, o;
  for (j = 0; j < e; j++) {
    if (h > 0 && h < c - 1 && i > 0 && i < c - 1) {
      if (d > 1) {
        if (f == 0) {
          k = a[((h - 1) * (c) + (i))];
          l = b[((f + 1) * (d) + (g))];
        } else if (f == d - 1) {
          l = a[((h + 1) * (c) + (i))];
          k = b[((f - 1) * (d) + (g))];
        } else {
          k = b[((f - 1) * (d) + (g))];
          l = b[((f + 1) * (d) + (g))];
        }

        if (g == 0) {
          m = a[((h) * (c) + (i - 1))];
          n = b[((f) * (d) + (g + 1))];
        } else if (g == d - 1) {
          n = a[((h) * (c) + (i + 1))];
          m = b[((f) * (d) + (g - 1))];
        } else {
          n = b[((f) * (d) + (g + 1))];
          m = b[((f) * (d) + (g - 1))];
        }

      } else {
        k = a[((h - 1) * (c) + (i))];
        l = a[((h + 1) * (c) + (i))];
        m = a[((h) * (c) + (i - 1))];
        n = a[((h) * (c) + (i + 1))];
      }
      o = (k + l + m + n) * 0.25;
      b[((f) * (d) + (g))] = o;
      a[((h) * (c) + (i))] = o;
    }
    barrier(2);
  }
}