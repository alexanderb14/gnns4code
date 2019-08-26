__kernel void A(__global float* a, __global float* b, const float16 c, const unsigned int d) {
  size_t e;
  __global float* f;
  __global float* g;
  float* h = (float*)&c;

  e = get_global_id(0);
  if (e < d) {
    int i, j, k;

    f = a + e * 16;
    g = b + e * 16;

    for (i = 0; i < 4; i++) {
      for (j = 0; j < 4; j++) {
        float l = 0.0f;
        for (k = 0; k < 4; k++) {
          float m = h[4 * i + k];
          float n = f[4 * k + j];
          l += (m * n);
        }
        g[4 * i + j] = l;
      }
    }
  }
}