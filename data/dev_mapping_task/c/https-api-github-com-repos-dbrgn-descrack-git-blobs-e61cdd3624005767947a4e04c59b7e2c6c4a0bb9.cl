void A(__private uint* a) {
  uint b = get_global_id(0);
  uint c = get_global_id(1);
  uint d;

  for (d = 5; d < 25; d++) {
    a[d - 5] = ~(((b >> (24 - d)) & 1) - 1);
  }

  for (d = 0; d < 31; d++) {
    a[d + 20] = ~(((c >> (31 - d - 1)) & 1) - 1);
  }

  a[55] = 0x55555555;
  a[54] = 0x33333333;
  a[53] = 0x0F0F0F0F;
  a[52] = 0x00FF00FF;
  a[51] = 0x0000FFFF;
}
void B(uint a, uint b, uint c, uint d, uint e, uint f, uint* g, uint* h, uint* i, uint* j) {
  uint k, l, m, n, o, p, q;
  uint r, s, t, u, v, w;
  uint x, y, z, aa;
  uint ab, ac, ad, ae;
  uint af, ag, ah, ai, aj, ak;
  uint al, am, an, ao, ap;
  uint aq, ar, as, at, au;
  uint av, aw, ax, ay;
  uint az, ba, bb, bc, bd, be, bf, bg;

  k = a & ~e;
  l = d ^ k;
  m = c | f;
  n = a ^ c;
  o = m & n;
  p = d ^ o;
  q = p & ~l;

  r = e ^ f;
  s = c ^ r;
  t = l & ~s;
  u = f | o;
  v = t ^ u;
  w = v & ~q;

  x = a | f;
  y = v | x;
  z = e & ~p;
  aa = y ^ z;

  ab = d & ~x;
  ac = z ^ ab;
  ad = r & ~n;
  ae = ac | ad;

  af = c & ~k;
  ag = l ^ y;
  ah = ag & ~af;
  ai = ~ah;
  aj = m & v;
  ak = ai ^ aj;
  bd = aa & ~b;
  be = bd ^ ak;
  *i ^= be;

  al = r ^ ah;
  am = z | al;
  an = m ^ am;
  ao = a ^ an;
  ap = ak ^ ao;
  az = q | b;
  ba = az ^ ap;
  *g ^= ba;

  aq = m ^ y;
  ar = ae | aq;
  as = ao ^ ar;
  at = r | ap;
  au = as ^ at;
  bb = w | b;
  bc = bb ^ au;
  *h ^= bc;

  av = e | l;
  aw = av & ~as;
  ax = w & ao;
  ay = aw ^ ax;
  bf = ay | b;
  bg = bf ^ ae;
  *j ^= bg;
}

void C(uint a, uint b, uint c, uint d, uint e, uint f, uint* g, uint* h, uint* i, uint* j) {
  uint k;
  uint l, m, n;
  uint o, p, q, r;
  uint s, t, u, v;
  uint w, x, y, z, aa, ab;
  uint ac, ad, ae, af, ag;
  uint ah, ai, aj, ak, al;
  uint am, an, ao, ap, aq;
  uint ar, as, at;
  uint au, av, aw, ax, ay, az, ba, bb;

  k = b ^ e;

  l = a & ~f;
  m = e & ~l;
  n = b | m;

  o = k & ~f;
  p = a & k;
  q = e ^ p;
  r = q & ~o;

  s = c & f;
  t = m ^ o;
  u = n & t;
  v = u & ~s;

  w = c & u;
  x = ~a;
  y = w ^ x;
  z = f ^ k;
  aa = z & ~s;
  ab = y ^ aa;
  aw = d & ~v;
  ax = aw ^ ab;
  *h ^= ax;

  ac = b & ~aa;
  ad = q ^ ac;
  ae = y & ~ad;
  af = c ^ z;
  ag = ae ^ af;
  au = n & ~d;
  av = au ^ ag;
  *g ^= av;

  ah = w ^ ac;
  ai = af | ah;
  aj = n ^ ab;
  ak = s | aj;
  al = ai ^ ak;

  am = u ^ ab;
  an = ag ^ am;
  ao = ak & an;
  ap = k & ai;
  aq = ao ^ ap;
  ay = aq | d;
  az = ay ^ al;
  *i ^= az;

  ar = aq & ~ad;
  as = z | aj;
  at = ar ^ as;
  ba = r | d;
  bb = ba ^ at;
  *j ^= bb;
}

void D(uint a, uint b, uint c, uint d, uint e, uint f, uint* g, uint* h, uint* i, uint* j) {
  uint k, l, m, n, o, p;
  uint q, r, s, t;
  uint u, v, w, x;
  uint y, z, aa, ab, ac;
  uint ad, ae, af, ag, ah;
  uint ai, aj, ak, al;
  uint am, an, ao, ap, aq;
  uint ar, as, at, au, av;
  uint aw, ax, ay, az, ba, bb, bc, bd;

  k = a & ~b;
  l = c ^ f;
  m = k | l;
  n = d ^ f;
  o = n & ~a;
  p = m ^ o;

  q = b ^ l;
  r = q & ~f;
  s = m ^ r;
  t = p & ~s;

  u = f & p;
  v = d | u;
  w = a & v;
  x = q ^ w;
  bc = p & ~e;
  bd = bc ^ x;
  *j ^= bd;

  y = l & n;
  z = a ^ d;
  aa = s ^ z;
  ab = c | aa;
  ac = ab & ~y;

  ad = o | z;
  ae = x & ~ad;
  af = d & f;
  ag = af & ~b;
  ah = ae ^ ag;

  ai = s & ah;
  aj = q | af;
  ak = aj & ~ai;
  al = a ^ ak;
  ay = ac & e;
  az = ay ^ al;
  *h ^= az;

  am = p & ~b;
  an = am & ~c;
  ao = ~q;
  ap = ad ^ ao;
  aq = an ^ ap;
  aw = e & ~t;
  ax = aw ^ aq;
  *g ^= ax;

  ar = an | ap;
  as = o | am;
  at = ar ^ as;
  au = d & ~p;
  av = at | au;
  ba = e & ~ah;
  bb = ba ^ av;
  *i ^= bb;
}

