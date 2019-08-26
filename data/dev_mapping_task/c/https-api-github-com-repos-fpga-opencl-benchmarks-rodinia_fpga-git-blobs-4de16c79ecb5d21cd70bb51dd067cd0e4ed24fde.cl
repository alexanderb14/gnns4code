__kernel void A(__global const float* a, __global const float* b, __global float* c, int d, int e, float f, float g, float h, float i, float j) {
  float k = j / f;
  float l = 1 / g;
  float m = 1 / h;
  float n = 1 / i;

  for (int o = 0; o < e; ++o) {
    for (int p = 0; p < d; ++p) {
      int q = p + o * d;
      int r = (o == e - 1) ? 0 : d;
      int s = (o == 0) ? 0 : -d;
      int t = (p == d - 1) ? 0 : 1;
      int u = (p == 0) ? 0 : -1;
      float v = a[q] + (b[q + r] + b[q + s] - 2.0f * b[q]) * m + (b[q + t] + b[q + u] - 2.0f * b[q]) * l + ((80.0f) - b[q]) * n;
      float w = k * v;
      c[q] = b[q] + w;
    }
  }
}