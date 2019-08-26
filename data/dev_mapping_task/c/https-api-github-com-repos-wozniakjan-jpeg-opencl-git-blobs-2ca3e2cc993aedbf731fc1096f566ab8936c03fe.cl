__kernel void A(__global unsigned char* a, uint b, uint c, __global unsigned char* d) {
  unsigned char e, f, g;
  size_t h = get_global_id(0);
  size_t i = get_global_id(1);

  if (i <= (c - 1) * 3 && i <= (c - 1) * 3) {
    float j, k, l;

    int m = h * b * 3 + i * 3;
    int n = h * b * 3 + i * 3 + 1;
    int o = h * b * 3 + i * 3 + 2;

    j = a[m];
    k = a[n];
    l = a[o];

    e = (0.299 * j + 0.587 * k + 0.114 * l);
    f = (-0.1687 * j - 0.3313 * k + 0.5 * l + 128);
    g = (0.5 * j - 0.4187 * k - 0.0813 * l + 128);

    int p = h * b + i;
    int q = h * b + i + b * c;
    int r = h * b + i + 2 * b * c;

    d[p] = (unsigned char)e;
    d[q] = (unsigned char)f;
    d[r] = (unsigned char)g;
  }
}

__kernel void B(__global unsigned char* a, uint b, uint c, __global unsigned char* d) {
  float e, f, g;
  size_t h = get_global_id(0);
  size_t i = get_global_id(1);

  if (i <= (c - 1) * 3 && i <= (c - 1) * 3) {
    unsigned char j, k, l;

    int m = h * b + i;
    int n = h * b + i + b * c;
    int o = h * b + i + 2 * b * c;

    e = a[m];
    f = a[n];
    g = a[o];

    j = e + 1.402 * (g - 128);
    k = e - 0.34414 * (f - 128) - 0.71414 * (g - 128);
    l = e + 1.772 * (f - 128);

    int p = h * b * 3 + i * 3;
    int q = h * b * 3 + i * 3 + 1;
    int r = h * b * 3 + i * 3 + 2;

    d[p] = (unsigned char)j;
    d[q] = (unsigned char)k;
    d[r] = (unsigned char)l;
  }
}