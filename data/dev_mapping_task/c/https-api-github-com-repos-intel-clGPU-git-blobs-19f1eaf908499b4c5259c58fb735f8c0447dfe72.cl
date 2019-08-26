float A(const global float* a, int b, int c, int d) {
  return a[b * d + c];
}

__kernel void B(int a, int b, int c, float d, __global float* e, int f, __global float* g, int h, float i, __global float* j, int k) {
  bool l = (a == 0);

  if (l) {
    for (int m = 0; m < b; m++) {
      float n = g[m * h] * A(e, m, c, f);

      for (int o = 1; o < min(b - m, c + 1); o++) {
        n += g[(m + o) * h] * A(e, m + o, c - o, f);
      }

      for (int o = 1; o < min(m + 1, c + 1); o++) {
        n += g[(m - o) * h] * A(e, m, 0, f);
      }

      j[m * k] = d * n + i * j[m * k];
    }
  }

  if (!l) {
    for (int m = 0; m < b; m++) {
      float n = g[m * h] * A(e, m, 0, f);

      for (int o = 1; o < min(c + 1, b - m); o++) {
        n += g[(m + o) * h] * A(e, m, o, f);
      }

      for (int o = 1; o < min(m + 1, c + 1); o++) {
        n += g[(m - o) * h] * A(e, m, -1 * o, f);
      }

      j[m * k] = d * n + i * j[m * k];
    }
  }
}