void E(uint a, uint b, uint c, uint d, uint e, uint f, uint* g, uint* h, uint* i, uint* j) {
  uint k, l;
  uint m, n, o, p, q, r, s, t;
  uint u, v, w, x, y;
  uint z, aa, ab, ac, ad, ae;
  uint af, ag, ah, ai;
  uint aj, ak, al, am, an, ao, ap, aq;

  k = a ^ c;
  l = c ^ e;
  m = b | d;
  n = e ^ m;
  o = l & ~n;
  p = l & ~b;
  q = d ^ p;
  r = k | q;
  s = r & ~o;
  t = b ^ s;

  u = q & t;
  v = l & ~u;
  w = k ^ t;
  x = w & ~v;
  y = o ^ x;

  z = b ^ d;
  aa = e | p;
  ab = w ^ aa;
  ac = ab & ~z;
  ad = s ^ ac;
  aj = f & ~y;
  ak = aj ^ ad;
  *g ^= ak;

  ae = ~ad;
  al = y & ~f;
  am = al ^ ae;
  *h ^= am;

  af = y ^ ae;
  ag = af & ~z;
  ah = u | ag;
  ai = ab ^ ah;
  an = t | f;
  ao = an ^ ai;
  *i ^= ao;

  ap = f & t;
  aq = ap ^ ai;
  *j ^= aq;
}

void F(uint a, uint b, uint c, uint d, uint e, uint f, uint* g, uint* h, uint* i, uint* j) {
  uint k, l, m, n, o;
  uint p, q, r, s, t, u;
  uint v, w, x, y, z, aa;
  uint ab, ac, ad, ae, af;
  uint ag, ah, ai, aj, ak;
  uint al, am, an, ao, ap;
  uint aq, ar, as, at;
  uint au, av, aw, ax;
  uint ay, az, ba, bb, bc, bd, be, bf;

  k = a | c;
  l = k & ~f;
  m = a ^ l;
  n = c ^ m;
  o = d | n;

  p = l & ~d;
  q = c ^ p;
  r = e & q;
  s = a | n;
  t = r ^ s;
  u = d ^ t;

  v = f ^ u;
  w = m | v;
  x = e & w;
  y = m ^ x;
  z = d & s;
  aa = y ^ z;

  ab = w & ~a;
  ac = q ^ ab;
  ad = e ^ o;
  ae = ad & ~ac;
  af = ~ae;
  bc = af & ~b;
  bd = bc ^ u;
  *i ^= bd;

  ag = q & ~x;
  ah = ab ^ ad;
  ai = aa | ah;
  aj = ai & ~ag;
  ak = o & ~aj;

  al = v & aj;
  am = ad ^ al;
  an = q & s;
  ao = am | an;
  ap = x ^ ao;
  be = ap & b;
  bf = be ^ aa;
  *j ^= bf;

  aq = a ^ k;
  ar = aj ^ aq;
  as = d & am;
  at = ar ^ as;
  ay = ak | b;
  az = ay ^ at;
  *g ^= az;

  au = o ^ q;
  av = au & ~at;
  aw = m ^ am;
  ax = av ^ aw;
  ba = o & b;
  bb = ba ^ ax;
  *h ^= bb;
}

void G(uint a, uint b, uint c, uint d, uint e, uint f, uint* g, uint* h, uint* i, uint* j) {
  uint k;
  uint l, m, n, o, p;
  uint q, r, s, t, u;
  uint v, w, x, y;
  uint z, aa, ab, ac, ad;
  uint ae, af, ag, ah;
  uint ai, aj, ak, al;
  uint am, an, ao, ap, aq;
  uint ar, as, at, au, av;
  uint aw, ax, ay, az, ba, bb, bc, bd;

  k = b ^ e;

  l = b | f;
  m = a & l;
  n = k ^ m;
  o = f ^ n;
  p = e & ~o;

  q = a & o;
  r = b ^ q;
  s = a ^ c;
  t = r | s;
  u = n ^ t;

  v = c & u;
  w = v & ~f;
  x = p | r;
  y = w ^ x;
  bc = y & d;
  bd = bc ^ u;
  *j ^= bd;

  z = b ^ t;
  aa = f & ~z;
  ab = c ^ aa;
  ac = e & ~v;
  ad = ab | ac;

  ae = a | u;
  af = x & ae;
  ag = ab ^ af;
  ah = ag & ~w;
  ba = p | d;
  bb = ba ^ ah;
  *i ^= bb;

  ai = b | s;
  aj = y ^ ai;
  ak = m | ad;
  al = aj ^ ak;

  am = n ^ ag;
  an = e & ~am;
  ao = ~z;
  ap = ai ^ ao;
  aq = an ^ ap;
  ay = aq & ~d;
  az = ay ^ al;
  *h ^= az;

  ar = f ^ q;
  as = a ^ ab;
  at = ar & as;
  au = v ^ ap;
  av = at ^ au;
  aw = ad & ~d;
  ax = aw ^ av;
  *g ^= ax;
}

