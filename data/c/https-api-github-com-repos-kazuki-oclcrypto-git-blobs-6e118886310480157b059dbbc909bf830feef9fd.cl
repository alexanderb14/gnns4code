void A(__private uint* a, int b, int c); void B(__private uint* a); void C(__private uint* a); __kernel void D(__global uint* a) {
  __private uint b[128];
  a += get_global_id(0) * 128;

  for (int c = 0; c < 128; c++)
    b[c] = a[c];

  for (int d = 0; d < 2; d++) {
    for (int c = 0; c < 3; c++) {
      A(b, 0, 64);
      A(b, 64, 0);
    }
    B(b);
    C(b + 64);
  }
  for (int c = 0; c < 3; c++) {
    A(b, 0, 64);
    A(b, 64, 0);
  }

  for (int c = 0; c < 64; c++)
    a[c] = b[c + 64];
  for (int c = 0; c < 64; c++)
    a[c + 64] = b[c];
}

__kernel void E(__global uint4* a, __local uint4* b) {
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

__kernel void F(__global uint* a, __local uint* b) {
  size_t c = get_local_id(0);
  b += (c & 0xFFFFFFE0) << 2;
  a += (get_global_id(0) & 0xFFFFFFE0) << 2;

  c &= 0x1F;
  b[c * 4 + 0] = a[c * 4 + 0];
  b[c * 4 + 1] = a[c * 4 + 1];
  b[c * 4 + 2] = a[c * 4 + 2];
  b[c * 4 + 3] = a[c * 4 + 3];
  barrier(1);

  a[c + 0] = b[c * 4 + 0];
  a[c + 32] = b[c * 4 + 1];
  a[c + 64] = b[c * 4 + 2];
  a[c + 96] = b[c * 4 + 3];
}

__kernel void G(__global uint* a, __local uint* b) {
  size_t c = get_local_id(0);
  b += (c & 0xFFFFFFE0) << 2;
  a += (get_global_id(0) & 0xFFFFFFE0) << 2;

  c &= 0x1F;
  b[c * 4 + 0] = a[c * 4 + 0];
  b[c * 4 + 1] = a[c * 4 + 1];
  b[c * 4 + 2] = a[c * 4 + 2];
  b[c * 4 + 3] = a[c * 4 + 3];
  barrier(1);

  a[c * 4 + 0] = b[c + 0];
  a[c * 4 + 1] = b[c + 32];
  a[c * 4 + 2] = b[c + 64];
  a[c * 4 + 3] = b[c + 96];
}

void H(__private uint* a, __private uint* b);
void I(__private uint* a, __private uint* b);
void J(__private uint* a, __private uint* b);
void K(__private uint* a, __private uint* b);
void A(__private uint* a, int b, int c) {
  __private uint d[64];
  H(a + b + 0, d + 0);
  I(a + b + 8, d + 8);
  J(a + b + 16, d + 16);
  K(a + b + 24, d + 24);
  I(a + b + 32, d + 32);
  J(a + b + 40, d + 40);
  K(a + b + 48, d + 48);
  H(a + b + 56, d + 56);

  for (int e = 0; e < 8; e++) {
    a[c + e + 0] ^= d[0 + e] ^ d[16 + e] ^ d[24 + e] ^ d[40 + e] ^ d[48 + e] ^ d[56 + e];
    a[c + e + 8] ^= d[0 + e] ^ d[8 + e] ^ d[24 + e] ^ d[32 + e] ^ d[48 + e] ^ d[56 + e];
    a[c + e + 16] ^= d[0 + e] ^ d[8 + e] ^ d[16 + e] ^ d[32 + e] ^ d[40 + e] ^ d[56 + e];
    a[c + e + 24] ^= d[8 + e] ^ d[16 + e] ^ d[24 + e] ^ d[32 + e] ^ d[40 + e] ^ d[48 + e];
    a[c + e + 32] ^= d[0 + e] ^ d[8 + e] ^ d[40 + e] ^ d[48 + e] ^ d[56 + e];
    a[c + e + 40] ^= d[8 + e] ^ d[16 + e] ^ d[32 + e] ^ d[48 + e] ^ d[56 + e];
    a[c + e + 48] ^= d[16 + e] ^ d[24 + e] ^ d[32 + e] ^ d[40 + e] ^ d[56 + e];
    a[c + e + 56] ^= d[0 + e] ^ d[24 + e] ^ d[32 + e] ^ d[40 + e] ^ d[48 + e];
  }
}

void B(__private uint* a) {
  for (int b = 0; b < 4; b++) {
    for (int c = 0; c < 7; c++)
      a[32 + b * 8 + c + 1] ^= a[b * 8 + c];
  }
  a[32] ^= a[15];
  a[40] ^= a[23];
  a[48] ^= a[31];
  a[56] ^= a[7];

  for (int b = 0; b < 32; b++)
    a[b] ^= a[b + 32];
}

void C(__private uint* a) {
  for (int b = 0; b < 32; b++)
    a[b] ^= a[b + 32];

  for (int b = 0; b < 4; b++) {
    for (int c = 0; c < 7; c++)
      a[32 + b * 8 + c + 1] ^= a[b * 8 + c];
  }
  a[32] ^= a[15];
  a[40] ^= a[23];
  a[48] ^= a[31];
  a[56] ^= a[7];
}

void H(__private uint* a, __private uint* b) {
  uint c, d, e, f, g, h, i, j;
  uint k, l, m, n, o, p, q, r;
  uint s, t, u, v, w, x, y, z, aa, ab, ac, ad, ae, af, ag;

  k = a[0];
  l = a[1];
  m = a[2];
  n = a[3];
  o = a[4];
  p = a[5];
  q = a[6];
  r = a[7];

  s = l ^ n ^ q ^ r;
  k ^= s;
  c = k ^ m;
  d = n ^ q ^ 0xFFFFFFFF;
  e = k ^ o ^ 0xFFFFFFFF;
  f = l ^ o;
  g = m ^ s ^ 0xFFFFFFFF;
  h = l ^ r ^ 0xFFFFFFFF;
  i = k ^ m ^ p;
  j = m ^ q;

  k = c ^ g;
  l = d ^ h;
  m = e ^ i;
  n = f ^ j;

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

  s = c ^ i ^ j;
  t = d ^ j;
  u = e ^ g ^ j;
  v = f ^ g ^ h ^ i;

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

  s = d ^ i;
  t = h ^ j;
  b[0] = t ^ s;
  b[1] = f ^ j ^ 0xFFFFFFFF;
  b[2] = c ^ e ^ j ^ 0xFFFFFFFF;
  s ^= e ^ f;
  b[3] = t ^ s ^ 0xFFFFFFFF;
  b[4] = c ^ e ^ h;
  b[5] = g ^ s ^ 0xFFFFFFFF;
  b[6] = d ^ h ^ 0xFFFFFFFF;
  b[7] = d ^ f ^ h;
}

void I(__private uint* a, __private uint* b) {
  uint c;
  H(a, b);
  c = b[7];
  for (int d = 7; d > 0; d--)
    b[d] = b[d - 1];
  b[0] = c;
}

void J(__private uint* a, __private uint* b) {
  uint c;
  H(a, b);
  c = b[0];
  for (int d = 0; d < 7; d++)
    b[d] = b[d + 1];
  b[7] = c;
}

void K(__private uint* a, __private uint* b) {
  uint c;
  c = a[7];
  for (int d = 7; d > 0; d--)
    b[d] = a[d - 1];
  b[0] = c;
  H(b, b);
}