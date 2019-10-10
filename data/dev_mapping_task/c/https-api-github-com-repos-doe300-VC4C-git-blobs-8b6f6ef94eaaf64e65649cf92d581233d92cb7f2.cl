typedef unsigned char fixed8; kernel void A(global unsigned char* a, const global short* b, const global int* c, const global int* d, int e, int f, int g, int h, int i, int j, int k, int l) {
  const unsigned char m[8] = {64, 64, 64, 64, 64, 64, 64, 64};

  int n = get_global_id(0);
  int o = get_global_id(1);

  int p = get_global_size(0);
  int q = get_global_size(1);

  const unsigned char* r;
  const unsigned char* s;

  r = m;
  s = m;

  int t = n + p;
  int u = o + q;
  short v = (b[(c[o]) * i + n] + r[(n + 0) & 7]) >> 7;
  short w = (b[(c[o]) * i + t] + r[t & 7]) >> 7;
  short x = (b[(c[u]) * i + n] + s[n & 7]) >> 7;
  short y = (b[(c[u]) * i + t] + s[t & 7]) >> 7;
  a[o * i + n] = ((v & (~0xFF)) ? ((-v) >> 31) : (v));
  a[o * i + t] = ((w & (~0xFF)) ? ((-w) >> 31) : (w));
  a[u * i + n] = ((x & (~0xFF)) ? ((-x) >> 31) : (x));
  a[u * i + t] = ((y & (~0xFF)) ? ((-y) >> 31) : (y));

  b += i * h;
  a += i * f;
  v = (b[d[o] * (j) + n] + r[n & 7]) >> 7;
  a[o * (j) + n] = ((v & (~0xFF)) ? ((-v) >> 31) : (v));

  b += j * (h >> 1);
  a += j * q;
  v = (b[d[o] * j + n] + r[(n + 3) & 7]) >> 7;
  a[o * j + n] = ((v & (~0xFF)) ? ((-v) >> 31) : (v));
}