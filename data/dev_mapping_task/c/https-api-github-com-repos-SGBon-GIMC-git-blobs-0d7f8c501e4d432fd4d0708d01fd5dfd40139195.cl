__kernel void A(__global unsigned char* a, __global float* b, __global unsigned char* c, __local float* d, __local float* e, unsigned long f, unsigned long g, unsigned int h, unsigned int i) {
  const unsigned int j = get_global_id(0);
  const unsigned int k = get_global_id(1);
  const unsigned int l = get_global_id(2);

  const unsigned int m = get_local_id(2);
  const unsigned int n = get_local_size(2);

  const unsigned int o = h * h;
  const unsigned int p = f * g;
  const unsigned int q = o < n ? o : o / n;

  const unsigned int r = q * m;
  unsigned int s = r + q;

  if (o % n != 0 && l == n - 1) {
    s = o;
  }
  d[m] = 0.0;

  for (unsigned int t = r; t < s && t < o; ++t) {
    e[t] = b[t + k * o];
  }
  barrier(1);

  if (j < (f * g) && k < i) {
    const int u = j % f;
    const int v = ((j - u) / f);
    const int w = (o - 1) / 2;

    const int x = u - w;
    const int y = v - w;

    float z = 0.0f;

    for (unsigned int t = r; t < s && t < o; ++t) {
      int aa = (x) + (t % h);
      int ab = (y) + ((t - (t % h)) / h);

      float ac;
      if (ab < 0 || ab > g || aa < 0 || aa > f) {
        ac = 0.0f;
      } else {
        ac = a[ab * f + aa];
      }

      const unsigned int ad = o - t - 1;
      const float ae = e[ad];
      z += ac * ae;
    }
    d[m] = z;
  }
  barrier(1);

  for (unsigned int w = n / 2; w > 0; w >>= 1) {
    if (m < w) {
      const float af = d[m + w];
      d[m] += af;
    }
    barrier(1);
  }

  if (m == 0) {
    c[j + k * p] = d[0];
  }
}
__kernel void B(__global float* a, unsigned int b, unsigned int c) {
  const unsigned int d = get_global_id(0);
  const unsigned int e = get_global_id(1);

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