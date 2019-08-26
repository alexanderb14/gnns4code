__kernel void A(__global const float* a, __global float* b, const int c, const int d, const int e, const int f, const int g, __constant float* h) {
  int i = get_global_id(0);
  int j = get_global_id(1);

  if (i < d && j < e) {
    i += c;
    j += c;

    int k = d + 2 * c;
    int l = e + 2 * c;

    for (int m = 0; m < f; m++) {
      float n = 0.0f;
      float o = 0.0f;

      for (int p = -c; p <= c; ++p) {
        int q = abs(p);
        n += h[q];
        o += h[q] * a[(j)*k + (i + p) + m * k * l];
      }

      const int r = o / n + 0.5f;
      b[i * l + j + m * k * l] = ((int)r & 0xffffff00) ? ~((int)r >> 24) : (int)r;
    }
  }
}