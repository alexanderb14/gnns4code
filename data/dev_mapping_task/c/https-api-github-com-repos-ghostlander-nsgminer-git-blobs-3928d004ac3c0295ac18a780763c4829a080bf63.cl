void A(uint8* restrict a, const void* restrict b, uint c) {
  uint* d = (uint*)a;
  uint* e = (uint*)b;

  c = ((uint)(((((ulong)c) << 32) | (ulong)c) >> (29U & 0x1F)));

  d[0] = ((uint)(((((ulong)e[1]) << 32) | (ulong)e[0]) >> (c & 0x1F)));
  d[1] = ((uint)(((((ulong)e[2]) << 32) | (ulong)e[1]) >> (c & 0x1F)));
  d[2] = ((uint)(((((ulong)e[3]) << 32) | (ulong)e[2]) >> (c & 0x1F)));
  d[3] = ((uint)(((((ulong)e[4]) << 32) | (ulong)e[3]) >> (c & 0x1F)));
  d[4] = ((uint)(((((ulong)e[5]) << 32) | (ulong)e[4]) >> (c & 0x1F)));
  d[5] = ((uint)(((((ulong)e[6]) << 32) | (ulong)e[5]) >> (c & 0x1F)));
  d[6] = ((uint)(((((ulong)e[7]) << 32) | (ulong)e[6]) >> (c & 0x1F)));
  d[7] = ((uint)(((((ulong)e[8]) << 32) | (ulong)e[7]) >> (c & 0x1F)));
}

void B(uint8* restrict a, const __local void* restrict b, uint c) {
  uint* d = (uint*)a;
  __local uint* e = (__local uint*)b;

  c = ((uint)(((((ulong)c) << 32) | (ulong)c) >> (29U & 0x1F)));

  d[0] = ((uint)(((((ulong)e[1]) << 32) | (ulong)e[0]) >> (c & 0x1F)));
  d[1] = ((uint)(((((ulong)e[2]) << 32) | (ulong)e[1]) >> (c & 0x1F)));
  d[2] = ((uint)(((((ulong)e[3]) << 32) | (ulong)e[2]) >> (c & 0x1F)));
  d[3] = ((uint)(((((ulong)e[4]) << 32) | (ulong)e[3]) >> (c & 0x1F)));
  d[4] = ((uint)(((((ulong)e[5]) << 32) | (ulong)e[4]) >> (c & 0x1F)));
  d[5] = ((uint)(((((ulong)e[6]) << 32) | (ulong)e[5]) >> (c & 0x1F)));
  d[6] = ((uint)(((((ulong)e[7]) << 32) | (ulong)e[6]) >> (c & 0x1F)));
  d[7] = ((uint)(((((ulong)e[8]) << 32) | (ulong)e[7]) >> (c & 0x1F)));
  d[8] = ((uint)(((((ulong)e[9]) << 32) | (ulong)e[8]) >> (c & 0x1F)));
  d[9] = ((uint)(((((ulong)e[10]) << 32) | (ulong)e[9]) >> (c & 0x1F)));
  d[10] = ((uint)(((((ulong)e[11]) << 32) | (ulong)e[10]) >> (c & 0x1F)));
  d[11] = ((uint)(((((ulong)e[12]) << 32) | (ulong)e[11]) >> (c & 0x1F)));
  d[12] = ((uint)(((((ulong)e[13]) << 32) | (ulong)e[12]) >> (c & 0x1F)));
  d[13] = ((uint)(((((ulong)e[14]) << 32) | (ulong)e[13]) >> (c & 0x1F)));
  d[14] = ((uint)(((((ulong)e[15]) << 32) | (ulong)e[14]) >> (c & 0x1F)));
  d[15] = ((uint)(((((ulong)e[16]) << 32) | (ulong)e[15]) >> (c & 0x1F)));
}

