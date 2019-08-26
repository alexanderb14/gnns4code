typedef uchar byte; union byte_int_converter {
  uint val;
  byte bytes[4];
};
__constant uint Ga[64] = {0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5, 0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174, 0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da, 0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
                          0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85, 0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070, 0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3, 0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2};
void A(byte* a, uint b, byte* c) {
  union byte_int_converter d, e, f, g, h, i, j, k, l;
  uint m, n, o, p, q, r, s, t, u, v, w, x[64] = {0};
  a[63] = b * 8;
  a[62] = b >> 5;
  a[b] = 0x80;
  ;

  d.val = 0x6a09e667;
  e.val = 0xbb67ae85;
  f.val = 0x3c6ef372;
  g.val = 0xa54ff53a;
  h.val = 0x510e527f;
  i.val = 0x9b05688c;
  j.val = 0x1f83d9ab;
  k.val = 0x5be0cd19;

  for (u = 0; u < 16; u++) {
    l.bytes[3] = a[u * 4];
    l.bytes[2] = a[u * 4 + 1];
    l.bytes[1] = a[u * 4 + 2];
    l.bytes[0] = a[u * 4 + 3];
    x[u] = l.val;
  }
  for (u = 16; u < 64; ++u)
    x[u] = (rotate((uint)x[u - 2], -((uint)17)) ^ rotate((uint)x[u - 2], -((uint)19)) ^ ((x[u - 2]) >> 10)) + x[u - 7] + (rotate((uint)x[u - 15], -((uint)7)) ^ rotate((uint)x[u - 15], -((uint)18)) ^ ((x[u - 15]) >> 3)) + x[u - 16];
  m = d.val;
  n = e.val;
  o = f.val;
  p = g.val;
  q = h.val;
  r = i.val;
  s = j.val;
  t = k.val;
  for (u = 0; u < 64; ++u) {
    v = t + (rotate((uint)q, -((uint)6)) ^ rotate((uint)q, -((uint)11)) ^ rotate((uint)q, -((uint)25))) + bitselect(s, r, q) + Ga[u] + x[u];
    w = (rotate((uint)m, -((uint)2)) ^ rotate((uint)m, -((uint)13)) ^ rotate((uint)m, -((uint)22))) + bitselect(m, n, o ^ m);
    t = s;
    s = r;
    r = q;
    q = p + v;
    p = o;
    o = n;
    n = m;
    m = v + w;
  }
  d.val += m;
  e.val += n;
  f.val += o;
  g.val += p;
  h.val += q;
  i.val += r;
  j.val += s;
  k.val += t;

  c[0] = d.bytes[3];
  c[1] = d.bytes[2];
  c[2] = d.bytes[1];
  c[3] = d.bytes[0];

  c[4] = e.bytes[3];
  c[5] = e.bytes[2];
  c[6] = e.bytes[1];
  c[7] = e.bytes[0];

  c[8] = f.bytes[3];
  c[9] = f.bytes[2];
  c[10] = f.bytes[1];
  c[11] = f.bytes[0];

  c[12] = g.bytes[3];
  c[13] = g.bytes[2];
  c[14] = g.bytes[1];
  c[15] = g.bytes[0];

  c[16] = h.bytes[3];
  c[17] = h.bytes[2];
  c[18] = h.bytes[1];
  c[19] = h.bytes[0];

  c[20] = i.bytes[3];
  c[21] = i.bytes[2];
  c[22] = i.bytes[1];
  c[23] = i.bytes[0];

  c[24] = j.bytes[3];
  c[25] = j.bytes[2];
  c[26] = j.bytes[1];
  c[27] = j.bytes[0];

  c[28] = k.bytes[3];
  c[29] = k.bytes[2];
  c[30] = k.bytes[1];
  c[31] = k.bytes[0];
}