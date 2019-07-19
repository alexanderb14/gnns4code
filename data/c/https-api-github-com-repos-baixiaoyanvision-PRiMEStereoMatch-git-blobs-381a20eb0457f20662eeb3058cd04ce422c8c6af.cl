__kernel void A(__global const char* a, __global const char* b, const int c, const int d, const int e, __global char* f, __global char* g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);

  const int j = (i * d) + h;

  char k = 255;
  char l = 0;
  char m = 255;
  char n = 0;

  for (int o = 1; o < e; o++) {
    char p = a[((o * c) + i) * d + h];
    char q = b[((o * c) + i) * d + h];
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