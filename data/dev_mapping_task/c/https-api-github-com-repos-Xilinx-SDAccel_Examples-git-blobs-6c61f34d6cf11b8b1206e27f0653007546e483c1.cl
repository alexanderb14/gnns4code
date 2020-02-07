__constant uchar Ga[256] = {0x52, 0x09, 0x6a, 0xd5, 0x30, 0x36, 0xa5, 0x38, 0xbf, 0x40, 0xa3, 0x9e, 0x81, 0xf3, 0xd7, 0xfb, 0x7c, 0xe3, 0x39, 0x82, 0x9b, 0x2f, 0xff, 0x87, 0x34, 0x8e, 0x43, 0x44, 0xc4, 0xde, 0xe9, 0xcb, 0x54, 0x7b, 0x94, 0x32, 0xa6, 0xc2, 0x23, 0x3d, 0xee, 0x4c, 0x95, 0x0b, 0x42, 0xfa, 0xc3, 0x4e, 0x08, 0x2e, 0xa1, 0x66, 0x28, 0xd9, 0x24, 0xb2, 0x76, 0x5b, 0xa2, 0x49, 0x6d, 0x8b, 0xd1, 0x25,
                            0x72, 0xf8, 0xf6, 0x64, 0x86, 0x68, 0x98, 0x16, 0xd4, 0xa4, 0x5c, 0xcc, 0x5d, 0x65, 0xb6, 0x92, 0x6c, 0x70, 0x48, 0x50, 0xfd, 0xed, 0xb9, 0xda, 0x5e, 0x15, 0x46, 0x57, 0xa7, 0x8d, 0x9d, 0x84, 0x90, 0xd8, 0xab, 0x00, 0x8c, 0xbc, 0xd3, 0x0a, 0xf7, 0xe4, 0x58, 0x05, 0xb8, 0xb3, 0x45, 0x06, 0xd0, 0x2c, 0x1e, 0x8f, 0xca, 0x3f, 0x0f, 0x02, 0xc1, 0xaf, 0xbd, 0x03, 0x01, 0x13, 0x8a, 0x6b,
                            0x3a, 0x91, 0x11, 0x41, 0x4f, 0x67, 0xdc, 0xea, 0x97, 0xf2, 0xcf, 0xce, 0xf0, 0xb4, 0xe6, 0x73, 0x96, 0xac, 0x74, 0x22, 0xe7, 0xad, 0x35, 0x85, 0xe2, 0xf9, 0x37, 0xe8, 0x1c, 0x75, 0xdf, 0x6e, 0x47, 0xf1, 0x1a, 0x71, 0x1d, 0x29, 0xc5, 0x89, 0x6f, 0xb7, 0x62, 0x0e, 0xaa, 0x18, 0xbe, 0x1b, 0xfc, 0x56, 0x3e, 0x4b, 0xc6, 0xd2, 0x79, 0x20, 0x9a, 0xdb, 0xc0, 0xfe, 0x78, 0xcd, 0x5a, 0xf4,
                            0x1f, 0xdd, 0xa8, 0x33, 0x88, 0x07, 0xc7, 0x31, 0xb1, 0x12, 0x10, 0x59, 0x27, 0x80, 0xec, 0x5f, 0x60, 0x51, 0x7f, 0xa9, 0x19, 0xb5, 0x4a, 0x0d, 0x2d, 0xe5, 0x7a, 0x9f, 0x93, 0xc9, 0x9c, 0xef, 0xa0, 0xe0, 0x3b, 0x4d, 0xae, 0x2a, 0xf5, 0xb0, 0xc8, 0xeb, 0xbb, 0x3c, 0x83, 0x53, 0x99, 0x61, 0x17, 0x2b, 0x04, 0x7e, 0xba, 0x77, 0xd6, 0x26, 0xe1, 0x69, 0x14, 0x63, 0x55, 0x21, 0x0c, 0x7d};
__attribute__((always_inline)) uchar16 A(uchar16 a) {
  uchar16 b;
  b.s0 = Ga[a.s0];
  b.s1 = Ga[a.s1];
  b.s2 = Ga[a.s2];
  b.s3 = Ga[a.s3];
  b.s4 = Ga[a.s4];
  b.s5 = Ga[a.s5];
  b.s6 = Ga[a.s6];
  b.s7 = Ga[a.s7];
  b.s8 = Ga[a.s8];
  b.s9 = Ga[a.s9];
  b.sa = Ga[a.sa];
  b.sb = Ga[a.sb];
  b.sc = Ga[a.sc];
  b.sd = Ga[a.sd];
  b.se = Ga[a.se];
  b.sf = Ga[a.sf];
  return (b);
}

__attribute__((always_inline)) uchar16 B(uchar16 a) {
  unsigned int b;
  uchar16 c;
  c.s0123 = a.s0123;
  c.s4567 = a.s7456;
  c.s89ab = a.sab89;
  c.scdef = a.sdefc;
  return c;
}

__attribute__((always_inline)) uchar C(a) {
  uchar b = a;
  uchar c = 0;
  uchar d;

  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  c = c ^ b;
  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  c = c ^ b;
  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  c = c ^ b;
  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);
  d = c;
  return (d);
}

__attribute__((always_inline)) uchar D(a) {
  uchar b = a;
  uchar c = 0;
  uchar d;

  c = c ^ b;
  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  c = c ^ b;
  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);
  d = c;
  return (d);
}

