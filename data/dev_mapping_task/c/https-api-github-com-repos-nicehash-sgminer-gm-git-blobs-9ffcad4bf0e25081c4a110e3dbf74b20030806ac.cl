void A(void* restrict a, void* restrict b, uint c) {
  for (int d = 0; d < (c >> 7); ++d) {
    ((ulong16*)a)[d] ^= ((ulong16*)b)[d];
    ((ulong16*)b)[d] ^= ((ulong16*)a)[d];
    ((ulong16*)a)[d] ^= ((ulong16*)b)[d];
  }
}

void B(void* restrict a, const void* restrict b, uint c) {
  for (int d = 0; d < c; ++d)
    ((ulong16*)a)[d] = ((ulong16*)b)[d];
}

void C(void* restrict a, const void* restrict b, uint c) {
  for (int d = 0; d < c; ++d)
    ((uchar*)a)[d] = ((uchar*)b)[d];
}

void D(void* restrict a, const void* restrict b, uint c) {
  for (int d = 0; d < c; ++d)
    ((uchar*)a)[d] ^= ((uchar*)b)[d];
}

void E(void* restrict a, const void* restrict b, const void* restrict c, uint d) {
  for (int e = 0; e < d; ++e)
    ((uchar*)a)[e] = ((uchar*)b)[e] ^ ((uchar*)c)[e];
}

const __constant uint Ga[8] = {0x6A09E667, 0xBB67AE85, 0x3C6EF372, 0xA54FF53A, 0x510E527F, 0x9B05688C, 0x1F83D9AB, 0x5BE0CD19};

