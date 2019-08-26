__kernel void A(const __global float* __restrict a, unsigned int b, unsigned int c, __global float* __restrict d, const __global float* __restrict e, const __global float* __restrict f, double g, double h ) {
  float i, j = g;
  float k;
  float l, m;
  float n, o;

  unsigned int p = get_global_id(0);
  unsigned int q = get_global_id(1);
  unsigned int r = get_global_size(1);

  unsigned int s = 1 * p;
  unsigned int t, u, v;

  float w = (float)1;

  for (unsigned int x = 0; x < c; x += r) {
    u = x + q;

    if (u < c) {
      i = 0.;
      t = s + u;

      for (unsigned int y = 0; y < 1; y++) {
        v = b * y + t;
        i += a[v];
      }
      i /= w;
      k = 0.;
      j = 0.;

      for (unsigned int y = 0; y < 1; y++) {
        v = b * y + t;
        k = a[v] - i;
        j = mad(k, k, (float)j);
      }
      j /= w;
      l = (1.f / sqrt(j + h));

      n = e[t];
      o = f[t];

      for (unsigned int y = 0; y < 1; y++) {
        v = b * y + t;
        k = a[v] - i;
        m = k * l;

        d[v] = mad(n, m, o);
      }
    }
  }
}