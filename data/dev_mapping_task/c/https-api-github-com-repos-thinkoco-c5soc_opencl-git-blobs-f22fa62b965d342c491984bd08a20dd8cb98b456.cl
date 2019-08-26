__kernel void A(global unsigned short* restrict a, global unsigned int* restrict b, const int c, const unsigned int d) {
  int e[3][3] = {{-1, -2, -1}, {0, 0, 0}, {1, 2, 1}};
  int f[3][3] = {{-1, 0, 1}, {-2, 0, 2}, {-1, 0, 1}};

  unsigned short g[2 * 640 + 3];

  int h = -(2 * 640 + 3);
  while (h != c) {
    for (int i = 640 * 2 + 2; i > 0; --i) {
      g[i] = g[i - 1];
    }
    g[0] = h >= 0 ? a[h] : 0;

    int j = 0;
    int k = 0;

    for (int i = 0; i < 3; ++i) {
      for (int l = 0; l < 3; ++l) {
        unsigned int m = g[i * 640 + l];
        unsigned int n = m & 0xff;
        j += n * e[i][l];
        k += n * f[i][l];
      }
    }
    int o = abs(j) + abs(k);
    unsigned int p;
    if (o > d) {
      p = 0xffffffff;
    } else {
      p = 0xff000000;
    }

    if (h >= 0) {
      b[h] = p;
    }
    h++;
  }
}