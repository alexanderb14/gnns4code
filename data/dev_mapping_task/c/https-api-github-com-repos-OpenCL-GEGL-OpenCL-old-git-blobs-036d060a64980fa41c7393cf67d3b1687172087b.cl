const __constant char Ga[256] = {7, 9,  12, 12, 8, 7, 5, 5, 6, 7, 8, 6, 10, 7, 6, 2, 8, 3, 9,  5, 13, 10, 9, 8, 8, 9,  3, 8, 9,  6, 8, 7, 4, 9,  6,  3, 10, 7, 7, 7, 6, 7,  4,  14, 7,  6, 11, 7,  7, 7, 12, 7, 10, 6, 8, 11, 3, 5, 7, 7, 8, 7, 9, 8, 5, 8, 11, 3, 4, 5,  8, 8, 7, 8, 9, 2, 7, 8,  12, 4, 8, 2, 11, 8,  14, 7, 8, 2, 3, 10, 4, 6, 9, 5, 8, 7, 10, 10, 10, 14, 5, 7, 6, 4, 5, 6, 11, 8,  7, 3, 11, 5, 5, 2, 9, 7, 7, 7, 9,  2, 7, 6,  9, 7, 6,  5, 12, 5,
                                 3, 11, 9,  12, 8, 6, 8, 6, 8, 5, 5, 7, 5,  2, 9, 5, 5, 8, 11, 8, 8,  10, 6, 4, 7, 14, 7, 3, 10, 7, 7, 4, 9, 10, 10, 9, 8,  8, 7, 6, 5, 10, 10, 5,  10, 7, 7,  10, 7, 4, 9,  9, 6,  8, 5, 10, 7, 3, 9, 9, 7, 8, 9, 7, 5, 7, 6,  5, 5, 12, 4, 7, 5, 5, 4, 5, 7, 10, 8,  7, 9, 4, 6,  11, 6,  3, 7, 8, 9, 5,  8, 6, 7, 8, 7, 7, 3,  7,  7,  9,  4, 5, 5, 6, 9, 7, 6,  12, 4, 9, 10, 8, 8, 6, 4, 9, 9, 8, 11, 6, 8, 13, 8, 9, 12, 6, 9,  8};

uint A(uint a, uint b, uint c) {
  ulong d;
  int e;

  for (e = 0; e < 3; e += 1) {
    d = a * 0xcd9e8d57ul;

    a = ((uint)(d >> 32)) ^ b ^ c;
    b = (uint)d;

    c += 0x9e3779b9u;
  }

  return a;
}

float B(uint* a) {
  return (*a = *a * 1664525u + 1013904223u) / 4294967296.0f;
}

void C(float* a, uint* b, int c, int d, float e, float f, float g, uint h, uint i) {
  uint j;
  int k, l;

  j = A((uint)c, (uint)d, i);
  l = Ga[j >> 24];

  for (k = 0; k < l; k += 1) {
    float m, n, o;
    int p, q;

    m = c + B(&j) - e;
    n = d + B(&j) - f;

    if (g == 2)
      o = m * m + n * n;
    else if (g == 1)
      o = __clc_fabs(m) + __clc_fabs(n);
    else
      o = __clc_pow(__clc_fabs(m), g) + __clc_pow(__clc_fabs(n), g);

    for (p = 0; p < h && o > a[p]; p += 1)
      ;

    if (p < h) {
      for (q = h - 1; q > p; q -= 1) {
        a[q] = a[q - 1];
      }

      a[p] = o;

      if (p == h - 1)
        *b = j;
    }
  }
}

__kernel void D(__global float* a, const int b, const int c, const uint d, float e, float f, uint g, uint h, int i) {
  const int j = get_global_id(0);
  const int k = get_global_id(1);

  float l, m, n, o[3], *p = &o[3 - 1];
  uint q;
  int r, s;

  for (s = 0, n = 0, l = 1, m = e; s < d; l *= 2, m *= 2, s += 1) {
    float t, u, v, w;
    float x = (float)(j + b) * m;
    float y = (float)(k + c) * m;
    int z = (int)__clc_floor(x);
    int aa = (int)__clc_floor(y);

    for (r = 0; r < g; o[r] = 1.0f / 0.0f, r += 1)
      ;

    C(o, &q, z, aa, x, y, f, g, h);

    p = &o[g - 1];
    t = x - z;
    t *= t;
    u = 1.0f - x + z;
    u *= u;
    w = y - aa;
    w *= w;
    v = 1.0f - y + aa;
    v *= v;

    if (t < *p) {
      if (t + w < *p)
        C(o, &q, z - 1, aa - 1, x, y, f, g, h);

      C(o, &q, z - 1, aa, x, y, f, g, h);

      if (t + v < *p)
        C(o, &q, z - 1, aa + 1, x, y, f, g, h);
    }

    if (w < *p)
      C(o, &q, z, aa - 1, x, y, f, g, h);

    if (v < *p)
      C(o, &q, z, aa + 1, x, y, f, g, h);

    if (u < *p) {
      if (u + w < *p)
        C(o, &q, z + 1, aa - 1, x, y, f, g, h);

      C(o, &q, z + 1, aa, x, y, f, g, h);

      if (u + v < *p)
        C(o, &q, z + 1, aa + 1, x, y, f, g, h);
    }

    if (i) {
      n += q / 4294967295.0f / l;
    } else {
      n += __clc_pow(o[g - 1], 1 / f) / l;
    }
  }

  a[k * get_global_size(0) + j] = n;
}