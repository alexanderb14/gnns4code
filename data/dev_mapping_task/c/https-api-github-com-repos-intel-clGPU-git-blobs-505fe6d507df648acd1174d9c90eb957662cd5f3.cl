__kernel void A(int a, int b, int c, int d, int e, float f, __global float* g, int h, __global float* i, int j, float k, __global float* l, int m) {
  bool n = (a == 0);
  bool o = (b == 0);

  if (n && o) {
    for (int p = 0; p < c; p++) {
      for (int q = 0; q < d; q++) {
        float r = 0.f;

        for (int s = 0; s < e; s++) {
          r += g[s * h + p] * i[q * j + s];
        }

        l[q * m + p] = f * r + k * l[q * m + p];
      }
    }
  }

  if (n && !o) {
    for (int p = 0; p < c; p++) {
      for (int q = 0; q < d; q++) {
        float r = 0.f;

        for (int s = 0; s < e; s++) {
          r += g[s * h + p] * i[s * j + q];
        }

        l[q * m + p] = f * r + k * l[q * m + p];
      }
    }
  }

  if (!n && o) {
    for (int p = 0; p < c; p++) {
      for (int q = 0; q < d; q++) {
        float r = 0.f;

        for (int s = 0; s < e; s++) {
          r += g[p * h + s] * i[q * j + s];
        }

        l[q * m + p] = f * r + k * l[q * m + p];
      }
    }
  }

  if (!n && !o) {
    for (int p = 0; p < c; p++) {
      for (int q = 0; q < d; q++) {
        float r = 0.f;

        for (int s = 0; s < e; s++) {
          r += g[p * h + s] * i[s * j + q];
        }

        l[q * m + p] = f * r + k * l[q * m + p];
      }
    }
  }
}