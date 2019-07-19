__kernel void A(__global int* restrict a, __global int* restrict b, int c, int d) {
  int e = -1;
  int f = 0, g = 0;
  int h = 1;
  int i = -1;

  int j[((100) * (16) * 2 + (16))];

  for (int k = 0; k < ((100) * (16) * 2 + (16)); ++k) {
    j[k] = 2147483647;
  }

  do {
    --h;
    ++i;
    if (h > 0) {
      f -= 16;
      ++g;
    } else {
      h = 100;
      ++e;
      f = e * 16;
      g = 0;
    }

    int l[16];
    if (f >= 0 && f < c) {
      for (int k = 0; k < 16; ++k) {
        l[k] = a[((f + k) + (g)*c)];

        int m = ((100) * (16) * 2 + (16)) - (100 * 16) - 16 + k;
        int n = k == 16 - 1 ? ((100) * (16) * 2 + (16)) - 16 : m + 1;
        int o = k == 0 ? 16 - 1 : m - 1;
        if (g != 0) {
          l[k] += ((((j[o]) <= (j[m]) ? (j[o]) : (j[m]))) <= (j[n]) ? (((j[o]) <= (j[m]) ? (j[o]) : (j[m]))) : (j[n]));
        }
      }
    } else {
      for (int k = 0; k < 16; ++k) {
        l[k] = 2147483647;
      }
    }
    for (int k = 0; k < ((100) * (16) * 2 + (16)) - 16; ++k) {
      j[k] = j[k + 16];
    }
    for (int k = 0; k < 16; ++k) {
      j[((100) * (16) * 2 + (16)) - 16 + k] = l[k];
    }
    if (f >= 0 && f < c && g == d - 1) {
      for (int k = 0; k < 16; ++k) {
        b[f + k] = l[k];
      }
    }
  } while (f != c - 16 || g != d - 1);
}