void C(uint8* restrict a, const void* restrict b, uint c, uint d) {
  uint* e = (uint*)a;
  uint* f = (uint*)b;
  uint g;

  c = ((uint)(((((ulong)c) << 32) | (ulong)c) >> (29U & 0x1F)));

  d = ((uint)(((((ulong)d) << 32) | (ulong)d) >> (29U & 0x1F)));

  for (g = 0; g < d; g += 8) {
    e[g] = ((uint)(((((ulong)f[g + 1]) << 32) | (ulong)f[g]) >> (c & 0x1F)));
    e[g + 1] = ((uint)(((((ulong)f[g + 2]) << 32) | (ulong)f[g + 1]) >> (c & 0x1F)));
    e[g + 2] = ((uint)(((((ulong)f[g + 3]) << 32) | (ulong)f[g + 2]) >> (c & 0x1F)));
    e[g + 3] = ((uint)(((((ulong)f[g + 4]) << 32) | (ulong)f[g + 3]) >> (c & 0x1F)));
    e[g + 4] = ((uint)(((((ulong)f[g + 5]) << 32) | (ulong)f[g + 4]) >> (c & 0x1F)));
    e[g + 5] = ((uint)(((((ulong)f[g + 6]) << 32) | (ulong)f[g + 5]) >> (c & 0x1F)));
    e[g + 6] = ((uint)(((((ulong)f[g + 7]) << 32) | (ulong)f[g + 6]) >> (c & 0x1F)));
    e[g + 7] = ((uint)(((((ulong)f[g + 8]) << 32) | (ulong)f[g + 7]) >> (c & 0x1F)));
  }
}

void D(uint* restrict a, const uint* restrict b, uint c) {
  c = ((uint)(((((ulong)c) << 32) | (ulong)c) >> (29U & 0x1F)));
  a[0] ^= ((uint)(((((ulong)b[1]) << 32) | (ulong)b[0]) >> (c & 0x1F)));
}

void E(void* restrict a, const uint8* restrict b, uint c) {
  uint* d = (uint*)a;
  uint* e = (uint*)b;
  uint f;
  c <<= 3;
  f = 32U - c;

  d[0] ^= (e[0] << c);
  d[1] ^= ((e[1] << c) | (uint)((ulong)e[0] >> f));
  d[2] ^= ((e[2] << c) | (uint)((ulong)e[1] >> f));
  d[3] ^= ((e[3] << c) | (uint)((ulong)e[2] >> f));
  d[4] ^= ((e[4] << c) | (uint)((ulong)e[3] >> f));
  d[5] ^= ((e[5] << c) | (uint)((ulong)e[4] >> f));
  d[6] ^= ((e[6] << c) | (uint)((ulong)e[5] >> f));
  d[7] ^= ((e[7] << c) | (uint)((ulong)e[6] >> f));
  d[8] ^= (uint)((ulong)e[7] >> f);
}

void F(uint16 __local* restrict a, const uint16* restrict b) {
  a[0] = b[0];
  a[1] = b[1];
}

void G(uint16* restrict a, const uint16* restrict b) {
  a[0] = b[0];
  a[1] = b[1];
  a[2] = b[2];
  a[3] = b[3];
}

void H(uint16* restrict a, const uint16* restrict b) {
  a[0] ^= b[0];
  a[1] ^= b[1];
  a[2] ^= b[2];
  a[3] ^= b[3];
}

void I(uint16* restrict a, uint16* restrict b) {
  a[0] ^= b[0];
  b[0] ^= a[0];
  a[0] ^= b[0];
}

void J(uint16* restrict a, uint16* restrict b) {
  a[0] ^= b[0];
  b[0] ^= a[0];
  a[0] ^= b[0];
  a[1] ^= b[1];
  b[1] ^= a[1];
  a[1] ^= b[1];
  a[2] ^= b[2];
  b[2] ^= a[2];
  a[2] ^= b[2];
  a[3] ^= b[3];
  b[3] ^= a[3];
  a[3] ^= b[3];
}

const __constant uint8 Ga[1] = {(uint8)(0x6A09E667, 0xBB67AE85, 0x3C6EF372, 0xA54FF53A, 0x510E527F, 0x9B05688C, 0x1F83D9AB, 0x5BE0CD19)};