void H(uint a, uint b, uint c, uint d, uint e, uint f, uint* g, uint* h, uint* i, uint* j) {
  uint k, l, m, n, o, p;
  uint q, r, s, t, u;
  uint v, w, x, y;
  uint z, aa, ab, ac, ad;
  uint ae, af, ag, ah, ai;
  uint aj, ak, al, am, an;
  uint ao, ap, aq, ar;
  uint as, at, au, av;
  uint aw, ax, ay, az, ba, bb, bc, bd;

  k = d ^ e;
  l = c ^ k;
  m = f & l;
  n = d & k;
  o = b ^ n;
  p = m & o;

  q = f & n;
  r = c ^ q;
  s = o | r;
  t = f ^ k;
  u = s ^ t;
  bc = a & ~p;
  bd = bc ^ u;
  *j ^= bd;

  v = e & ~l;
  w = o | v;
  x = m ^ r;
  y = w ^ x;

  z = m ^ t;
  aa = d & ~z;
  ab = o & ~aa;
  ac = e ^ x;
  ad = ab ^ ac;

  ae = n | u;
  af = c & ad;
  ag = ae | af;
  ah = l & ~t;
  ai = ag ^ ah;
  aw = ai & ~a;
  ax = aw ^ y;
  *g ^= ax;

  aj = ad | ai;
  ak = f & aj;
  al = b & ak;
  am = y ^ ai;
  an = al ^ am;

  ao = af | an;
  ap = ak ^ ao;
  aq = e ^ am;
  ar = ap | aq;
  ba = ar & a;
  bb = ba ^ ad;
  *i ^= bb;

  as = ak ^ ar;
  at = v | as;
  au = ~ai;
  av = at ^ au;
  ay = av & ~a;
  az = ay ^ an;
  *h ^= az;
}

void I(uint a, uint b, uint c, uint d, uint e, uint f, uint* g, uint* h, uint* i, uint* j) {
  uint k, l, m, n, o;
  uint p, q, r, s, t, u;
  uint v, w, x, y, z;
  uint aa, ab, ac, ad, ae;
  uint af, ag, ah, ai;
  uint aj, ak, al, am;
  uint an, ao, ap, aq;
  uint ar, as, at, au, av, aw, ax, ay;

  k = c & ~b;
  l = e & ~c;
  m = d ^ l;
  n = a & m;
  o = n & ~k;

  p = b & ~m;
  q = a | p;
  r = b & ~c;
  s = e ^ r;
  t = q & s;
  u = n | t;

  v = ~m;
  w = t ^ v;
  x = c & ~q;
  y = w ^ x;
  z = k ^ y;
  at = o | f;
  au = at ^ z;
  *h ^= au;

  aa = a ^ z;
  ab = e & aa;
  ac = b ^ y;
  ad = ab ^ ac;
  ae = p ^ ad;

  af = u ^ ad;
  ag = b | af;
  ah = e ^ aa;
  ai = ag ^ ah;
  av = u & f;
  aw = av ^ ai;
  *i ^= aw;

  aj = s ^ ae;
  ak = d | ac;
  al = aj ^ ak;
  am = a ^ al;
  ax = am & f;
  ay = ax ^ ae;
  *j ^= ay;

  an = aj & ~d;
  ao = ai & an;
  ap = o ^ al;
  aq = ao ^ ap;
  ar = aq | f;
  as = ar ^ ae;
  *g ^= as;
}

void J(uint a[], uint b[], uint c[]) {
  B(a[31] ^ b[8], a[0] ^ b[44], a[1] ^ b[29], a[2] ^ b[52], a[3] ^ b[42], a[4] ^ b[14], &c[8], &c[16], &c[22], &c[30]);
  C(a[3] ^ b[28], a[4] ^ b[49], a[5] ^ b[1], a[6] ^ b[7], a[7] ^ b[16], a[8] ^ b[36], &c[12], &c[27], &c[1], &c[17]);
  D(a[7] ^ b[2], a[8] ^ b[30], a[9] ^ b[22], a[10] ^ b[21], a[11] ^ b[38], a[12] ^ b[50], &c[23], &c[15], &c[29], &c[5]);
  E(a[11] ^ b[51], a[12] ^ b[0], a[13] ^ b[31], a[14] ^ b[23], a[15] ^ b[15], a[16] ^ b[35], &c[25], &c[19], &c[9], &c[0]);
  F(a[15] ^ b[19], a[16] ^ b[24], a[17] ^ b[34], a[18] ^ b[47], a[19] ^ b[32], a[20] ^ b[3], &c[7], &c[13], &c[24], &c[2]);
  G(a[19] ^ b[41], a[20] ^ b[26], a[21] ^ b[4], a[22] ^ b[46], a[23] ^ b[20], a[24] ^ b[25], &c[3], &c[28], &c[10], &c[18]);
  H(a[23] ^ b[53], a[24] ^ b[18], a[25] ^ b[33], a[26] ^ b[55], a[27] ^ b[13], a[28] ^ b[17], &c[31], &c[11], &c[21], &c[6]);
  I(a[27] ^ b[39], a[28] ^ b[12], a[29] ^ b[11], a[30] ^ b[54], a[31] ^ b[48], a[0] ^ b[27], &c[4], &c[26], &c[14], &c[20]);
}

