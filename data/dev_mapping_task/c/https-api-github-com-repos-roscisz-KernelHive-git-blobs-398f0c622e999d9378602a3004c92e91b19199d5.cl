__kernel void A(__global unsigned char* a, unsigned int b, unsigned int c, __global unsigned char* d, unsigned int e) {
  int f = get_global_id(0);
  int g;

  unsigned char h[16];
  unsigned char i[sizeof(long)], j[sizeof(long)];
  long k, l;
  long m;
  int n;

  int o, p;
  long q;

  for (o = 0; o < 16; o++) {
    h[o] = a[o];
  }
  for (o = 0; o < sizeof(long); o++) {
    i[o] = a[o + 16];
    j[o] = a[o + 16 + sizeof(long)];
  }
  k = *((long*)i);
  l = *((long*)j);

  m = (l - k) / c;
  n = (l - k) % c;

  if (f == 0) {
    for (o = 0; o < c; o++) {
      g = o * e;
      for (p = 0; p < 16; p++) {
        d[g + p] = h[p];
      }
      q = k + (m * o);
      *((long*)i) = q;
      q = k + (m * (o + 1)) + n;
      if (q < 0L) {
        q = 9223372036854775807L;
      }
      *((long*)j) = q;
      for (p = 0; p < sizeof(long); p++) {
        d[p + g + 16] = i[p];
        d[p + g + 16 + sizeof(long)] = j[p];
      }
    }
  }
}