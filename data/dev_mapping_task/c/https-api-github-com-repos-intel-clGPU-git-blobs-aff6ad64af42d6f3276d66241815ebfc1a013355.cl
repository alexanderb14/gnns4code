float A(const global float* a, int b, int c, int d) {
  return a[c * d + b];
}

kernel void B(const int a, const int b, const int c, const int d, const global float* e, const int f, global float* g, const int h) {
  bool i = b == 0;
  bool j = a == 1;
  bool k = c == 0;

  if (i) {
    if (j) {
      for (int l = 0; l < d; l++) {
        if (k) {
          g[l * h] = g[l * h] / A(e, l, l, f);
        }
        float m = g[l * h];
        for (int n = l + 1; n < d; n++) {
          g[n * h] -= m * A(e, n, l, f);
        }
      }
    } else {
      for (int l = d - 1; l >= 0; l--) {
        if (k) {
          g[l * h] = g[l * h] / A(e, l, l, f);
        }
        float m = g[l * h];
        for (int n = l - 1; n >= 0; n--) {
          g[n * h] -= m * A(e, n, l, f);
        }
      }
    }
  } else {
    if (j) {
      for (int l = d - 1; l >= 0; l--) {
        if (k) {
          g[l * h] = g[l * h] / A(e, l, l, f);
        }
        float m = g[l * h];
        for (int n = l - 1; n >= 0; n--) {
          g[n * h] -= m * A(e, l, n, f);
        }
      }
    } else {
      for (int l = 0; l < d; l++) {
        if (k) {
          g[l * h] = g[l * h] / A(e, l, l, f);
        }
        float m = g[l * h];
        for (int n = l + 1; n < d; n++) {
          g[n * h] -= m * A(e, l, n, f);
        }
      }
    }
  }
}