void K(uint a[], uint b[], uint c[]) {
  B(a[31] ^ b[1], a[0] ^ b[37], a[1] ^ b[22], a[2] ^ b[45], a[3] ^ b[35], a[4] ^ b[7], &c[8], &c[16], &c[22], &c[30]);
  C(a[3] ^ b[21], a[4] ^ b[42], a[5] ^ b[51], a[6] ^ b[0], a[7] ^ b[9], a[8] ^ b[29], &c[12], &c[27], &c[1], &c[17]);
  D(a[7] ^ b[52], a[8] ^ b[23], a[9] ^ b[15], a[10] ^ b[14], a[11] ^ b[31], a[12] ^ b[43], &c[23], &c[15], &c[29], &c[5]);
  E(a[11] ^ b[44], a[12] ^ b[50], a[13] ^ b[49], a[14] ^ b[16], a[15] ^ b[8], a[16] ^ b[28], &c[25], &c[19], &c[9], &c[0]);
  F(a[15] ^ b[12], a[16] ^ b[17], a[17] ^ b[27], a[18] ^ b[40], a[19] ^ b[25], a[20] ^ b[55], &c[7], &c[13], &c[24], &c[2]);
  G(a[19] ^ b[34], a[20] ^ b[19], a[21] ^ b[24], a[22] ^ b[39], a[23] ^ b[13], a[24] ^ b[18], &c[3], &c[28], &c[10], &c[18]);
  H(a[23] ^ b[46], a[24] ^ b[11], a[25] ^ b[26], a[26] ^ b[48], a[27] ^ b[6], a[28] ^ b[10], &c[31], &c[11], &c[21], &c[6]);
  I(a[27] ^ b[32], a[28] ^ b[5], a[29] ^ b[4], a[30] ^ b[47], a[31] ^ b[41], a[0] ^ b[20], &c[4], &c[26], &c[14], &c[20]);
}

void L(uint a[], uint b[], uint c[]) {
  B(a[31] ^ b[44], a[0] ^ b[23], a[1] ^ b[8], a[2] ^ b[31], a[3] ^ b[21], a[4] ^ b[50], &c[8], &c[16], &c[22], &c[30]);
  C(a[3] ^ b[7], a[4] ^ b[28], a[5] ^ b[37], a[6] ^ b[43], a[7] ^ b[52], a[8] ^ b[15], &c[12], &c[27], &c[1], &c[17]);
  D(a[7] ^ b[38], a[8] ^ b[9], a[9] ^ b[1], a[10] ^ b[0], a[11] ^ b[42], a[12] ^ b[29], &c[23], &c[15], &c[29], &c[5]);
  E(a[11] ^ b[30], a[12] ^ b[36], a[13] ^ b[35], a[14] ^ b[2], a[15] ^ b[51], a[16] ^ b[14], &c[25], &c[19], &c[9], &c[0]);
  F(a[15] ^ b[53], a[16] ^ b[3], a[17] ^ b[13], a[18] ^ b[26], a[19] ^ b[11], a[20] ^ b[41], &c[7], &c[13], &c[24], &c[2]);
  G(a[19] ^ b[20], a[20] ^ b[5], a[21] ^ b[10], a[22] ^ b[25], a[23] ^ b[54], a[24] ^ b[4], &c[3], &c[28], &c[10], &c[18]);
  H(a[23] ^ b[32], a[24] ^ b[24], a[25] ^ b[12], a[26] ^ b[34], a[27] ^ b[47], a[28] ^ b[55], &c[31], &c[11], &c[21], &c[6]);
  I(a[27] ^ b[18], a[28] ^ b[46], a[29] ^ b[17], a[30] ^ b[33], a[31] ^ b[27], a[0] ^ b[6], &c[4], &c[26], &c[14], &c[20]);
}

void M(uint a[], uint b[], uint c[]) {
  B(a[31] ^ b[30], a[0] ^ b[9], a[1] ^ b[51], a[2] ^ b[42], a[3] ^ b[7], a[4] ^ b[36], &c[8], &c[16], &c[22], &c[30]);
  C(a[3] ^ b[50], a[4] ^ b[14], a[5] ^ b[23], a[6] ^ b[29], a[7] ^ b[38], a[8] ^ b[1], &c[12], &c[27], &c[1], &c[17]);
  D(a[7] ^ b[49], a[8] ^ b[52], a[9] ^ b[44], a[10] ^ b[43], a[11] ^ b[28], a[12] ^ b[15], &c[23], &c[15], &c[29], &c[5]);
  E(a[11] ^ b[16], a[12] ^ b[22], a[13] ^ b[21], a[14] ^ b[45], a[15] ^ b[37], a[16] ^ b[0], &c[25], &c[19], &c[9], &c[0]);
  F(a[15] ^ b[39], a[16] ^ b[48], a[17] ^ b[54], a[18] ^ b[12], a[19] ^ b[24], a[20] ^ b[27], &c[7], &c[13], &c[24], &c[2]);
  G(a[19] ^ b[6], a[20] ^ b[46], a[21] ^ b[55], a[22] ^ b[11], a[23] ^ b[40], a[24] ^ b[17], &c[3], &c[28], &c[10], &c[18]);
  H(a[23] ^ b[18], a[24] ^ b[10], a[25] ^ b[53], a[26] ^ b[20], a[27] ^ b[33], a[28] ^ b[41], &c[31], &c[11], &c[21], &c[6]);
  I(a[27] ^ b[4], a[28] ^ b[32], a[29] ^ b[3], a[30] ^ b[19], a[31] ^ b[13], a[0] ^ b[47], &c[4], &c[26], &c[14], &c[20]);
}

