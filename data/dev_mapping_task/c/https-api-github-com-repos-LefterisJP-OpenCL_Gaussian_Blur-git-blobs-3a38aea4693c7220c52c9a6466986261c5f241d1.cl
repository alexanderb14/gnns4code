__kernel void A(__global const unsigned char* a, __global const float* b, const int c, const int d, const int e, __global unsigned char* f) {
  unsigned int g, h, i;
  float j;
  int k, l, m, n;

  k = get_global_id(0);

  i = c * 3;
  n = e / 2;

  if (k >= i * (e - n) + n * 3 && k < c * d * 3 - i * (e - n) - n * 3) {
    j = 0;
    for (h = 0; h < e; h++) {
      m = i * (h - n);
      for (g = 0; g < e; g++) {
        l = 3 * (g - n);
        j += b[h * e + g] * a[k + l + m];
      }
    }
    f[k] = j;
  } else {
    f[k] = a[k];
  }
}