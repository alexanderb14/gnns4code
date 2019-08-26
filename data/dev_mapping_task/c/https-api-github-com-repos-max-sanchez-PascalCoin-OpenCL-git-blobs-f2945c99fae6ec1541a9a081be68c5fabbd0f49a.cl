inline uint A(__const ulong a, __const unsigned b) {
  return (a >> b) | (a << (64 - b));
}
inline uint B(__const uint a, __const unsigned b) {
  return (a >> b) | (a << (32 - b));
}
inline uint C(__const uint a, __const unsigned b) {
  return (a >> b) | (a << (32 - b));
}
inline uint D(__const uint a) {
  return B(a, 7) ^ B(a, 18) ^ ((a) >> 3);
}
inline uint E(__const uint a) {
  return B(a, 17) ^ B(a, 19) ^ ((a) >> 10);
}
inline uint F(__const uint a) {
  return B(a, 7) ^ B(a, 18) ^ ((a) >> 3);
}
inline uint G(__const uint a) {
  return B(a, 17) ^ B(a, 19) ^ ((a) >> 10);
}

__constant const uint Ga[64] = {0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5, 0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174, 0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da, 0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
                                0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85, 0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070, 0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3, 0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2};

__kernel void H(__global uint* a, __global int* b) {
  uint c[16];
  uint d[8];

  uint e = (a[24] << 24) + (uint)get_global_id(0);

  d[0] = a[16];
  d[1] = a[17];
  d[2] = a[18];
  d[3] = a[19];
  d[4] = a[20];
  d[5] = a[21];
  d[6] = a[22];
  d[7] = a[23];

  int f = 0;

  for (f = 0; f < 16; f++) {
    c[f] = a[f];
  }

  uint g[64];

  uint h;
  uint i;
  uint j;
  uint k;

  uint l, m, n, o, p, q, r, s;

  uint t, u, v, w, x, y, z, aa;

  l = d[0];
  m = d[1];
  n = d[2];
  o = d[3];
  p = d[4];
  q = d[5];
  r = d[6];
  s = d[7];

  t = l;
  u = m;
  v = n;
  w = o;
  x = p;
  y = q;
  z = r;
  aa = s;

  c[11] = e;

  for (f = 0; f < 16; f++) {
    g[f] = c[f];
  }

  for (f = 16; f < 64; f++) {
    g[f] = g[f - 16] + g[f - 7] + G(g[f - 2]) + F(g[f - 15]);
  }

  for (f = 0; f < 64; f++) {
    k = (C(x, 6)) ^ (C(x, 11)) ^ (C(x, 25));
    h = aa + k + ((x & y) ^ ((~x) & z)) + Ga[f] + g[f];
    j = (C(t, 2)) ^ (C(t, 13)) ^ (C(t, 22));
    i = j + (((t & u) ^ (t & v) ^ (u & v)));

    aa = z;
    z = y;
    y = x;
    x = w + h;
    w = v;
    v = u;
    u = t;
    t = h + i;
  }

  l += t;
  m += u;
  n += v;
  o += w;
  p += x;
  q += y;
  r += z;
  s += aa;

  g[0] = l;
  g[1] = m;
  g[2] = n;
  g[3] = o;
  g[4] = p;
  g[5] = q;
  g[6] = r;
  g[7] = s;
  g[8] = 0x80000000;
  g[9] = 0x00000000;
  g[10] = 0x00000000;
  g[11] = 0x00000000;
  g[12] = 0x00000000;
  g[13] = 0x00000000;
  g[14] = 0x00000000;
  g[15] = 0x00000100;

  l = t = 0x6a09e667;
  m = u = 0xbb67ae85;
  n = v = 0x3c6ef372;
  o = w = 0xa54ff53a;
  p = x = 0x510e527f;
  q = y = 0x9b05688c;
  r = z = 0x1f83d9ab;
  s = aa = 0x5be0cd19;

  for (f = 16; f < 64; f++) {
    g[f] = g[f - 16] + g[f - 7] + G(g[f - 2]) + F(g[f - 15]);
  }

  for (f = 0; f < 64; f++) {
    k = (C(x, 6)) ^ (C(x, 11)) ^ (C(x, 25));
    h = aa + k + ((x & y) ^ ((~x) & z)) + Ga[f] + g[f];
    j = (C(t, 2)) ^ (C(t, 13)) ^ (C(t, 22));
    i = j + (((t & u) ^ (t & v) ^ (u & v)));

    aa = z;
    z = y;
    y = x;
    x = w + h;
    w = v;
    v = u;
    u = t;
    t = h + i;
  }

  l += t;
  m += u;
  n += v;
  o += w;
  p += x;
  q += y;
  r += z;
  s += aa;

  uint ab = l & 0xFFFFFFFF;
  uint ac = m & 0xF0000000;
  if (ab == 0 && ac == 0) {
    *b = e;
  }
}