__attribute__((always_inline)) uchar E(a) {
  unsigned char b = a;
  unsigned char c = 0;
  uchar d;

  c = c ^ b;
  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  c = c ^ b;
  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  c = c ^ b;
  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);
  d = c;
  return (d);
}

__attribute__((always_inline)) uchar F(a) {
  unsigned char b = a;
  unsigned char c = 0;
  uchar d;

  c = c ^ b;
  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  c = c ^ b;
  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  c = c ^ b;
  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);

  b = (b & 0x80) ? (b << 1) ^ 0x1b : (b << 1);
  d = c;
  return (d);
}

__attribute__((always_inline)) uchar16 G(uchar16 a) {
  uchar16 b, c, d, e, f;

  b.s0 = C(a.s0);
  c.s0 = D(a.sc);
  d.s0 = E(a.s8);
  e.s0 = F(a.s4);
  f.s0 = b.s0 ^ c.s0 ^ d.s0 ^ e.s0;

  b.s1 = C(a.s1);
  c.s1 = D(a.sd);
  d.s1 = E(a.s9);
  e.s1 = F(a.s5);
  f.s1 = b.s1 ^ c.s1 ^ d.s1 ^ e.s1;

  b.s2 = C(a.s2);
  c.s2 = D(a.se);
  d.s2 = E(a.sa);
  e.s2 = F(a.s6);
  f.s2 = b.s2 ^ c.s2 ^ d.s2 ^ e.s2;

  b.s3 = C(a.s3);
  c.s3 = D(a.sf);
  d.s3 = E(a.sb);
  e.s3 = F(a.s7);
  f.s3 = b.s3 ^ c.s3 ^ d.s3 ^ e.s3;

  b.s4 = C(a.s4);
  c.s4 = D(a.s0);
  d.s4 = E(a.sc);
  e.s4 = F(a.s8);
  f.s4 = b.s4 ^ c.s4 ^ d.s4 ^ e.s4;

  b.s5 = C(a.s5);
  c.s5 = D(a.s1);
  d.s5 = E(a.sd);
  e.s5 = F(a.s9);
  f.s5 = b.s5 ^ c.s5 ^ d.s5 ^ e.s5;

  b.s6 = C(a.s6);
  c.s6 = D(a.s2);
  d.s6 = E(a.se);
  e.s6 = F(a.sa);
  f.s6 = b.s6 ^ c.s6 ^ d.s6 ^ e.s6;

  b.s7 = C(a.s7);
  c.s7 = D(a.s3);
  d.s7 = E(a.sf);
  e.s7 = F(a.sb);
  f.s7 = b.s7 ^ c.s7 ^ d.s7 ^ e.s7;

  b.s8 = C(a.s8);
  c.s8 = D(a.s4);
  d.s8 = E(a.s0);
  e.s8 = F(a.sc);
  f.s8 = b.s8 ^ c.s8 ^ d.s8 ^ e.s8;

  b.s9 = C(a.s9);
  c.s9 = D(a.s5);
  d.s9 = E(a.s1);
  e.s9 = F(a.sd);
  f.s9 = b.s9 ^ c.s9 ^ d.s9 ^ e.s9;

  b.sa = C(a.sa);
  c.sa = D(a.s6);
  d.sa = E(a.s2);
  e.sa = F(a.se);
  f.sa = b.sa ^ c.sa ^ d.sa ^ e.sa;

  b.sb = C(a.sb);
  c.sb = D(a.s7);
  d.sb = E(a.s3);
  e.sb = F(a.sf);
  f.sb = b.sb ^ c.sb ^ d.sb ^ e.sb;

  b.sc = C(a.sc);
  c.sc = D(a.s8);
  d.sc = E(a.s4);
  e.sc = F(a.s0);
  f.sc = b.sc ^ c.sc ^ d.sc ^ e.sc;

  b.sd = C(a.sd);
  c.sd = D(a.s9);
  d.sd = E(a.s5);
  e.sd = F(a.s1);
  f.sd = b.sd ^ c.sd ^ d.sd ^ e.sd;

  b.se = C(a.se);
  c.se = D(a.sa);
  d.se = E(a.s6);
  e.se = F(a.s2);
  f.se = b.se ^ c.se ^ d.se ^ e.se;

  b.sf = C(a.sf);
  c.sf = D(a.sb);
  d.sf = E(a.s7);
  e.sf = F(a.s3);
  f.sf = b.sf ^ c.sf ^ d.sf ^ e.sf;
  return (f);
}

__attribute__((always_inline)) uchar16 H(uchar16 a, unsigned int b, local uchar16* c) {
  uchar16 d = a ^ c[b];
  return (d);
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void I(__global uchar16* a, __global uchar16* b, __global uchar16* c, uint d) {
  int e;

  local uchar16 f[10 + 1];

  for (e = 0; e < (10 + 1); e++)
    f[e] = c[e];

  unsigned int g;

  for (g = 0; g < d; g++) {
    uchar16 h;

    h = b[g];

    h = H(h, 10, f);

    for (e = (10 - 1); e >= 1; e--) {
      h = B(h);
      h = A(h);
      h = H(h, e, f);
      h = G(h);
    }

    h = B(h);
    h = A(h);
    h = H(h, 0, f);

    a[g] = h;
  }
}