void N(uint a[], uint b[], uint c[]) {
  B(a[31] ^ b[16], a[0] ^ b[52], a[1] ^ b[37], a[2] ^ b[28], a[3] ^ b[50], a[4] ^ b[22], &c[8], &c[16], &c[22], &c[30]);
  C(a[3] ^ b[36], a[4] ^ b[0], a[5] ^ b[9], a[6] ^ b[15], a[7] ^ b[49], a[8] ^ b[44], &c[12], &c[27], &c[1], &c[17]);
  D(a[7] ^ b[35], a[8] ^ b[38], a[9] ^ b[30], a[10] ^ b[29], a[11] ^ b[14], a[12] ^ b[1], &c[23], &c[15], &c[29], &c[5]);
  E(a[11] ^ b[2], a[12] ^ b[8], a[13] ^ b[7], a[14] ^ b[31], a[15] ^ b[23], a[16] ^ b[43], &c[25], &c[19], &c[9], &c[0]);
  F(a[15] ^ b[25], a[16] ^ b[34], a[17] ^ b[40], a[18] ^ b[53], a[19] ^ b[10], a[20] ^ b[13], &c[7], &c[13], &c[24], &c[2]);
  G(a[19] ^ b[47], a[20] ^ b[32], a[21] ^ b[41], a[22] ^ b[24], a[23] ^ b[26], a[24] ^ b[3], &c[3], &c[28], &c[10], &c[18]);
  H(a[23] ^ b[4], a[24] ^ b[55], a[25] ^ b[39], a[26] ^ b[6], a[27] ^ b[19], a[28] ^ b[27], &c[31], &c[11], &c[21], &c[6]);
  I(a[27] ^ b[17], a[28] ^ b[18], a[29] ^ b[48], a[30] ^ b[5], a[31] ^ b[54], a[0] ^ b[33], &c[4], &c[26], &c[14], &c[20]);
}

void O(uint a[], uint b[], uint c[]) {
  B(a[31] ^ b[2], a[0] ^ b[38], a[1] ^ b[23], a[2] ^ b[14], a[3] ^ b[36], a[4] ^ b[8], &c[8], &c[16], &c[22], &c[30]);
  C(a[3] ^ b[22], a[4] ^ b[43], a[5] ^ b[52], a[6] ^ b[1], a[7] ^ b[35], a[8] ^ b[30], &c[12], &c[27], &c[1], &c[17]);
  D(a[7] ^ b[21], a[8] ^ b[49], a[9] ^ b[16], a[10] ^ b[15], a[11] ^ b[0], a[12] ^ b[44], &c[23], &c[15], &c[29], &c[5]);
  E(a[11] ^ b[45], a[12] ^ b[51], a[13] ^ b[50], a[14] ^ b[42], a[15] ^ b[9], a[16] ^ b[29], &c[25], &c[19], &c[9], &c[0]);
  F(a[15] ^ b[11], a[16] ^ b[20], a[17] ^ b[26], a[18] ^ b[39], a[19] ^ b[55], a[20] ^ b[54], &c[7], &c[13], &c[24], &c[2]);
  G(a[19] ^ b[33], a[20] ^ b[18], a[21] ^ b[27], a[22] ^ b[10], a[23] ^ b[12], a[24] ^ b[48], &c[3], &c[28], &c[10], &c[18]);
  H(a[23] ^ b[17], a[24] ^ b[41], a[25] ^ b[25], a[26] ^ b[47], a[27] ^ b[5], a[28] ^ b[13], &c[31], &c[11], &c[21], &c[6]);
  I(a[27] ^ b[3], a[28] ^ b[4], a[29] ^ b[34], a[30] ^ b[46], a[31] ^ b[40], a[0] ^ b[19], &c[4], &c[26], &c[14], &c[20]);
}

void P(uint a[], uint b[], uint c[]) {
  B(a[31] ^ b[45], a[0] ^ b[49], a[1] ^ b[9], a[2] ^ b[0], a[3] ^ b[22], a[4] ^ b[51], &c[8], &c[16], &c[22], &c[30]);
  C(a[3] ^ b[8], a[4] ^ b[29], a[5] ^ b[38], a[6] ^ b[44], a[7] ^ b[21], a[8] ^ b[16], &c[12], &c[27], &c[1], &c[17]);
  D(a[7] ^ b[7], a[8] ^ b[35], a[9] ^ b[2], a[10] ^ b[1], a[11] ^ b[43], a[12] ^ b[30], &c[23], &c[15], &c[29], &c[5]);
  E(a[11] ^ b[31], a[12] ^ b[37], a[13] ^ b[36], a[14] ^ b[28], a[15] ^ b[52], a[16] ^ b[15], &c[25], &c[19], &c[9], &c[0]);
  F(a[15] ^ b[24], a[16] ^ b[6], a[17] ^ b[12], a[18] ^ b[25], a[19] ^ b[41], a[20] ^ b[40], &c[7], &c[13], &c[24], &c[2]);
  G(a[19] ^ b[19], a[20] ^ b[4], a[21] ^ b[13], a[22] ^ b[55], a[23] ^ b[53], a[24] ^ b[34], &c[3], &c[28], &c[10], &c[18]);
  H(a[23] ^ b[3], a[24] ^ b[27], a[25] ^ b[11], a[26] ^ b[33], a[27] ^ b[46], a[28] ^ b[54], &c[31], &c[11], &c[21], &c[6]);
  I(a[27] ^ b[48], a[28] ^ b[17], a[29] ^ b[20], a[30] ^ b[32], a[31] ^ b[26], a[0] ^ b[5], &c[4], &c[26], &c[14], &c[20]);
}

void Q(uint a[], uint b[], uint c[]) {
  B(a[31] ^ b[31], a[0] ^ b[35], a[1] ^ b[52], a[2] ^ b[43], a[3] ^ b[8], a[4] ^ b[37], &c[8], &c[16], &c[22], &c[30]);
  C(a[3] ^ b[51], a[4] ^ b[15], a[5] ^ b[49], a[6] ^ b[30], a[7] ^ b[7], a[8] ^ b[2], &c[12], &c[27], &c[1], &c[17]);
  D(a[7] ^ b[50], a[8] ^ b[21], a[9] ^ b[45], a[10] ^ b[44], a[11] ^ b[29], a[12] ^ b[16], &c[23], &c[15], &c[29], &c[5]);
  E(a[11] ^ b[42], a[12] ^ b[23], a[13] ^ b[22], a[14] ^ b[14], a[15] ^ b[38], a[16] ^ b[1], &c[25], &c[19], &c[9], &c[0]);
  F(a[15] ^ b[10], a[16] ^ b[47], a[17] ^ b[53], a[18] ^ b[11], a[19] ^ b[27], a[20] ^ b[26], &c[7], &c[13], &c[24], &c[2]);
  G(a[19] ^ b[5], a[20] ^ b[17], a[21] ^ b[54], a[22] ^ b[41], a[23] ^ b[39], a[24] ^ b[20], &c[3], &c[28], &c[10], &c[18]);
  H(a[23] ^ b[48], a[24] ^ b[13], a[25] ^ b[24], a[26] ^ b[19], a[27] ^ b[32], a[28] ^ b[40], &c[31], &c[11], &c[21], &c[6]);
  I(a[27] ^ b[34], a[28] ^ b[3], a[29] ^ b[6], a[30] ^ b[18], a[31] ^ b[12], a[0] ^ b[46], &c[4], &c[26], &c[14], &c[20]);
}

