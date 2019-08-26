__kernel void A(global unsigned int* restrict a, global unsigned int* restrict b, const int c, const unsigned int d) {
  int e[3][3] = {{-1, -2, -1}, {0, 0, 0}, {1, 2, 1}};
  int f[3][3] = {{-1, 0, 1}, {-2, 0, 2}, {-1, 0, 1}};

  int g[2 * 640 + 3];

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
        unsigned int o = (m >> 8) & 0xff;
        unsigned int p = (m >> 16) & 0xff;

        unsigned int q = p * 66 + o * 129 + n * 25;
        q = (q + 128) >> 8;
        q += 16;

        j += q * e[i][l];
        k += q * f[i][l];
      }
    }

    int r = abs(j) + abs(k);
    unsigned int s;
    if (r > d) {
      s = 0xffffff;
    } else {
      s = 0;
    }

    if (h >= 0) {
      b[h] = s;
    }
    h++;
  }
}