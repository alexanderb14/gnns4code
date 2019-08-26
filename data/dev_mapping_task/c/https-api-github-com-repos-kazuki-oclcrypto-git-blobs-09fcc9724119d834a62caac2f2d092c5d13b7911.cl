void A(__local uint4* a, __local uint4* b, uint c) {
  uint d = ((((c >> 5) - (c >> 3)) & 3) << 5) | (c & 31);
  b[d] = a[c];
}

uint B(uint a) {
  return ((((a >> 5) - (a >> 3)) & 3) << 5) | (a & 31);
}

uint C(uint a) {
  return ((((a >> 5) + ((a >> 3) & 3)) & 3) << 5) | (a & 31);
}

uint4 D(__local uint4* a, uint b) {
  uint c = b & 0x1F;
  uint d = b & 0xE0;
  uint4 e = a[C(d + ((c + 7) & 0x1F))] ^ a[C(d + ((c + 8) & 0x1F))] ^ a[C(d + ((c + 16) & 0x1F))] ^ a[C(d + ((c + 24) & 0x1F))] ^ a[C(d + ((c + 31) & 0x1F))];
  switch (c & 7) {
    case 0:
      e ^= a[C(d + ((c + 15) & 0x1F))] ^ a[C(d + ((c + 31) & 0x1F))];
      break;
    case 1:
      e ^= a[C(d + ((c + 6) & 0x1F))] ^ a[C(d + ((c + 14) & 0x1F))];
      break;
    case 3:
      e ^= a[C(d + ((c + 4) & 0x1F))] ^ a[C(d + ((c + 12) & 0x1F))];
      break;
    case 4:
      e ^= a[C(d + ((c + 3) & 0x1F))] ^ a[C(d + ((c + 11) & 0x1F))];
      break;
  }
  return e;
}

void E(__local uint4* a, __local uint4* b, uint c) {
  uint d = c & 7;
  uint e = c & (~7);
  if (d != 0)
    return;

  uint4 f, g, h, i, j, k, l, m;
  f = a[e + 0] ^ a[e + 1] ^ a[e + 6];
  g = a[e + 1] ^ a[e + 4] ^ a[e + 6];
  h = a[e + 1] ^ a[e + 2] ^ a[e + 3] ^ a[e + 4] ^ a[e + 7];
  i = a[e + 1] ^ a[e + 2] ^ a[e + 6] ^ a[e + 7];
  j = a[e + 1] ^ a[e + 2] ^ a[e + 3] ^ a[e + 5] ^ a[e + 7];
  k = a[e + 2] ^ a[e + 3] ^ a[e + 5] ^ a[e + 7];
  l = a[e + 1] ^ a[e + 2] ^ a[e + 3] ^ a[e + 4] ^ a[e + 6] ^ a[e + 7];
  m = a[e + 5] ^ a[e + 7];

  uint4 n = f ^ j;
  uint4 o = g ^ k;
  uint4 p = h ^ l;
  uint4 q = i ^ m;

  uint4 r, s, t, u;
  r = j ^ k ^ m;
  s = k ^ l;
  t = l ^ m;
  u = r ^ t;
  r = t;
  t = s ^ m ^ u;
  s = m;

  {
    uint4 v = q & i;
    uint4 w = (p & h) ^ v;
    uint4 x = v ^ (p & i) ^ (q & h);
    uint4 y = o & g;
    uint4 z = (n & f) ^ y;
    uint4 aa = y ^ (n & g) ^ (o & f);
    uint4 ab = n ^ p;
    uint4 ac = o ^ q;
    uint4 ad = f ^ h;
    uint4 ae = g ^ i;
    uint4 af = ac & ae;
    h = (ab & ad) ^ af ^ z;
    i = af ^ (ab & ae) ^ (ac & ad) ^ aa;
    f = x ^ z;
    g = w ^ x ^ aa;
  }

  {
    uint4 ag = r ^ f;
    uint4 ah = s ^ g;
    uint4 ai = t ^ h;
    uint4 aj = u ^ i;
    uint4 ak = ag & aj;
    uint4 al = ah & ai;
    uint4 am = ah & aj;
    uint4 an = ai & aj;
    uint4 ao = ag & al;
    uint4 ap = ag & am;
    uint4 aq = ag & an;
    uint4 ar = ah & an;
    uint4 as = ah ^ ai;
    uint4 at = ar ^ aq;
    uint4 au = ak ^ al;
    r = ag ^ as ^ at ^ am ^ ap ^ au ^ ao;
    s = as ^ aj ^ ar ^ ap ^ (ag & ai);
    t = ai ^ at ^ au;
    u = ai ^ aj ^ ar ^ ak;
  }

  {
    uint4 ab = r ^ t;
    uint4 ac = s ^ u;
    {
      uint4 v = u & m;
      uint4 w = (t & l) ^ v;
      uint4 x = v ^ (t & m) ^ (u & l);
      uint4 y = s & k;
      uint4 z = (r & j) ^ y;
      uint4 aa = y ^ (r & k) ^ (s & j);
      uint4 ad = j ^ l;
      uint4 ae = k ^ m;
      uint4 af = ac & ae;
      j = x ^ z;
      k = w ^ x ^ aa;
      l = (ab & ad) ^ af ^ z;
      m = af ^ (ab & ae) ^ (ac & ad) ^ aa;
    }

    {
      uint4 v = u & q;
      uint4 w = (t & p) ^ v;
      uint4 x = v ^ (t & q) ^ (u & p);
      uint4 y = s & o;
      uint4 z = (r & n) ^ y;
      uint4 aa = y ^ (r & o) ^ (s & n);
      uint4 ad = n ^ p;
      uint4 ae = o ^ q;
      uint4 af = ac & ae;
      f = x ^ z;
      g = w ^ x ^ aa;
      h = (ab & ad) ^ af ^ z;
      i = af ^ (ab & ae) ^ (ac & ad) ^ aa;
    }
  }

  n = f ^ h ^ j ^ k ^ l;
  o = j ^ k;
  p = g ^ h ^ i ^ j ^ m;
  q = g ^ h ^ i ^ j ^ k;
  r = g ^ h ^ j ^ k ^ l;
  s = g ^ k ^ l;
  t = h ^ l;
  u = g ^ k ^ l ^ m;

  b[e + 0] = ~(n ^ r ^ s ^ t ^ u);
  b[e + 1] = ~(n ^ o ^ s ^ t ^ u);
  b[e + 2] = n ^ o ^ p ^ t ^ u;
  b[e + 3] = n ^ o ^ p ^ q ^ u;
  b[e + 4] = n ^ o ^ p ^ q ^ r;
  b[e + 5] = ~(o ^ p ^ q ^ r ^ s);
  b[e + 6] = ~(p ^ q ^ r ^ s ^ t);
  b[e + 7] = q ^ r ^ s ^ t ^ u;
}

