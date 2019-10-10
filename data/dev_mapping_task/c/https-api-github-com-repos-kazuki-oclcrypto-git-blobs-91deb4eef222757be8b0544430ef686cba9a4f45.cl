void A(__local uint4* a) {
  uint4 b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac;
  for (int ad = 0; ad < 32; ad += 8) {
    b = a[ad + 0];
    c = a[ad + 1];
    d = a[ad + 2];
    e = a[ad + 3];
    f = a[ad + 4];
    g = a[ad + 5];
    h = a[ad + 6];
    i = a[ad + 7];
    g ^= b ^ h;
    j = c ^ i;
    h ^= b ^ c ^ d ^ e;
    i ^= g;
    c ^= g;
    e ^= b ^ f ^ j;
    f ^= g;
    d ^= j ^ g;
    k = f ^ i;
    l = c ^ d;
    r = k;
    o = b;
    q = l;
    o ^= h;
    p = e ^ g;
    t = o;
    n = k ^ l;
    k &= o;
    s = p;
    l &= p;
    u = n;
    o ^= p;
    l ^= k;
    n &= o;
    v = o;
    p = d;
    k ^= n;
    p &= e;
    w = k;
    j = e;
    k = d;
    j ^= b;
    k ^= f;
    o = f;
    x = k;
    m = i;
    k &= j;
    m &= h;
    y = j;
    o &= b;
    p ^= k;
    o ^= k;
    ab = h;
    k = c;
    j = g;
    k ^= i;
    j ^= h;
    z = k;
    o ^= l;
    n = c;
    ac = g;
    k &= j;
    n &= g;
    h ^= i;
    aa = j;
    n ^= k;
    m ^= k;
    g ^= c;
    k = w;
    m ^= l;
    o ^= g;
    m ^= h;
    o ^= d;
    k ^= h;
    p ^= b;
    n ^= k;
    p ^= k;
    n ^= g;
    p ^= f;
    l = n;
    o ^= e;
    l ^= m;
    h = o;
    j = o;
    h ^= p;
    j &= m;
    g = l;
    j ^= m;
    g &= h;
    j ^= o;
    g ^= p;
    k = p;
    g ^= n;
    k &= n;
    j ^= g;
    k ^= g;
    p &= j;
    n &= j;
    g = ac;
    o &= k;
    j ^= k;
    m &= k;
    h &= j;
    l &= j;
    p ^= h;
    n ^= l;
    o ^= h;
    m ^= l;
    k = p;
    h = ab;
    e &= n;
    k ^= n;
    l = s;
    d &= n;
    q &= k;
    g &= p;
    n ^= m;
    c &= p;
    x &= n;
    b &= m;
    p ^= o;
    n &= y;
    f &= m;
    z &= p;
    i &= o;
    m ^= o;
    p &= aa;
    h &= o;
    l &= k;
    r &= m;
    g ^= p;
    o = x;
    h ^= p;
    p = k;
    e ^= n;
    k ^= m;
    m &= t;
    b ^= n;
    d ^= o;
    u &= k;
    l ^= m;
    k &= v;
    b ^= l;
    j = q;
    k ^= m;
    f ^= o;
    m = z;
    h ^= l;
    e ^= k;
    g ^= k;
    p = b;
    k = r;
    b ^= h;
    c ^= m;
    j ^= k;
    i ^= m;
    k ^= u;
    f ^= j;
    i ^= j;
    c ^= k;
    d ^= k;
    l = c;
    k = f;
    c ^= h;
    f = g;
    h = d;
    c ^= g;
    h ^= e;
    j = i;
    f ^= h;
    e = b;
    i = g;
    e ^= f;
    i ^= d;
    g = p;
    d = i;
    g ^= j;
    d ^= k;
    b ^= l;
    d ^= g;
    a[ad + 0] = ~b;
    a[ad + 1] = ~c;
    a[ad + 2] = d;
    a[ad + 3] = e;
    a[ad + 4] = f;
    a[ad + 5] = ~g;
    a[ad + 6] = ~h;
    a[ad + 7] = i;
  }
}

