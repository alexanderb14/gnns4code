float A(const global float* a, int b, int c, int d) {
  return a[c * d + b];
}

__kernel void B(int a, int b, int c, int d, int e, __global float* f, int g, __global float* h, int i) {
  bool j = (a == 0);
  bool k = (c == 1);
  bool l = (b == 0);

  if (j && l) {
    for (int m = 0; m < d; m++) {
      h[m * i] = k ? h[m * i] : h[m * i] * A(f, e, m, g);

      for (int n = 1; n < min(d - m, e + 1); n++) {
        h[m * i] += h[(m + n) * i] * A(f, e - n, m + n, g);
      }
    }
  }

  if (j && !l) {
    for (int m = d - 1; m >= 0; m--) {
      h[m * i] = k ? h[m * i] : h[m * i] * A(f, e, m, g);

      for (int n = 1; n < min(m + 1, e + 1); n++) {
        h[m * i] += h[(m - n) * i] * A(f, e - n, m, g);
      }
    }
  }

  if (!j && l) {
    for (int m = d - 1; m >= 0; m--) {
      h[m * i] = k ? h[m * i] : h[m * i] * A(f, 0, m, g);

      for (int n = 1; n < min(m + 1, e + 1); n++) {
        h[m * i] += h[(m - n) * i] * A(f, n, m - n, g);
      }
    }
  }

  if (!j && !l) {
    for (int m = 0; m < d; m++) {
      h[m * i] = k ? h[m * i] : h[m * i] * A(f, 0, m, g);

      for (int n = 1; n < min(e + 1, d - m); n++) {
        h[m * i] += h[n * i] * A(f, n, m, g);
      }
    }
  }
}