__kernel void A(__global const float* a, __global float* b, const int c, const int d, const int e, const int f, const int g, const float h, __constant float* i, __constant float* j) {
  int k = get_global_id(0);
  int l = get_global_id(1);

  if (k < d && l < e) {
    k += c;
    l += c;

    int m = d + 2 * c;
    int n = e + 2 * c;

    float o = 0;
    float p = 0;
    float q = 0.0f;
    float r[3] = {};

    __global const float* s = &a[m * l + k];
    __global float* t = &b[m * l + k];

    for (int u = -c; u <= c; u++) {
      for (int v = -c; v <= c; v++) {
        int w = abs(v);
        int x = abs(u);
        for (int y = 0; y < f; ++y) {
          float z = s[y * m * n + v + u * m] - s[y * m * n];
          o += z * z;
        }

        const float aa = -1.0f / (2.0f * h * h);
        p = exp(o * aa);
        float ab = p * i[w] * i[x];

        q += ab;
        for (int y = 0; y < f; ++y) {
          r[y] += ab * s[y * m * n + u * m + v];
        }
      }
    }

    for (int y = 0; y < f; ++y) {
      const int ac = r[y] / q + 0.5f;
      t[y * m * n] = (ac & 0xffffff00) ? ~(ac >> 24) : ac;
    }
  }
}