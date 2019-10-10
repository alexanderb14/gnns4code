__kernel void A(__global unsigned char* a, unsigned int b, unsigned int c, __global unsigned char* d, unsigned int e) {
  int f = get_global_id(0);
  int g;
  int h;
  int i = get_global_size(0);
  int j = b / c;

  int k = c / i;
  int l = k * i;

  __local int m[1];
  __local int n[2];

  int o;
  int p;

  if (k >= 1) {
    for (p = 0; p < k; p++) {
      g = (f * k) + p;
      h = g * j;
      o = *((int*)a[h]);
      if (o > 0) {
        *m = f;
        n[0] = h;
        n[1] = o;
      }
    }
  }
  if (c - l > 0) {
    g = f + l;
    h = g * j;
    if (g <= c - 1) {
      o = *((int*)a[h]);
      if (o > 0) {
        *m = f;
        n[0] = h;
        n[1] = o;
      }
    }
  }
  barrier(1);

  if (f == *m) {
    h = n[0];
    for (p = 0; p < n[1]; p++) {
      d[p] = a[h + p];
    }
  }
}