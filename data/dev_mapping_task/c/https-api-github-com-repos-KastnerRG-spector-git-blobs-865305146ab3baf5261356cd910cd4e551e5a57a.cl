__kernel void A(__global const unsigned char* restrict a, __global unsigned int* restrict b, int c) {
  const int d = 0;

  const int e = d * c;

  unsigned int f[256];

  unsigned int g[256];
  for (int h = 0; h < 256; h++) {
    f[h] = 0;

    g[h] = 0;
  }

  for (int h = 0; h < c; h += 2) {
    int i = h + e;

    f[a[i]]++;

    if (h + 1 < c) {
      g[a[i + 1]]++;
    }
  }
  for (int h = 0; h < 256; h++) {
    b[d * 256 + h] =

        f[h] +

        g[h] + 0;
  }
}