void B(__local uint4* a) {
  uint4 b, c, d, e, f, g, h, i;
  uint4 j, k, l, m, n, o, p, q;
  uint4 r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, ae, af;
  for (int ag = 0; ag < 32; ag += 8) {
    j = a[ag + 0];
    k = a[ag + 1];
    l = a[ag + 2];
    m = a[ag + 3];
    n = a[ag + 4];
    o = a[ag + 5];
    p = a[ag + 6];
    q = a[ag + 7];

    i = o ^ q;
    e = k ^ l;
    h = e ^ m;
    b = k ^ p;
    c = b ^ n;
    b ^= j;
    d = h ^ n ^ q;
    e ^= p ^ q;
    f = h ^ i;
    g = l ^ m ^ i;
    h ^= n ^ p ^ q;

    j = b ^ f;
    k = c ^ g;
    l = d ^ h;
    m = e ^ i;

    n = f ^ g ^ i;
    o = g ^ h;
    p = h ^ i;
    q = n ^ p;
    n = p;
    p = o ^ i ^ q;
    o = i;

    r = m & e;
    s = (l & d) ^ r;
    t = r ^ (l & e) ^ (m & d);
    u = k & c;
    v = (j & b) ^ u;
    w = u ^ (j & c) ^ (k & b);
    r = j ^ l;
    u = k ^ m;
    b ^= d;
    c ^= e;
    x = u & c;
    d = (r & b) ^ x ^ v;
    e = x ^ (r & c) ^ (u & b) ^ w;
    b = t ^ v;
    c = s ^ t ^ w;

    r = n ^ b;
    s = o ^ c;
    t = p ^ d;
    u = q ^ e;
    v = r & u;
    w = s & t;
    x = s & u;
    y = t & u;
    z = r & w;
    aa = r & x;
    ab = r & y;
    ac = s & y;
    ad = s ^ t;
    ae = ac ^ ab;
    af = v ^ w;
    n = r ^ ad ^ ae ^ x ^ aa ^ af ^ z;
    o = ad ^ u ^ ac ^ aa ^ (r & t);
    p = t ^ ae ^ af;
    q = t ^ u ^ ac ^ v;

    r = n ^ p;
    s = o ^ q;
    t = q & i;
    u = (p & h) ^ t;
    v = t ^ (p & i) ^ (q & h);
    w = o & g;
    x = (n & f) ^ w;
    y = w ^ (n & g) ^ (o & f);
    t = f ^ h;
    w = g ^ i;
    z = s & w;
    f = v ^ x;
    g = u ^ v ^ y;
    h = (r & t) ^ z ^ x;
    i = z ^ (r & w) ^ (s & t) ^ y;
    t = q & m;
    u = (p & l) ^ t;
    v = t ^ (p & m) ^ (q & l);
    w = o & k;
    x = (n & j) ^ w;
    y = w ^ (n & k) ^ (o & j);
    t = j ^ l;
    w = k ^ m;
    z = s & w;
    b = v ^ x;
    c = u ^ v ^ y;
    d = (r & t) ^ z ^ x;
    e = z ^ (r & w) ^ (s & t) ^ y;

    j = b ^ c ^ d;
    k = h ^ i;
    l = b ^ i;
    m = d ^ i;
    n = f ^ g ^ h;
    a[ag + 0] = ~(j ^ k);
    a[ag + 1] = ~l;
    a[ag + 2] = b ^ d ^ e ^ n;
    a[ag + 3] = j;
    a[ag + 4] = l ^ c ^ f;
    a[ag + 5] = ~m;
    a[ag + 6] = ~(n ^ i);
    a[ag + 7] = m ^ e;
  }
}

void C(__local uint4* a) {
  for (int b = 8; b < 16; b++)
    a[b] = a[b].s1230;
  for (int b = 16; b < 24; b++)
    a[b] = a[b].s2301;
  for (int b = 24; b < 32; b++)
    a[b] = a[b].s3012;
}

