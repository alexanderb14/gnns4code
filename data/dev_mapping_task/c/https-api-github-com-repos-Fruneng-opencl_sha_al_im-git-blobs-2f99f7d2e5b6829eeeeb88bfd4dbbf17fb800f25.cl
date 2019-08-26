uint A(uint a, int b) {
  if (b < 32)
    return (a >> b) | (a << (32 - b));
  return a;
}

uint B(uint a, uint b, uint c) {
  return (a & b) ^ (~a & c);
}

uint C(uint a, uint b, uint c) {
  return (a & b) ^ (a & c) ^ (b & c);
}

uint D(uint a) {
  return A(a, 2) ^ A(a, 13) ^ A(a, 22);
}

uint E(uint a) {
  return A(a, 6) ^ A(a, 11) ^ A(a, 25);
}

uint F(uint a) {
  return A(a, 7) ^ A(a, 18) ^ (a >> 3);
}

uint G(uint a) {
  return A(a, 17) ^ A(a, 19) ^ (a >> 10);
}

__kernel void H(__global uint* a, __global char* b, __global uint* c) {
  int d, e, f;
  int g, h;
  uint i, j, k, l;
  uint m[80], n, o, p, q, r, s, t, u, v, w, x;
  uint y = a[1];
  int z;

  uint aa[64] = {0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5, 0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174, 0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da, 0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
                 0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85, 0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070, 0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3, 0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2};

  f = 0;

  j = a[2];
  l = j % 64 >= 56 ? 2 : 1 + j / 64;

  c[0] = 0x6a09e667;
  c[1] = 0xbb67ae85;
  c[2] = 0x3c6ef372;
  c[3] = 0xa54ff53a;
  c[4] = 0x510e527f;
  c[5] = 0x9b05688c;
  c[6] = 0x1f83d9ab;
  c[7] = 0x5be0cd19;
  for (k = 0; k < l; k++) {
    o = c[0];
    p = c[1];
    q = c[2];
    r = c[3];
    s = c[4];
    t = c[5];
    u = c[6];
    v = c[7];

    for (d = 0; d < 80; d++) {
      m[d] = 0x00000000;
    }
    f = k * 64;
    if (j > f) {
      z = (j - f) > 64 ? 64 : (j - f);
    } else {
      z = -1;
    }

    if (z > 0) {
      i = z;

      g = i / 4;

      for (d = 0; d < g; d++) {
        m[d] = ((uchar)b[f + d * 4]) << 24;
        m[d] |= ((uchar)b[f + d * 4 + 1]) << 16;
        m[d] |= ((uchar)b[f + d * 4 + 2]) << 8;
        m[d] |= (uchar)b[f + d * 4 + 3];
      }
      h = i % 4;
      if (h == 3) {
        m[d] = ((uchar)b[f + d * 4]) << 24;
        m[d] |= ((uchar)b[f + d * 4 + 1]) << 16;
        m[d] |= ((uchar)b[f + d * 4 + 2]) << 8;
        m[d] |= ((uchar)0x80);
      } else if (h == 2) {
        m[d] = ((uchar)b[f + d * 4]) << 24;
        m[d] |= ((uchar)b[f + d * 4 + 1]) << 16;
        m[d] |= 0x8000;
      } else if (h == 1) {
        m[d] = ((uchar)b[f + d * 4]) << 24;
        m[d] |= 0x800000;
      } else {
        m[d] = 0x80000000;
      }

      if (z < 56) {
        m[15] = j * 8;
      }
    } else if (z < 0) {
      if (j % 64 == 0)
        m[0] = 0x80000000;
      m[15] = j * 8;
    }

    for (d = 0; d < 64; d++) {
      if (d >= 16)
        m[d] = G(m[d - 2]) + m[d - 7] + F(m[d - 15]) + m[d - 16];
      w = v + E(s) + B(s, t, u) + aa[d] + m[d];
      x = D(o) + C(o, p, q);
      v = u;
      u = t;
      t = s;
      s = r + w;
      r = q;
      q = p;
      p = o;
      o = w + x;
    }
    c[0] += o;
    c[1] += p;
    c[2] += q;
    c[3] += r;
    c[4] += s;
    c[5] += t;
    c[6] += u;
    c[7] += v;
  }
}