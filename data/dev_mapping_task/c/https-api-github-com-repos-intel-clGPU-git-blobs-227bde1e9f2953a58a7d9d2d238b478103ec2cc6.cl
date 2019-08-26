__kernel void A(int a, int b, int c, int d, __global float* e, __global float* f, int g, __global float* h) {
  bool i = (a == 0);
  bool j = (c == 1);
  bool k = (b == 0);

  if (i && k) {
    int l = 0;

    for (int m = 0; m < d; m++) {
      int n = l + m + 1;

      h[m] = j ? f[m * g] : f[m * g] * e[l];

      for (int o = m + 1; o < d; o++, n += o) {
        h[m] += f[o * g] * e[n];
      }

      l += (m + 2);
    }
  }

  if (i && !k) {
    int n = 0;

    for (int m = 0; m < d; m++) {
      for (int o = 0; o < m; o++, n++) {
        h[m] += f[o * g] * e[n];
      }

      h[m] += j ? f[m * g] : f[m * g] * e[n];

      n += 1;
    }
  }

  if (!i && k) {
    int l = 0;

    for (int m = 0; m < d; m++) {
      int n = l;

      for (int o = 0; o < m; o++, n += (d - o)) {
        h[m] += f[o * g] * e[n];
      }

      h[m] += j ? f[m * g] : f[m * g] * e[n];

      l += 1;
    }
  }

  if (!i && !k) {
    int n = 0;

    for (int m = 0; m < d; m++) {
      h[m] = j ? f[m * g] : f[m * g] * e[n];

      n += 1;

      for (int o = m + 1; o < d; o++, n++) {
        h[m] += f[o * g] * e[n];
      }
    }
  }

  for (int m = 0; m < d; m++) {
    f[m * g] = h[m];
  }
}