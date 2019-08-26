__kernel void A(__global const uchar* a, __global const uchar* b, const int c, const int d, const int e, __global uchar* f, __global uchar* g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);

  const int j = (i * d) + h;

  uchar k = 255;
  uchar l = 0;
  uchar m = 255;
  uchar n = 0;

  for (int o = 1; o < e; o++) {
    uchar p = a[((o * c) + i) * d + h];
    uchar q = b[((o * c) + i) * d + h];
    if (p < k) {
      k = p;
      l = o;
    }
    if (q < m) {
      m = q;
      n = o;
    }
  }
  f[j] = l;
  g[j] = n;
}
__kernel void B(__global const float* a, __global const float* b, const int c, const int d, const int e, __global uchar* f, __global uchar* g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);

  const int j = i * d;
  int k;

  float l = 1e5f;
  char m = 0;

  for (int n = 1; n < e; n++) {
    float o = *(a + ((n * c) + i) * d + h);
    if (o < l) {
      l = o;
      m = n;
    }
  }
  *(f + j + h) = m;

  l = 1e5f;
  m = 0;

  for (int n = 1; n < e; n++) {
    float o = *(b + ((n * c) + i) * d + h);
    if (o < l) {
      l = o;
      m = n;
    }
  }
  *(g + j + h) = m;
}