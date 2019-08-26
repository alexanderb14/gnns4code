__kernel void A(const int a, const int b, const int c, int d, __global float* e, __global float* f, int g) {
  bool h = b == 0;
  bool i = a == 1;
  bool j = c == 0;

  if (h) {
    if (i) {
      uint k = 0;
      for (int l = 0; l < d; l++) {
        if (j) {
          f[l * g] = f[l * g] / e[k];
        }
        float m = f[l * g];
        for (int n = 1; n < d - l; n++) {
          f[(l + n) * g] -= m * e[k + n];
        }
        k += d - l;
      }
    } else {
      uint k = d * (d + 1) / 2 - 1;
      for (int l = d - 1; l >= 0; l--) {
        if (j) {
          f[l * g] = f[l * g] / e[k];
        }
        float m = f[l * g];
        for (int n = 1; n < l + 1; n++) {
          f[(l - n) * g] -= m * e[k - n];
        }
        k -= l + 1;
      }
    }
  } else {
    if (i) {
      uint k = d * (d + 1) / 2 - 1;
      for (int l = d - 1; l >= 0; l--) {
        if (j) {
          f[l * g] = f[l * g] / e[k];
        }
        float m = f[l * g];
        for (int n = 1; n < l + 1; n++) {
          f[(l - n) * g] -= m * e[k - (d - l - 1) * n - n * (n + 1) / 2];
        }
        k -= d - l + 1;
      }
    } else {
      uint k = 0;
      for (int l = 0; l < d; l++) {
        if (j) {
          f[l * g] = f[l * g] / e[k];
        }
        float m = f[l * g];
        for (int n = 1; n < d - l; n++) {
          f[(l + n) * g] -= m * e[k + l * n + n * (n + 1) / 2];
        }
        k += l + 2;
      }
    }
  }
}