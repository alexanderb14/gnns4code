unsigned int A(int a, unsigned int b) {
  return ((b << a) & 0xFFFFFFFF) | (b) >> (32 - (a));
}

__kernel void B(__global uint* a, __global char* b, __global uint* c) {
  int d, e, f;
  int g, h;
  uint i, j, k, l;
  uint m[80], n, o, p, q, r, s;
  uint t = a[1];
  int u;

  f = 0;

  j = a[2];
  l = j % 64 >= 56 ? 2 : 1 + j / 64;

  c[0] = 0x67452301;
  c[1] = 0xEFCDAB89;
  c[2] = 0x98BADCFE;
  c[3] = 0x10325476;
  c[4] = 0xC3D2E1F0;
  for (k = 0; k < l; k++) {
    o = c[0];
    p = c[1];
    q = c[2];
    r = c[3];
    s = c[4];

    for (d = 0; d < 80; d++) {
      m[d] = 0x00000000;
    }
    f = k * 64;
    if (j > f) {
      u = (j - f) > 64 ? 64 : (j - f);
    } else {
      u = -1;
    }

    if (u > 0) {
      i = u;

      g = i / 4;

      for (d = 0; d < g; d++) {
        m[d] = ((uchar)b[f + d * 4]) << 24;
        m[d] |= ((uchar)b[f + d * 4 + 1]) << 16;
        m[d] |= ((uchar)b[f + d * 4 + 2]) << 8;
        m[d] |= (uchar)b[f + d * 4 + 3];
      }
      h = i % 4;
      if (h == 3) {
        m[d] = ((uchar)b[f + d * 4]) << 24;
        m[d] |= ((uchar)b[f + d * 4 + 1]) << 16;
        m[d] |= ((uchar)b[f + d * 4 + 2]) << 8;
        m[d] |= ((uchar)0x80);
      } else if (h == 2) {
        m[d] = ((uchar)b[f + d * 4]) << 24;
        m[d] |= ((uchar)b[f + d * 4 + 1]) << 16;
        m[d] |= 0x8000;
      } else if (h == 1) {
        m[d] = ((uchar)b[f + d * 4]) << 24;
        m[d] |= 0x800000;
      } else {
        m[d] = 0x80000000;
      }

      if (u < 56) {
        m[15] = j * 8;
      }
    } else if (u < 0) {
      if (j % 64 == 0)
        m[0] = 0x80000000;
      m[15] = j * 8;
    }

    for (d = 16; d < 80; d++) {
      m[d] = A(1, m[d - 3] ^ m[d - 8] ^ m[d - 14] ^ m[d - 16]);
    }

    for (d = 0; d < 20; d++) {
      n = A(5, o) + ((p & q) | ((~p) & r)) + s + m[d] + 0x5A827999;
      n &= 0xFFFFFFFF;
      s = r;
      r = q;
      q = A(30, p);
      p = o;
      o = n;
    }

    for (d = 20; d < 40; d++) {
      n = A(5, o) + (p ^ q ^ r) + s + m[d] + 0x6ED9EBA1;
      n &= 0xFFFFFFFF;
      s = r;
      r = q;
      q = A(30, p);
      p = o;
      o = n;
    }

    for (d = 40; d < 60; d++) {
      n = A(5, o) + ((p & q) | (p & r) | (q & r)) + s + m[d] + 0x8F1BBCDC;
      n &= 0xFFFFFFFF;
      s = r;
      r = q;
      q = A(30, p);
      p = o;
      o = n;
    }

    for (d = 60; d < 80; d++) {
      n = A(5, o) + (p ^ q ^ r) + s + m[d] + 0xCA62C1D6;
      n &= 0xFFFFFFFF;
      s = r;
      r = q;
      q = A(30, p);
      p = o;
      o = n;
    }

    c[0] = (c[0] + o) & 0xFFFFFFFF;
    c[1] = (c[1] + p) & 0xFFFFFFFF;
    c[2] = (c[2] + q) & 0xFFFFFFFF;
    c[3] = (c[3] + r) & 0xFFFFFFFF;
    c[4] = (c[4] + s) & 0xFFFFFFFF;
  }
}