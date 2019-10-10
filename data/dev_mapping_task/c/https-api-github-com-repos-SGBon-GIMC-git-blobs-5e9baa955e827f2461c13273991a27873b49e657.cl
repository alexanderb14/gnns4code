__kernel void A(__global unsigned char* a, __global float* b, __local float* c, __global float* d, unsigned long e, unsigned long f, unsigned int g, unsigned int h, unsigned int i) {
  const unsigned int j = get_global_id(0);
  const unsigned int k = get_global_id(1);
  const unsigned int l = get_global_id(2);

  const unsigned int m = get_local_id(0);
  const unsigned int n = get_local_id(1);
  const unsigned int o = get_local_id(2);

  const unsigned int p = g * h;
  const unsigned int q = e * f;

  c[o] = 0.0;
  barrier(1);

  if (j < q && k < i && l < p) {
    const int r = j % e;
    const int s = ((j - r) / e);
    const int t = (p - 1) / 2;

    const int u = r - t;
    const int v = s - t;

    const int w = (u) + (l % g);
    const int x = (v) + ((l - (l % g)) / g);

    float y;
    if (x < 0 || x > f || w < 0 || w > e) {
      y = 0;
    } else {
      y = a[x * e + w];
    }
    const unsigned int z = p - l - 1 + k * p;
    const float aa = b[z];
    c[o] = y * aa;
  }
  barrier(1);

  for (unsigned int t = get_local_size(2) / 2; t > 0; t >>= 1) {
    if (o < t) {
      const float ab = c[o + t];
      c[o] += ab;
    }
    barrier(1);
  }

  if (o == 0) {
    d[j - get_global_offset(0) + get_group_id(2)] = c[0];
  }
}
__kernel void B(__global float* a, __global unsigned char* b, unsigned long c, unsigned long d, unsigned long e) {
  const unsigned int f = get_global_id(0);
  const unsigned int g = get_global_id(1);
  const unsigned int h = f - get_global_offset(0);
  const unsigned long i = c * d;

  if (f < i) {
    float j = 0.0;
    for (unsigned int k = 0; k < e; ++k) {
      j += a[h * e + k];
    }

    b[f + g * i] = j;
  }
}
__kernel void C(__global float* a, unsigned int b, unsigned int c) {
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

__kernel void D(__global float* a, unsigned int b, unsigned int c) {
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