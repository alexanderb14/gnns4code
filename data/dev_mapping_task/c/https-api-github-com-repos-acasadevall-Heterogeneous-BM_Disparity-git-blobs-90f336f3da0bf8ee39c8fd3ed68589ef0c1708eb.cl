__attribute((max_global_work_dim(0))) __kernel void A(global unsigned char* restrict a, global unsigned char* restrict b, global unsigned int* restrict c, unsigned int d) {
  local unsigned char e[1024][8];

  for (int f = 3; f < (480 - 3); f++) {
    for (int g = 0; g < 640; g++) {
      for (int h = 0; h < 7; h++) {
        int i = f + h - 3;
        e[(g) % 1024][h] = b[i * 640 + g];
      }
    }

    for (int j = 3; j < (640 - 3); j++) {
      int k = 0;
      int l[128];
      for (int m = j; (m >= 3) && (k < d); m--) {
        int n = 0;

        for (int o = -3; o <= 3; o++) {
          for (int p = -3; p <= 3; p++) {
            n += abs(a[(f + o) * 640 + (j + p)] - e[(p + m) % 1024][o + 3]);
          }
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

      c[f * 640 + j] = r;
    }
  }
}