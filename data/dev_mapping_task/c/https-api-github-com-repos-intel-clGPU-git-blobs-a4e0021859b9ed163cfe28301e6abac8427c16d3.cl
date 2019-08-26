float A(const global float* a, int b, int c, int d) {
  return a[c * d + b];
}

kernel void B(const int a, const int b, const int c, const int d, const int e, const global float* f, const int g, global float* h, const int i) {
  bool j = a == 1;
  bool k = b == 0;
  bool l = c == 1;

  if (k) {
    if (j) {
      for (int m = 0; m < d; m++) {
        if (!l) {
          h[m * i] = h[m * i] / A(f, 0, m, g);
        }
        for (int n = 1; n < min(e + 1, d - m); n++) {
          h[(m + n) * i] -= h[m * i] * A(f, n, m, g);
        }
      }
    } else {
      for (int m = d - 1; m >= 0; m--) {
        if (!l) {
          h[m * i] = h[m * i] / A(f, e, m, g);
        }
        for (int n = 1; n < min(e + 1, m + 1); n++) {
          h[(m - n) * i] -= h[m * i] * A(f, e - n, m, g);
        }
      }
    }
  } else {
    if (j) {
      for (int m = d - 1; m >= 0; m--) {
        if (!l) {
          h[m * i] = h[m * i] / A(f, 0, m, g);
        }
        for (int n = 1; n < min(e + 1, m + 1); n++) {
          h[(m - n) * i] -= h[m * i] * A(f, n, m - n, g);
        }
      }
    } else {
      for (int m = 0; m < d; m++) {
        if (!l) {
          h[m * i] = h[m * i] / A(f, e, m, g);
        }
        for (int n = 1; n < min(e + 1, d - m); n++) {
          h[(m + n) * i] -= h[m * i] * A(f, e - n, m + n, g);
        }
      }
    }
  }
}