const __constant uint Gb[10][16] = {
    {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, {14, 10, 4, 8, 9, 15, 13, 6, 1, 12, 0, 2, 11, 7, 5, 3}, {11, 8, 12, 0, 5, 2, 15, 13, 10, 14, 3, 6, 7, 1, 9, 4}, {7, 9, 3, 1, 13, 12, 11, 14, 2, 6, 5, 10, 4, 0, 15, 8}, {9, 0, 5, 7, 2, 4, 10, 15, 14, 1, 11, 12, 6, 8, 3, 13},
    {2, 12, 6, 10, 0, 11, 8, 3, 4, 13, 7, 5, 15, 14, 1, 9}, {12, 5, 1, 15, 14, 13, 4, 10, 0, 7, 6, 3, 9, 2, 8, 11}, {13, 11, 7, 14, 12, 1, 3, 9, 5, 0, 15, 4, 8, 6, 2, 10}, {6, 15, 14, 9, 11, 3, 0, 8, 12, 2, 13, 7, 1, 4, 10, 5}, {10, 2, 8, 4, 7, 6, 1, 5, 15, 11, 9, 14, 3, 12, 13, 0},
};
uint16 K(uint16 a) {
  uint b;

  uint16 c = a;
  for (b = 0; b < 5; b++) {
    c.s4 ^= rotate(c.s0 + c.sc, 7U);
    c.s8 ^= rotate(c.s4 + c.s0, 9U);
    c.sc ^= rotate(c.s8 + c.s4, 13U);
    c.s0 ^= rotate(c.sc + c.s8, 18U);
    c.s9 ^= rotate(c.s5 + c.s1, 7U);
    c.sd ^= rotate(c.s9 + c.s5, 9U);
    c.s1 ^= rotate(c.sd + c.s9, 13U);
    c.s5 ^= rotate(c.s1 + c.sd, 18U);
    c.se ^= rotate(c.sa + c.s6, 7U);
    c.s2 ^= rotate(c.se + c.sa, 9U);
    c.s6 ^= rotate(c.s2 + c.se, 13U);
    c.sa ^= rotate(c.s6 + c.s2, 18U);
    c.s3 ^= rotate(c.sf + c.sb, 7U);
    c.s7 ^= rotate(c.s3 + c.sf, 9U);
    c.sb ^= rotate(c.s7 + c.s3, 13U);
    c.sf ^= rotate(c.sb + c.s7, 18U);
    c.s1 ^= rotate(c.s0 + c.s3, 7U);
    c.s2 ^= rotate(c.s1 + c.s0, 9U);
    c.s3 ^= rotate(c.s2 + c.s1, 13U);
    c.s0 ^= rotate(c.s3 + c.s2, 18U);
    c.s6 ^= rotate(c.s5 + c.s4, 7U);
    c.s7 ^= rotate(c.s6 + c.s5, 9U);
    c.s4 ^= rotate(c.s7 + c.s6, 13U);
    c.s5 ^= rotate(c.s4 + c.s7, 18U);
    c.sb ^= rotate(c.sa + c.s9, 7U);
    c.s8 ^= rotate(c.sb + c.sa, 9U);
    c.s9 ^= rotate(c.s8 + c.sb, 13U);
    c.sa ^= rotate(c.s9 + c.s8, 18U);
    c.sc ^= rotate(c.sf + c.se, 7U);
    c.sd ^= rotate(c.sc + c.sf, 9U);
    c.se ^= rotate(c.sd + c.sc, 13U);
    c.sf ^= rotate(c.se + c.sd, 18U);
    ;
    c.s4 ^= rotate(c.s0 + c.sc, 7U);
    c.s8 ^= rotate(c.s4 + c.s0, 9U);
    c.sc ^= rotate(c.s8 + c.s4, 13U);
    c.s0 ^= rotate(c.sc + c.s8, 18U);
    c.s9 ^= rotate(c.s5 + c.s1, 7U);
    c.sd ^= rotate(c.s9 + c.s5, 9U);
    c.s1 ^= rotate(c.sd + c.s9, 13U);
    c.s5 ^= rotate(c.s1 + c.sd, 18U);
    c.se ^= rotate(c.sa + c.s6, 7U);
    c.s2 ^= rotate(c.se + c.sa, 9U);
    c.s6 ^= rotate(c.s2 + c.se, 13U);
    c.sa ^= rotate(c.s6 + c.s2, 18U);
    c.s3 ^= rotate(c.sf + c.sb, 7U);
    c.s7 ^= rotate(c.s3 + c.sf, 9U);
    c.sb ^= rotate(c.s7 + c.s3, 13U);
    c.sf ^= rotate(c.sb + c.s7, 18U);
    c.s1 ^= rotate(c.s0 + c.s3, 7U);
    c.s2 ^= rotate(c.s1 + c.s0, 9U);
    c.s3 ^= rotate(c.s2 + c.s1, 13U);
    c.s0 ^= rotate(c.s3 + c.s2, 18U);
    c.s6 ^= rotate(c.s5 + c.s4, 7U);
    c.s7 ^= rotate(c.s6 + c.s5, 9U);
    c.s4 ^= rotate(c.s7 + c.s6, 13U);
    c.s5 ^= rotate(c.s4 + c.s7, 18U);
    c.sb ^= rotate(c.sa + c.s9, 7U);
    c.s8 ^= rotate(c.sb + c.sa, 9U);
    c.s9 ^= rotate(c.s8 + c.sb, 13U);
    c.sa ^= rotate(c.s9 + c.s8, 18U);
    c.sc ^= rotate(c.sf + c.se, 7U);
    c.sd ^= rotate(c.sc + c.sf, 9U);
    c.se ^= rotate(c.sd + c.sc, 13U);
    c.sf ^= rotate(c.se + c.sd, 18U);
    ;
  }
  return (a + c);
}
uint16 L(uint16 a) {
  uint b;

  uint16 c = a;
  for (b = 0; b < 5; b++) {
    c.s0 += c.s4;
    c.sc = rotate(c.sc ^ c.s0, 16U);
    c.s8 += c.sc;
    c.s4 = rotate(c.s4 ^ c.s8, 12U);
    c.s0 += c.s4;
    c.sc = rotate(c.sc ^ c.s0, 8U);
    c.s8 += c.sc;
    c.s4 = rotate(c.s4 ^ c.s8, 7U);
    c.s1 += c.s5;
    c.sd = rotate(c.sd ^ c.s1, 16U);
    c.s9 += c.sd;
    c.s5 = rotate(c.s5 ^ c.s9, 12U);
    c.s1 += c.s5;
    c.sd = rotate(c.sd ^ c.s1, 8U);
    c.s9 += c.sd;
    c.s5 = rotate(c.s5 ^ c.s9, 7U);
    c.s2 += c.s6;
    c.se = rotate(c.se ^ c.s2, 16U);
    c.sa += c.se;
    c.s6 = rotate(c.s6 ^ c.sa, 12U);
    c.s2 += c.s6;
    c.se = rotate(c.se ^ c.s2, 8U);
    c.sa += c.se;
    c.s6 = rotate(c.s6 ^ c.sa, 7U);
    c.s3 += c.s7;
    c.sf = rotate(c.sf ^ c.s3, 16U);
    c.sb += c.sf;
    c.s7 = rotate(c.s7 ^ c.sb, 12U);
    c.s3 += c.s7;
    c.sf = rotate(c.sf ^ c.s3, 8U);
    c.sb += c.sf;
    c.s7 = rotate(c.s7 ^ c.sb, 7U);
    c.s0 += c.s5;
    c.sf = rotate(c.sf ^ c.s0, 16U);
    c.sa += c.sf;
    c.s5 = rotate(c.s5 ^ c.sa, 12U);
    c.s0 += c.s5;
    c.sf = rotate(c.sf ^ c.s0, 8U);
    c.sa += c.sf;
    c.s5 = rotate(c.s5 ^ c.sa, 7U);
    c.s1 += c.s6;
    c.sc = rotate(c.sc ^ c.s1, 16U);
    c.sb += c.sc;
    c.s6 = rotate(c.s6 ^ c.sb, 12U);
    c.s1 += c.s6;
    c.sc = rotate(c.sc ^ c.s1, 8U);
    c.sb += c.sc;
    c.s6 = rotate(c.s6 ^ c.sb, 7U);
    c.s2 += c.s7;
    c.sd = rotate(c.sd ^ c.s2, 16U);
    c.s8 += c.sd;
    c.s7 = rotate(c.s7 ^ c.s8, 12U);
    c.s2 += c.s7;
    c.sd = rotate(c.sd ^ c.s2, 8U);
    c.s8 += c.sd;
    c.s7 = rotate(c.s7 ^ c.s8, 7U);
    c.s3 += c.s4;
    c.se = rotate(c.se ^ c.s3, 16U);
    c.s9 += c.se;
    c.s4 = rotate(c.s4 ^ c.s9, 12U);
    c.s3 += c.s4;
    c.se = rotate(c.se ^ c.s3, 8U);
    c.s9 += c.se;
    c.s4 = rotate(c.s4 ^ c.s9, 7U);
    ;
    c.s0 += c.s4;
    c.sc = rotate(c.sc ^ c.s0, 16U);
    c.s8 += c.sc;
    c.s4 = rotate(c.s4 ^ c.s8, 12U);
    c.s0 += c.s4;
    c.sc = rotate(c.sc ^ c.s0, 8U);
    c.s8 += c.sc;
    c.s4 = rotate(c.s4 ^ c.s8, 7U);
    c.s1 += c.s5;
    c.sd = rotate(c.sd ^ c.s1, 16U);
    c.s9 += c.sd;
    c.s5 = rotate(c.s5 ^ c.s9, 12U);
    c.s1 += c.s5;
    c.sd = rotate(c.sd ^ c.s1, 8U);
    c.s9 += c.sd;
    c.s5 = rotate(c.s5 ^ c.s9, 7U);
    c.s2 += c.s6;
    c.se = rotate(c.se ^ c.s2, 16U);
    c.sa += c.se;
    c.s6 = rotate(c.s6 ^ c.sa, 12U);
    c.s2 += c.s6;
    c.se = rotate(c.se ^ c.s2, 8U);
    c.sa += c.se;
    c.s6 = rotate(c.s6 ^ c.sa, 7U);
    c.s3 += c.s7;
    c.sf = rotate(c.sf ^ c.s3, 16U);
    c.sb += c.sf;
    c.s7 = rotate(c.s7 ^ c.sb, 12U);
    c.s3 += c.s7;
    c.sf = rotate(c.sf ^ c.s3, 8U);
    c.sb += c.sf;
    c.s7 = rotate(c.s7 ^ c.sb, 7U);
    c.s0 += c.s5;
    c.sf = rotate(c.sf ^ c.s0, 16U);
    c.sa += c.sf;
    c.s5 = rotate(c.s5 ^ c.sa, 12U);
    c.s0 += c.s5;
    c.sf = rotate(c.sf ^ c.s0, 8U);
    c.sa += c.sf;
    c.s5 = rotate(c.s5 ^ c.sa, 7U);
    c.s1 += c.s6;
    c.sc = rotate(c.sc ^ c.s1, 16U);
    c.sb += c.sc;
    c.s6 = rotate(c.s6 ^ c.sb, 12U);
    c.s1 += c.s6;
    c.sc = rotate(c.sc ^ c.s1, 8U);
    c.sb += c.sc;
    c.s6 = rotate(c.s6 ^ c.sb, 7U);
    c.s2 += c.s7;
    c.sd = rotate(c.sd ^ c.s2, 16U);
    c.s8 += c.sd;
    c.s7 = rotate(c.s7 ^ c.s8, 12U);
    c.s2 += c.s7;
    c.sd = rotate(c.sd ^ c.s2, 8U);
    c.s8 += c.sd;
    c.s7 = rotate(c.s7 ^ c.s8, 7U);
    c.s3 += c.s4;
    c.se = rotate(c.se ^ c.s3, 16U);
    c.s9 += c.se;
    c.s4 = rotate(c.s4 ^ c.s9, 12U);
    c.s3 += c.s4;
    c.se = rotate(c.se ^ c.s3, 8U);
    c.s9 += c.se;
    c.s4 = rotate(c.s4 ^ c.s9, 7U);
    ;
  }
  return (a + c);
}
uint M(uint16* a, __local uint16* b) {
  uint c, d, e, f;

  __local uint* g = (__local uint*)&b[0];

  uint4* h = (uint4*)&a[0];
  uint* i = (uint*)&a[0];

  uint8* j = (uint8*)&h[18];
  uint4* k = (uint4*)&h[18];

  uint8* l = (uint8*)&h[20];
  uint* m = (uint*)&h[20];

  for (c = 0, d = 0; c < 32; c++) {
    uint16 n;

    f = d & 0x03;
    A(&l[0], &i[d >> 2], f);

    l[1] = (uint8)(0, 0, 0, 0, 0, 0, 0, 0);

    j[0] = Ga[0];
    n.lo = n.hi = j[0];

    n.s0 ^= 0x01012020U;
    n.sc ^= 64U;
    for (uint o = 0; o < 10; o++) {
      n.s0 += n.s4 + m[Gb[o][0]];
      n.sc = rotate(n.sc ^ n.s0, 16U);
      n.s8 += n.sc;
      n.s4 = rotate(n.s4 ^ n.s8, 20U);
      n.s0 += n.s4 + m[Gb[o][0 + 1]];
      n.sc = rotate(n.sc ^ n.s0, 24U);
      n.s8 += n.sc;
      n.s4 = rotate(n.s4 ^ n.s8, 25U);
      ;
      n.s1 += n.s5 + m[Gb[o][2]];
      n.sd = rotate(n.sd ^ n.s1, 16U);
      n.s9 += n.sd;
      n.s5 = rotate(n.s5 ^ n.s9, 20U);
      n.s1 += n.s5 + m[Gb[o][2 + 1]];
      n.sd = rotate(n.sd ^ n.s1, 24U);
      n.s9 += n.sd;
      n.s5 = rotate(n.s5 ^ n.s9, 25U);
      ;
      n.s2 += n.s6 + m[Gb[o][4]];
      n.se = rotate(n.se ^ n.s2, 16U);
      n.sa += n.se;
      n.s6 = rotate(n.s6 ^ n.sa, 20U);
      n.s2 += n.s6 + m[Gb[o][4 + 1]];
      n.se = rotate(n.se ^ n.s2, 24U);
      n.sa += n.se;
      n.s6 = rotate(n.s6 ^ n.sa, 25U);
      ;
      n.s3 += n.s7 + m[Gb[o][6]];
      n.sf = rotate(n.sf ^ n.s3, 16U);
      n.sb += n.sf;
      n.s7 = rotate(n.s7 ^ n.sb, 20U);
      n.s3 += n.s7 + m[Gb[o][6 + 1]];
      n.sf = rotate(n.sf ^ n.s3, 24U);
      n.sb += n.sf;
      n.s7 = rotate(n.s7 ^ n.sb, 25U);
      ;
      n.s0 += n.s5 + m[Gb[o][8]];
      n.sf = rotate(n.sf ^ n.s0, 16U);
      n.sa += n.sf;
      n.s5 = rotate(n.s5 ^ n.sa, 20U);
      n.s0 += n.s5 + m[Gb[o][8 + 1]];
      n.sf = rotate(n.sf ^ n.s0, 24U);
      n.sa += n.sf;
      n.s5 = rotate(n.s5 ^ n.sa, 25U);
      ;
      n.s1 += n.s6 + m[Gb[o][10]];
      n.sc = rotate(n.sc ^ n.s1, 16U);
      n.sb += n.sc;
      n.s6 = rotate(n.s6 ^ n.sb, 20U);
      n.s1 += n.s6 + m[Gb[o][10 + 1]];
      n.sc = rotate(n.sc ^ n.s1, 24U);
      n.sb += n.sc;
      n.s6 = rotate(n.s6 ^ n.sb, 25U);
      ;
      n.s2 += n.s7 + m[Gb[o][12]];
      n.sd = rotate(n.sd ^ n.s2, 16U);
      n.s8 += n.sd;
      n.s7 = rotate(n.s7 ^ n.s8, 20U);
      n.s2 += n.s7 + m[Gb[o][12 + 1]];
      n.sd = rotate(n.sd ^ n.s2, 24U);
      n.s8 += n.sd;
      n.s7 = rotate(n.s7 ^ n.s8, 25U);
      ;
      n.s3 += n.s4 + m[Gb[o][14]];
      n.se = rotate(n.se ^ n.s3, 16U);
      n.s9 += n.se;
      n.s4 = rotate(n.s4 ^ n.s9, 20U);
      n.s3 += n.s4 + m[Gb[o][14 + 1]];
      n.se = rotate(n.se ^ n.s3, 24U);
      n.s9 += n.se;
      n.s4 = rotate(n.s4 ^ n.s9, 25U);
      ;
    }

    n.lo ^= n.hi ^ j[0];
    n.s0 ^= 0x01012020U;
    n.hi = j[0];
    j[0] = n.lo;
    n.sc ^= 128U;
    n.se ^= 0xFFFFFFFFU;

    e = d - 80U;
    B(&l[0], &g[min(e, d) >> 2], f);

    for (uint o = 0; o < 10; o++) {
      n.s0 += n.s4 + m[Gb[o][0]];
      n.sc = rotate(n.sc ^ n.s0, 16U);
      n.s8 += n.sc;
      n.s4 = rotate(n.s4 ^ n.s8, 20U);
      n.s0 += n.s4 + m[Gb[o][0 + 1]];
      n.sc = rotate(n.sc ^ n.s0, 24U);
      n.s8 += n.sc;
      n.s4 = rotate(n.s4 ^ n.s8, 25U);
      ;
      n.s1 += n.s5 + m[Gb[o][2]];
      n.sd = rotate(n.sd ^ n.s1, 16U);
      n.s9 += n.sd;
      n.s5 = rotate(n.s5 ^ n.s9, 20U);
      n.s1 += n.s5 + m[Gb[o][2 + 1]];
      n.sd = rotate(n.sd ^ n.s1, 24U);
      n.s9 += n.sd;
      n.s5 = rotate(n.s5 ^ n.s9, 25U);
      ;
      n.s2 += n.s6 + m[Gb[o][4]];
      n.se = rotate(n.se ^ n.s2, 16U);
      n.sa += n.se;
      n.s6 = rotate(n.s6 ^ n.sa, 20U);
      n.s2 += n.s6 + m[Gb[o][4 + 1]];
      n.se = rotate(n.se ^ n.s2, 24U);
      n.sa += n.se;
      n.s6 = rotate(n.s6 ^ n.sa, 25U);
      ;
      n.s3 += n.s7 + m[Gb[o][6]];
      n.sf = rotate(n.sf ^ n.s3, 16U);
      n.sb += n.sf;
      n.s7 = rotate(n.s7 ^ n.sb, 20U);
      n.s3 += n.s7 + m[Gb[o][6 + 1]];
      n.sf = rotate(n.sf ^ n.s3, 24U);
      n.sb += n.sf;
      n.s7 = rotate(n.s7 ^ n.sb, 25U);
      ;
      n.s0 += n.s5 + m[Gb[o][8]];
      n.sf = rotate(n.sf ^ n.s0, 16U);
      n.sa += n.sf;
      n.s5 = rotate(n.s5 ^ n.sa, 20U);
      n.s0 += n.s5 + m[Gb[o][8 + 1]];
      n.sf = rotate(n.sf ^ n.s0, 24U);
      n.sa += n.sf;
      n.s5 = rotate(n.s5 ^ n.sa, 25U);
      ;
      n.s1 += n.s6 + m[Gb[o][10]];
      n.sc = rotate(n.sc ^ n.s1, 16U);
      n.sb += n.sc;
      n.s6 = rotate(n.s6 ^ n.sb, 20U);
      n.s1 += n.s6 + m[Gb[o][10 + 1]];
      n.sc = rotate(n.sc ^ n.s1, 24U);
      n.sb += n.sc;
      n.s6 = rotate(n.s6 ^ n.sb, 25U);
      ;
      n.s2 += n.s7 + m[Gb[o][12]];
      n.sd = rotate(n.sd ^ n.s2, 16U);
      n.s8 += n.sd;
      n.s7 = rotate(n.s7 ^ n.s8, 20U);
      n.s2 += n.s7 + m[Gb[o][12 + 1]];
      n.sd = rotate(n.sd ^ n.s2, 24U);
      n.s8 += n.sd;
      n.s7 = rotate(n.s7 ^ n.s8, 25U);
      ;
      n.s3 += n.s4 + m[Gb[o][14]];
      n.se = rotate(n.se ^ n.s3, 16U);
      n.s9 += n.se;
      n.s4 = rotate(n.s4 ^ n.s9, 20U);
      n.s3 += n.s4 + m[Gb[o][14 + 1]];
      n.se = rotate(n.se ^ n.s3, 24U);
      n.s9 += n.se;
      n.s4 = rotate(n.s4 ^ n.s9, 25U);
      ;
    }

    j[0] ^= n.lo ^ n.hi;

    uint8 p;

    p.lo = k[0];
    p.hi = k[1];

    d = p.s0;
    d += rotate(p.s0, 24U);
    d += rotate(p.s0, 16U);
    d += rotate(p.s0, 8U);
    d += p.s1;
    d += rotate(p.s1, 24U);
    d += rotate(p.s1, 16U);
    d += rotate(p.s1, 8U);
    d += p.s2;
    d += rotate(p.s2, 24U);
    d += rotate(p.s2, 16U);
    d += rotate(p.s2, 8U);
    d += p.s3;
    d += rotate(p.s3, 24U);
    d += rotate(p.s3, 16U);
    d += rotate(p.s3, 8U);
    d += p.s4;
    d += rotate(p.s4, 24U);
    d += rotate(p.s4, 16U);
    d += rotate(p.s4, 8U);
    d += p.s5;
    d += rotate(p.s5, 24U);
    d += rotate(p.s5, 16U);
    d += rotate(p.s5, 8U);
    d += p.s6;
    d += rotate(p.s6, 24U);
    d += rotate(p.s6, 16U);
    d += rotate(p.s6, 8U);
    d += p.s7;
    d += rotate(p.s7, 24U);
    d += rotate(p.s7, 16U);
    d += rotate(p.s7, 8U);

    d = convert_uchar(d);
    f = d & 0x03;
    E(&i[d >> 2], &j[0], f);
    if (d < 32U) {
      h[16] = h[0];
      h[17] = h[1];
      continue;
    }

    if (d > 224U) {
      h[0] = h[16];
      h[1] = h[17];
    }
  }

  return (d);
}

__attribute__((reqd_work_group_size(128, 1, 1))) __kernel void N(__global const uint4* restrict a, __global uint* restrict b, __global ulong16* restrict c, const uint d) {
  uint e, f, g, h, i;

  uint j = get_global_id(0);
  uint k = get_group_id(0);
  __global uint16* l = (__global uint16*)&c[mul24(k, (uint)(128 << 8))];

  uint m = j & (128 - 1);
  __local uint16 n[128 << 2];
  __local uint16* o = (__local uint16*)&n[m << 2];

  uint16 p[5];
  uint4* q = (uint4*)&p[0];
  uint* r = (uint*)&p[0];

  uint16 s[4];
  uint8* t = (uint8*)&s[0];

  i = a[1].w;

    const uint4 u = (uint4)(ax, ay, az, j    p[0] = (uint16)(a a a a;
    p[1] = (uint16)(ua a a;
    p[2] = (uint16)(a ua a;
    p[3] = (uint16)(a a ua;
    q[16] = q[0];
    q[17] = q[1];

    F(&o[0], &p[0]);
    o[2] = (uint16)(a ua a;
    o[3] = (uint16)(a a a u
        h = M(p, o);



        uint v = (256 - h + 31) >> 5;
        C(&t[0], &r[h >> 2], h & 0x03, v);
        C(&t[v], &r[(h & 0x1FU) >> 2], h & 0x03, 8U - v);

        p[0] = s[0] ^ o[0];
        p[1] = s[1] ^ o[1];
        p[2] = s[2] ^ (uint16)(a ua a;
        p[3] = s[3] ^ (uint16)(a a ua;


        G(&s[0], &p[0]);


        for(e = 0; e < 2; e++) {

    for (f = 0; f < 128; f++) {
      g = rotate(mad24(f, (uint)128, m), 2U);
      l[g] = p[0];
      l[g + 1] = p[1];
      l[g + 2] = p[2];
      l[g + 3] = p[3];

      p[0] ^= p[3];
      if (e) {
        p[0] = K(p[0]);
        p[1] ^= p[0];
        p[1] = K(p[1]);
        p[2] ^= p[1];
        p[2] = K(p[2]);
        p[3] ^= p[2];
        p[3] = K(p[3]);
      } else {
        p[0] = L(p[0]);
        p[1] ^= p[0];
        p[1] = L(p[1]);
        p[2] ^= p[1];
        p[2] = L(p[2]);
        p[3] ^= p[2];
        p[3] = L(p[3]);
      }
      I(&p[2], &p[1]);
    }

    for (f = 0; f < 128; f++) {
      g = rotate(mad24((((uint*)p)[48] & 0x7F), (uint)128, m), 2U);

      p[0] ^= l[g];
      p[1] ^= l[g + 1];
      p[2] ^= l[g + 2];
      p[3] ^= l[g + 3];

      p[0] ^= p[3];
      if (e) {
        p[0] = K(p[0]);
        p[1] ^= p[0];
        p[1] = K(p[1]);
        p[2] ^= p[1];
        p[2] = K(p[2]);
        p[3] ^= p[2];
        p[3] = K(p[3]);
      } else {
        p[0] = L(p[0]);
        p[1] ^= p[0];
        p[1] = L(p[1]);
        p[2] ^= p[1];
        p[2] = L(p[2]);
        p[3] ^= p[2];
        p[3] = L(p[3]);
      }
      I(&p[2], &p[1]);
    }

    if (e)
      break;

    J(&p[0], &s[0]);

        }


        H(&p[0], &s[0]);


        q[16] = q[0];
        q[17] = q[1];




    h = M(p, o);



    D(&i, &r[(h >> 2) + 7], h & 0x03);
    if(i <= d) b[atomic_add(&b[(0xFF)], 1)] = j;

    return;
}