void A(__global uchar* a, char* b, __global uchar* c, int d) {
  int e, f;
  uint g;

  for (e = 0; e < d && a[e] != 0x80; e++)
    b[e] = a[e];

  for (f = 0; f < 8; f++)
    b[e + f] = c[f];

  e = e + f;
  g = (e * 8) & 0xFFFFFFFF;
  b[e] = (char)0x80;

  e = e + 1;
  for (; e < 60; e++)
    b[e] = (char)0;
  b[60] = g >> 24;
  b[61] = g >> 16;
  b[62] = g >> 8;
  b[63] = g;

  return;
}

__kernel void B(__global uint* a, __global uchar* b, __global char* c, __global uint* d) {
  int e, f, g;
  int h, i, j;
  uint k;
  uint l[80], m, n, o, p, q, r;
  uint s = a[1];

  f = get_global_id(0);
  g = f * a[0];

  n = 0x67452301;
  o = 0xEFCDAB89;
  p = 0x98BADCFE;
  q = 0x10325476;
  r = 0xC3D2E1F0;
  for (e = 2; e < 15; e++) {
    l[e] = 0x00000000;
  }
  for (h = 0; h < a[0] && ((uchar)c[g + h]) != 0x80; h++) {
  }

  i = h / 4;
  for (e = 0; e < i; e++) {
    l[e] = ((uchar)c[g + e * 4]) << 24;
    l[e] |= ((uchar)c[g + e * 4 + 1]) << 16;
    l[e] |= ((uchar)c[g + e * 4 + 2]) << 8;
    l[e] |= (uchar)c[g + e * 4 + 3];
  }
  j = h % 4;
  if (j == 3) {
    l[e] = ((uchar)c[g + e * 4]) << 24;
    l[e] |= ((uchar)c[g + e * 4 + 1]) << 16;
    l[e] |= ((uchar)c[g + e * 4 + 2]) << 8;
    l[e] |= (uchar)b[0];
    l[e + 2] = ((uchar)b[5]) << 24;
    l[e + 2] |= ((uchar)b[6]) << 16;
    l[e + 2] |= ((uchar)b[7]) << 8;
    l[e + 2] |= ((uchar)0x80);
    j = 4 - j;
  } else if (j == 2) {
    l[e] = ((uchar)c[g + e * 4]) << 24;
    l[e] |= ((uchar)c[g + e * 4 + 1]) << 16;
    l[e] |= ((uchar)b[0]) << 8;
    l[e] |= (uchar)b[1];
    l[e + 2] = ((uchar)b[6]) << 24;
    l[e + 2] |= ((uchar)b[7]) << 16;
    l[e + 2] |= 0x8000;
    j = 4 - j;
  } else if (j == 1) {
    l[e] = ((uchar)c[g + e * 4]) << 24;
    l[e] |= ((uchar)b[0]) << 16;
    l[e] |= ((uchar)b[1]) << 8;
    l[e] |= (uchar)b[2];
    l[e + 2] = ((uchar)b[7]) << 24;
    l[e + 2] |= 0x800000;
    j = 4 - j;
  } else if (j == 0) {
    l[e + 2] = 0x80000000;
    e = e - 1;
  }
  e = e + 1;
  for (; e < (i + 2) && j < 8; e++) {
    l[e] = ((uchar)b[j]) << 24;
    l[e] |= ((uchar)b[j + 1]) << 16;
    l[e] |= ((uchar)b[j + 2]) << 8;
    l[e] |= ((uchar)b[j + 3]);
    j = j + 4;
  }

  h = h + 8;
  k = (h * 8) & 0xFFFFFFFF;
  l[15] = k;
  {
    r += rotate((int)n, 5) + (q ^ (o & (p ^ q))) + 0x5A827999 + l[0];
    o = rotate((int)o, 30);
  };
  {
    q += rotate((int)r, 5) + (p ^ (n & (o ^ p))) + 0x5A827999 + l[1];
    n = rotate((int)n, 30);
  };
  {
    p += rotate((int)q, 5) + (o ^ (r & (n ^ o))) + 0x5A827999 + l[2];
    r = rotate((int)r, 30);
  };
  {
    o += rotate((int)p, 5) + (n ^ (q & (r ^ n))) + 0x5A827999 + l[3];
    q = rotate((int)q, 30);
  };
  {
    n += rotate((int)o, 5) + (r ^ (p & (q ^ r))) + 0x5A827999 + l[4];
    p = rotate((int)p, 30);
  };
  {
    r += rotate((int)n, 5) + (q ^ (o & (p ^ q))) + 0x5A827999 + l[5];
    o = rotate((int)o, 30);
  };
  {
    q += rotate((int)r, 5) + (p ^ (n & (o ^ p))) + 0x5A827999 + l[6];
    n = rotate((int)n, 30);
  };
  {
    p += rotate((int)q, 5) + (o ^ (r & (n ^ o))) + 0x5A827999 + l[7];
    r = rotate((int)r, 30);
  };
  {
    o += rotate((int)p, 5) + (n ^ (q & (r ^ n))) + 0x5A827999 + l[8];
    q = rotate((int)q, 30);
  };
  {
    n += rotate((int)o, 5) + (r ^ (p & (q ^ r))) + 0x5A827999 + l[9];
    p = rotate((int)p, 30);
  };
  {
    r += rotate((int)n, 5) + (q ^ (o & (p ^ q))) + 0x5A827999 + l[10];
    o = rotate((int)o, 30);
  };
  {
    q += rotate((int)r, 5) + (p ^ (n & (o ^ p))) + 0x5A827999 + l[11];
    n = rotate((int)n, 30);
  };
  {
    p += rotate((int)q, 5) + (o ^ (r & (n ^ o))) + 0x5A827999 + l[12];
    r = rotate((int)r, 30);
  };
  {
    o += rotate((int)p, 5) + (n ^ (q & (r ^ n))) + 0x5A827999 + l[13];
    q = rotate((int)q, 30);
  };
  {
    n += rotate((int)o, 5) + (r ^ (p & (q ^ r))) + 0x5A827999 + l[14];
    p = rotate((int)p, 30);
  };
  {
    r += rotate((int)n, 5) + (q ^ (o & (p ^ q))) + 0x5A827999 + l[15];
    o = rotate((int)o, 30);
  };
  {
    q += rotate((int)r, 5) + (p ^ (n & (o ^ p))) + 0x5A827999 + (m = l[(16 - 3) & 0x0F] ^ l[(16 - 8) & 0x0F] ^ l[(16 - 14) & 0x0F] ^ l[16 & 0x0F], (l[16 & 0x0F] = rotate((int)m, 1)));
    n = rotate((int)n, 30);
  };
  {
    p += rotate((int)q, 5) + (o ^ (r & (n ^ o))) + 0x5A827999 + (m = l[(17 - 3) & 0x0F] ^ l[(17 - 8) & 0x0F] ^ l[(17 - 14) & 0x0F] ^ l[17 & 0x0F], (l[17 & 0x0F] = rotate((int)m, 1)));
    r = rotate((int)r, 30);
  };
  {
    o += rotate((int)p, 5) + (n ^ (q & (r ^ n))) + 0x5A827999 + (m = l[(18 - 3) & 0x0F] ^ l[(18 - 8) & 0x0F] ^ l[(18 - 14) & 0x0F] ^ l[18 & 0x0F], (l[18 & 0x0F] = rotate((int)m, 1)));
    q = rotate((int)q, 30);
  };
  {
    n += rotate((int)o, 5) + (r ^ (p & (q ^ r))) + 0x5A827999 + (m = l[(19 - 3) & 0x0F] ^ l[(19 - 8) & 0x0F] ^ l[(19 - 14) & 0x0F] ^ l[19 & 0x0F], (l[19 & 0x0F] = rotate((int)m, 1)));
    p = rotate((int)p, 30);
  };

  {
    r += rotate((int)n, 5) + (o ^ p ^ q) + 0x6ED9EBA1 + (m = l[(20 - 3) & 0x0F] ^ l[(20 - 8) & 0x0F] ^ l[(20 - 14) & 0x0F] ^ l[20 & 0x0F], (l[20 & 0x0F] = rotate((int)m, 1)));
    o = rotate((int)o, 30);
  };
  {
    q += rotate((int)r, 5) + (n ^ o ^ p) + 0x6ED9EBA1 + (m = l[(21 - 3) & 0x0F] ^ l[(21 - 8) & 0x0F] ^ l[(21 - 14) & 0x0F] ^ l[21 & 0x0F], (l[21 & 0x0F] = rotate((int)m, 1)));
    n = rotate((int)n, 30);
  };
  {
    p += rotate((int)q, 5) + (r ^ n ^ o) + 0x6ED9EBA1 + (m = l[(22 - 3) & 0x0F] ^ l[(22 - 8) & 0x0F] ^ l[(22 - 14) & 0x0F] ^ l[22 & 0x0F], (l[22 & 0x0F] = rotate((int)m, 1)));
    r = rotate((int)r, 30);
  };
  {
    o += rotate((int)p, 5) + (q ^ r ^ n) + 0x6ED9EBA1 + (m = l[(23 - 3) & 0x0F] ^ l[(23 - 8) & 0x0F] ^ l[(23 - 14) & 0x0F] ^ l[23 & 0x0F], (l[23 & 0x0F] = rotate((int)m, 1)));
    q = rotate((int)q, 30);
  };
  {
    n += rotate((int)o, 5) + (p ^ q ^ r) + 0x6ED9EBA1 + (m = l[(24 - 3) & 0x0F] ^ l[(24 - 8) & 0x0F] ^ l[(24 - 14) & 0x0F] ^ l[24 & 0x0F], (l[24 & 0x0F] = rotate((int)m, 1)));
    p = rotate((int)p, 30);
  };
  {
    r += rotate((int)n, 5) + (o ^ p ^ q) + 0x6ED9EBA1 + (m = l[(25 - 3) & 0x0F] ^ l[(25 - 8) & 0x0F] ^ l[(25 - 14) & 0x0F] ^ l[25 & 0x0F], (l[25 & 0x0F] = rotate((int)m, 1)));
    o = rotate((int)o, 30);
  };
  {
    q += rotate((int)r, 5) + (n ^ o ^ p) + 0x6ED9EBA1 + (m = l[(26 - 3) & 0x0F] ^ l[(26 - 8) & 0x0F] ^ l[(26 - 14) & 0x0F] ^ l[26 & 0x0F], (l[26 & 0x0F] = rotate((int)m, 1)));
    n = rotate((int)n, 30);
  };
  {
    p += rotate((int)q, 5) + (r ^ n ^ o) + 0x6ED9EBA1 + (m = l[(27 - 3) & 0x0F] ^ l[(27 - 8) & 0x0F] ^ l[(27 - 14) & 0x0F] ^ l[27 & 0x0F], (l[27 & 0x0F] = rotate((int)m, 1)));
    r = rotate((int)r, 30);
  };
  {
    o += rotate((int)p, 5) + (q ^ r ^ n) + 0x6ED9EBA1 + (m = l[(28 - 3) & 0x0F] ^ l[(28 - 8) & 0x0F] ^ l[(28 - 14) & 0x0F] ^ l[28 & 0x0F], (l[28 & 0x0F] = rotate((int)m, 1)));
    q = rotate((int)q, 30);
  };
  {
    n += rotate((int)o, 5) + (p ^ q ^ r) + 0x6ED9EBA1 + (m = l[(29 - 3) & 0x0F] ^ l[(29 - 8) & 0x0F] ^ l[(29 - 14) & 0x0F] ^ l[29 & 0x0F], (l[29 & 0x0F] = rotate((int)m, 1)));
    p = rotate((int)p, 30);
  };
  {
    r += rotate((int)n, 5) + (o ^ p ^ q) + 0x6ED9EBA1 + (m = l[(30 - 3) & 0x0F] ^ l[(30 - 8) & 0x0F] ^ l[(30 - 14) & 0x0F] ^ l[30 & 0x0F], (l[30 & 0x0F] = rotate((int)m, 1)));
    o = rotate((int)o, 30);
  };
  {
    q += rotate((int)r, 5) + (n ^ o ^ p) + 0x6ED9EBA1 + (m = l[(31 - 3) & 0x0F] ^ l[(31 - 8) & 0x0F] ^ l[(31 - 14) & 0x0F] ^ l[31 & 0x0F], (l[31 & 0x0F] = rotate((int)m, 1)));
    n = rotate((int)n, 30);
  };
  {
    p += rotate((int)q, 5) + (r ^ n ^ o) + 0x6ED9EBA1 + (m = l[(32 - 3) & 0x0F] ^ l[(32 - 8) & 0x0F] ^ l[(32 - 14) & 0x0F] ^ l[32 & 0x0F], (l[32 & 0x0F] = rotate((int)m, 1)));
    r = rotate((int)r, 30);
  };
  {
    o += rotate((int)p, 5) + (q ^ r ^ n) + 0x6ED9EBA1 + (m = l[(33 - 3) & 0x0F] ^ l[(33 - 8) & 0x0F] ^ l[(33 - 14) & 0x0F] ^ l[33 & 0x0F], (l[33 & 0x0F] = rotate((int)m, 1)));
    q = rotate((int)q, 30);
  };
  {
    n += rotate((int)o, 5) + (p ^ q ^ r) + 0x6ED9EBA1 + (m = l[(34 - 3) & 0x0F] ^ l[(34 - 8) & 0x0F] ^ l[(34 - 14) & 0x0F] ^ l[34 & 0x0F], (l[34 & 0x0F] = rotate((int)m, 1)));
    p = rotate((int)p, 30);
  };
  {
    r += rotate((int)n, 5) + (o ^ p ^ q) + 0x6ED9EBA1 + (m = l[(35 - 3) & 0x0F] ^ l[(35 - 8) & 0x0F] ^ l[(35 - 14) & 0x0F] ^ l[35 & 0x0F], (l[35 & 0x0F] = rotate((int)m, 1)));
    o = rotate((int)o, 30);
  };
  {
    q += rotate((int)r, 5) + (n ^ o ^ p) + 0x6ED9EBA1 + (m = l[(36 - 3) & 0x0F] ^ l[(36 - 8) & 0x0F] ^ l[(36 - 14) & 0x0F] ^ l[36 & 0x0F], (l[36 & 0x0F] = rotate((int)m, 1)));
    n = rotate((int)n, 30);
  };
  {
    p += rotate((int)q, 5) + (r ^ n ^ o) + 0x6ED9EBA1 + (m = l[(37 - 3) & 0x0F] ^ l[(37 - 8) & 0x0F] ^ l[(37 - 14) & 0x0F] ^ l[37 & 0x0F], (l[37 & 0x0F] = rotate((int)m, 1)));
    r = rotate((int)r, 30);
  };
  {
    o += rotate((int)p, 5) + (q ^ r ^ n) + 0x6ED9EBA1 + (m = l[(38 - 3) & 0x0F] ^ l[(38 - 8) & 0x0F] ^ l[(38 - 14) & 0x0F] ^ l[38 & 0x0F], (l[38 & 0x0F] = rotate((int)m, 1)));
    q = rotate((int)q, 30);
  };
  {
    n += rotate((int)o, 5) + (p ^ q ^ r) + 0x6ED9EBA1 + (m = l[(39 - 3) & 0x0F] ^ l[(39 - 8) & 0x0F] ^ l[(39 - 14) & 0x0F] ^ l[39 & 0x0F], (l[39 & 0x0F] = rotate((int)m, 1)));
    p = rotate((int)p, 30);
  };

  {
    r += rotate((int)n, 5) + ((o & p) | (q & (o | p))) + 0x8F1BBCDC + (m = l[(40 - 3) & 0x0F] ^ l[(40 - 8) & 0x0F] ^ l[(40 - 14) & 0x0F] ^ l[40 & 0x0F], (l[40 & 0x0F] = rotate((int)m, 1)));
    o = rotate((int)o, 30);
  };
  {
    q += rotate((int)r, 5) + ((n & o) | (p & (n | o))) + 0x8F1BBCDC + (m = l[(41 - 3) & 0x0F] ^ l[(41 - 8) & 0x0F] ^ l[(41 - 14) & 0x0F] ^ l[41 & 0x0F], (l[41 & 0x0F] = rotate((int)m, 1)));
    n = rotate((int)n, 30);
  };
  {
    p += rotate((int)q, 5) + ((r & n) | (o & (r | n))) + 0x8F1BBCDC + (m = l[(42 - 3) & 0x0F] ^ l[(42 - 8) & 0x0F] ^ l[(42 - 14) & 0x0F] ^ l[42 & 0x0F], (l[42 & 0x0F] = rotate((int)m, 1)));
    r = rotate((int)r, 30);
  };
  {
    o += rotate((int)p, 5) + ((q & r) | (n & (q | r))) + 0x8F1BBCDC + (m = l[(43 - 3) & 0x0F] ^ l[(43 - 8) & 0x0F] ^ l[(43 - 14) & 0x0F] ^ l[43 & 0x0F], (l[43 & 0x0F] = rotate((int)m, 1)));
    q = rotate((int)q, 30);
  };
  {
    n += rotate((int)o, 5) + ((p & q) | (r & (p | q))) + 0x8F1BBCDC + (m = l[(44 - 3) & 0x0F] ^ l[(44 - 8) & 0x0F] ^ l[(44 - 14) & 0x0F] ^ l[44 & 0x0F], (l[44 & 0x0F] = rotate((int)m, 1)));
    p = rotate((int)p, 30);
  };
  {
    r += rotate((int)n, 5) + ((o & p) | (q & (o | p))) + 0x8F1BBCDC + (m = l[(45 - 3) & 0x0F] ^ l[(45 - 8) & 0x0F] ^ l[(45 - 14) & 0x0F] ^ l[45 & 0x0F], (l[45 & 0x0F] = rotate((int)m, 1)));
    o = rotate((int)o, 30);
  };
  {
    q += rotate((int)r, 5) + ((n & o) | (p & (n | o))) + 0x8F1BBCDC + (m = l[(46 - 3) & 0x0F] ^ l[(46 - 8) & 0x0F] ^ l[(46 - 14) & 0x0F] ^ l[46 & 0x0F], (l[46 & 0x0F] = rotate((int)m, 1)));
    n = rotate((int)n, 30);
  };
  {
    p += rotate((int)q, 5) + ((r & n) | (o & (r | n))) + 0x8F1BBCDC + (m = l[(47 - 3) & 0x0F] ^ l[(47 - 8) & 0x0F] ^ l[(47 - 14) & 0x0F] ^ l[47 & 0x0F], (l[47 & 0x0F] = rotate((int)m, 1)));
    r = rotate((int)r, 30);
  };
  {
    o += rotate((int)p, 5) + ((q & r) | (n & (q | r))) + 0x8F1BBCDC + (m = l[(48 - 3) & 0x0F] ^ l[(48 - 8) & 0x0F] ^ l[(48 - 14) & 0x0F] ^ l[48 & 0x0F], (l[48 & 0x0F] = rotate((int)m, 1)));
    q = rotate((int)q, 30);
  };
  {
    n += rotate((int)o, 5) + ((p & q) | (r & (p | q))) + 0x8F1BBCDC + (m = l[(49 - 3) & 0x0F] ^ l[(49 - 8) & 0x0F] ^ l[(49 - 14) & 0x0F] ^ l[49 & 0x0F], (l[49 & 0x0F] = rotate((int)m, 1)));
    p = rotate((int)p, 30);
  };
  {
    r += rotate((int)n, 5) + ((o & p) | (q & (o | p))) + 0x8F1BBCDC + (m = l[(50 - 3) & 0x0F] ^ l[(50 - 8) & 0x0F] ^ l[(50 - 14) & 0x0F] ^ l[50 & 0x0F], (l[50 & 0x0F] = rotate((int)m, 1)));
    o = rotate((int)o, 30);
  };
  {
    q += rotate((int)r, 5) + ((n & o) | (p & (n | o))) + 0x8F1BBCDC + (m = l[(51 - 3) & 0x0F] ^ l[(51 - 8) & 0x0F] ^ l[(51 - 14) & 0x0F] ^ l[51 & 0x0F], (l[51 & 0x0F] = rotate((int)m, 1)));
    n = rotate((int)n, 30);
  };
  {
    p += rotate((int)q, 5) + ((r & n) | (o & (r | n))) + 0x8F1BBCDC + (m = l[(52 - 3) & 0x0F] ^ l[(52 - 8) & 0x0F] ^ l[(52 - 14) & 0x0F] ^ l[52 & 0x0F], (l[52 & 0x0F] = rotate((int)m, 1)));
    r = rotate((int)r, 30);
  };
  {
    o += rotate((int)p, 5) + ((q & r) | (n & (q | r))) + 0x8F1BBCDC + (m = l[(53 - 3) & 0x0F] ^ l[(53 - 8) & 0x0F] ^ l[(53 - 14) & 0x0F] ^ l[53 & 0x0F], (l[53 & 0x0F] = rotate((int)m, 1)));
    q = rotate((int)q, 30);
  };
  {
    n += rotate((int)o, 5) + ((p & q) | (r & (p | q))) + 0x8F1BBCDC + (m = l[(54 - 3) & 0x0F] ^ l[(54 - 8) & 0x0F] ^ l[(54 - 14) & 0x0F] ^ l[54 & 0x0F], (l[54 & 0x0F] = rotate((int)m, 1)));
    p = rotate((int)p, 30);
  };
  {
    r += rotate((int)n, 5) + ((o & p) | (q & (o | p))) + 0x8F1BBCDC + (m = l[(55 - 3) & 0x0F] ^ l[(55 - 8) & 0x0F] ^ l[(55 - 14) & 0x0F] ^ l[55 & 0x0F], (l[55 & 0x0F] = rotate((int)m, 1)));
    o = rotate((int)o, 30);
  };
  {
    q += rotate((int)r, 5) + ((n & o) | (p & (n | o))) + 0x8F1BBCDC + (m = l[(56 - 3) & 0x0F] ^ l[(56 - 8) & 0x0F] ^ l[(56 - 14) & 0x0F] ^ l[56 & 0x0F], (l[56 & 0x0F] = rotate((int)m, 1)));
    n = rotate((int)n, 30);
  };
  {
    p += rotate((int)q, 5) + ((r & n) | (o & (r | n))) + 0x8F1BBCDC + (m = l[(57 - 3) & 0x0F] ^ l[(57 - 8) & 0x0F] ^ l[(57 - 14) & 0x0F] ^ l[57 & 0x0F], (l[57 & 0x0F] = rotate((int)m, 1)));
    r = rotate((int)r, 30);
  };
  {
    o += rotate((int)p, 5) + ((q & r) | (n & (q | r))) + 0x8F1BBCDC + (m = l[(58 - 3) & 0x0F] ^ l[(58 - 8) & 0x0F] ^ l[(58 - 14) & 0x0F] ^ l[58 & 0x0F], (l[58 & 0x0F] = rotate((int)m, 1)));
    q = rotate((int)q, 30);
  };
  {
    n += rotate((int)o, 5) + ((p & q) | (r & (p | q))) + 0x8F1BBCDC + (m = l[(59 - 3) & 0x0F] ^ l[(59 - 8) & 0x0F] ^ l[(59 - 14) & 0x0F] ^ l[59 & 0x0F], (l[59 & 0x0F] = rotate((int)m, 1)));
    p = rotate((int)p, 30);
  };

  {
    r += rotate((int)n, 5) + (o ^ p ^ q) + 0xCA62C1D6 + (m = l[(60 - 3) & 0x0F] ^ l[(60 - 8) & 0x0F] ^ l[(60 - 14) & 0x0F] ^ l[60 & 0x0F], (l[60 & 0x0F] = rotate((int)m, 1)));
    o = rotate((int)o, 30);
  };
  {
    q += rotate((int)r, 5) + (n ^ o ^ p) + 0xCA62C1D6 + (m = l[(61 - 3) & 0x0F] ^ l[(61 - 8) & 0x0F] ^ l[(61 - 14) & 0x0F] ^ l[61 & 0x0F], (l[61 & 0x0F] = rotate((int)m, 1)));
    n = rotate((int)n, 30);
  };
  {
    p += rotate((int)q, 5) + (r ^ n ^ o) + 0xCA62C1D6 + (m = l[(62 - 3) & 0x0F] ^ l[(62 - 8) & 0x0F] ^ l[(62 - 14) & 0x0F] ^ l[62 & 0x0F], (l[62 & 0x0F] = rotate((int)m, 1)));
    r = rotate((int)r, 30);
  };
  {
    o += rotate((int)p, 5) + (q ^ r ^ n) + 0xCA62C1D6 + (m = l[(63 - 3) & 0x0F] ^ l[(63 - 8) & 0x0F] ^ l[(63 - 14) & 0x0F] ^ l[63 & 0x0F], (l[63 & 0x0F] = rotate((int)m, 1)));
    q = rotate((int)q, 30);
  };
  {
    n += rotate((int)o, 5) + (p ^ q ^ r) + 0xCA62C1D6 + (m = l[(64 - 3) & 0x0F] ^ l[(64 - 8) & 0x0F] ^ l[(64 - 14) & 0x0F] ^ l[64 & 0x0F], (l[64 & 0x0F] = rotate((int)m, 1)));
    p = rotate((int)p, 30);
  };
  {
    r += rotate((int)n, 5) + (o ^ p ^ q) + 0xCA62C1D6 + (m = l[(65 - 3) & 0x0F] ^ l[(65 - 8) & 0x0F] ^ l[(65 - 14) & 0x0F] ^ l[65 & 0x0F], (l[65 & 0x0F] = rotate((int)m, 1)));
    o = rotate((int)o, 30);
  };
  {
    q += rotate((int)r, 5) + (n ^ o ^ p) + 0xCA62C1D6 + (m = l[(66 - 3) & 0x0F] ^ l[(66 - 8) & 0x0F] ^ l[(66 - 14) & 0x0F] ^ l[66 & 0x0F], (l[66 & 0x0F] = rotate((int)m, 1)));
    n = rotate((int)n, 30);
  };
  {
    p += rotate((int)q, 5) + (r ^ n ^ o) + 0xCA62C1D6 + (m = l[(67 - 3) & 0x0F] ^ l[(67 - 8) & 0x0F] ^ l[(67 - 14) & 0x0F] ^ l[67 & 0x0F], (l[67 & 0x0F] = rotate((int)m, 1)));
    r = rotate((int)r, 30);
  };
  {
    o += rotate((int)p, 5) + (q ^ r ^ n) + 0xCA62C1D6 + (m = l[(68 - 3) & 0x0F] ^ l[(68 - 8) & 0x0F] ^ l[(68 - 14) & 0x0F] ^ l[68 & 0x0F], (l[68 & 0x0F] = rotate((int)m, 1)));
    q = rotate((int)q, 30);
  };
  {
    n += rotate((int)o, 5) + (p ^ q ^ r) + 0xCA62C1D6 + (m = l[(69 - 3) & 0x0F] ^ l[(69 - 8) & 0x0F] ^ l[(69 - 14) & 0x0F] ^ l[69 & 0x0F], (l[69 & 0x0F] = rotate((int)m, 1)));
    p = rotate((int)p, 30);
  };
  {
    r += rotate((int)n, 5) + (o ^ p ^ q) + 0xCA62C1D6 + (m = l[(70 - 3) & 0x0F] ^ l[(70 - 8) & 0x0F] ^ l[(70 - 14) & 0x0F] ^ l[70 & 0x0F], (l[70 & 0x0F] = rotate((int)m, 1)));
    o = rotate((int)o, 30);
  };
  {
    q += rotate((int)r, 5) + (n ^ o ^ p) + 0xCA62C1D6 + (m = l[(71 - 3) & 0x0F] ^ l[(71 - 8) & 0x0F] ^ l[(71 - 14) & 0x0F] ^ l[71 & 0x0F], (l[71 & 0x0F] = rotate((int)m, 1)));
    n = rotate((int)n, 30);
  };
  {
    p += rotate((int)q, 5) + (r ^ n ^ o) + 0xCA62C1D6 + (m = l[(72 - 3) & 0x0F] ^ l[(72 - 8) & 0x0F] ^ l[(72 - 14) & 0x0F] ^ l[72 & 0x0F], (l[72 & 0x0F] = rotate((int)m, 1)));
    r = rotate((int)r, 30);
  };
  {
    o += rotate((int)p, 5) + (q ^ r ^ n) + 0xCA62C1D6 + (m = l[(73 - 3) & 0x0F] ^ l[(73 - 8) & 0x0F] ^ l[(73 - 14) & 0x0F] ^ l[73 & 0x0F], (l[73 & 0x0F] = rotate((int)m, 1)));
    q = rotate((int)q, 30);
  };
  {
    n += rotate((int)o, 5) + (p ^ q ^ r) + 0xCA62C1D6 + (m = l[(74 - 3) & 0x0F] ^ l[(74 - 8) & 0x0F] ^ l[(74 - 14) & 0x0F] ^ l[74 & 0x0F], (l[74 & 0x0F] = rotate((int)m, 1)));
    p = rotate((int)p, 30);
  };
  {
    r += rotate((int)n, 5) + (o ^ p ^ q) + 0xCA62C1D6 + (m = l[(75 - 3) & 0x0F] ^ l[(75 - 8) & 0x0F] ^ l[(75 - 14) & 0x0F] ^ l[75 & 0x0F], (l[75 & 0x0F] = rotate((int)m, 1)));
    o = rotate((int)o, 30);
  };
  {
    q += rotate((int)r, 5) + (n ^ o ^ p) + 0xCA62C1D6 + (m = l[(76 - 3) & 0x0F] ^ l[(76 - 8) & 0x0F] ^ l[(76 - 14) & 0x0F] ^ l[76 & 0x0F], (l[76 & 0x0F] = rotate((int)m, 1)));
    n = rotate((int)n, 30);
  };
  {
    p += rotate((int)q, 5) + (r ^ n ^ o) + 0xCA62C1D6 + (m = l[(77 - 3) & 0x0F] ^ l[(77 - 8) & 0x0F] ^ l[(77 - 14) & 0x0F] ^ l[77 & 0x0F], (l[77 & 0x0F] = rotate((int)m, 1)));
    r = rotate((int)r, 30);
  };
  {
    o += rotate((int)p, 5) + (q ^ r ^ n) + 0xCA62C1D6 + (m = l[(78 - 3) & 0x0F] ^ l[(78 - 8) & 0x0F] ^ l[(78 - 14) & 0x0F] ^ l[78 & 0x0F], (l[78 & 0x0F] = rotate((int)m, 1)));
    q = rotate((int)q, 30);
  };
  {
    n += rotate((int)o, 5) + (p ^ q ^ r) + 0xCA62C1D6 + (m = l[(79 - 3) & 0x0F] ^ l[(79 - 8) & 0x0F] ^ l[(79 - 14) & 0x0F] ^ l[79 & 0x0F], (l[79 & 0x0F] = rotate((int)m, 1)));
    p = rotate((int)p, 30);
  };

  d[f] = __builtin_astype(__builtin_astype(n + 0x67452301, uchar4).wzyx, uint);
  d[f + 1 * s] = __builtin_astype(__builtin_astype(o + 0xEFCDAB89, uchar4).wzyx, uint);
  d[f + 2 * s] = __builtin_astype(__builtin_astype(p + 0x98BADCFE, uchar4).wzyx, uint);
  d[f + 3 * s] = __builtin_astype(__builtin_astype(q + 0x10325476, uchar4).wzyx, uint);
  d[f + 4 * s] = __builtin_astype(__builtin_astype(r + 0xC3D2E1F0, uchar4).wzyx, uint);
}