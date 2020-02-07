__constant uint Ga[] = {
    0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5, 0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174, 0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da, 0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
    0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85, 0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070, 0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3, 0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2,
};

inline uint A(uint a, uint b, uint c) {
  return (a & b) ^ (~a & c);
}

inline uint B(uint a, uint b, uint c) {
  return (a & b) ^ (a & c) ^ (b & c);
}

inline uint C(uint a, uchar b) {
  return (a >> b) | (a << (32 - b));
}

inline uint D(uint a) {
  return C(a, 2) ^ C(a, 13) ^ C(a, 22);
}

inline uint E(uint a) {
  return C(a, 6) ^ C(a, 11) ^ C(a, 25);
}

inline uint F(uint a) {
  return C(a, 7) ^ C(a, 18) ^ (a >> 3);
}

inline uint G(uint a) {
  return C(a, 17) ^ C(a, 19) ^ (a >> 10);
}
__kernel void H(__global const uint* a, __global uint* b, int c) {
  uint d[64];
  uint e, f, g, h, i, j, k, l;

  for (int m = 0; m < 1 * 16; m++) {
    for (int n = 0; n < 16; n++)
      d[n] = a[m * c + n];
    for (int n = 16; n < 64; n++)
      d[n] = G(d[n - 2]) + d[n - 7] + F(d[n - 15]) + d[n - 16];

    e = b[m * 8 + 0];
    f = b[m * 8 + 1];
    g = b[m * 8 + 2];
    h = b[m * 8 + 3];
    i = b[m * 8 + 4];
    j = b[m * 8 + 5];
    k = b[m * 8 + 6];
    l = b[m * 8 + 7];

    for (int n = 0; n < 64; n++) {
      uint o = l + E(i) + A(i, j, k) + Ga[n] + d[n];
      uint p = D(e) + B(e, f, g);
      l = k;
      k = j;
      j = i;
      i = h + o;
      h = g;
      g = f;
      f = e;
      e = o + p;
    }

    b[m * 8 + 0] += e;
    b[m * 8 + 1] += f;
    b[m * 8 + 2] += g;
    b[m * 8 + 3] += h;
    b[m * 8 + 4] += i;
    b[m * 8 + 5] += j;
    b[m * 8 + 6] += k;
    b[m * 8 + 7] += l;
  }
}