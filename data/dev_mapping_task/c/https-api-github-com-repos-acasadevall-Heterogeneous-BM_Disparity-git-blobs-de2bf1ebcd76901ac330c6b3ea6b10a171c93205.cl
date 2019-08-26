__attribute((reqd_work_group_size(32, 32, 1))) __kernel void A(__global unsigned char* restrict a, __global unsigned char* restrict b, __global unsigned int* restrict c) {
  int d = get_global_id(0);
  int e = get_global_id(1);
  int f = get_global_size(0);
  int g = get_global_size(1);
  int h = get_group_id(0);
  int i = get_group_id(1);
  int j = get_local_id(0);
  int k = get_local_id(1);
  int l = get_local_size(0);
  int m = get_local_size(1);

  int n = h * l + j;
  int o = i * m + k;

  __local unsigned char p[3 * 3];
  __local unsigned char q[3 * 3];
  __local unsigned int r;
  __local int s[16];

  if ((o > 1) && (o < (g - 1))) {
    if ((n > 1) && (n < (f - 1))) {
      for (int t = 0; t < 3; t++) {
        int u = o - 1 + t;

        for (int v = 0; v < 3; v++) {
          int w = n - 1 + v;
          p[t * 3 + v] = a[u * f + w];
          barrier(1);
        }
      }

      unsigned int x = 0;

      for (int y = n; (y > 1) && (x < 16); y--) {
        int z = n - y;

        unsigned int aa = 0;

        for (int t = 0; t < 3; t++) {
          int u = o - 1 + t;

          for (int v = 0; v < 3; v++) {
            int w = n - 1 + v;
            q[t * 3 + v] = b[u * f + w];
            barrier(1);
          }
        }

        r = 0;
        barrier(1);
        for (int ab = 0; ab < 3 * 3; ab++) {
          r += abs(p[ab] - q[ab]);
          barrier(1);
        }
        s[x++] = r;
        barrier(1);
      }

      int ac = s[0];
      int ad = 0;

      for (int ab = 0; ab < x; ab++) {
        if (s[ab] < ac) {
          ac = s[ab];
          ad = ab;
        }
      }

      c[o * f + n] = ad;
    }
  }
}