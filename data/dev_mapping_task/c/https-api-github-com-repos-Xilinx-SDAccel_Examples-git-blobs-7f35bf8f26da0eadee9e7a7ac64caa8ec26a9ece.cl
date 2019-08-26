typedef unsigned int u_int32_t; typedef uint16 buf_t; typedef uint16 state_t; void A(uint16 a, u_int32_t b[16]) {
  b[0] = a.s0;
  b[1] = a.s1;
  b[2] = a.s2;
  b[3] = a.s3;
  b[4] = a.s4;
  b[5] = a.s5;
  b[6] = a.s6;
  b[7] = a.s7;
  b[8] = a.s8;
  b[9] = a.s9;
  b[10] = a.sA;
  b[11] = a.sB;
  b[12] = a.sC;
  b[13] = a.sD;
  b[14] = a.sE;
  b[15] = a.sF;
}

void B(u_int32_t a[16], uint16 b) {
  b.s0 = a[0];
  b.s1 = a[1];
  b.s2 = a[2];
  b.s3 = a[3];
  b.s4 = a[4];
  b.s5 = a[5];
  b.s6 = a[6];
  b.s7 = a[7];
  b.s8 = a[8];
  b.s9 = a[9];
  b.sA = a[10];
  b.sB = a[11];
  b.sC = a[12];
  b.sD = a[13];
  b.sE = a[14];
  b.sF = a[15];
}

void C(uint a, char b[4]) {
  b[0] = (a & 0x000000FF) >> 0;
  b[1] = (a & 0x0000FF00) >> 8;
  b[2] = (a & 0x00FF0000) >> 16;
  b[3] = (a & 0xFF000000) >> 24;
}

void D(uint16 a, char b[64]) {
  C(a.s0, &b[0]);
  C(a.s1, &b[4]);
  C(a.s2, &b[8]);
  C(a.s3, &b[12]);
  C(a.s4, &b[16]);
  C(a.s5, &b[20]);
  C(a.s6, &b[24]);
  C(a.s7, &b[28]);
  C(a.s8, &b[32]);
  C(a.s9, &b[36]);
  C(a.sA, &b[40]);
  C(a.sB, &b[44]);
  C(a.sC, &b[48]);
  C(a.sD, &b[52]);
  C(a.sE, &b[56]);
  C(a.sF, &b[60]);
}

void E(int a, global char* b) {
  b[0] = (a & 0x000000FF) >> 0;
  b[1] = (a & 0x0000FF00) >> 8;
  b[2] = (a & 0x00FF0000) >> 16;
  b[3] = (a & 0xFF000000) >> 24;
}
void F(u_int32_t a[5], u_int32_t b[16]) {
  u_int32_t c, d, e, f, g;

  c = a[0];
  d = a[1];
  e = a[2];
  f = a[3];
  g = a[4];

  for (int h = 0; h < 80; h++) {
    u_int32_t i, j, k;

    if (h < 16) {
      k = ((((b[h]) << (24)) | ((b[h]) >> (32 - (24)))) & 0xFF00FF00) | ((((b[h]) << (8)) | ((b[h]) >> (32 - (8)))) & 0x00FF00FF);
    } else {
      k = (((b[(h + 13) & 15] ^ b[(h + 8) & 15] ^ b[(h + 2) & 15] ^ b[(h + 0) & 15]) << (1)) | ((b[(h + 13) & 15] ^ b[(h + 8) & 15] ^ b[(h + 2) & 15] ^ b[(h + 0) & 15]) >> (32 - (1))));
    }

    b[h & 15] = k;

    u_int32_t l = e ^ f;
    u_int32_t m = ((d & (l)) ^ f);
    u_int32_t n = (d ^ l);
    u_int32_t o = (((d | e) & f) | (d & e));

    if (h < 20) {
      i = 0x5A827999;
      j = m;
    } else if (h < 40) {
      i = 0x6ED9EBA1;
      j = n;
    } else if (h < 60) {
      i = 0x8F1BBCDC;
      j = o;
    } else {
      i = 0xCA62C1D6;
      j = n;
    }

    u_int32_t p = i + j + g + k + (((c) << (5)) | ((c) >> (32 - (5))));
    g = f;
    f = e;
    e = (((d) << (30)) | ((d) >> (32 - (30))));
    d = c;
    c = p;
  }

  a[0] += c;
  a[1] += d;
  a[2] += e;
  a[3] += f;
  a[4] += g;
}

kernel void G(global buf_t* a, global state_t* b) {
  local state_t c[256];

  for (size_t d = 0; d < 256; d++) {
    c[d] = b[d];
  }

  for (size_t d = 0; d < 256 * (1 << 14); d++) {
    u_int32_t e[5] __attribute__((xcl_array_partition(complete, 1)));

    e[0] = c[d % 256].s0;
    e[1] = c[d % 256].s1;
    e[2] = c[d % 256].s2;
    e[3] = c[d % 256].s3;
    e[4] = c[d % 256].s4;

    uint16 f __attribute__((xcl_array_partition(complete, 1)));
    f = a[d];

    u_int32_t g[16] __attribute__((xcl_array_partition(complete, 1)));

    A(f, g);
    F(e, g);
    c[d % 256].s0 = e[0];
    c[d % 256].s1 = e[1];
    c[d % 256].s2 = e[2];
    c[d % 256].s3 = e[3];
    c[d % 256].s4 = e[4];
  }

  for (size_t d = 0; d < 256; d++) {
    b[d] = c[d];
  }
}