void R(uint a[], uint b[], uint c[]) {
  B(a[31] ^ b[49], a[0] ^ b[28], a[1] ^ b[45], a[2] ^ b[36], a[3] ^ b[1], a[4] ^ b[30], &c[8], &c[16], &c[22], &c[30]);
  C(a[3] ^ b[44], a[4] ^ b[8], a[5] ^ b[42], a[6] ^ b[23], a[7] ^ b[0], a[8] ^ b[52], &c[12], &c[27], &c[1], &c[17]);
  D(a[7] ^ b[43], a[8] ^ b[14], a[9] ^ b[38], a[10] ^ b[37], a[11] ^ b[22], a[12] ^ b[9], &c[23], &c[15], &c[29], &c[5]);
  E(a[11] ^ b[35], a[12] ^ b[16], a[13] ^ b[15], a[14] ^ b[7], a[15] ^ b[31], a[16] ^ b[51], &c[25], &c[19], &c[9], &c[0]);
  F(a[15] ^ b[3], a[16] ^ b[40], a[17] ^ b[46], a[18] ^ b[4], a[19] ^ b[20], a[20] ^ b[19], &c[7], &c[13], &c[24], &c[2]);
  G(a[19] ^ b[53], a[20] ^ b[10], a[21] ^ b[47], a[22] ^ b[34], a[23] ^ b[32], a[24] ^ b[13], &c[3], &c[28], &c[10], &c[18]);
  H(a[23] ^ b[41], a[24] ^ b[6], a[25] ^ b[17], a[26] ^ b[12], a[27] ^ b[25], a[28] ^ b[33], &c[31], &c[11], &c[21], &c[6]);
  I(a[27] ^ b[27], a[28] ^ b[55], a[29] ^ b[54], a[30] ^ b[11], a[31] ^ b[5], a[0] ^ b[39], &c[4], &c[26], &c[14], &c[20]);
}

void S(uint a[], uint b[], uint c[]) {
  B(a[31] ^ b[35], a[0] ^ b[14], a[1] ^ b[31], a[2] ^ b[22], a[3] ^ b[44], a[4] ^ b[16], &c[8], &c[16], &c[22], &c[30]);
  C(a[3] ^ b[30], a[4] ^ b[51], a[5] ^ b[28], a[6] ^ b[9], a[7] ^ b[43], a[8] ^ b[38], &c[12], &c[27], &c[1], &c[17]);
  D(a[7] ^ b[29], a[8] ^ b[0], a[9] ^ b[49], a[10] ^ b[23], a[11] ^ b[8], a[12] ^ b[52], &c[23], &c[15], &c[29], &c[5]);
  E(a[11] ^ b[21], a[12] ^ b[2], a[13] ^ b[1], a[14] ^ b[50], a[15] ^ b[42], a[16] ^ b[37], &c[25], &c[19], &c[9], &c[0]);
  F(a[15] ^ b[48], a[16] ^ b[26], a[17] ^ b[32], a[18] ^ b[17], a[19] ^ b[6], a[20] ^ b[5], &c[7], &c[13], &c[24], &c[2]);
  G(a[19] ^ b[39], a[20] ^ b[55], a[21] ^ b[33], a[22] ^ b[20], a[23] ^ b[18], a[24] ^ b[54], &c[3], &c[28], &c[10], &c[18]);
  H(a[23] ^ b[27], a[24] ^ b[47], a[25] ^ b[3], a[26] ^ b[53], a[27] ^ b[11], a[28] ^ b[19], &c[31], &c[11], &c[21], &c[6]);
  I(a[27] ^ b[13], a[28] ^ b[41], a[29] ^ b[40], a[30] ^ b[24], a[31] ^ b[46], a[0] ^ b[25], &c[4], &c[26], &c[14], &c[20]);
}

void T(uint a[], uint b[], uint c[]) {
  B(a[31] ^ b[21], a[0] ^ b[0], a[1] ^ b[42], a[2] ^ b[8], a[3] ^ b[30], a[4] ^ b[2], &c[8], &c[16], &c[22], &c[30]);
  C(a[3] ^ b[16], a[4] ^ b[37], a[5] ^ b[14], a[6] ^ b[52], a[7] ^ b[29], a[8] ^ b[49], &c[12], &c[27], &c[1], &c[17]);
  D(a[7] ^ b[15], a[8] ^ b[43], a[9] ^ b[35], a[10] ^ b[9], a[11] ^ b[51], a[12] ^ b[38], &c[23], &c[15], &c[29], &c[5]);
  E(a[11] ^ b[7], a[12] ^ b[45], a[13] ^ b[44], a[14] ^ b[36], a[15] ^ b[28], a[16] ^ b[23], &c[25], &c[19], &c[9], &c[0]);
  F(a[15] ^ b[34], a[16] ^ b[12], a[17] ^ b[18], a[18] ^ b[3], a[19] ^ b[47], a[20] ^ b[46], &c[7], &c[13], &c[24], &c[2]);
  G(a[19] ^ b[25], a[20] ^ b[41], a[21] ^ b[19], a[22] ^ b[6], a[23] ^ b[4], a[24] ^ b[40], &c[3], &c[28], &c[10], &c[18]);
  H(a[23] ^ b[13], a[24] ^ b[33], a[25] ^ b[48], a[26] ^ b[39], a[27] ^ b[24], a[28] ^ b[5], &c[31], &c[11], &c[21], &c[6]);
  I(a[27] ^ b[54], a[28] ^ b[27], a[29] ^ b[26], a[30] ^ b[10], a[31] ^ b[32], a[0] ^ b[11], &c[4], &c[26], &c[14], &c[20]);
}

