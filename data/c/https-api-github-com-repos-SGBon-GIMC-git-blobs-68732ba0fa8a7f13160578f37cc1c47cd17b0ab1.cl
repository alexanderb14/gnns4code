__kernel void A(__constant unsigned char* a, __constant float* b, __global unsigned char* c, unsigned int d, unsigned int e, unsigned long f, unsigned long g, unsigned int h) {
  int i = get_global_id(0);
  int j = get_global_id(1);

  if (i < (d * e) && j < h) {
    const int k = i % d;
    const int l = ((i - k) / d);
    const unsigned int m = d * e;
    const unsigned long n = f * g;
    const int o = (n - 1) / 2;

    const int p = k - o;
    const int q = l - o;

    float r = 0;

    for (unsigned int s = 0; s < n; ++s) {
      int t = (p) + (s % f);
      int u = (q) + ((s - (s % f)) / f);

      float v;
      if (u < 0 || u > e || t < 0 || t > d) {
        v = 0;
      } else {
        v = a[u * d + t];
      }

      const unsigned int w = n - s - 1 + j * n;
      const float x = b[w];
      r += v * x;
    }
    c[l * d + k + j * m] = r;
  }
}