uint4 F(__local uint* a, uint b) {
  uint c = b >> 5;
  uint d = b & 0x1F;
  uint e = ((a[c + 0] >> d) & 1) | (((a[c + 4] >> d) & 1) << 1) | (((a[c + 8] >> d) & 1) << 2) | (((a[c + 12] >> d) & 1) << 3) | (((a[c + 16] >> d) & 1) << 4) | (((a[c + 20] >> d) & 1) << 5) | (((a[c + 24] >> d) & 1) << 6) | (((a[c + 28] >> d) & 1) << 7) | (((a[c + 32] >> d) & 1) << 8) | (((a[c + 36] >> d) & 1) << 9) | (((a[c + 40] >> d) & 1) << 10) | (((a[c + 44] >> d) & 1) << 11) | (((a[c + 48] >> d) & 1) << 12) | (((a[c + 52] >> d) & 1) << 13) | (((a[c + 56] >> d) & 1) << 14) |
           (((a[c + 60] >> d) & 1) << 15) | (((a[c + 64] >> d) & 1) << 16) | (((a[c + 68] >> d) & 1) << 17) | (((a[c + 72] >> d) & 1) << 18) | (((a[c + 76] >> d) & 1) << 19) | (((a[c + 80] >> d) & 1) << 20) | (((a[c + 84] >> d) & 1) << 21) | (((a[c + 88] >> d) & 1) << 22) | (((a[c + 92] >> d) & 1) << 23) | (((a[c + 96] >> d) & 1) << 24) | (((a[c + 100] >> d) & 1) << 25) | (((a[c + 104] >> d) & 1) << 26) | (((a[c + 108] >> d) & 1) << 27) | (((a[c + 112] >> d) & 1) << 28) |
           (((a[c + 116] >> d) & 1) << 29) | (((a[c + 120] >> d) & 1) << 30) | (((a[c + 124] >> d) & 1) << 31);
  uint f = ((a[c + 128] >> d) & 1) | (((a[c + 132] >> d) & 1) << 1) | (((a[c + 136] >> d) & 1) << 2) | (((a[c + 140] >> d) & 1) << 3) | (((a[c + 144] >> d) & 1) << 4) | (((a[c + 148] >> d) & 1) << 5) | (((a[c + 152] >> d) & 1) << 6) | (((a[c + 156] >> d) & 1) << 7) | (((a[c + 160] >> d) & 1) << 8) | (((a[c + 164] >> d) & 1) << 9) | (((a[c + 168] >> d) & 1) << 10) | (((a[c + 172] >> d) & 1) << 11) | (((a[c + 176] >> d) & 1) << 12) | (((a[c + 180] >> d) & 1) << 13) |
           (((a[c + 184] >> d) & 1) << 14) | (((a[c + 188] >> d) & 1) << 15) | (((a[c + 192] >> d) & 1) << 16) | (((a[c + 196] >> d) & 1) << 17) | (((a[c + 200] >> d) & 1) << 18) | (((a[c + 204] >> d) & 1) << 19) | (((a[c + 208] >> d) & 1) << 20) | (((a[c + 212] >> d) & 1) << 21) | (((a[c + 216] >> d) & 1) << 22) | (((a[c + 220] >> d) & 1) << 23) | (((a[c + 224] >> d) & 1) << 24) | (((a[c + 228] >> d) & 1) << 25) | (((a[c + 232] >> d) & 1) << 26) | (((a[c + 236] >> d) & 1) << 27) |
           (((a[c + 240] >> d) & 1) << 28) | (((a[c + 244] >> d) & 1) << 29) | (((a[c + 248] >> d) & 1) << 30) | (((a[c + 252] >> d) & 1) << 31);
  uint g = ((a[c + 256] >> d) & 1) | (((a[c + 260] >> d) & 1) << 1) | (((a[c + 264] >> d) & 1) << 2) | (((a[c + 268] >> d) & 1) << 3) | (((a[c + 272] >> d) & 1) << 4) | (((a[c + 276] >> d) & 1) << 5) | (((a[c + 280] >> d) & 1) << 6) | (((a[c + 284] >> d) & 1) << 7) | (((a[c + 288] >> d) & 1) << 8) | (((a[c + 292] >> d) & 1) << 9) | (((a[c + 296] >> d) & 1) << 10) | (((a[c + 300] >> d) & 1) << 11) | (((a[c + 304] >> d) & 1) << 12) | (((a[c + 308] >> d) & 1) << 13) |
           (((a[c + 312] >> d) & 1) << 14) | (((a[c + 316] >> d) & 1) << 15) | (((a[c + 320] >> d) & 1) << 16) | (((a[c + 324] >> d) & 1) << 17) | (((a[c + 328] >> d) & 1) << 18) | (((a[c + 332] >> d) & 1) << 19) | (((a[c + 336] >> d) & 1) << 20) | (((a[c + 340] >> d) & 1) << 21) | (((a[c + 344] >> d) & 1) << 22) | (((a[c + 348] >> d) & 1) << 23) | (((a[c + 352] >> d) & 1) << 24) | (((a[c + 356] >> d) & 1) << 25) | (((a[c + 360] >> d) & 1) << 26) | (((a[c + 364] >> d) & 1) << 27) |
           (((a[c + 368] >> d) & 1) << 28) | (((a[c + 372] >> d) & 1) << 29) | (((a[c + 376] >> d) & 1) << 30) | (((a[c + 380] >> d) & 1) << 31);
  uint h = ((a[c + 384] >> d) & 1) | (((a[c + 388] >> d) & 1) << 1) | (((a[c + 392] >> d) & 1) << 2) | (((a[c + 396] >> d) & 1) << 3) | (((a[c + 400] >> d) & 1) << 4) | (((a[c + 404] >> d) & 1) << 5) | (((a[c + 408] >> d) & 1) << 6) | (((a[c + 412] >> d) & 1) << 7) | (((a[c + 416] >> d) & 1) << 8) | (((a[c + 420] >> d) & 1) << 9) | (((a[c + 424] >> d) & 1) << 10) | (((a[c + 428] >> d) & 1) << 11) | (((a[c + 432] >> d) & 1) << 12) | (((a[c + 436] >> d) & 1) << 13) |
           (((a[c + 440] >> d) & 1) << 14) | (((a[c + 444] >> d) & 1) << 15) | (((a[c + 448] >> d) & 1) << 16) | (((a[c + 452] >> d) & 1) << 17) | (((a[c + 456] >> d) & 1) << 18) | (((a[c + 460] >> d) & 1) << 19) | (((a[c + 464] >> d) & 1) << 20) | (((a[c + 468] >> d) & 1) << 21) | (((a[c + 472] >> d) & 1) << 22) | (((a[c + 476] >> d) & 1) << 23) | (((a[c + 480] >> d) & 1) << 24) | (((a[c + 484] >> d) & 1) << 25) | (((a[c + 488] >> d) & 1) << 26) | (((a[c + 492] >> d) & 1) << 27) |
           (((a[c + 496] >> d) & 1) << 28) | (((a[c + 500] >> d) & 1) << 29) | (((a[c + 504] >> d) & 1) << 30) | (((a[c + 508] >> d) & 1) << 31);
 return (uint4)(e f g h;
}

void G(__local uint4* a, __global uint* b, uint c, uint d) {
  uint e = d >> 5;
  uint f = d & 0x1F;
  uint g = 0, h = 0, i = 0, j = 0;
  switch (e) {
    case 0:
      for (int k = 0; k < 32; k++)
        g |= ((a[k].s0 >> f) & 1) << k;
      for (int k = 0; k < 32; k++)
        h |= ((a[k + 32].s0 >> f) & 1) << k;
      for (int k = 0; k < 32; k++)
        i |= ((a[k + 64].s0 >> f) & 1) << k;
      for (int k = 0; k < 32; k++)
        j |= ((a[k + 96].s0 >> f) & 1) << k;
      break;
    case 1:
      for (int k = 0; k < 32; k++)
        g |= ((a[k].s1 >> f) & 1) << k;
      for (int k = 0; k < 32; k++)
        h |= ((a[k + 32].s1 >> f) & 1) << k;
      for (int k = 0; k < 32; k++)
        i |= ((a[k + 64].s1 >> f) & 1) << k;
      for (int k = 0; k < 32; k++)
        j |= ((a[k + 96].s1 >> f) & 1) << k;
      break;
    case 2:
      for (int k = 0; k < 32; k++)
        g |= ((a[k].s2 >> f) & 1) << k;
      for (int k = 0; k < 32; k++)
        h |= ((a[k + 32].s2 >> f) & 1) << k;
      for (int k = 0; k < 32; k++)
        i |= ((a[k + 64].s2 >> f) & 1) << k;
      for (int k = 0; k < 32; k++)
        j |= ((a[k + 96].s2 >> f) & 1) << k;
      break;
    case 3:
      for (int k = 0; k < 32; k++)
        g |= ((a[k].s3 >> f) & 1) << k;
      for (int k = 0; k < 32; k++)
        h |= ((a[k + 32].s3 >> f) & 1) << k;
      for (int k = 0; k < 32; k++)
        i |= ((a[k + 64].s3 >> f) & 1) << k;
      for (int k = 0; k < 32; k++)
        j |= ((a[k + 96].s3 >> f) & 1) << k;
      break;
  }
  b[(c + d) * 4] = g;
  b[(c + d) * 4 + 1] = h;
  b[(c + d) * 4 + 2] = i;
  b[(c + d) * 4 + 3] = j;
}

__kernel void H(__global uint* a, const __global uint* b, __local uint4* c, __local uint4* d, __local uint* e) {
  uint f = get_group_id(0);
  uint g = get_local_id(0);
  uint h = f * 128;

  e[g * 4 + 0] = a[(h + g) * 4 + 0];
  e[g * 4 + 1] = a[(h + g) * 4 + 1];
  e[g * 4 + 2] = a[(h + g) * 4 + 2];
  e[g * 4 + 3] = a[(h + g) * 4 + 3];
  barrier(1);
  c[g] = F(e, g) ^ b[g];
  barrier(1);

  for (uint i = 1; i < 10; i++) {
    E(c, d, g);
    barrier(1);
    c[g] = D(d, g) ^ b[i * 128 + g];
    barrier(1);
  }
  E(c, d, g);
  barrier(1);
  uint j = B(g);
  c[j] = d[g] ^ b[10 * 128 + j];
  barrier(1);
  G(c, a, h, g);
}

__kernel void I(const __global uchar* a, __global uint* b) {
  uint c = get_global_id(0);
  uint d = c >> 3;
  uint e = c & 0x7;
  b[c] = ((a[d] >> e) & 1) == 0 ? 0 : 0xffffffff;
}