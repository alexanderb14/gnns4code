typedef unsigned char BYTE; typedef unsigned int INT32; void A(INT32* a, int b, int c, int d) {
  INT32 e;
  INT32* f;
  int g;

  g = c / 4;
  e = b;
  f = (INT32*)a;
  while (d-- > 0) {
    f++;
  }
  while (g-- > 0) {
    *f++ = e;
  }
}

void B(INT32* a, const BYTE* b, int c) {
  INT32* d;
  BYTE* e;
  INT32 f;
  int g;
  g = c / 4;
  d = (INT32*)a;
  e = (BYTE*)b;

  while (g-- > 0) {
    f = 0;
    f |= 0xFF & *e++;
    f |= (0xFF & *e++) << 8;
    f |= (0xFF & *e++) << 16;
    f |= (0xFF & *e++) << 24;
    *d = f;
    d++;
  }
}

void C(INT32 a[], INT32 b[]) {
  int c;
  INT32 d, e, f, g, h, i, j[80];

  for (c = 0; c < 16; ++c) {
    j[c] = a[c];
  }
  for (c = 16; c < 80; ++c) {
    j[c] = j[c - 3] ^ j[c - 8] ^ j[c - 14] ^ j[c - 16];
  }
  e = b[0];
  f = b[1];
  g = b[2];
  h = b[3];
  i = b[4];

  for (c = 0; c < 20; ++c) {
    d = ((e << 5) | (e >> (32 - 5))) + ((f & g) | (~f & h)) + i + j[c] + 0x5a827999L;
    i = h;
    h = g;
    g = ((f << 30) | (f >> (32 - 30)));
    f = e;
    e = d;
  }
  for (c = 20; c < 40; ++c) {
    d = ((e << 5) | (e >> (32 - 5))) + (f ^ g ^ h) + i + j[c] + 0x6ed9eba1L;
    i = h;
    h = g;
    g = ((f << 30) | (f >> (32 - 30)));
    f = e;
    e = d;
  }
  for (c = 40; c < 60; ++c) {
    d = ((e << 5) | (e >> (32 - 5))) + ((f & g) | (f & h) | (g & h)) + i + j[c] + 0x8f1bbcdcL;
    i = h;
    h = g;
    g = ((f << 30) | (f >> (32 - 30)));
    f = e;
    e = d;
  }
  for (c = 60; c < 80; ++c) {
    d = ((e << 5) | (e >> (32 - 5))) + (f ^ g ^ h) + i + j[c] + 0xca62c1d6L;
    i = h;
    h = g;
    g = ((f << 30) | (f >> (32 - 30)));
    f = e;
    e = d;
  }

  b[0] += e;
  b[1] += f;
  b[2] += g;
  b[3] += h;
  b[4] += i;
}

void D(INT32 a[], INT32* b, INT32* c) {
  a[0] = 0x67452301L;
  a[1] = 0xefcdab89L;
  a[2] = 0x98badcfeL;
  a[3] = 0x10325476L;
  a[4] = 0xc3d2e1f0L;
  *b = 0L;
  *c = 0L;
}

void E(const BYTE* a, int b, INT32 c[], INT32 d[], INT32* e, INT32* f) {
  if (((*e) + ((INT32)b << 3)) < (*e)) {
    ++(*f);
  }
  *e += (INT32)b << 3;
  *f += (INT32)b >> 29;
  while (b >= 64) {
    B(c, a, 64);
    C(c, d);
    a += 64;
    b -= 64;
  }
  B(c, a, b);
}

void F(INT32 a[], INT32 b[], INT32* c, INT32* d) {
  int e;
  INT32 f;
  INT32 g;

  f = *c;
  g = *d;
  e = (int)((f >> 3) & 0x3f);
  a[e++] = 0x80;
  if (e > 56) {
    A(a, 0, 64 - e, e);
    C(a, b);
    A(a, 0, 56, 0);
  } else {
    A(a, 0, 56 - e, e);
  }
  a[14] = g;
  a[15] = f;
  C(a, b);
}

void G(BYTE a[2][8192], int b[2], INT32 c[5]) {
  int d, e;
  const BYTE* f;
  INT32 g, h;
  INT32 i[16];

  D(c, &g, &h);
  for (e = 0; e < 2; e++) {
    d = b[e];
    f = &a[e][0];
    E(f, d, i, c, &g, &h);
  }
  F(i, c, &g, &h);
}

__kernel

    __attribute__((reqd_work_group_size(1, 1, 1))) void
    H(__global BYTE* restrict a, __global int* restrict b) {
  BYTE c[2][8192];
  for (int d = 0; d < 2; d++) {
    for (int e = 0; e < 8192; e++) {
      c[d][e] = a[d * 8192 + e];
    }
  }
  int f[2] = {8192, 8192};
  INT32 g[5];
  G(c, f, g);

  for (int h = 0; h < 5; h++) {
    b[h] = g[h];
  }
}