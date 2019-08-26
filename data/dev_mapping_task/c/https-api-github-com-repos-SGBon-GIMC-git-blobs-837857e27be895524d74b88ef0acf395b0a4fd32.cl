__kernel void A(__global unsigned char* a, __global float* b, __global unsigned char* c, unsigned long d, unsigned long e, unsigned int f, unsigned int g) {
  int h = get_global_id(0);
  int i = get_global_id(1);

  if (h < (d * e) && i < g) {
    const int j = h % d;
    const int k = ((h - j) / d);
    const unsigned int l = d * e;
    const unsigned long m = f * f;
    const int n = (m - 1) / 2;

    const int o = j - n;
    const int p = k - n;

    float q = 0;

    for (unsigned int r = 0; r < m; ++r) {
      int s = (o) + (r % f);
      int t = (p) + ((r - (r % f)) / f);

      float u;
      if (t < 0 || t > e || s < 0 || s > d) {
        u = 0;
      } else {
        u = a[t * d + s];
      }

      const unsigned int v = m - r - 1 + i * m;
      const float w = b[v];
      q += u * w;
    }
    c[k * d + j + i * l] = q;
  }
}
__kernel void B(__global float* a, unsigned int b, unsigned int c) {
  const unsigned int d = get_global_id(0);
  const int e = get_global_id(1);

  const unsigned long f = c * c;
  if (d < b && e < f) {
    const float g = (d + 1) * 25.0 / b;
    const int h = (c - 1) / 2;
    int i = (e % c);
    int j = ((e - i) / c);
    i -= h;
    j -= h;

    const float k = (1.0 / (2 * 0x1.921fb6p+1f * g * g)) * (exp(-(j * j + i * i) / (2.0 * g * g)));

    a[f * d + e] = k;
  }
}

__kernel void C(__global float* a, unsigned int b, unsigned int c) {
  const unsigned int d = get_global_id(0);
  const unsigned int e = c * c;

  if (d < b) {
    float f = 0;
    for (unsigned int g = 0; g < e; ++g) {
      f += a[e * d + g];
    }

    for (unsigned int g = 0; g < e; ++g) {
      a[e * d + g] = a[e * d + g] / f;
    }
  }
}