void U(uint a[], uint b[], uint c[]) {
  B(a[31] ^ b[7], a[0] ^ b[43], a[1] ^ b[28], a[2] ^ b[51], a[3] ^ b[16], a[4] ^ b[45], &c[8], &c[16], &c[22], &c[30]);
  C(a[3] ^ b[2], a[4] ^ b[23], a[5] ^ b[0], a[6] ^ b[38], a[7] ^ b[15], a[8] ^ b[35], &c[12], &c[27], &c[1], &c[17]);
  D(a[7] ^ b[1], a[8] ^ b[29], a[9] ^ b[21], a[10] ^ b[52], a[11] ^ b[37], a[12] ^ b[49], &c[23], &c[15], &c[29], &c[5]);
  E(a[11] ^ b[50], a[12] ^ b[31], a[13] ^ b[30], a[14] ^ b[22], a[15] ^ b[14], a[16] ^ b[9], &c[25], &c[19], &c[9], &c[0]);
  F(a[15] ^ b[20], a[16] ^ b[53], a[17] ^ b[4], a[18] ^ b[48], a[19] ^ b[33], a[20] ^ b[32], &c[7], &c[13], &c[24], &c[2]);
  G(a[19] ^ b[11], a[20] ^ b[27], a[21] ^ b[5], a[22] ^ b[47], a[23] ^ b[17], a[24] ^ b[26], &c[3], &c[28], &c[10], &c[18]);
  H(a[23] ^ b[54], a[24] ^ b[19], a[25] ^ b[34], a[26] ^ b[25], a[27] ^ b[10], a[28] ^ b[46], &c[31], &c[11], &c[21], &c[6]);
  I(a[27] ^ b[40], a[28] ^ b[13], a[29] ^ b[12], a[30] ^ b[55], a[31] ^ b[18], a[0] ^ b[24], &c[4], &c[26], &c[14], &c[20]);
}

void V(uint a[], uint b[], uint c[]) {
  B(a[31] ^ b[50], a[0] ^ b[29], a[1] ^ b[14], a[2] ^ b[37], a[3] ^ b[2], a[4] ^ b[31], &c[8], &c[16], &c[22], &c[30]);
  C(a[3] ^ b[45], a[4] ^ b[9], a[5] ^ b[43], a[6] ^ b[49], a[7] ^ b[1], a[8] ^ b[21], &c[12], &c[27], &c[1], &c[17]);
  D(a[7] ^ b[44], a[8] ^ b[15], a[9] ^ b[7], a[10] ^ b[38], a[11] ^ b[23], a[12] ^ b[35], &c[23], &c[15], &c[29], &c[5]);
  E(a[11] ^ b[36], a[12] ^ b[42], a[13] ^ b[16], a[14] ^ b[8], a[15] ^ b[0], a[16] ^ b[52], &c[25], &c[19], &c[9], &c[0]);
  F(a[15] ^ b[6], a[16] ^ b[39], a[17] ^ b[17], a[18] ^ b[34], a[19] ^ b[19], a[20] ^ b[18], &c[7], &c[13], &c[24], &c[2]);
  G(a[19] ^ b[24], a[20] ^ b[13], a[21] ^ b[46], a[22] ^ b[33], a[23] ^ b[3], a[24] ^ b[12], &c[3], &c[28], &c[10], &c[18]);
  H(a[23] ^ b[40], a[24] ^ b[5], a[25] ^ b[20], a[26] ^ b[11], a[27] ^ b[55], a[28] ^ b[32], &c[31], &c[11], &c[21], &c[6]);
  I(a[27] ^ b[26], a[28] ^ b[54], a[29] ^ b[53], a[30] ^ b[41], a[31] ^ b[4], a[0] ^ b[10], &c[4], &c[26], &c[14], &c[20]);
}

void W(uint a[], uint b[], uint c[]) {
  B(a[31] ^ b[36], a[0] ^ b[15], a[1] ^ b[0], a[2] ^ b[23], a[3] ^ b[45], a[4] ^ b[42], &c[8], &c[16], &c[22], &c[30]);
  C(a[3] ^ b[31], a[4] ^ b[52], a[5] ^ b[29], a[6] ^ b[35], a[7] ^ b[44], a[8] ^ b[7], &c[12], &c[27], &c[1], &c[17]);
  D(a[7] ^ b[30], a[8] ^ b[1], a[9] ^ b[50], a[10] ^ b[49], a[11] ^ b[9], a[12] ^ b[21], &c[23], &c[15], &c[29], &c[5]);
  E(a[11] ^ b[22], a[12] ^ b[28], a[13] ^ b[2], a[14] ^ b[51], a[15] ^ b[43], a[16] ^ b[38], &c[25], &c[19], &c[9], &c[0]);
  F(a[15] ^ b[47], a[16] ^ b[25], a[17] ^ b[3], a[18] ^ b[20], a[19] ^ b[5], a[20] ^ b[4], &c[7], &c[13], &c[24], &c[2]);
  G(a[19] ^ b[10], a[20] ^ b[54], a[21] ^ b[32], a[22] ^ b[19], a[23] ^ b[48], a[24] ^ b[53], &c[3], &c[28], &c[10], &c[18]);
  H(a[23] ^ b[26], a[24] ^ b[46], a[25] ^ b[6], a[26] ^ b[24], a[27] ^ b[41], a[28] ^ b[18], &c[31], &c[11], &c[21], &c[6]);
  I(a[27] ^ b[12], a[28] ^ b[40], a[29] ^ b[39], a[30] ^ b[27], a[31] ^ b[17], a[0] ^ b[55], &c[4], &c[26], &c[14], &c[20]);
}

