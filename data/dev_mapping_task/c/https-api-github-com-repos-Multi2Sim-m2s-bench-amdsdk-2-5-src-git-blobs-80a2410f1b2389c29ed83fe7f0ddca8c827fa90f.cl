unsigned char A(unsigned char a, unsigned char b) {
  unsigned char c = 0;
  for (unsigned int d = 0; d < 8; ++d) {
    if ((b & 1) == 1) {
      c ^= a;
    }
    unsigned char e = (a & 0x80);
    a <<= 1;
    if (e == 0x80) {
      a ^= 0x1b;
    }
    b >>= 1;
  }
  return c;
}

inline uchar4 B(__global uchar* a, uchar4 b) {
  return (uchar4)bbbb;
}

uchar4 C(__local uchar4* a, __private uchar4* b, unsigned int c) {
  unsigned int d = 4;

  uchar e, f, g, h;

  e = A(a[0].x, b[(d - c) % d].x);
  f = A(a[0].y, b[(d - c) % d].x);
  g = A(a[0].z, b[(d - c) % d].x);
  h = A(a[0].w, b[(d - c) % d].x);

  for (unsigned int i = 1; i < 4; ++i) {
    e ^= A(a[i].x, b[(i + d - c) % d].x);
    f ^= A(a[i].y, b[(i + d - c) % d].x);
    g ^= A(a[i].z, b[(i + d - c) % d].x);
    h ^= A(a[i].w, b[(i + d - c) % d].x);
  }

  return (uchar4)(e, f, g, h);
}

uchar4 D(uchar4 a, unsigned int b) {
  uchar4 c = a;
  for (uint d = 0; d < b; ++d) {
    c = c.yzwx;
  }
  return c;
}

__kernel void E(__global uchar4* a, __global uchar4* b, __global uchar4* c, __global uchar* d, __local uchar4* e, __local uchar4* f, const uint g, const uint h)

{
  unsigned int i = get_group_id(0);
  unsigned int j = get_group_id(1);

  unsigned int k = get_local_id(0);
  unsigned int l = get_local_id(1);

  unsigned int m = (((j * g / 4) + i) * 4) + (l);
  unsigned int n = l;

  __private uchar4 o[4];
  o[0] = (uchar4)(2, 0, 0, 0);
  o[1] = (uchar4)(3, 0, 0, 0);
  o[2] = (uchar4)(1, 0, 0, 0);
  o[3] = (uchar4)(1, 0, 0, 0);

  e[n] = b[m];

  e[n] ^= c[n];

  for (unsigned int p = 1; p < h; ++p) {
    e[n] = B(d, e[n]);

    e[n] = D(e[n], n);

    barrier(1);
    f[n] = C(e, o, n);

    barrier(1);
    e[n] = f[n] ^ c[p * 4 + n];
  }
  e[n] = B(d, e[n]);

  e[n] = D(e[n], n);

  a[m] = e[n] ^ c[(h)*4 + n];
}

uchar4 F(uchar4 a, unsigned int b) {
  uchar4 c = a;
  for (uint d = 0; d < b; ++d) {
    c = c.wxyz;
  }
  return c;
}

__kernel void G(__global uchar4* a, __global uchar4* b, __global uchar4* c, __global uchar* d, __local uchar4* e, __local uchar4* f, const uint g, const uint h)

{
  unsigned int i = get_group_id(0);
  unsigned int j = get_group_id(1);

  unsigned int k = get_local_id(0);
  unsigned int l = get_local_id(1);

  unsigned int m = (((j * g / 4) + i) * 4) + (l);
  unsigned int n = l;

  __private uchar4 o[4];
  o[0] = (uchar4)(14, 0, 0, 0);
  o[1] = (uchar4)(11, 0, 0, 0);
  o[2] = (uchar4)(13, 0, 0, 0);
  o[3] = (uchar4)(9, 0, 0, 0);

  e[n] = b[m];

  e[n] ^= c[4 * h + n];

  for (unsigned int p = h - 1; p > 0; --p) {
    e[n] = F(e[n], n);

    e[n] = B(d, e[n]);

    barrier(1);
    f[n] = e[n] ^ c[p * 4 + n];

    barrier(1);
    e[n] = C(f, o, n);
  }

  e[n] = F(e[n], n);

  e[n] = B(d, e[n]);

  a[m] = e[n] ^ c[n];
}