void A(__local uint4* a, int b); void B(__local uint4* a); void C(__local uint4* a, int b); void D(__local uint4* a, int b, int c, const __constant uint4* d, int e); __kernel void E(__global uint4* a, const __global uint4* b, __local uint4* c) {
  int d = get_local_id(0);
  int e = d & (4 - 1);
  int f = e * (32 / 4);
  a += (get_global_id(0) / 4) * 32;
  c += (d / 4) * 32;

  for (uint g = 0; g < 8; g++)
    c[f + g] = a[f + g] ^ b[f + g];

  for (uint h = 1; h < 10; h++) {
    A(c, f);
    C(c, e);
    barrier(1);
    if (e == 0)
      B(c);
    barrier(1);
    for (uint g = 0; g < 8; g++)
      c[f + g] ^= b[f + h * 32 + g];
  }

  A(c, f);
  C(c, e);
  for (uint g = 0; g < 8; g++)
    a[f + g] = c[f + g] ^ b[f + 320 + g];
}

__kernel void F(__global uint4* a, __local uint4* b) {
  const uint4 c = (uint4)(1);
  size_t d = get_local_id(0);
  uint4 e = (uint4)(0), f;
  b += d & 0xFFFFFFE0;
  a += get_global_id(0) & 0xFFFFFFE0;

  d &= 0x1F;
  b[d] = a[d];
  barrier(1);

  f = (uint4)(d);
  for (int g = 0; g < 32; g++)
    e |= ((b[g] >> f) & c) << (uint4)(g);
  a[d] = e;
}

__kernel void G(__constant uchar* a, __global uint4* b) {
  size_t c = get_global_id(0);
  int d = c >> 5;
  int e = (d << 7) + (c & 0x1F);
  int f = e >> 3;
  int g = e & 7;

  b[c] = (ufnt4)(((a g)&1) == 0 ? 0 : 0xffffffff, f((a g)&1) == 0 ? 0 : 0xffffffff, f((a g)&1) == 0 ? 0 : 0xffffffff, f((a > g) & 1) == 0 ? 0 : 0xffffffff);
}

void A(__local uint4* a, int b) {
  uint4 c, d, e, f, g, h, i, j;
  uint4 k, l, m, n, o, p, q, r;
  uint4 s, t, u, v, w, x, y, z, aa, ab, ac, ad, ae, af, ag;

  k = a[b + 0];
  l = a[b + 1];
  m = a[b + 2];
  n = a[b + 3];
  o = a[b + 4];
  p = a[b + 5];
  q = a[b + 6];
  r = a[b + 7];

  j = p ^ r;
  f = l ^ m;
  i = f ^ n;
  c = l ^ q;
  d = c ^ o;
  c ^= k;
  e = i ^ o ^ r;
  f ^= q ^ r;
  g = i ^ j;
  h = m ^ n ^ j;
  i ^= o ^ q ^ r;

  k = c ^ g;
  l = d ^ h;
  m = e ^ i;
  n = f ^ j;

  o = g ^ h ^ j;
  p = h ^ i;
  q = i ^ j;
  r = o ^ q;
  o = q;
  q = p ^ j ^ r;
  p = j;

  s = n & f;
  t = (m & e) ^ s;
  u = s ^ (m & f) ^ (n & e);
  v = l & d;
  w = (k & c) ^ v;
  x = v ^ (k & d) ^ (l & c);
  s = k ^ m;
  v = l ^ n;
  c ^= e;
  d ^= f;
  y = v & d;
  e = (s & c) ^ y ^ w;
  f = y ^ (s & d) ^ (v & c) ^ x;
  c = u ^ w;
  d = t ^ u ^ x;

  s = o ^ c;
  t = p ^ d;
  u = q ^ e;
  v = r ^ f;
  w = s & v;
  x = t & u;
  y = t & v;
  z = u & v;
  aa = s & x;
  ab = s & y;
  ac = s & z;
  ad = t & z;
  ae = t ^ u;
  af = ad ^ ac;
  ag = w ^ x;
  o = s ^ ae ^ af ^ y ^ ab ^ ag ^ aa;
  p = ae ^ v ^ ad ^ ab ^ (s & u);
  q = u ^ af ^ ag;
  r = u ^ v ^ ad ^ w;

  s = o ^ q;
  t = p ^ r;
  u = r & j;
  v = (q & i) ^ u;
  w = u ^ (q & j) ^ (r & i);
  x = p & h;
  y = (o & g) ^ x;
  z = x ^ (o & h) ^ (p & g);
  u = g ^ i;
  x = h ^ j;
  aa = t & x;
  g = w ^ y;
  h = v ^ w ^ z;
  i = (s & u) ^ aa ^ y;
  j = aa ^ (s & x) ^ (t & u) ^ z;
  u = r & n;
  v = (q & m) ^ u;
  w = u ^ (q & n) ^ (r & m);
  x = p & l;
  y = (o & k) ^ x;
  z = x ^ (o & l) ^ (p & k);
  u = k ^ m;
  x = l ^ n;
  aa = t & x;
  c = w ^ y;
  d = v ^ w ^ z;
  e = (s & u) ^ aa ^ y;
  f = aa ^ (s & x) ^ (t & u) ^ z;

  k = c ^ d ^ e;
  l = i ^ j;
  m = c ^ j;
  n = e ^ j;
  o = g ^ h ^ i;
  a[b + 0] = ~(k ^ l);
  a[b + 1] = ~m;
  a[b + 2] = c ^ e ^ f ^ o;
  a[b + 3] = k;
  a[b + 4] = m ^ d ^ g;
  a[b + 5] = ~n;
  a[b + 6] = ~(o ^ j);
  a[b + 7] = n ^ f;
}