void X(uint a[], uint b[], uint c[]) {
  B(a[31] ^ b[22], a[0] ^ b[1], a[1] ^ b[43], a[2] ^ b[9], a[3] ^ b[31], a[4] ^ b[28], &c[8], &c[16], &c[22], &c[30]);
  C(a[3] ^ b[42], a[4] ^ b[38], a[5] ^ b[15], a[6] ^ b[21], a[7] ^ b[30], a[8] ^ b[50], &c[12], &c[27], &c[1], &c[17]);
  D(a[7] ^ b[16], a[8] ^ b[44], a[9] ^ b[36], a[10] ^ b[35], a[11] ^ b[52], a[12] ^ b[7], &c[23], &c[15], &c[29], &c[5]);
  E(a[11] ^ b[8], a[12] ^ b[14], a[13] ^ b[45], a[14] ^ b[37], a[15] ^ b[29], a[16] ^ b[49], &c[25], &c[19], &c[9], &c[0]);
  F(a[15] ^ b[33], a[16] ^ b[11], a[17] ^ b[48], a[18] ^ b[6], a[19] ^ b[46], a[20] ^ b[17], &c[7], &c[13], &c[24], &c[2]);
  G(a[19] ^ b[55], a[20] ^ b[40], a[21] ^ b[18], a[22] ^ b[5], a[23] ^ b[34], a[24] ^ b[39], &c[3], &c[28], &c[10], &c[18]);
  H(a[23] ^ b[12], a[24] ^ b[32], a[25] ^ b[47], a[26] ^ b[10], a[27] ^ b[27], a[28] ^ b[4], &c[31], &c[11], &c[21], &c[6]);
  I(a[27] ^ b[53], a[28] ^ b[26], a[29] ^ b[25], a[30] ^ b[13], a[31] ^ b[3], a[0] ^ b[41], &c[4], &c[26], &c[14], &c[20]);
}

void Y(uint a[], uint b[], uint c[]) {
  B(a[31] ^ b[15], a[0] ^ b[51], a[1] ^ b[36], a[2] ^ b[2], a[3] ^ b[49], a[4] ^ b[21], &c[8], &c[16], &c[22], &c[30]);
  C(a[3] ^ b[35], a[4] ^ b[31], a[5] ^ b[8], a[6] ^ b[14], a[7] ^ b[23], a[8] ^ b[43], &c[12], &c[27], &c[1], &c[17]);
  D(a[7] ^ b[9], a[8] ^ b[37], a[9] ^ b[29], a[10] ^ b[28], a[11] ^ b[45], a[12] ^ b[0], &c[23], &c[15], &c[29], &c[5]);
  E(a[11] ^ b[1], a[12] ^ b[7], a[13] ^ b[38], a[14] ^ b[30], a[15] ^ b[22], a[16] ^ b[42], &c[25], &c[19], &c[9], &c[0]);
  F(a[15] ^ b[26], a[16] ^ b[4], a[17] ^ b[41], a[18] ^ b[54], a[19] ^ b[39], a[20] ^ b[10], &c[7], &c[13], &c[24], &c[2]);
  G(a[19] ^ b[48], a[20] ^ b[33], a[21] ^ b[11], a[22] ^ b[53], a[23] ^ b[27], a[24] ^ b[32], &c[3], &c[28], &c[10], &c[18]);
  H(a[23] ^ b[5], a[24] ^ b[25], a[25] ^ b[40], a[26] ^ b[3], a[27] ^ b[20], a[28] ^ b[24], &c[31], &c[11], &c[21], &c[6]);
  I(a[27] ^ b[46], a[28] ^ b[19], a[29] ^ b[18], a[30] ^ b[6], a[31] ^ b[55], a[0] ^ b[34], &c[4], &c[26], &c[14], &c[20]);
}

void Z(__constant uint* a, uint* b, uint* c) {
  uint d;
  for (d = 0; d < 64; d++) {
    c[d] = a[d];
  }

  J(&c[32], b, c);

  K(c, b, &c[32]);

  L(&c[32], b, c);

  M(c, b, &c[32]);

  N(&c[32], b, c);

  O(c, b, &c[32]);

  P(&c[32], b, c);

  Q(c, b, &c[32]);

  R(&c[32], b, c);

  S(c, b, &c[32]);

  T(&c[32], b, c);

  U(c, b, &c[32]);

  V(&c[32], b, c);

  W(c, b, &c[32]);

  X(&c[32], b, c);

  Y(c, b, &c[32]);
}

__kernel void AA(__constant uint* a, __constant uint* b, __global uint* c) {
  uint d[56];
  uint e[64];
  uint f = 0xFFFFFFFF;
  int g;

  A(d);

  for (g = 0; g < 64; g++) {
    e[g] = 0;
  }
  Z(a, d, e);

  for (g = 0; g < 64; g++) {
    f &= ~(e[g] ^ b[g]);
  }

  if (f) {
    c[0] = get_global_id(0);
    c[1] = get_global_id(1);
    c[2] = f;
  }
}