void D(__local uint4* a) {
  uint4 b, c, d, e, f, g, h, i;
  uint4 j, k, l;
  j = a[7] ^ a[8];
  k = a[15] ^ a[16];
  l = a[23] ^ a[24];
  b = j ^ k ^ a[24];
  c = a[0] ^ k ^ l;
  d = a[0] ^ a[8] ^ l ^ a[31];
  e = a[0] ^ j ^ a[16] ^ a[31];
  f = a[0] ^ j ^ a[9] ^ a[15] ^ a[17] ^ a[25];
  g = a[1] ^ a[8] ^ k ^ a[17] ^ a[23] ^ a[25];
  h = a[1] ^ a[9] ^ a[16] ^ l ^ a[25] ^ a[31];
  i = a[0] ^ a[1] ^ a[7] ^ a[9] ^ a[17] ^ a[24] ^ a[31];
  a[0] = b;
  a[8] = c;
  a[16] = d;
  a[24] = e;
  b = a[1] ^ a[9] ^ a[10] ^ a[18] ^ a[26];
  c = a[2] ^ a[9] ^ a[17] ^ a[18] ^ a[26];
  d = a[2] ^ a[10] ^ a[17] ^ a[25] ^ a[26];
  e = a[1] ^ a[2] ^ a[10] ^ a[18] ^ a[25];
  a[1] = f;
  a[9] = g;
  a[17] = h;
  a[25] = i;
  f = a[2] ^ a[7] ^ a[10] ^ a[11] ^ a[15] ^ a[19] ^ a[27];
  g = a[3] ^ a[10] ^ a[15] ^ a[18] ^ a[19] ^ a[23] ^ a[27];
  h = a[3] ^ a[11] ^ a[18] ^ a[23] ^ a[26] ^ a[27] ^ a[31];
  i = a[2] ^ a[3] ^ a[7] ^ a[11] ^ a[19] ^ a[26] ^ a[31];
  a[2] = b;
  a[10] = c;
  a[18] = d;
  a[26] = e;
  b = a[3] ^ a[7] ^ a[11] ^ a[12] ^ a[15] ^ a[20] ^ a[28];
  c = a[4] ^ a[11] ^ a[15] ^ a[19] ^ a[20] ^ a[23] ^ a[28];
  d = a[4] ^ a[12] ^ a[19] ^ a[23] ^ a[27] ^ a[28] ^ a[31];
  e = a[3] ^ a[4] ^ a[7] ^ a[12] ^ a[20] ^ a[27] ^ a[31];
  a[3] = f;
  a[11] = g;
  a[19] = h;
  a[27] = i;
  f = a[4] ^ a[12] ^ a[13] ^ a[21] ^ a[29];
  g = a[5] ^ a[12] ^ a[20] ^ a[21] ^ a[29];
  h = a[5] ^ a[13] ^ a[20] ^ a[28] ^ a[29];
  i = a[4] ^ a[5] ^ a[13] ^ a[21] ^ a[28];
  a[4] = b;
  a[12] = c;
  a[20] = d;
  a[28] = e;
  b = a[5] ^ a[13] ^ a[14] ^ a[22] ^ a[30];
  c = a[6] ^ a[13] ^ a[21] ^ a[22] ^ a[30];
  d = a[6] ^ a[14] ^ a[21] ^ a[29] ^ a[30];
  e = a[5] ^ a[6] ^ a[14] ^ a[22] ^ a[29];
  a[5] = f;
  a[13] = g;
  a[21] = h;
  a[29] = i;
  f = a[6] ^ a[14] ^ a[15] ^ a[23] ^ a[31];
  g = a[7] ^ a[14] ^ a[22] ^ a[23] ^ a[31];
  h = a[7] ^ a[15] ^ a[22] ^ a[30] ^ a[31];
  i = a[6] ^ a[7] ^ a[15] ^ a[23] ^ a[30];
  a[6] = b;
  a[7] = f;
  a[14] = c;
  a[15] = g;
  a[22] = d;
  a[23] = h;
  a[30] = e;
  a[31] = i;
}

void E(const __global uint4* a, __local uint4* b) {
  const uint4 c = (uint4)(1);
  for (int d = 0; d < 32; d++)
    b[d] = (uint4)(0);
  for (int d = 0; d < 32; d += 8) {
    uint4 e = a[d + 0], f = a[d + 1];
    uint4 g = a[d + 2], h = a[d + 3];
    uint4 i = a[d + 4], j = a[d + 5];
    uint4 k = a[d + 6], l = a[d + 7];
    for (int m = 0; m < 32; m++) {
      b[m] |= (((e >> (uint4)(m)) & c) << (uint4)(d + 0)) | (((f >> (uint4)(m)) & c) << (uint4)(d + 1)) | (((g >> (uint4)(m)) & c) << (uint4)(d + 2)) | (((h >> (uint4)(m)) & c) << (uint4)(d + 3)) | (((i >> (uint4)(m)) & c) << (uint4)(d + 4)) | (((j >> (uint4)(m)) & c) << (uint4)(d + 5)) | (((k >> (uint4)(m)) & c) << (uint4)(d + 6)) | (((l >> (uint4)(m)) & c) << (uint4)(d + 7));
    }
  }
}

void F(__local uint4* a, __global uint4* b) {
  const uint4 c = (uint4)(1);
  for (int d = 0; d < 32; d += 2) {
    uint4 e = (uint4)(0);
    uint4 f = (uint4)(0);
    for (int g = 0; g < 32; g++) {
      e |= ((a[g] >> (uint4)(d + 0)) & c) << (uint4)(g);
      f |= ((a[g] >> (uint4)(d + 1)) & c) << (uint4)(g);
    }
    b[d] = e;
    b[d + 1] = f;
  }
}