void B(__local uint4* b) {
  uint4 c, d, e, f, g, h, i, j;
  uint4 k, l, m;
  k = b[7] ^ b[8];
  l = b[15] ^ b[16];
  m = b[23] ^ b[24];
  c = k ^ l ^ b[24];
  d = b[0] ^ l ^ m;
  e = b[0] ^ b[8] ^ m ^ b[31];
  f = b[0] ^ k ^ b[16] ^ b[31];
  g = b[0] ^ k ^ b[9] ^ b[15] ^ b[17] ^ b[25];
  h = b[1] ^ b[8] ^ l ^ b[17] ^ b[23] ^ b[25];
  i = b[1] ^ b[9] ^ b[16] ^ m ^ b[25] ^ b[31];
  j = b[0] ^ b[1] ^ b[7] ^ b[9] ^ b[17] ^ b[24] ^ b[31];
  b[0] = c;
  b[8] = d;
  b[16] = e;
  b[24] = f;
  c = b[1] ^ b[9] ^ b[10] ^ b[18] ^ b[26];
  d = b[2] ^ b[9] ^ b[17] ^ b[18] ^ b[26];
  e = b[2] ^ b[10] ^ b[17] ^ b[25] ^ b[26];
  f = b[1] ^ b[2] ^ b[10] ^ b[18] ^ b[25];
  b[1] = g;
  b[9] = h;
  b[17] = i;
  b[25] = j;
  g = b[2] ^ b[7] ^ b[10] ^ b[11] ^ b[15] ^ b[19] ^ b[27];
  h = b[3] ^ b[10] ^ b[15] ^ b[18] ^ b[19] ^ b[23] ^ b[27];
  i = b[3] ^ b[11] ^ b[18] ^ b[23] ^ b[26] ^ b[27] ^ b[31];
  j = b[2] ^ b[3] ^ b[7] ^ b[11] ^ b[19] ^ b[26] ^ b[31];
  b[2] = c;
  b[10] = d;
  b[18] = e;
  b[26] = f;
  c = b[3] ^ b[7] ^ b[11] ^ b[12] ^ b[15] ^ b[20] ^ b[28];
  d = b[4] ^ b[11] ^ b[15] ^ b[19] ^ b[20] ^ b[23] ^ b[28];
  e = b[4] ^ b[12] ^ b[19] ^ b[23] ^ b[27] ^ b[28] ^ b[31];
  f = b[3] ^ b[4] ^ b[7] ^ b[12] ^ b[20] ^ b[27] ^ b[31];
  b[3] = g;
  b[11] = h;
  b[19] = i;
  b[27] = j;
  g = b[4] ^ b[12] ^ b[13] ^ b[21] ^ b[29];
  h = b[5] ^ b[12] ^ b[20] ^ b[21] ^ b[29];
  i = b[5] ^ b[13] ^ b[20] ^ b[28] ^ b[29];
  j = b[4] ^ b[5] ^ b[13] ^ b[21] ^ b[28];
  b[4] = c;
  b[12] = d;
  b[20] = e;
  b[28] = f;
  c = b[5] ^ b[13] ^ b[14] ^ b[22] ^ b[30];
  d = b[6] ^ b[13] ^ b[21] ^ b[22] ^ b[30];
  e = b[6] ^ b[14] ^ b[21] ^ b[29] ^ b[30];
  f = b[5] ^ b[6] ^ b[14] ^ b[22] ^ b[29];
  b[5] = g;
  b[13] = h;
  b[21] = i;
  b[29] = j;
  g = b[6] ^ b[14] ^ b[15] ^ b[23] ^ b[31];
  h = b[7] ^ b[14] ^ b[22] ^ b[23] ^ b[31];
  i = b[7] ^ b[15] ^ b[22] ^ b[30] ^ b[31];
  j = b[6] ^ b[7] ^ b[15] ^ b[23] ^ b[30];
  b[6] = c;
  b[7] = g;
  b[14] = d;
  b[15] = h;
  b[22] = e;
  b[23] = i;
  b[30] = f;
  b[31] = j;
}

void C(__local uint4* a, int b) {
  switch (b) {
    case 1:
      for (uint c = 8; c < 16; c++)
        a[c] = a[c].s1230;
      break;
    case 2:
      for (uint c = 16; c < 24; c++)
        a[c] = a[c].s2301;
      break;
    case 3:
      for (uint c = 24; c < 32; c++)
        a[c] = a[c].s3012;
      break;
  }
}