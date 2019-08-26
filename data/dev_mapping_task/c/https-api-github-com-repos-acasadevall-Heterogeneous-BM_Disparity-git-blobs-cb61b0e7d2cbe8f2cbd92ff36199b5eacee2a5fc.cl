__kernel void A(__global unsigned char* restrict a, __global unsigned char* restrict b, __global unsigned int* restrict c, unsigned int d) {
  int2 e = (int2)(get_global_size(0), get_global_size(1));
  int2 f = (int2)(get_group_id(0), get_group_id(1));
  int2 g = (int2)(get_local_id(0), get_local_id(1));
  int2 h = (int2)(get_local_size(0), get_local_size(1));

  unsigned int i = f.x * h.x + g.x;
  unsigned int j = f.y * h.y + g.y;

  if ((j >= 7 / 2) && (j < (e.y - 7 / 2))) {
    if ((i >= 7 / 2) && (i < (e.x - 7 / 2))) {
      int k = 0;
      int l[256];
      for (int m = i; (m >= 7 / 2) && (k < d); m--) {
        unsigned int n = 0;
        for (int o = j - 7 / 2; o <= (j + 7 / 2); o++) {
          for (int p = m - 7 / 2; p <= (m + 7 / 2); p++)
            n += abs(a[o * e.x + p + (i - m)] - b[o * e.x + p]);
        }

        l[k++] = n;
      }

      int q = l[0];
      int r = 0;
      for (int s = 0; s < k; s++) {
        if (l[s] < q) {
          q = l[s];
          r = s;
        }
      }

      c[j * e.x + i] = r;
    }
  }
}