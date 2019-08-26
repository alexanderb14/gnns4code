__kernel void A(int a, int b, float c, __global float* d, __global float* e, int f, float g, __global float* h, int i) {
  bool j = (a == 0);

  if (j) {
    int k = 0;
    int l = 0;

    for (int m = 0; m < b; m++) {
      int n = k;
      int o = l;
      float p = 0.f;

      for (int q = m; q < b; q++, n += q) {
        p += d[n] * e[q * f];
      }

      for (int q = 0; q < m; q++, o++) {
        p += d[o] * e[q * f];
      }

      h[m * i] = c * p + g * h[m * i];

      k += (m + 2);
      l += (m + 1);
    }
  }

  if (!j) {
    int k = 0;
    int l = 0;

    for (int m = 0; m < b; m++) {
      int n = k;
      int o = l;
      float p = 0.f;

      for (int q = m; q < b; q++, n++) {
        p += d[n] * e[q * f];
      }

      for (int q = 0; q < m; q++, o += (b - q)) {
        p += d[o] * e[q * f];
      }

      h[m * i] = c * p + g * h[m * i];

      k += (b - m);
      l += 1;
    }
  }
}