const __constant uchar Gb[10][16] = {
    {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, {14, 10, 4, 8, 9, 15, 13, 6, 1, 12, 0, 2, 11, 7, 5, 3}, {11, 8, 12, 0, 5, 2, 15, 13, 10, 14, 3, 6, 7, 1, 9, 4}, {7, 9, 3, 1, 13, 12, 11, 14, 2, 6, 5, 10, 4, 0, 15, 8}, {9, 0, 5, 7, 2, 4, 10, 15, 14, 1, 11, 12, 6, 8, 3, 13},
    {2, 12, 6, 10, 0, 11, 8, 3, 4, 13, 7, 5, 15, 14, 1, 9}, {12, 5, 1, 15, 14, 13, 4, 10, 0, 7, 6, 3, 9, 2, 8, 11}, {13, 11, 7, 14, 12, 1, 3, 9, 5, 0, 15, 4, 8, 6, 2, 10}, {6, 15, 14, 9, 11, 3, 0, 8, 12, 2, 13, 7, 1, 4, 10, 5}, {10, 2, 8, 4, 7, 6, 1, 5, 15, 11, 9, 14, 3, 12, 13, 0},
};
void F(uint* restrict a, const uint* restrict b) {
  uint16 c;
  uint8 d;

  c.lo = c.hi = vload8(0U, Ga);

  c.s0 ^= 0x01012020;

  d = c.lo;

  c.sc ^= 64U;

  for (int e = 0; e < 10; ++e) {
    do {
      c.s0123 += c.e4e6e e Gc.scdef = rotate(c.scdef ^ c.s0123, 16U);
      c.s89ab += c.scdef;
      c.s4567 = rotate(c.s4567 ^ c.s89ab, 20U);
      c.s0123 += c.e4e6e e Gc.scdef = rotate(c.scdef ^ c.s0123, 24U);
      c.s89ab += c.scdef;
      c.s4567 = rotate(c.s4567 ^ c.s89ab, 25U);
    } while (0);
    do { c.s0123 += c.s5eee e (uGbc.sfcde = rotate(c.sfcde ^ c.s0123, 16U); c.sab89 += c.sfcde; c.s5674 = rotate(c.s5674 ^ c.sab89, 20U); c.s0123 += c.s5eee e (uGbc.sfcde = rotate(c.sfcde ^ c.s0123, 24U); c.sab89 += c.sfcde; c.s5674 = rotate(c.s5674 ^ c.sab89, 25U);
    } while (0);
  }

  c.lo ^= c.hi ^ d;

  c.hi = vload8(0U, Ga);

  d = c.lo;

  c.sc ^= 64U << 1;

  c.se ^= 0xFFFFFFFFU;

  for (int e = 0; e < 10; ++e) {
    do {
      c.s0123 += c.e4e6e e Gc.scdef = rotate(c.scdef ^ c.s0123, 16U);
      c.s89ab += c.scdef;
      c.s4567 = rotate(c.s4567 ^ c.s89ab, 20U);
      c.s0123 += c.e4e6e e Gc.scdef = rotate(c.scdef ^ c.s0123, 24U);
      c.s89ab += c.scdef;
      c.s4567 = rotate(c.s4567 ^ c.s89ab, 25U);
    } while (0);
    do { c.s0123 += c.s5eee e (uGbc.sfcde = rotate(c.sfcde ^ c.s0123, 16U); c.sab89 += c.sfcde; c.s5674 = rotate(c.s5674 ^ c.sab89, 20U); c.s0123 += c.s5eee e (uGbc.sfcde = rotate(c.sfcde ^ c.s0123, 24U); c.sab89 += c.sfcde; c.s5674 = rotate(c.s5674 ^ c.sab89, 25U);
    } while (0);
  }

  c.lo ^= c.hi ^ d;

  vstore8(c.lo, 0, a);
}

void G(const uchar* restrict a, const uchar* restrict b, const uint c, uchar* restrict d, uint e) {
  uchar f = 0;
  uint8 g[9], h[9] = {(uint8)(0)};
  uchar *i = (uchar *)g, *j = (uchar *)h;

  for (int k = 0; k < (256U >> 3); ++k)
    ((ulong*)i)[k] = ((ulong*)a)[k % 10];

  ((uint16*)(i + 256U))[0] = ((uint16*)a)[0];

  if (c == 256U) {
    ((ulong16*)j)[0] = ((ulong16*)j)[2] = ((ulong16*)b)[0];
    ((ulong16*)j)[1] = ((ulong16*)j)[3] = ((ulong16*)b)[1];
  } else {
    for (int k = 0; k < (256U >> 3); ++k)
      ((ulong*)j)[k] = ((ulong*)b)[k % 10];

    for (int k = 0; k < 10; ++k)
      ((ulong*)(j + 256U))[k] = ((ulong*)b)[k];
  }

  for (int k = 0; k < 32; ++k) {
    uchar l[64U] __attribute__((aligned)), m[64U] __attribute__((aligned)) = {0};

    C(l, i + f, 64U);
    C(m, j + f, 32U);

    uint *n = (uint *)m, *o = (uint *)l;

    uint16 p;
    uint8 q;

    p.lo = p.hi = vload8(0U, Ga);

    p.s0 ^= 0x01012020;

    q = p.lo;

    p.sc ^= 64U;

    for (int r = 0; r < 10; ++r) {
      do {
        p.s0123 += p.r4r6r r Gp.scdef = rotate(p.scdef ^ p.s0123, 16U);
        p.s89ab += p.scdef;
        p.s4567 = rotate(p.s4567 ^ p.s89ab, 20U);
        p.s0123 += p.r4r6r r Gp.scdef = rotate(p.scdef ^ p.s0123, 24U);
        p.s89ab += p.scdef;
        p.s4567 = rotate(p.s4567 ^ p.s89ab, 25U);
      } while (0);
      do { p.s0123 += p.s5rrr r (uGbp.sfcde = rotate(p.sfcde ^ p.s0123, 16U); p.sab89 += p.sfcde; p.s5674 = rotate(p.s5674 ^ p.sab89, 20U); p.s0123 += p.s5rrr r (uGbp.sfcde = rotate(p.sfcde ^ p.s0123, 24U); p.sab89 += p.sfcde; p.s5674 = rotate(p.s5674 ^ p.sab89, 25U);
      } while (0);
    }

    p.lo ^= p.hi ^ q;

    p.hi = vload8(0U, Ga);

    q = p.lo;

    p.sc ^= 64U << 1;

    p.se ^= 0xFFFFFFFFU;

    for (int r = 0; r < 10; ++r) {
      do {
        p.s0123 += p.r4r6r r Gp.scdef = rotate(p.scdef ^ p.s0123, 16U);
        p.s89ab += p.scdef;
        p.s4567 = rotate(p.s4567 ^ p.s89ab, 20U);
        p.s0123 += p.r4r6r r Gp.scdef = rotate(p.scdef ^ p.s0123, 24U);
        p.s89ab += p.scdef;
        p.s4567 = rotate(p.s4567 ^ p.s89ab, 25U);
      } while (0);
      do { p.s0123 += p.s5rrr r (uGbp.sfcde = rotate(p.sfcde ^ p.s0123, 16U); p.sab89 += p.sfcde; p.s5674 = rotate(p.s5674 ^ p.sab89, 20U); p.s0123 += p.s5rrr r (uGbp.sfcde = rotate(p.sfcde ^ p.s0123, 24U); p.sab89 += p.sfcde; p.s5674 = rotate(p.s5674 ^ p.sab89, 25U);
      } while (0);
    }

    p.lo ^= p.hi ^ q;

    vstore8(p.lo, 0, o);

    f = 0;

    for (int r = 0; r < 32U; ++r)
      f += l[r];

    D(j + f, l, 32U);

    if (f < 32U) {
      C(j + 256U + f, j + f, 32U - f);
    } else if ((256U - f) < 32U) {
      C(j, j + 256U, 32U - (256U - f));
    }
  }
  uint s = 256U - f;

  if (s < e) {
    E(d, j + f, i, s);
    E(d + s, j, i + s, e - s);
  } else {
    E(d, j + f, i, e);
  }
}

void H(const uchar a[80], uchar b[256]) {
  uchar c = 0;
  uint8 d[9], e[9] = {(uint8)(0)};
  uchar *f = (uchar *)d, *g = (uchar *)e;

  for (int h = 0; h < (256U >> 3); ++h)
    ((ulong*)g)[h] = ((ulong*)f)[h] = ((ulong*)a)[h % 10];

  ((uint16*)(g + 256U))[0] = ((uint16*)(f + 256U))[0] = ((uint16*)a)[0];

  for (int h = 0; h < 32; ++h) {
    uchar i[64U] __attribute__((aligned)), j[64U] __attribute__((aligned)) = {0};

    C(i, f + c, 64U);
    C(j, g + c, 32U);

    uint *k = (uint *)j, *l = (uint *)i;

    uint4 m[4];
    uint8 n;

    n = vload8(0U, Ga);

    m[0] = m[2] = n.lo;
    m[1] = m[3] = n.hi;

    m[0].s0 ^= 0x01012020U;
    n.lo = m[0];

    m[3].s0 ^= 64U;

    for (int o = 0; o < 10; ++o) {
      do {
        m[0] += omo1o o Gm[3] = rotate(m[3] ^ m[0], 16U);
        m[2] += m[3];
        m[1] = rotate(m[1] ^ m[2], 20U);
        m[0] += omo1o o Gm[3] = rotate(m[3] ^ m[0], 24U);
        m[2] += m[3];
        m[1] = rotate(m[1] ^ m[2], 25U);
      } while (0);
      do { m[0] += m[1].s1ooo o (uGbm[3].s3012 = rotate(m[3].s3012 ^ m[0], 16U); m[2].s2301 += m[3].s3012; m[1].s1230 = rotate(m[1].s1230 ^ m[2].s2301, 20U); m[0] += m[1].s1ooo o (uGbm[3].s3012 = rotate(m[3].s3012 ^ m[0], 24U); m[2].s2301 += m[3].s3012; m[1].s1230 = rotate(m[1].s1230 ^ m[2].s2301, 25U);
      } while (0);
    }

    m[0] ^= m[2] ^ n.lo;
    m[1] ^= m[3] ^ n.hi;

    m[2] = vload4(0U, Ga);
    m[3] = vload4(1U, Ga);

    n.lo = m[0];
    n.hi = m[1];

    m[3].s0 ^= 64U << 1;
    m[3].s2 ^= 0xFFFFFFFFU;

    for (int o = 0; o < 10; ++o) {
      do {
        m[0] += omo1o o Gm[3] = rotate(m[3] ^ m[0], 16U);
        m[2] += m[3];
        m[1] = rotate(m[1] ^ m[2], 20U);
        m[0] += omo1o o Gm[3] = rotate(m[3] ^ m[0], 24U);
        m[2] += m[3];
        m[1] = rotate(m[1] ^ m[2], 25U);
      } while (0);
      do { m[0] += m[1].s1ooo o (uGbm[3].s3012 = rotate(m[3].s3012 ^ m[0], 16U); m[2].s2301 += m[3].s3012; m[1].s1230 = rotate(m[1].s1230 ^ m[2].s2301, 20U); m[0] += m[1].s1ooo o (uGbm[3].s3012 = rotate(m[3].s3012 ^ m[0], 24U); m[2].s2301 += m[3].s3012; m[1].s1230 = rotate(m[1].s1230 ^ m[2].s2301, 25U);
      } while (0);
    }

    m[0] ^= m[2] ^ n.lo;
    m[1] ^= m[3] ^ n.hi;

    vstore4(m[0], 0, l);
    vstore4(m[1], 1, l);
    c = 0;

    for (int o = 0; o < 32U; ++o)
      c += i[o];

    D(g + c, i, 32U);

    if (c < 32U) {
      C(g + 256U + c, g + c, 32U - c);
    } else if ((256U - c) < 32U) {
      C(g, g + 256U, 32U - (256U - c));
    }
  }
  uint p = 256U - c;

  if (p < 256) {
    E(b, g + c, f, p);
    E(b + p, g, f + p, 256 - p);
  } else {
    E(b, g + c, f, 256);
  }
}

void I(const uchar a[80], const uchar b[256], __global uint* restrict c, const uint d) {
  uchar e = 0;
  uint8 f[9], g[9] = {(uint8)(0)};
  uchar *h = (uchar *)f, *i = (uchar *)g;

  for (int j = 0; j < (256U >> 3); ++j)
    ((ulong*)h)[j] = ((ulong*)a)[j % 10];

  ((uint16*)(h + 256U))[0] = ((uint16*)a)[0];

  ((ulong16*)i)[0] = ((ulong16*)i)[2] = ((ulong16*)b)[0];
  ((ulong16*)i)[1] = ((ulong16*)i)[3] = ((ulong16*)b)[1];

  for (int j = 0; j < 32; ++j) {
    uchar k[64U] __attribute__((aligned)), l[64U] __attribute__((aligned)) = {0};

    C(k, h + e, 64U);
    C(l, i + e, 32U);

    uint *m = (uint *)l, *n = (uint *)k;

    uint4 o[4];
    uint8 p;

    p = vload8(0U, Ga);

    o[0] = o[2] = p.lo;
    o[1] = o[3] = p.hi;

    o[0].s0 ^= 0x01012020U;
    p.lo = o[0];

    o[3].s0 ^= 64U;

    for (int q = 0; q < 10; ++q) {
      do {
        o[0] += qoq1q q Go[3] = rotate(o[3] ^ o[0], 16U);
        o[2] += o[3];
        o[1] = rotate(o[1] ^ o[2], 20U);
        o[0] += qoq1q q Go[3] = rotate(o[3] ^ o[0], 24U);
        o[2] += o[3];
        o[1] = rotate(o[1] ^ o[2], 25U);
      } while (0);
      do { o[0] += o[1].s1qqq q (uGbo[3].s3012 = rotate(o[3].s3012 ^ o[0], 16U); o[2].s2301 += o[3].s3012; o[1].s1230 = rotate(o[1].s1230 ^ o[2].s2301, 20U); o[0] += o[1].s1qqq q (uGbo[3].s3012 = rotate(o[3].s3012 ^ o[0], 24U); o[2].s2301 += o[3].s3012; o[1].s1230 = rotate(o[1].s1230 ^ o[2].s2301, 25U);
      } while (0);
    }

    o[0] ^= o[2] ^ p.lo;
    o[1] ^= o[3] ^ p.hi;

    o[2] = vload4(0U, Ga);
    o[3] = vload4(1U, Ga);

    p.lo = o[0];
    p.hi = o[1];

    o[3].s0 ^= 64U << 1;
    o[3].s2 ^= 0xFFFFFFFFU;

    for (int q = 0; q < 10; ++q) {
      do {
        o[0] += qoq1q q Go[3] = rotate(o[3] ^ o[0], 16U);
        o[2] += o[3];
        o[1] = rotate(o[1] ^ o[2], 20U);
        o[0] += qoq1q q Go[3] = rotate(o[3] ^ o[0], 24U);
        o[2] += o[3];
        o[1] = rotate(o[1] ^ o[2], 25U);
      } while (0);
      do { o[0] += o[1].s1qqq q (uGbo[3].s3012 = rotate(o[3].s3012 ^ o[0], 16U); o[2].s2301 += o[3].s3012; o[1].s1230 = rotate(o[1].s1230 ^ o[2].s2301, 20U); o[0] += o[1].s1qqq q (uGbo[3].s3012 = rotate(o[3].s3012 ^ o[0], 24U); o[2].s2301 += o[3].s3012; o[1].s1230 = rotate(o[1].s1230 ^ o[2].s2301, 25U);
      } while (0);
    }

    o[0] ^= o[2] ^ p.lo;
    o[1] ^= o[3] ^ p.hi;

    vstore4(o[0], 0, n);
    vstore4(o[1], 1, n);
    e = 0;

    for (int q = 0; q < 32U; ++q)
      e += k[q];

    D(i + e, k, 32U);

    if (e < 32U) {
      C(i + 256U + e, i + e, 32U - e);
    } else if ((256U - e) < 32U) {
      C(i, i + 256U, 32U - (256U - e));
    }
  }

  uchar r[32];

  for (uint j = 0; j < 32; ++j, ++e)
    r[j] = i[e] ^ h[j];
  if (((uint*)r)[7] <= d)
    c[atomic_add(c + 0xFF, 1)] = get_global_id(0);
}
uint16 J(uint16 a) {
  uint4 b[4] = {(uint4)(a.s4, a.s9, a.se, a.s3), (uint4)(a.s8, a.sd, a.s2, a.s7), (uint4)(a.sc, a.s1, a.s6, a.sb), (uint4)(a.s0, a.s5, a.sa, a.sf)};
  for (int c = 0; c < 3; ++c) {
    do {
      b[0] ^= rotate(b[3] + b[2], 7U);
      b[1] ^= rotate(b[0] + b[3], 9U);
      b[2] ^= rotate(b[1] + b[0], 13U);
      b[3] ^= rotate(b[2] + b[1], 18U);
      b[2] ^= rotate(b[3].wxyz + b[0].zwxy, 7U);
      b[1] ^= rotate(b[2].wxyz + b[3].zwxy, 9U);
      b[0] ^= rotate(b[1].wxyz + b[2].zwxy, 13U);
      b[3] ^= rotate(b[0].wxyz + b[1].zwxy, 18U);
    } while (0);
    do {
      b[0] ^= rotate(b[3] + b[2], 7U);
      b[1] ^= rotate(b[0] + b[3], 9U);
      b[2] ^= rotate(b[1] + b[0], 13U);
      b[3] ^= rotate(b[2] + b[1], 18U);
      b[2] ^= rotate(b[3].wxyz + b[0].zwxy, 7U);
      b[1] ^= rotate(b[2].wxyz + b[3].zwxy, 9U);
      b[0] ^= rotate(b[1].wxyz + b[2].zwxy, 13U);
      b[3] ^= rotate(b[0].wxyz + b[1].zwxy, 18U);
    } while (0);
    if (c == 2)
      break;
    do {
      b[0] ^= rotate(b[3] + b[2], 7U);
      b[1] ^= rotate(b[0] + b[3], 9U);
      b[2] ^= rotate(b[1] + b[0], 13U);
      b[3] ^= rotate(b[2] + b[1], 18U);
      b[2] ^= rotate(b[3].wxyz + b[0].zwxy, 7U);
      b[1] ^= rotate(b[2].wxyz + b[3].zwxy, 9U);
      b[0] ^= rotate(b[1].wxyz + b[2].zwxy, 13U);
      b[3] ^= rotate(b[0].wxyz + b[1].zwxy, 18U);
    } while (0);
    do {
      b[0] ^= rotate(b[3] + b[2], 7U);
      b[1] ^= rotate(b[0] + b[3], 9U);
      b[2] ^= rotate(b[1] + b[0], 13U);
      b[3] ^= rotate(b[2] + b[1], 18U);
      b[2] ^= rotate(b[3].wxyz + b[0].zwxy, 7U);
      b[1] ^= rotate(b[2].wxyz + b[3].zwxy, 9U);
      b[0] ^= rotate(b[1].wxyz + b[2].zwxy, 13U);
      b[3] ^= rotate(b[0].wxyz + b[1].zwxy, 18U);
    } while (0);
  }
 return(a + (uint16)(
  b3].x, b2].y, b1].z, b0].w,
  b0].x, b3].y, b2].z, b1].w,
  b1].x, b0].y, b3].z, b2].w,
  b2].x, b1].y, b0].z, b3].w));
}

uint16 K(uint16 a) {
  uint16 b = a;
  for (int c = 0; c < 3; ++c) {
    do {
      b.s4 ^= rotate(b.s0 + b.sc, 7U);
      b.s8 ^= rotate(b.s4 + b.s0, 9U);
      b.sc ^= rotate(b.s8 + b.s4, 13U);
      b.s0 ^= rotate(b.sc + b.s8, 18U);
      b.s9 ^= rotate(b.s5 + b.s1, 7U);
      b.sd ^= rotate(b.s9 + b.s5, 9U);
      b.s1 ^= rotate(b.sd + b.s9, 13U);
      b.s5 ^= rotate(b.s1 + b.sd, 18U);
      b.se ^= rotate(b.sa + b.s6, 7U);
      b.s2 ^= rotate(b.se + b.sa, 9U);
      b.s6 ^= rotate(b.s2 + b.se, 13U);
      b.sa ^= rotate(b.s6 + b.s2, 18U);
      b.s3 ^= rotate(b.sf + b.sb, 7U);
      b.s7 ^= rotate(b.s3 + b.sf, 9U);
      b.sb ^= rotate(b.s7 + b.s3, 13U);
      b.sf ^= rotate(b.sb + b.s7, 18U);
      b.s1 ^= rotate(b.s0 + b.s3, 7U);
      b.s2 ^= rotate(b.s1 + b.s0, 9U);
      b.s3 ^= rotate(b.s2 + b.s1, 13U);
      b.s0 ^= rotate(b.s3 + b.s2, 18U);
      b.s6 ^= rotate(b.s5 + b.s4, 7U);
      b.s7 ^= rotate(b.s6 + b.s5, 9U);
      b.s4 ^= rotate(b.s7 + b.s6, 13U);
      b.s5 ^= rotate(b.s4 + b.s7, 18U);
      b.sb ^= rotate(b.sa + b.s9, 7U);
      b.s8 ^= rotate(b.sb + b.sa, 9U);
      b.s9 ^= rotate(b.s8 + b.sb, 13U);
      b.sa ^= rotate(b.s9 + b.s8, 18U);
      b.sc ^= rotate(b.sf + b.se, 7U);
      b.sd ^= rotate(b.sc + b.sf, 9U);
      b.se ^= rotate(b.sd + b.sc, 13U);
      b.sf ^= rotate(b.se + b.sd, 18U);
    } while (0);
    do {
      b.s4 ^= rotate(b.s0 + b.sc, 7U);
      b.s8 ^= rotate(b.s4 + b.s0, 9U);
      b.sc ^= rotate(b.s8 + b.s4, 13U);
      b.s0 ^= rotate(b.sc + b.s8, 18U);
      b.s9 ^= rotate(b.s5 + b.s1, 7U);
      b.sd ^= rotate(b.s9 + b.s5, 9U);
      b.s1 ^= rotate(b.sd + b.s9, 13U);
      b.s5 ^= rotate(b.s1 + b.sd, 18U);
      b.se ^= rotate(b.sa + b.s6, 7U);
      b.s2 ^= rotate(b.se + b.sa, 9U);
      b.s6 ^= rotate(b.s2 + b.se, 13U);
      b.sa ^= rotate(b.s6 + b.s2, 18U);
      b.s3 ^= rotate(b.sf + b.sb, 7U);
      b.s7 ^= rotate(b.s3 + b.sf, 9U);
      b.sb ^= rotate(b.s7 + b.s3, 13U);
      b.sf ^= rotate(b.sb + b.s7, 18U);
      b.s1 ^= rotate(b.s0 + b.s3, 7U);
      b.s2 ^= rotate(b.s1 + b.s0, 9U);
      b.s3 ^= rotate(b.s2 + b.s1, 13U);
      b.s0 ^= rotate(b.s3 + b.s2, 18U);
      b.s6 ^= rotate(b.s5 + b.s4, 7U);
      b.s7 ^= rotate(b.s6 + b.s5, 9U);
      b.s4 ^= rotate(b.s7 + b.s6, 13U);
      b.s5 ^= rotate(b.s4 + b.s7, 18U);
      b.sb ^= rotate(b.sa + b.s9, 7U);
      b.s8 ^= rotate(b.sb + b.sa, 9U);
      b.s9 ^= rotate(b.s8 + b.sb, 13U);
      b.sa ^= rotate(b.s9 + b.s8, 18U);
      b.sc ^= rotate(b.sf + b.se, 7U);
      b.sd ^= rotate(b.sc + b.sf, 9U);
      b.se ^= rotate(b.sd + b.sc, 13U);
      b.sf ^= rotate(b.se + b.sd, 18U);
    } while (0);
    if (c == 2)
      break;
    do {
      b.s4 ^= rotate(b.s0 + b.sc, 7U);
      b.s8 ^= rotate(b.s4 + b.s0, 9U);
      b.sc ^= rotate(b.s8 + b.s4, 13U);
      b.s0 ^= rotate(b.sc + b.s8, 18U);
      b.s9 ^= rotate(b.s5 + b.s1, 7U);
      b.sd ^= rotate(b.s9 + b.s5, 9U);
      b.s1 ^= rotate(b.sd + b.s9, 13U);
      b.s5 ^= rotate(b.s1 + b.sd, 18U);
      b.se ^= rotate(b.sa + b.s6, 7U);
      b.s2 ^= rotate(b.se + b.sa, 9U);
      b.s6 ^= rotate(b.s2 + b.se, 13U);
      b.sa ^= rotate(b.s6 + b.s2, 18U);
      b.s3 ^= rotate(b.sf + b.sb, 7U);
      b.s7 ^= rotate(b.s3 + b.sf, 9U);
      b.sb ^= rotate(b.s7 + b.s3, 13U);
      b.sf ^= rotate(b.sb + b.s7, 18U);
      b.s1 ^= rotate(b.s0 + b.s3, 7U);
      b.s2 ^= rotate(b.s1 + b.s0, 9U);
      b.s3 ^= rotate(b.s2 + b.s1, 13U);
      b.s0 ^= rotate(b.s3 + b.s2, 18U);
      b.s6 ^= rotate(b.s5 + b.s4, 7U);
      b.s7 ^= rotate(b.s6 + b.s5, 9U);
      b.s4 ^= rotate(b.s7 + b.s6, 13U);
      b.s5 ^= rotate(b.s4 + b.s7, 18U);
      b.sb ^= rotate(b.sa + b.s9, 7U);
      b.s8 ^= rotate(b.sb + b.sa, 9U);
      b.s9 ^= rotate(b.s8 + b.sb, 13U);
      b.sa ^= rotate(b.s9 + b.s8, 18U);
      b.sc ^= rotate(b.sf + b.se, 7U);
      b.sd ^= rotate(b.sc + b.sf, 9U);
      b.se ^= rotate(b.sd + b.sc, 13U);
      b.sf ^= rotate(b.se + b.sd, 18U);
    } while (0);
    do {
      b.s4 ^= rotate(b.s0 + b.sc, 7U);
      b.s8 ^= rotate(b.s4 + b.s0, 9U);
      b.sc ^= rotate(b.s8 + b.s4, 13U);
      b.s0 ^= rotate(b.sc + b.s8, 18U);
      b.s9 ^= rotate(b.s5 + b.s1, 7U);
      b.sd ^= rotate(b.s9 + b.s5, 9U);
      b.s1 ^= rotate(b.sd + b.s9, 13U);
      b.s5 ^= rotate(b.s1 + b.sd, 18U);
      b.se ^= rotate(b.sa + b.s6, 7U);
      b.s2 ^= rotate(b.se + b.sa, 9U);
      b.s6 ^= rotate(b.s2 + b.se, 13U);
      b.sa ^= rotate(b.s6 + b.s2, 18U);
      b.s3 ^= rotate(b.sf + b.sb, 7U);
      b.s7 ^= rotate(b.s3 + b.sf, 9U);
      b.sb ^= rotate(b.s7 + b.s3, 13U);
      b.sf ^= rotate(b.sb + b.s7, 18U);
      b.s1 ^= rotate(b.s0 + b.s3, 7U);
      b.s2 ^= rotate(b.s1 + b.s0, 9U);
      b.s3 ^= rotate(b.s2 + b.s1, 13U);
      b.s0 ^= rotate(b.s3 + b.s2, 18U);
      b.s6 ^= rotate(b.s5 + b.s4, 7U);
      b.s7 ^= rotate(b.s6 + b.s5, 9U);
      b.s4 ^= rotate(b.s7 + b.s6, 13U);
      b.s5 ^= rotate(b.s4 + b.s7, 18U);
      b.sb ^= rotate(b.sa + b.s9, 7U);
      b.s8 ^= rotate(b.sb + b.sa, 9U);
      b.s9 ^= rotate(b.s8 + b.sb, 13U);
      b.sa ^= rotate(b.s9 + b.s8, 18U);
      b.sc ^= rotate(b.sf + b.se, 7U);
      b.sd ^= rotate(b.sc + b.sf, 9U);
      b.se ^= rotate(b.sd + b.sc, 13U);
      b.sf ^= rotate(b.se + b.sd, 18U);
    } while (0);
  }
  return (a + b);
}
uint16 L(uint16 a) {
  uint4 b[4];

  ((uint16*)b)[0] = a;
  for (int c = 0; c < 3; ++c) {
    do {
      b[0] += b[1];
      b[3] = rotate(b[3] ^ b[0], 16U);
      b[2] += b[3];
      b[1] = rotate(b[1] ^ b[2], 12U);
      b[0] += b[1];
      b[3] = rotate(b[3] ^ b[0], 8U);
      b[2] += b[3];
      b[1] = rotate(b[1] ^ b[2], 7U);
      b[0] += b[1].yzwx;
      b[3].wxyz = rotate(b[3].wxyz ^ b[0], 16);
      b[2].zwxy += b[3].wxyz;
      b[1].yzwx = rotate(b[1].yzwx ^ b[2].zwxy, 12U);
      b[0] += b[1].yzwx;
      b[3].wxyz = rotate(b[3].wxyz ^ b[0], 8U);
      b[2].zwxy += b[3].wxyz;
      b[1].yzwx = rotate(b[1].yzwx ^ b[2].zwxy, 7U);
    } while (0);
    do {
      b[0] += b[1];
      b[3] = rotate(b[3] ^ b[0], 16U);
      b[2] += b[3];
      b[1] = rotate(b[1] ^ b[2], 12U);
      b[0] += b[1];
      b[3] = rotate(b[3] ^ b[0], 8U);
      b[2] += b[3];
      b[1] = rotate(b[1] ^ b[2], 7U);
      b[0] += b[1].yzwx;
      b[3].wxyz = rotate(b[3].wxyz ^ b[0], 16);
      b[2].zwxy += b[3].wxyz;
      b[1].yzwx = rotate(b[1].yzwx ^ b[2].zwxy, 12U);
      b[0] += b[1].yzwx;
      b[3].wxyz = rotate(b[3].wxyz ^ b[0], 8U);
      b[2].zwxy += b[3].wxyz;
      b[1].yzwx = rotate(b[1].yzwx ^ b[2].zwxy, 7U);
    } while (0);
    if (c == 2)
      break;
    do {
      b[0] += b[1];
      b[3] = rotate(b[3] ^ b[0], 16U);
      b[2] += b[3];
      b[1] = rotate(b[1] ^ b[2], 12U);
      b[0] += b[1];
      b[3] = rotate(b[3] ^ b[0], 8U);
      b[2] += b[3];
      b[1] = rotate(b[1] ^ b[2], 7U);
      b[0] += b[1].yzwx;
      b[3].wxyz = rotate(b[3].wxyz ^ b[0], 16);
      b[2].zwxy += b[3].wxyz;
      b[1].yzwx = rotate(b[1].yzwx ^ b[2].zwxy, 12U);
      b[0] += b[1].yzwx;
      b[3].wxyz = rotate(b[3].wxyz ^ b[0], 8U);
      b[2].zwxy += b[3].wxyz;
      b[1].yzwx = rotate(b[1].yzwx ^ b[2].zwxy, 7U);
    } while (0);
    do {
      b[0] += b[1];
      b[3] = rotate(b[3] ^ b[0], 16U);
      b[2] += b[3];
      b[1] = rotate(b[1] ^ b[2], 12U);
      b[0] += b[1];
      b[3] = rotate(b[3] ^ b[0], 8U);
      b[2] += b[3];
      b[1] = rotate(b[1] ^ b[2], 7U);
      b[0] += b[1].yzwx;
      b[3].wxyz = rotate(b[3].wxyz ^ b[0], 16);
      b[2].zwxy += b[3].wxyz;
      b[1].yzwx = rotate(b[1].yzwx ^ b[2].zwxy, 12U);
      b[0] += b[1].yzwx;
      b[3].wxyz = rotate(b[3].wxyz ^ b[0], 8U);
      b[2].zwxy += b[3].wxyz;
      b[1].yzwx = rotate(b[1].yzwx ^ b[2].zwxy, 7U);
    } while (0);
  }
  return (a + ((uint16*)b)[0]);
}

uint16 M(uint16 a) {
  uint16 b = a;
  for (int c = 0; c < 3; ++c) {
    do {
      b.s0 += b.s4;
      b.sc = __builtin_astype(__builtin_astype(b.sc ^ b.s0, ushort2).s10, uint);
      b.s8 += b.sc;
      b.s4 = rotate(b.s4 ^ b.s8, 12U);
      b.s0 += b.s4;
      b.sc = rotate(b.sc ^ b.s0, 8U);
      b.s8 += b.sc;
      b.s4 = rotate(b.s4 ^ b.s8, 7U);
      b.s1 += b.s5;
      b.sd = __builtin_astype(__builtin_astype(b.sd ^ b.s1, ushort2).s10, uint);
      b.s9 += b.sd;
      b.s5 = rotate(b.s5 ^ b.s9, 12U);
      b.s1 += b.s5;
      b.sd = rotate(b.sd ^ b.s1, 8U);
      b.s9 += b.sd;
      b.s5 = rotate(b.s5 ^ b.s9, 7U);
      b.s2 += b.s6;
      b.se = __builtin_astype(__builtin_astype(b.se ^ b.s2, ushort2).s10, uint);
      b.sa += b.se;
      b.s6 = rotate(b.s6 ^ b.sa, 12U);
      b.s2 += b.s6;
      b.se = rotate(b.se ^ b.s2, 8U);
      b.sa += b.se;
      b.s6 = rotate(b.s6 ^ b.sa, 7U);
      b.s3 += b.s7;
      b.sf = __builtin_astype(__builtin_astype(b.sf ^ b.s3, ushort2).s10, uint);
      b.sb += b.sf;
      b.s7 = rotate(b.s7 ^ b.sb, 12U);
      b.s3 += b.s7;
      b.sf = rotate(b.sf ^ b.s3, 8U);
      b.sb += b.sf;
      b.s7 = rotate(b.s7 ^ b.sb, 7U);
      b.s0 += b.s5;
      b.sf = __builtin_astype(__builtin_astype(b.sf ^ b.s0, ushort2).s10, uint);
      b.sa += b.sf;
      b.s5 = rotate(b.s5 ^ b.sa, 12U);
      b.s0 += b.s5;
      b.sf = rotate(b.sf ^ b.s0, 8U);
      b.sa += b.sf;
      b.s5 = rotate(b.s5 ^ b.sa, 7U);
      b.s1 += b.s6;
      b.sc = __builtin_astype(__builtin_astype(b.sc ^ b.s1, ushort2).s10, uint);
      b.sb += b.sc;
      b.s6 = rotate(b.s6 ^ b.sb, 12U);
      b.s1 += b.s6;
      b.sc = rotate(b.sc ^ b.s1, 8U);
      b.sb += b.sc;
      b.s6 = rotate(b.s6 ^ b.sb, 7U);
      b.s2 += b.s7;
      b.sd = __builtin_astype(__builtin_astype(b.sd ^ b.s2, ushort2).s10, uint);
      b.s8 += b.sd;
      b.s7 = rotate(b.s7 ^ b.s8, 12U);
      b.s2 += b.s7;
      b.sd = rotate(b.sd ^ b.s2, 8U);
      b.s8 += b.sd;
      b.s7 = rotate(b.s7 ^ b.s8, 7U);
      b.s3 += b.s4;
      b.se = __builtin_astype(__builtin_astype(b.se ^ b.s3, ushort2).s10, uint);
      b.s9 += b.se;
      b.s4 = rotate(b.s4 ^ b.s9, 12U);
      b.s3 += b.s4;
      b.se = rotate(b.se ^ b.s3, 8U);
      b.s9 += b.se;
      b.s4 = rotate(b.s4 ^ b.s9, 7U);
    } while (0);
    do {
      b.s0 += b.s4;
      b.sc = __builtin_astype(__builtin_astype(b.sc ^ b.s0, ushort2).s10, uint);
      b.s8 += b.sc;
      b.s4 = rotate(b.s4 ^ b.s8, 12U);
      b.s0 += b.s4;
      b.sc = rotate(b.sc ^ b.s0, 8U);
      b.s8 += b.sc;
      b.s4 = rotate(b.s4 ^ b.s8, 7U);
      b.s1 += b.s5;
      b.sd = __builtin_astype(__builtin_astype(b.sd ^ b.s1, ushort2).s10, uint);
      b.s9 += b.sd;
      b.s5 = rotate(b.s5 ^ b.s9, 12U);
      b.s1 += b.s5;
      b.sd = rotate(b.sd ^ b.s1, 8U);
      b.s9 += b.sd;
      b.s5 = rotate(b.s5 ^ b.s9, 7U);
      b.s2 += b.s6;
      b.se = __builtin_astype(__builtin_astype(b.se ^ b.s2, ushort2).s10, uint);
      b.sa += b.se;
      b.s6 = rotate(b.s6 ^ b.sa, 12U);
      b.s2 += b.s6;
      b.se = rotate(b.se ^ b.s2, 8U);
      b.sa += b.se;
      b.s6 = rotate(b.s6 ^ b.sa, 7U);
      b.s3 += b.s7;
      b.sf = __builtin_astype(__builtin_astype(b.sf ^ b.s3, ushort2).s10, uint);
      b.sb += b.sf;
      b.s7 = rotate(b.s7 ^ b.sb, 12U);
      b.s3 += b.s7;
      b.sf = rotate(b.sf ^ b.s3, 8U);
      b.sb += b.sf;
      b.s7 = rotate(b.s7 ^ b.sb, 7U);
      b.s0 += b.s5;
      b.sf = __builtin_astype(__builtin_astype(b.sf ^ b.s0, ushort2).s10, uint);
      b.sa += b.sf;
      b.s5 = rotate(b.s5 ^ b.sa, 12U);
      b.s0 += b.s5;
      b.sf = rotate(b.sf ^ b.s0, 8U);
      b.sa += b.sf;
      b.s5 = rotate(b.s5 ^ b.sa, 7U);
      b.s1 += b.s6;
      b.sc = __builtin_astype(__builtin_astype(b.sc ^ b.s1, ushort2).s10, uint);
      b.sb += b.sc;
      b.s6 = rotate(b.s6 ^ b.sb, 12U);
      b.s1 += b.s6;
      b.sc = rotate(b.sc ^ b.s1, 8U);
      b.sb += b.sc;
      b.s6 = rotate(b.s6 ^ b.sb, 7U);
      b.s2 += b.s7;
      b.sd = __builtin_astype(__builtin_astype(b.sd ^ b.s2, ushort2).s10, uint);
      b.s8 += b.sd;
      b.s7 = rotate(b.s7 ^ b.s8, 12U);
      b.s2 += b.s7;
      b.sd = rotate(b.sd ^ b.s2, 8U);
      b.s8 += b.sd;
      b.s7 = rotate(b.s7 ^ b.s8, 7U);
      b.s3 += b.s4;
      b.se = __builtin_astype(__builtin_astype(b.se ^ b.s3, ushort2).s10, uint);
      b.s9 += b.se;
      b.s4 = rotate(b.s4 ^ b.s9, 12U);
      b.s3 += b.s4;
      b.se = rotate(b.se ^ b.s3, 8U);
      b.s9 += b.se;
      b.s4 = rotate(b.s4 ^ b.s9, 7U);
    } while (0);
    if (c == 2)
      break;
    do {
      b.s0 += b.s4;
      b.sc = __builtin_astype(__builtin_astype(b.sc ^ b.s0, ushort2).s10, uint);
      b.s8 += b.sc;
      b.s4 = rotate(b.s4 ^ b.s8, 12U);
      b.s0 += b.s4;
      b.sc = rotate(b.sc ^ b.s0, 8U);
      b.s8 += b.sc;
      b.s4 = rotate(b.s4 ^ b.s8, 7U);
      b.s1 += b.s5;
      b.sd = __builtin_astype(__builtin_astype(b.sd ^ b.s1, ushort2).s10, uint);
      b.s9 += b.sd;
      b.s5 = rotate(b.s5 ^ b.s9, 12U);
      b.s1 += b.s5;
      b.sd = rotate(b.sd ^ b.s1, 8U);
      b.s9 += b.sd;
      b.s5 = rotate(b.s5 ^ b.s9, 7U);
      b.s2 += b.s6;
      b.se = __builtin_astype(__builtin_astype(b.se ^ b.s2, ushort2).s10, uint);
      b.sa += b.se;
      b.s6 = rotate(b.s6 ^ b.sa, 12U);
      b.s2 += b.s6;
      b.se = rotate(b.se ^ b.s2, 8U);
      b.sa += b.se;
      b.s6 = rotate(b.s6 ^ b.sa, 7U);
      b.s3 += b.s7;
      b.sf = __builtin_astype(__builtin_astype(b.sf ^ b.s3, ushort2).s10, uint);
      b.sb += b.sf;
      b.s7 = rotate(b.s7 ^ b.sb, 12U);
      b.s3 += b.s7;
      b.sf = rotate(b.sf ^ b.s3, 8U);
      b.sb += b.sf;
      b.s7 = rotate(b.s7 ^ b.sb, 7U);
      b.s0 += b.s5;
      b.sf = __builtin_astype(__builtin_astype(b.sf ^ b.s0, ushort2).s10, uint);
      b.sa += b.sf;
      b.s5 = rotate(b.s5 ^ b.sa, 12U);
      b.s0 += b.s5;
      b.sf = rotate(b.sf ^ b.s0, 8U);
      b.sa += b.sf;
      b.s5 = rotate(b.s5 ^ b.sa, 7U);
      b.s1 += b.s6;
      b.sc = __builtin_astype(__builtin_astype(b.sc ^ b.s1, ushort2).s10, uint);
      b.sb += b.sc;
      b.s6 = rotate(b.s6 ^ b.sb, 12U);
      b.s1 += b.s6;
      b.sc = rotate(b.sc ^ b.s1, 8U);
      b.sb += b.sc;
      b.s6 = rotate(b.s6 ^ b.sb, 7U);
      b.s2 += b.s7;
      b.sd = __builtin_astype(__builtin_astype(b.sd ^ b.s2, ushort2).s10, uint);
      b.s8 += b.sd;
      b.s7 = rotate(b.s7 ^ b.s8, 12U);
      b.s2 += b.s7;
      b.sd = rotate(b.sd ^ b.s2, 8U);
      b.s8 += b.sd;
      b.s7 = rotate(b.s7 ^ b.s8, 7U);
      b.s3 += b.s4;
      b.se = __builtin_astype(__builtin_astype(b.se ^ b.s3, ushort2).s10, uint);
      b.s9 += b.se;
      b.s4 = rotate(b.s4 ^ b.s9, 12U);
      b.s3 += b.s4;
      b.se = rotate(b.se ^ b.s3, 8U);
      b.s9 += b.se;
      b.s4 = rotate(b.s4 ^ b.s9, 7U);
    } while (0);
    do {
      b.s0 += b.s4;
      b.sc = __builtin_astype(__builtin_astype(b.sc ^ b.s0, ushort2).s10, uint);
      b.s8 += b.sc;
      b.s4 = rotate(b.s4 ^ b.s8, 12U);
      b.s0 += b.s4;
      b.sc = rotate(b.sc ^ b.s0, 8U);
      b.s8 += b.sc;
      b.s4 = rotate(b.s4 ^ b.s8, 7U);
      b.s1 += b.s5;
      b.sd = __builtin_astype(__builtin_astype(b.sd ^ b.s1, ushort2).s10, uint);
      b.s9 += b.sd;
      b.s5 = rotate(b.s5 ^ b.s9, 12U);
      b.s1 += b.s5;
      b.sd = rotate(b.sd ^ b.s1, 8U);
      b.s9 += b.sd;
      b.s5 = rotate(b.s5 ^ b.s9, 7U);
      b.s2 += b.s6;
      b.se = __builtin_astype(__builtin_astype(b.se ^ b.s2, ushort2).s10, uint);
      b.sa += b.se;
      b.s6 = rotate(b.s6 ^ b.sa, 12U);
      b.s2 += b.s6;
      b.se = rotate(b.se ^ b.s2, 8U);
      b.sa += b.se;
      b.s6 = rotate(b.s6 ^ b.sa, 7U);
      b.s3 += b.s7;
      b.sf = __builtin_astype(__builtin_astype(b.sf ^ b.s3, ushort2).s10, uint);
      b.sb += b.sf;
      b.s7 = rotate(b.s7 ^ b.sb, 12U);
      b.s3 += b.s7;
      b.sf = rotate(b.sf ^ b.s3, 8U);
      b.sb += b.sf;
      b.s7 = rotate(b.s7 ^ b.sb, 7U);
      b.s0 += b.s5;
      b.sf = __builtin_astype(__builtin_astype(b.sf ^ b.s0, ushort2).s10, uint);
      b.sa += b.sf;
      b.s5 = rotate(b.s5 ^ b.sa, 12U);
      b.s0 += b.s5;
      b.sf = rotate(b.sf ^ b.s0, 8U);
      b.sa += b.sf;
      b.s5 = rotate(b.s5 ^ b.sa, 7U);
      b.s1 += b.s6;
      b.sc = __builtin_astype(__builtin_astype(b.sc ^ b.s1, ushort2).s10, uint);
      b.sb += b.sc;
      b.s6 = rotate(b.s6 ^ b.sb, 12U);
      b.s1 += b.s6;
      b.sc = rotate(b.sc ^ b.s1, 8U);
      b.sb += b.sc;
      b.s6 = rotate(b.s6 ^ b.sb, 7U);
      b.s2 += b.s7;
      b.sd = __builtin_astype(__builtin_astype(b.sd ^ b.s2, ushort2).s10, uint);
      b.s8 += b.sd;
      b.s7 = rotate(b.s7 ^ b.s8, 12U);
      b.s2 += b.s7;
      b.sd = rotate(b.sd ^ b.s2, 8U);
      b.s8 += b.sd;
      b.s7 = rotate(b.s7 ^ b.s8, 7U);
      b.s3 += b.s4;
      b.se = __builtin_astype(__builtin_astype(b.se ^ b.s3, ushort2).s10, uint);
      b.s9 += b.se;
      b.s4 = rotate(b.s4 ^ b.s9, 12U);
      b.s3 += b.s4;
      b.se = rotate(b.se ^ b.s3, 8U);
      b.s9 += b.se;
      b.s4 = rotate(b.s4 ^ b.s9, 7U);
    } while (0);
  }
  return (a + b);
}

void N(uint16 a[4]) {
  a[0] ^= a[3];

  a[0] = J(a[0]);
  a[1] ^= a[0];
  a[1] = J(a[1]);
  a[2] ^= a[1];
  a[2] = J(a[2]);
  a[3] ^= a[2];
  a[3] = J(a[3]);

  a[1] ^= a[2];
  a[2] ^= a[1];
  a[1] ^= a[2];
}

void O(uint16 a[4]) {
  a[0] ^= a[3];

  a[0] = L(a[0]);
  a[1] ^= a[0];
  a[1] = L(a[1]);
  a[2] ^= a[1];
  a[2] = L(a[2]);
  a[3] ^= a[2];
  a[3] = L(a[3]);
  a[1] ^= a[2];
  a[2] ^= a[1];
  a[1] ^= a[2];
}
void P(__global void* a, void* b, uchar c) {
  ((__global ulong16*)a)[mul24(c << 1, (int)get_global_size(0))] = ((ulong16*)b)[0];
  ((__global ulong16*)a)[mul24((c << 1) + 1, (int)get_global_size(0))] = ((ulong16*)b)[1];
}

void Q(void* a, const __global void* b, uchar c) {
  ((ulong16*)a)[0] ^= ((__global ulong16*)b)[mul24(c << 1, (int)get_global_size(0))];
  ((ulong16*)a)[1] ^= ((__global ulong16*)b)[mul24((c << 1) + 1, (int)get_global_size(0))];
}
void R(uint16 a[4], __global uint16* b) {
  for (int c = 0; c < 128; ++c) {
    P(b, a, c);
    N(a);
  }

  for (int c = 0; c < 128; ++c) {
    const uint d = convert_uchar(((uint*)a)[48] & 0x7F);

    Q(a, b, d);
    N(a);
  }
}

void S(uint16 a[4], __global uint16* b) {
  for (int c = 0; c < 128; ++c) {
    P(b, a, c);
    O(a);
  }

  for (int c = 0; c < 128; ++c) {
    const uint d = convert_uchar(((uint*)a)[48] & 0x7F);
    Q(a, b, d);
    O(a);
  }
}

__attribute__((reqd_work_group_size(128, 1, 1))) __kernel void T(__global const uchar* restrict a, __global uint* restrict b, __global uchar* c, const uint d) {
  uint16 e[4], f[4];

  __global ulong16* g = ((__global ulong16*)(c) + (get_global_id(0) % get_global_size(0)));

  uchar h[80U];

  ((ulong8*)h)[0] = ((__global const ulong8*)a)[0];
  ((ulong*)h)[8] = ((__global const ulong*)a)[8];
  ((uint*)h)[18] = ((__global const uint*)a)[18];
  ((uint*)h)[19] = get_global_id(0);

  H(h, (uchar*)e);

  B(f, e, 2);
  for (int i = 0;; ++i) {
    if (i)
      S(e, g);
    else
      R(f, g);
    if (i)
      break;
  }
  ((ulong16*)e)[0] ^= ((ulong16*)f)[0];
  ((ulong16*)e)[1] ^= ((ulong16*)f)[1];

  I(h, (uchar*)e, b, d);
}