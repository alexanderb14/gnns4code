__kernel void A(int a, int b, int c, float d, __global float* e, int f, __global float* g, int h, float i, __global float* j, int k) {
  bool l = (a == 0);
  bool m = (b == 0);

  int n = get_global_id(0);
  int o = get_global_id(1);

  if (l && m) {
    float p = 0.f;

    for (int q = 0; q < c; q++) {
      p += e[q * f + n] * g[o * h + q];
    }

    j[o * k + n] = d * p + i * j[o * k + n];
  }

  if (l && !m) {
    float p = 0.f;

    for (int q = 0; q < c; q++) {
      p += e[q * f + n] * g[q * f + o];
    }

    j[o * k + n] = d * p + i * j[o * k + n];
  }

  if (!l && m) {
    float p = 0.f;

    for (int q = 0; q < c; q++) {
      p += e[n * f + q] * g[o * f + q];
    }

    j[o * k + n] = d * p + i * j[o * k + n];
  }

  if (!l && !m) {
    float p = 0.f;

    for (int q = 0; q < c; q++) {
      p += e[n * f + q] * g[q * f + o];
    }

    j[o * k + n] = d * p + i * j[o * k + n];
  }
}