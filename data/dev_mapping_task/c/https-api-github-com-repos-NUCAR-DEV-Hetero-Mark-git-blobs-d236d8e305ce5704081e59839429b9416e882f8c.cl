void A(uchar* a, __global uchar* b) {
  a[0] = b[a[0]];
  a[1] = b[a[1]];
  a[2] = b[a[2]];
  a[3] = b[a[3]];
  a[4] = b[a[4]];
  a[5] = b[a[5]];
  a[6] = b[a[6]];
  a[7] = b[a[7]];
  a[8] = b[a[8]];
  a[9] = b[a[9]];
  a[10] = b[a[10]];
  a[11] = b[a[11]];
  a[12] = b[a[12]];
  a[13] = b[a[13]];
  a[14] = b[a[14]];
  a[15] = b[a[15]];
}

void B(uchar* a) {
  for (int b = 0; b < 4; b++) {
    uchar c[4];
    uchar d[4];
    uchar e;
    uchar f;
    for (e = 0; e < 4; e++) {
      c[e] = a[(4 * b + e)];
      f = c[e] & 0x80;
      d[e] = c[e] << 1;
      if (f == 0x80) {
        d[e] ^= 0x1b;
      }
    }
    a[b * 4 + 0] = d[0] ^ c[3] ^ c[2] ^ d[1] ^ c[1];
    a[b * 4 + 1] = d[1] ^ c[0] ^ c[3] ^ d[2] ^ c[2];
    a[b * 4 + 2] = d[2] ^ c[1] ^ c[0] ^ d[3] ^ c[3];
    a[b * 4 + 3] = d[3] ^ c[2] ^ c[1] ^ d[0] ^ c[0];
  }
}

void C(uchar* a) {
  uchar b[16];
  b[0] = a[0];
  b[1] = a[5];
  b[2] = a[10];
  b[3] = a[15];
  b[4] = a[4];
  b[5] = a[9];
  b[6] = a[14];
  b[7] = a[3];
  b[8] = a[8];
  b[9] = a[13];
  b[10] = a[2];
  b[11] = a[7];
  b[12] = a[12];
  b[13] = a[1];
  b[14] = a[6];
  b[15] = a[11];

  a[0] = b[0];
  a[1] = b[1];
  a[2] = b[2];
  a[3] = b[3];
  a[4] = b[4];
  a[5] = b[5];
  a[6] = b[6];
  a[7] = b[7];
  a[8] = b[8];
  a[9] = b[9];
  a[10] = b[10];
  a[11] = b[11];
  a[12] = b[12];
  a[13] = b[13];
  a[14] = b[14];
  a[15] = b[15];
}

void D(uchar* a, __global uint* b, int c) {
  for (int d = 0; d < 4; d++) {
    uint e = b[c + d];
    uchar f[4];

    f[0] = (e & 0xff000000) >> 24;
    f[1] = (e & 0x00ff0000) >> 16;
    f[2] = (e & 0x0000ff00) >> 8;
    f[3] = (e & 0x000000ff) >> 0;

    a[d * 4] ^= f[0];
    a[d * 4 + 1] ^= f[1];
    a[d * 4 + 2] ^= f[2];
    a[d * 4 + 3] ^= f[3];
  }
}

__kernel void E(__global uchar* a, __global uint* b, __global uchar* c) {
  uchar d[16];

  int e = get_global_id(0);

  for (int f = 0; f < 16; f++) {
    d[f] = a[e * 16 + f];
  }

  D(d, b, 0);

  for (int f = 1; f < 14; f++) {
    A(d, c);
    C(d);
    B(d);
    D(d, b, f * 4);
  }

  A(d, c);
  C(d);
  D(d, b, 14 * 4);

  for (int f = 0; f < 16; f++) {
    a[e * 16 + f] = d[f];
  }
}