__kernel void G(__global uint4* a, const __global uint4* b, __local uint4* c) {
  const int d = 10;
  a += get_global_id(0) * 32;
  c += get_local_id(0) * 32;
  E(a, c);
  for (int e = 0; e < 32; e++)
    c[e] ^= b[e];
  for (uint e = 1; e < d; e++) {
    B(c);
    C(c);
    D(c);
    for (int f = 0; f < 32; f++)
      c[f] = c[f] ^ b[e * 32 + f];
  }
  B(c);
  C(c);
  for (int e = 0; e < 32; e++)
    c[e] ^= b[10 * 32 + e];
  F(c, a);
}

__kernel void H(__global uint4* a, const __global uint4* b, __local uint4* c) {
  const int d = 10;
  a += get_global_id(0) * 32;
  c += get_local_id(0) * 32;

  for (int e = 0; e < 32; e++)
    c[e] = a[e] ^ b[e];
  b += 32;
  for (uint e = 1; e < d; e++, b += 32) {
    B(c);
    C(c);
    D(c);
    for (int f = 0; f < 32; f += 8) {
      c[f] ^= b[f];
      c[f + 1] ^= b[f + 1];
      c[f + 2] ^= b[f + 2];
      c[f + 3] ^= b[f + 3];
      c[f + 4] ^= b[f + 4];
      c[f + 5] ^= b[f + 5];
      c[f + 6] ^= b[f + 6];
      c[f + 7] ^= b[f + 7];
    }
  }
  B(c);
  C(c);

  for (int e = 0; e < 32; e++)
    a[e] = c[e] ^ b[e];
}

__kernel void I(__global uint4* a) {
  const uint4 b = (uint4)(1);
  a += get_global_id(0) * 32;

  uint4 c = a[0], d = a[1];
  uint4 e = a[2], f = a[3];
  uint4 g = a[4], h = a[5];
  uint4 i = a[6], j = a[7];
  uint4 k = a[8], l = a[9];
  uint4 m = a[10], n = a[11];
  uint4 o = a[12], p = a[13];
  uint4 q = a[14], r = a[15];
  uint4 s = a[16], t = a[17];
  uint4 u = a[18], v = a[19];
  uint4 w = a[20], x = a[21];
  uint4 y = a[22], z = a[23];
  uint4 aa = a[24], ab = a[25];
  uint4 ac = a[26], ad = a[27];
  uint4 ae = a[28], af = a[29];
  uint4 ag = a[30], ah = a[31];
  for (int ai = 0; ai < 32; ai++) {
    const uint4 aj = (uint4)(ai);
    a[ai] = (((c >> aj) & b) << (uint4)(0)) | (((d >> aj) & b) << (uint4)(1)) | (((e >> aj) & b) << (uint4)(2)) | (((f >> aj) & b) << (uint4)(3)) | (((g >> aj) & b) << (uint4)(4)) | (((h >> aj) & b) << (uint4)(5)) | (((i >> aj) & b) << (uint4)(6)) | (((j >> aj) & b) << (uint4)(7)) | (((k >> aj) & b) << (uint4)(8)) | (((l >> aj) & b) << (uint4)(9)) | (((m >> aj) & b) << (uint4)(10)) | (((n >> aj) & b) << (uint4)(11)) | (((o >> aj) & b) << (uint4)(12)) | (((p >> aj) & b) << (uint4)(13)) |
            (((q >> aj) & b) << (uint4)(14)) | (((r >> aj) & b) << (uint4)(15)) | (((s >> aj) & b) << (uint4)(16)) | (((t >> aj) & b) << (uint4)(17)) | (((u >> aj) & b) << (uint4)(18)) | (((v >> aj) & b) << (uint4)(19)) | (((w >> aj) & b) << (uint4)(20)) | (((x >> aj) & b) << (uint4)(21)) | (((y >> aj) & b) << (uint4)(22)) | (((z >> aj) & b) << (uint4)(23)) | (((aa >> aj) & b) << (uint4)(24)) | (((ab >> aj) & b) << (uint4)(25)) | (((ac >> aj) & b) << (uint4)(26)) |
            (((ad >> aj) & b) << (uint4)(27)) | (((ae >> aj) & b) << (uint4)(28)) | (((af >> aj) & b) << (uint4)(29)) | (((ag >> aj) & b) << (uint4)(30)) | (((ah >> aj) & b) << (uint4)(31));
  }
}

__kernel void J(__constant uchar* a, __global uint4* b) {
  size_t c = get_global_id(0);
  int d = c >> 5;
  int e = (d << 7) + (c & 0x1F);
  int f = e >> 3;
  int g = e & 7;

  b[c] = (ufnt4)(((a g)&1) == 0 ? 0 : 0xffffffff, f((a g)&1) == 0 ? 0 : 0xffffffff, f((a g)&1) == 0 ? 0 : 0xffffffff, f((a > g) & 1) == 0 ? 0 : 0xffffffff);
}