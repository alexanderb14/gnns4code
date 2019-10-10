uint A(uint a) {
  return rotate(a & 0x00FF00FF, 24U) | rotate(a & 0xFF00FF00, 8U);
}

__constant uchar Ga[256] = {0, 1,  2,  3, 4,  5, 6, 7, 8,  9, 10, 11, 12, 13, 14, 15, 14, 10, 4, 8, 9, 15, 13, 6, 1,  12, 0, 2,  11, 7,  5,  3, 11, 8, 12, 0, 5, 2, 15, 13, 10, 14, 3,  6,  7,  1,  9,  4,  7,  9,  3, 1, 13, 12, 11, 14, 2, 6,  5, 10, 4,  0, 15, 8, 9,  0, 5,  7, 2, 4, 10, 15, 14, 1,  11, 12, 6, 8, 3, 13, 2, 12, 6, 10, 0,  11, 8,  3,  4, 13, 7, 5,  15, 14, 1,  9, 12, 5, 1, 15, 14, 13, 4,  10, 0,  7, 6,  3,  9, 2, 8, 11, 13, 11, 7, 14, 12, 1,  3, 9, 5, 0,  15, 4, 8,  6,  2, 10,
                            6, 15, 14, 9, 11, 3, 0, 8, 12, 2, 13, 7,  1,  4,  10, 5,  10, 2,  8, 4, 7, 6,  1,  5, 15, 11, 9, 14, 3,  12, 13, 0, 0,  1, 2,  3, 4, 5, 6,  7,  8,  9,  10, 11, 12, 13, 14, 15, 14, 10, 4, 8, 9,  15, 13, 6,  1, 12, 0, 2,  11, 7, 5,  3, 11, 8, 12, 0, 5, 2, 15, 13, 10, 14, 3,  6,  7, 1, 9, 4,  7, 9,  3, 1,  13, 12, 11, 14, 2, 6,  5, 10, 4,  0,  15, 8, 9,  0, 5, 7,  2,  4,  10, 15, 14, 1, 11, 12, 6, 8, 3, 13, 2,  12, 6, 10, 0,  11, 8, 3, 4, 13, 7,  5, 15, 14, 1, 9};

__constant ulong Gb[16] = {0x243F6A8885A308D3UL, 0x13198A2E03707344UL, 0xA4093822299F31D0UL, 0x082EFA98EC4E6C89UL, 0x452821E638D01377UL, 0xBE5466CF34E90C6CUL, 0xC0AC29B7C97C50DDUL, 0x3F84D5B5B5470917UL, 0x9216D5D98979FB1BUL, 0xD1310BA698DFB5ACUL, 0x2FFD72DBD01ADFB7UL, 0xB8E1AFED6A267E96UL, 0xBA7C9045F12C7F99UL, 0x24A19947B3916CF7UL, 0x0801F2E2858EFC16UL, 0x636920D871574E69UL};

__constant uint Gc[64] = {0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5, 0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174, 0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da, 0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
                          0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85, 0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070, 0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3, 0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2};
void B(uint8* a, __local uchar* b) {
  uint c[64];

  __local uint* d = (__local uint*)b;

  uint e = (*a).s0;
  uint f = (*a).s1;
  uint g = (*a).s2;
  uint h = (*a).s3;
  uint i = (*a).s4;
  uint j = (*a).s5;
  uint k = (*a).s6;
  uint l = (*a).s7;
  for (uint m = 0; m < 16; m += 8) {
    c[m + 0] = A(d[m + 0]);
    l += (rotate(i, 7U) ^ rotate(i, 21U) ^ rotate(i, 26U)) + bitselect(k, j, i) + Gc[m + 0] + c[m + 0];
    h += l;
    l += (rotate(e, 10U) ^ rotate(e, 19U) ^ rotate(e, 30U)) + bitselect(g, f, (e ^ g));
    ;
    c[m + 1] = A(d[m + 1]);
    k += (rotate(h, 7U) ^ rotate(h, 21U) ^ rotate(h, 26U)) + bitselect(j, i, h) + Gc[m + 1] + c[m + 1];
    g += k;
    k += (rotate(l, 10U) ^ rotate(l, 19U) ^ rotate(l, 30U)) + bitselect(f, e, (l ^ f));
    ;
    c[m + 2] = A(d[m + 2]);
    j += (rotate(g, 7U) ^ rotate(g, 21U) ^ rotate(g, 26U)) + bitselect(i, h, g) + Gc[m + 2] + c[m + 2];
    f += j;
    j += (rotate(k, 10U) ^ rotate(k, 19U) ^ rotate(k, 30U)) + bitselect(e, l, (k ^ e));
    ;
    c[m + 3] = A(d[m + 3]);
    i += (rotate(f, 7U) ^ rotate(f, 21U) ^ rotate(f, 26U)) + bitselect(h, g, f) + Gc[m + 3] + c[m + 3];
    e += i;
    i += (rotate(j, 10U) ^ rotate(j, 19U) ^ rotate(j, 30U)) + bitselect(l, k, (j ^ l));
    ;
    c[m + 4] = A(d[m + 4]);
    h += (rotate(e, 7U) ^ rotate(e, 21U) ^ rotate(e, 26U)) + bitselect(g, f, e) + Gc[m + 4] + c[m + 4];
    l += h;
    h += (rotate(i, 10U) ^ rotate(i, 19U) ^ rotate(i, 30U)) + bitselect(k, j, (i ^ k));
    ;
    c[m + 5] = A(d[m + 5]);
    g += (rotate(l, 7U) ^ rotate(l, 21U) ^ rotate(l, 26U)) + bitselect(f, e, l) + Gc[m + 5] + c[m + 5];
    k += g;
    g += (rotate(h, 10U) ^ rotate(h, 19U) ^ rotate(h, 30U)) + bitselect(j, i, (h ^ j));
    ;
    c[m + 6] = A(d[m + 6]);
    f += (rotate(k, 7U) ^ rotate(k, 21U) ^ rotate(k, 26U)) + bitselect(e, l, k) + Gc[m + 6] + c[m + 6];
    j += f;
    f += (rotate(g, 10U) ^ rotate(g, 19U) ^ rotate(g, 30U)) + bitselect(i, h, (g ^ i));
    ;
    c[m + 7] = A(d[m + 7]);
    e += (rotate(j, 7U) ^ rotate(j, 21U) ^ rotate(j, 26U)) + bitselect(l, k, j) + Gc[m + 7] + c[m + 7];
    i += e;
    e += (rotate(f, 10U) ^ rotate(f, 19U) ^ rotate(f, 30U)) + bitselect(h, g, (f ^ h));
    ;
  }
  for (uint m = 16; m < 64; m += 8) {
    l += (rotate(i, 7U) ^ rotate(i, 21U) ^ rotate(i, 26U)) + bitselect(k, j, i) + Gc[m + 0] + (c[m + 0] = (rotate(c[m + 0 - 2], 15U) ^ (c[m + 0 - 2] >> 10U) ^ rotate(c[m + 0 - 2], 13U)) + c[m + 0 - 7] + (rotate(c[m + 0 - 15], 25U) ^ (c[m + 0 - 15] >> 3U) ^ rotate(c[m + 0 - 15], 14U)) + c[m + 0 - 16]);
    h += l;
    l += (rotate(e, 10U) ^ rotate(e, 19U) ^ rotate(e, 30U)) + bitselect(g, f, (e ^ g));
    ;
    k += (rotate(h, 7U) ^ rotate(h, 21U) ^ rotate(h, 26U)) + bitselect(j, i, h) + Gc[m + 1] + (c[m + 1] = (rotate(c[m + 1 - 2], 15U) ^ (c[m + 1 - 2] >> 10U) ^ rotate(c[m + 1 - 2], 13U)) + c[m + 1 - 7] + (rotate(c[m + 1 - 15], 25U) ^ (c[m + 1 - 15] >> 3U) ^ rotate(c[m + 1 - 15], 14U)) + c[m + 1 - 16]);
    g += k;
    k += (rotate(l, 10U) ^ rotate(l, 19U) ^ rotate(l, 30U)) + bitselect(f, e, (l ^ f));
    ;
    j += (rotate(g, 7U) ^ rotate(g, 21U) ^ rotate(g, 26U)) + bitselect(i, h, g) + Gc[m + 2] + (c[m + 2] = (rotate(c[m + 2 - 2], 15U) ^ (c[m + 2 - 2] >> 10U) ^ rotate(c[m + 2 - 2], 13U)) + c[m + 2 - 7] + (rotate(c[m + 2 - 15], 25U) ^ (c[m + 2 - 15] >> 3U) ^ rotate(c[m + 2 - 15], 14U)) + c[m + 2 - 16]);
    f += j;
    j += (rotate(k, 10U) ^ rotate(k, 19U) ^ rotate(k, 30U)) + bitselect(e, l, (k ^ e));
    ;
    i += (rotate(f, 7U) ^ rotate(f, 21U) ^ rotate(f, 26U)) + bitselect(h, g, f) + Gc[m + 3] + (c[m + 3] = (rotate(c[m + 3 - 2], 15U) ^ (c[m + 3 - 2] >> 10U) ^ rotate(c[m + 3 - 2], 13U)) + c[m + 3 - 7] + (rotate(c[m + 3 - 15], 25U) ^ (c[m + 3 - 15] >> 3U) ^ rotate(c[m + 3 - 15], 14U)) + c[m + 3 - 16]);
    e += i;
    i += (rotate(j, 10U) ^ rotate(j, 19U) ^ rotate(j, 30U)) + bitselect(l, k, (j ^ l));
    ;
    h += (rotate(e, 7U) ^ rotate(e, 21U) ^ rotate(e, 26U)) + bitselect(g, f, e) + Gc[m + 4] + (c[m + 4] = (rotate(c[m + 4 - 2], 15U) ^ (c[m + 4 - 2] >> 10U) ^ rotate(c[m + 4 - 2], 13U)) + c[m + 4 - 7] + (rotate(c[m + 4 - 15], 25U) ^ (c[m + 4 - 15] >> 3U) ^ rotate(c[m + 4 - 15], 14U)) + c[m + 4 - 16]);
    l += h;
    h += (rotate(i, 10U) ^ rotate(i, 19U) ^ rotate(i, 30U)) + bitselect(k, j, (i ^ k));
    ;
    g += (rotate(l, 7U) ^ rotate(l, 21U) ^ rotate(l, 26U)) + bitselect(f, e, l) + Gc[m + 5] + (c[m + 5] = (rotate(c[m + 5 - 2], 15U) ^ (c[m + 5 - 2] >> 10U) ^ rotate(c[m + 5 - 2], 13U)) + c[m + 5 - 7] + (rotate(c[m + 5 - 15], 25U) ^ (c[m + 5 - 15] >> 3U) ^ rotate(c[m + 5 - 15], 14U)) + c[m + 5 - 16]);
    k += g;
    g += (rotate(h, 10U) ^ rotate(h, 19U) ^ rotate(h, 30U)) + bitselect(j, i, (h ^ j));
    ;
    f += (rotate(k, 7U) ^ rotate(k, 21U) ^ rotate(k, 26U)) + bitselect(e, l, k) + Gc[m + 6] + (c[m + 6] = (rotate(c[m + 6 - 2], 15U) ^ (c[m + 6 - 2] >> 10U) ^ rotate(c[m + 6 - 2], 13U)) + c[m + 6 - 7] + (rotate(c[m + 6 - 15], 25U) ^ (c[m + 6 - 15] >> 3U) ^ rotate(c[m + 6 - 15], 14U)) + c[m + 6 - 16]);
    j += f;
    f += (rotate(g, 10U) ^ rotate(g, 19U) ^ rotate(g, 30U)) + bitselect(i, h, (g ^ i));
    ;
    e += (rotate(j, 7U) ^ rotate(j, 21U) ^ rotate(j, 26U)) + bitselect(l, k, j) + Gc[m + 7] + (c[m + 7] = (rotate(c[m + 7 - 2], 15U) ^ (c[m + 7 - 2] >> 10U) ^ rotate(c[m + 7 - 2], 13U)) + c[m + 7 - 7] + (rotate(c[m + 7 - 15], 25U) ^ (c[m + 7 - 15] >> 3U) ^ rotate(c[m + 7 - 15], 14U)) + c[m + 7 - 16]);
    i += e;
    e += (rotate(f, 10U) ^ rotate(f, 19U) ^ rotate(f, 30U)) + bitselect(h, g, (f ^ h));
    ;
  }
  (*a) += (uint8)(e, f, g, h, i, j, k, l);
}
__constant uint Gd[61] = {0xc28a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5, 0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19c0174, 0x649b69c1, 0xf9be478a, 0x0fe1edc6, 0x240ca60c, 0x4fe9346f, 0x4d1c84ab, 0x61b94f1e, 0xf6f993db, 0xe8465162, 0xad13066f, 0xb0214c0d, 0x695a0283, 0xa0323379, 0x2bd376e9, 0xe1d0537c,
                          0x03a244a0, 0xfc13a4a5, 0xfafda43e, 0x56bea8bb, 0x445ec9b6, 0x39907315, 0x8c0d4e9f, 0xc832dccc, 0xdaffb65b, 0x1fed4f61, 0x2f646808, 0x1ff32294, 0x2634ccd7, 0xb0ebdefa, 0xd6fc592b, 0xa63c5c8f, 0xbe9fbab9, 0x0158082c, 0x68969712, 0x51e1d7e1, 0x5cf12d0d, 0xc4be2155, 0x7d7c8a34, 0x611f2c60, 0x036324af, 0xa4f08d87, 0x9e3e8435, 0x2c6dae30, 0x11921afc, 0xb76d720e};

void C(uint8* a) {
  uint b = (*a).s7;
  (*a).s7 += (rotate((*a).s4, 7U) ^ rotate((*a).s4, 21U) ^ rotate((*a).s4, 26U)) + bitselect((*a).s6, (*a).s5, (*a).s4) + Gd[0];
  (*a).s3 += (*a).s7;
  (*a).s7 += (rotate((*a).s0, 10U) ^ rotate((*a).s0, 19U) ^ rotate((*a).s0, 30U)) + bitselect((*a).s2, (*a).s1, ((*a).s0 ^ (*a).s2));
  ;
  (*a).s6 += (rotate((*a).s3, 7U) ^ rotate((*a).s3, 21U) ^ rotate((*a).s3, 26U)) + bitselect((*a).s5, (*a).s4, (*a).s3) + Gd[1];
  (*a).s2 += (*a).s6;
  (*a).s6 += (rotate((*a).s7, 10U) ^ rotate((*a).s7, 19U) ^ rotate((*a).s7, 30U)) + bitselect((*a).s1, (*a).s0, ((*a).s7 ^ (*a).s1));
  ;
  (*a).s5 += (rotate((*a).s2, 7U) ^ rotate((*a).s2, 21U) ^ rotate((*a).s2, 26U)) + bitselect((*a).s4, (*a).s3, (*a).s2) + Gd[2];
  (*a).s1 += (*a).s5;
  (*a).s5 += (rotate((*a).s6, 10U) ^ rotate((*a).s6, 19U) ^ rotate((*a).s6, 30U)) + bitselect((*a).s0, (*a).s7, ((*a).s6 ^ (*a).s0));
  ;
  (*a).s4 += (rotate((*a).s1, 7U) ^ rotate((*a).s1, 21U) ^ rotate((*a).s1, 26U)) + bitselect((*a).s3, (*a).s2, (*a).s1) + Gd[3];
  (*a).s0 += (*a).s4;
  (*a).s4 += (rotate((*a).s5, 10U) ^ rotate((*a).s5, 19U) ^ rotate((*a).s5, 30U)) + bitselect((*a).s7, (*a).s6, ((*a).s5 ^ (*a).s7));
  ;
  (*a).s3 += (rotate((*a).s0, 7U) ^ rotate((*a).s0, 21U) ^ rotate((*a).s0, 26U)) + bitselect((*a).s2, (*a).s1, (*a).s0) + Gd[4];
  (*a).s7 += (*a).s3;
  (*a).s3 += (rotate((*a).s4, 10U) ^ rotate((*a).s4, 19U) ^ rotate((*a).s4, 30U)) + bitselect((*a).s6, (*a).s5, ((*a).s4 ^ (*a).s6));
  ;
  (*a).s2 += (rotate((*a).s7, 7U) ^ rotate((*a).s7, 21U) ^ rotate((*a).s7, 26U)) + bitselect((*a).s1, (*a).s0, (*a).s7) + Gd[5];
  (*a).s6 += (*a).s2;
  (*a).s2 += (rotate((*a).s3, 10U) ^ rotate((*a).s3, 19U) ^ rotate((*a).s3, 30U)) + bitselect((*a).s5, (*a).s4, ((*a).s3 ^ (*a).s5));
  ;
  (*a).s1 += (rotate((*a).s6, 7U) ^ rotate((*a).s6, 21U) ^ rotate((*a).s6, 26U)) + bitselect((*a).s0, (*a).s7, (*a).s6) + Gd[6];
  (*a).s5 += (*a).s1;
  (*a).s1 += (rotate((*a).s2, 10U) ^ rotate((*a).s2, 19U) ^ rotate((*a).s2, 30U)) + bitselect((*a).s4, (*a).s3, ((*a).s2 ^ (*a).s4));
  ;
  (*a).s0 += (rotate((*a).s5, 7U) ^ rotate((*a).s5, 21U) ^ rotate((*a).s5, 26U)) + bitselect((*a).s7, (*a).s6, (*a).s5) + Gd[7];
  (*a).s4 += (*a).s0;
  (*a).s0 += (rotate((*a).s1, 10U) ^ rotate((*a).s1, 19U) ^ rotate((*a).s1, 30U)) + bitselect((*a).s3, (*a).s2, ((*a).s1 ^ (*a).s3));
  ;
  (*a).s7 += (rotate((*a).s4, 7U) ^ rotate((*a).s4, 21U) ^ rotate((*a).s4, 26U)) + bitselect((*a).s6, (*a).s5, (*a).s4) + Gd[8];
  (*a).s3 += (*a).s7;
  (*a).s7 += (rotate((*a).s0, 10U) ^ rotate((*a).s0, 19U) ^ rotate((*a).s0, 30U)) + bitselect((*a).s2, (*a).s1, ((*a).s0 ^ (*a).s2));
  ;
  (*a).s6 += (rotate((*a).s3, 7U) ^ rotate((*a).s3, 21U) ^ rotate((*a).s3, 26U)) + bitselect((*a).s5, (*a).s4, (*a).s3) + Gd[9];
  (*a).s2 += (*a).s6;
  (*a).s6 += (rotate((*a).s7, 10U) ^ rotate((*a).s7, 19U) ^ rotate((*a).s7, 30U)) + bitselect((*a).s1, (*a).s0, ((*a).s7 ^ (*a).s1));
  ;
  (*a).s5 += (rotate((*a).s2, 7U) ^ rotate((*a).s2, 21U) ^ rotate((*a).s2, 26U)) + bitselect((*a).s4, (*a).s3, (*a).s2) + Gd[10];
  (*a).s1 += (*a).s5;
  (*a).s5 += (rotate((*a).s6, 10U) ^ rotate((*a).s6, 19U) ^ rotate((*a).s6, 30U)) + bitselect((*a).s0, (*a).s7, ((*a).s6 ^ (*a).s0));
  ;
  (*a).s4 += (rotate((*a).s1, 7U) ^ rotate((*a).s1, 21U) ^ rotate((*a).s1, 26U)) + bitselect((*a).s3, (*a).s2, (*a).s1) + Gd[11];
  (*a).s0 += (*a).s4;
  (*a).s4 += (rotate((*a).s5, 10U) ^ rotate((*a).s5, 19U) ^ rotate((*a).s5, 30U)) + bitselect((*a).s7, (*a).s6, ((*a).s5 ^ (*a).s7));
  ;
  (*a).s3 += (rotate((*a).s0, 7U) ^ rotate((*a).s0, 21U) ^ rotate((*a).s0, 26U)) + bitselect((*a).s2, (*a).s1, (*a).s0) + Gd[12];
  (*a).s7 += (*a).s3;
  (*a).s3 += (rotate((*a).s4, 10U) ^ rotate((*a).s4, 19U) ^ rotate((*a).s4, 30U)) + bitselect((*a).s6, (*a).s5, ((*a).s4 ^ (*a).s6));
  ;
  (*a).s2 += (rotate((*a).s7, 7U) ^ rotate((*a).s7, 21U) ^ rotate((*a).s7, 26U)) + bitselect((*a).s1, (*a).s0, (*a).s7) + Gd[13];
  (*a).s6 += (*a).s2;
  (*a).s2 += (rotate((*a).s3, 10U) ^ rotate((*a).s3, 19U) ^ rotate((*a).s3, 30U)) + bitselect((*a).s5, (*a).s4, ((*a).s3 ^ (*a).s5));
  ;
  (*a).s1 += (rotate((*a).s6, 7U) ^ rotate((*a).s6, 21U) ^ rotate((*a).s6, 26U)) + bitselect((*a).s0, (*a).s7, (*a).s6) + Gd[14];
  (*a).s5 += (*a).s1;
  (*a).s1 += (rotate((*a).s2, 10U) ^ rotate((*a).s2, 19U) ^ rotate((*a).s2, 30U)) + bitselect((*a).s4, (*a).s3, ((*a).s2 ^ (*a).s4));
  ;
  (*a).s0 += (rotate((*a).s5, 7U) ^ rotate((*a).s5, 21U) ^ rotate((*a).s5, 26U)) + bitselect((*a).s7, (*a).s6, (*a).s5) + Gd[15];
  (*a).s4 += (*a).s0;
  (*a).s0 += (rotate((*a).s1, 10U) ^ rotate((*a).s1, 19U) ^ rotate((*a).s1, 30U)) + bitselect((*a).s3, (*a).s2, ((*a).s1 ^ (*a).s3));
  ;
  (*a).s7 += (rotate((*a).s4, 7U) ^ rotate((*a).s4, 21U) ^ rotate((*a).s4, 26U)) + bitselect((*a).s6, (*a).s5, (*a).s4) + Gd[16];
  (*a).s3 += (*a).s7;
  (*a).s7 += (rotate((*a).s0, 10U) ^ rotate((*a).s0, 19U) ^ rotate((*a).s0, 30U)) + bitselect((*a).s2, (*a).s1, ((*a).s0 ^ (*a).s2));
  ;
  (*a).s6 += (rotate((*a).s3, 7U) ^ rotate((*a).s3, 21U) ^ rotate((*a).s3, 26U)) + bitselect((*a).s5, (*a).s4, (*a).s3) + Gd[17];
  (*a).s2 += (*a).s6;
  (*a).s6 += (rotate((*a).s7, 10U) ^ rotate((*a).s7, 19U) ^ rotate((*a).s7, 30U)) + bitselect((*a).s1, (*a).s0, ((*a).s7 ^ (*a).s1));
  ;
  (*a).s5 += (rotate((*a).s2, 7U) ^ rotate((*a).s2, 21U) ^ rotate((*a).s2, 26U)) + bitselect((*a).s4, (*a).s3, (*a).s2) + Gd[18];
  (*a).s1 += (*a).s5;
  (*a).s5 += (rotate((*a).s6, 10U) ^ rotate((*a).s6, 19U) ^ rotate((*a).s6, 30U)) + bitselect((*a).s0, (*a).s7, ((*a).s6 ^ (*a).s0));
  ;
  (*a).s4 += (rotate((*a).s1, 7U) ^ rotate((*a).s1, 21U) ^ rotate((*a).s1, 26U)) + bitselect((*a).s3, (*a).s2, (*a).s1) + Gd[19];
  (*a).s0 += (*a).s4;
  (*a).s4 += (rotate((*a).s5, 10U) ^ rotate((*a).s5, 19U) ^ rotate((*a).s5, 30U)) + bitselect((*a).s7, (*a).s6, ((*a).s5 ^ (*a).s7));
  ;
  (*a).s3 += (rotate((*a).s0, 7U) ^ rotate((*a).s0, 21U) ^ rotate((*a).s0, 26U)) + bitselect((*a).s2, (*a).s1, (*a).s0) + Gd[20];
  (*a).s7 += (*a).s3;
  (*a).s3 += (rotate((*a).s4, 10U) ^ rotate((*a).s4, 19U) ^ rotate((*a).s4, 30U)) + bitselect((*a).s6, (*a).s5, ((*a).s4 ^ (*a).s6));
  ;
  (*a).s2 += (rotate((*a).s7, 7U) ^ rotate((*a).s7, 21U) ^ rotate((*a).s7, 26U)) + bitselect((*a).s1, (*a).s0, (*a).s7) + Gd[21];
  (*a).s6 += (*a).s2;
  (*a).s2 += (rotate((*a).s3, 10U) ^ rotate((*a).s3, 19U) ^ rotate((*a).s3, 30U)) + bitselect((*a).s5, (*a).s4, ((*a).s3 ^ (*a).s5));
  ;
  (*a).s1 += (rotate((*a).s6, 7U) ^ rotate((*a).s6, 21U) ^ rotate((*a).s6, 26U)) + bitselect((*a).s0, (*a).s7, (*a).s6) + Gd[22];
  (*a).s5 += (*a).s1;
  (*a).s1 += (rotate((*a).s2, 10U) ^ rotate((*a).s2, 19U) ^ rotate((*a).s2, 30U)) + bitselect((*a).s4, (*a).s3, ((*a).s2 ^ (*a).s4));
  ;
  (*a).s0 += (rotate((*a).s5, 7U) ^ rotate((*a).s5, 21U) ^ rotate((*a).s5, 26U)) + bitselect((*a).s7, (*a).s6, (*a).s5) + Gd[23];
  (*a).s4 += (*a).s0;
  (*a).s0 += (rotate((*a).s1, 10U) ^ rotate((*a).s1, 19U) ^ rotate((*a).s1, 30U)) + bitselect((*a).s3, (*a).s2, ((*a).s1 ^ (*a).s3));
  ;
  (*a).s7 += (rotate((*a).s4, 7U) ^ rotate((*a).s4, 21U) ^ rotate((*a).s4, 26U)) + bitselect((*a).s6, (*a).s5, (*a).s4) + Gd[24];
  (*a).s3 += (*a).s7;
  (*a).s7 += (rotate((*a).s0, 10U) ^ rotate((*a).s0, 19U) ^ rotate((*a).s0, 30U)) + bitselect((*a).s2, (*a).s1, ((*a).s0 ^ (*a).s2));
  ;
  (*a).s6 += (rotate((*a).s3, 7U) ^ rotate((*a).s3, 21U) ^ rotate((*a).s3, 26U)) + bitselect((*a).s5, (*a).s4, (*a).s3) + Gd[25];
  (*a).s2 += (*a).s6;
  (*a).s6 += (rotate((*a).s7, 10U) ^ rotate((*a).s7, 19U) ^ rotate((*a).s7, 30U)) + bitselect((*a).s1, (*a).s0, ((*a).s7 ^ (*a).s1));
  ;
  (*a).s5 += (rotate((*a).s2, 7U) ^ rotate((*a).s2, 21U) ^ rotate((*a).s2, 26U)) + bitselect((*a).s4, (*a).s3, (*a).s2) + Gd[26];
  (*a).s1 += (*a).s5;
  (*a).s5 += (rotate((*a).s6, 10U) ^ rotate((*a).s6, 19U) ^ rotate((*a).s6, 30U)) + bitselect((*a).s0, (*a).s7, ((*a).s6 ^ (*a).s0));
  ;
  (*a).s4 += (rotate((*a).s1, 7U) ^ rotate((*a).s1, 21U) ^ rotate((*a).s1, 26U)) + bitselect((*a).s3, (*a).s2, (*a).s1) + Gd[27];
  (*a).s0 += (*a).s4;
  (*a).s4 += (rotate((*a).s5, 10U) ^ rotate((*a).s5, 19U) ^ rotate((*a).s5, 30U)) + bitselect((*a).s7, (*a).s6, ((*a).s5 ^ (*a).s7));
  ;
  (*a).s3 += (rotate((*a).s0, 7U) ^ rotate((*a).s0, 21U) ^ rotate((*a).s0, 26U)) + bitselect((*a).s2, (*a).s1, (*a).s0) + Gd[28];
  (*a).s7 += (*a).s3;
  (*a).s3 += (rotate((*a).s4, 10U) ^ rotate((*a).s4, 19U) ^ rotate((*a).s4, 30U)) + bitselect((*a).s6, (*a).s5, ((*a).s4 ^ (*a).s6));
  ;
  (*a).s2 += (rotate((*a).s7, 7U) ^ rotate((*a).s7, 21U) ^ rotate((*a).s7, 26U)) + bitselect((*a).s1, (*a).s0, (*a).s7) + Gd[29];
  (*a).s6 += (*a).s2;
  (*a).s2 += (rotate((*a).s3, 10U) ^ rotate((*a).s3, 19U) ^ rotate((*a).s3, 30U)) + bitselect((*a).s5, (*a).s4, ((*a).s3 ^ (*a).s5));
  ;
  (*a).s1 += (rotate((*a).s6, 7U) ^ rotate((*a).s6, 21U) ^ rotate((*a).s6, 26U)) + bitselect((*a).s0, (*a).s7, (*a).s6) + Gd[30];
  (*a).s5 += (*a).s1;
  (*a).s1 += (rotate((*a).s2, 10U) ^ rotate((*a).s2, 19U) ^ rotate((*a).s2, 30U)) + bitselect((*a).s4, (*a).s3, ((*a).s2 ^ (*a).s4));
  ;
  (*a).s0 += (rotate((*a).s5, 7U) ^ rotate((*a).s5, 21U) ^ rotate((*a).s5, 26U)) + bitselect((*a).s7, (*a).s6, (*a).s5) + Gd[31];
  (*a).s4 += (*a).s0;
  (*a).s0 += (rotate((*a).s1, 10U) ^ rotate((*a).s1, 19U) ^ rotate((*a).s1, 30U)) + bitselect((*a).s3, (*a).s2, ((*a).s1 ^ (*a).s3));
  ;
  (*a).s7 += (rotate((*a).s4, 7U) ^ rotate((*a).s4, 21U) ^ rotate((*a).s4, 26U)) + bitselect((*a).s6, (*a).s5, (*a).s4) + Gd[32];
  (*a).s3 += (*a).s7;
  (*a).s7 += (rotate((*a).s0, 10U) ^ rotate((*a).s0, 19U) ^ rotate((*a).s0, 30U)) + bitselect((*a).s2, (*a).s1, ((*a).s0 ^ (*a).s2));
  ;
  (*a).s6 += (rotate((*a).s3, 7U) ^ rotate((*a).s3, 21U) ^ rotate((*a).s3, 26U)) + bitselect((*a).s5, (*a).s4, (*a).s3) + Gd[33];
  (*a).s2 += (*a).s6;
  (*a).s6 += (rotate((*a).s7, 10U) ^ rotate((*a).s7, 19U) ^ rotate((*a).s7, 30U)) + bitselect((*a).s1, (*a).s0, ((*a).s7 ^ (*a).s1));
  ;
  (*a).s5 += (rotate((*a).s2, 7U) ^ rotate((*a).s2, 21U) ^ rotate((*a).s2, 26U)) + bitselect((*a).s4, (*a).s3, (*a).s2) + Gd[34];
  (*a).s1 += (*a).s5;
  (*a).s5 += (rotate((*a).s6, 10U) ^ rotate((*a).s6, 19U) ^ rotate((*a).s6, 30U)) + bitselect((*a).s0, (*a).s7, ((*a).s6 ^ (*a).s0));
  ;
  (*a).s4 += (rotate((*a).s1, 7U) ^ rotate((*a).s1, 21U) ^ rotate((*a).s1, 26U)) + bitselect((*a).s3, (*a).s2, (*a).s1) + Gd[35];
  (*a).s0 += (*a).s4;
  (*a).s4 += (rotate((*a).s5, 10U) ^ rotate((*a).s5, 19U) ^ rotate((*a).s5, 30U)) + bitselect((*a).s7, (*a).s6, ((*a).s5 ^ (*a).s7));
  ;
  (*a).s3 += (rotate((*a).s0, 7U) ^ rotate((*a).s0, 21U) ^ rotate((*a).s0, 26U)) + bitselect((*a).s2, (*a).s1, (*a).s0) + Gd[36];
  (*a).s7 += (*a).s3;
  (*a).s3 += (rotate((*a).s4, 10U) ^ rotate((*a).s4, 19U) ^ rotate((*a).s4, 30U)) + bitselect((*a).s6, (*a).s5, ((*a).s4 ^ (*a).s6));
  ;
  (*a).s2 += (rotate((*a).s7, 7U) ^ rotate((*a).s7, 21U) ^ rotate((*a).s7, 26U)) + bitselect((*a).s1, (*a).s0, (*a).s7) + Gd[37];
  (*a).s6 += (*a).s2;
  (*a).s2 += (rotate((*a).s3, 10U) ^ rotate((*a).s3, 19U) ^ rotate((*a).s3, 30U)) + bitselect((*a).s5, (*a).s4, ((*a).s3 ^ (*a).s5));
  ;
  (*a).s1 += (rotate((*a).s6, 7U) ^ rotate((*a).s6, 21U) ^ rotate((*a).s6, 26U)) + bitselect((*a).s0, (*a).s7, (*a).s6) + Gd[38];
  (*a).s5 += (*a).s1;
  (*a).s1 += (rotate((*a).s2, 10U) ^ rotate((*a).s2, 19U) ^ rotate((*a).s2, 30U)) + bitselect((*a).s4, (*a).s3, ((*a).s2 ^ (*a).s4));
  ;
  (*a).s0 += (rotate((*a).s5, 7U) ^ rotate((*a).s5, 21U) ^ rotate((*a).s5, 26U)) + bitselect((*a).s7, (*a).s6, (*a).s5) + Gd[39];
  (*a).s4 += (*a).s0;
  (*a).s0 += (rotate((*a).s1, 10U) ^ rotate((*a).s1, 19U) ^ rotate((*a).s1, 30U)) + bitselect((*a).s3, (*a).s2, ((*a).s1 ^ (*a).s3));
  ;
  (*a).s7 += (rotate((*a).s4, 7U) ^ rotate((*a).s4, 21U) ^ rotate((*a).s4, 26U)) + bitselect((*a).s6, (*a).s5, (*a).s4) + Gd[40];
  (*a).s3 += (*a).s7;
  (*a).s7 += (rotate((*a).s0, 10U) ^ rotate((*a).s0, 19U) ^ rotate((*a).s0, 30U)) + bitselect((*a).s2, (*a).s1, ((*a).s0 ^ (*a).s2));
  ;
  (*a).s6 += (rotate((*a).s3, 7U) ^ rotate((*a).s3, 21U) ^ rotate((*a).s3, 26U)) + bitselect((*a).s5, (*a).s4, (*a).s3) + Gd[41];
  (*a).s2 += (*a).s6;
  (*a).s6 += (rotate((*a).s7, 10U) ^ rotate((*a).s7, 19U) ^ rotate((*a).s7, 30U)) + bitselect((*a).s1, (*a).s0, ((*a).s7 ^ (*a).s1));
  ;
  (*a).s5 += (rotate((*a).s2, 7U) ^ rotate((*a).s2, 21U) ^ rotate((*a).s2, 26U)) + bitselect((*a).s4, (*a).s3, (*a).s2) + Gd[42];
  (*a).s1 += (*a).s5;
  (*a).s5 += (rotate((*a).s6, 10U) ^ rotate((*a).s6, 19U) ^ rotate((*a).s6, 30U)) + bitselect((*a).s0, (*a).s7, ((*a).s6 ^ (*a).s0));
  ;
  (*a).s4 += (rotate((*a).s1, 7U) ^ rotate((*a).s1, 21U) ^ rotate((*a).s1, 26U)) + bitselect((*a).s3, (*a).s2, (*a).s1) + Gd[43];
  (*a).s0 += (*a).s4;
  (*a).s4 += (rotate((*a).s5, 10U) ^ rotate((*a).s5, 19U) ^ rotate((*a).s5, 30U)) + bitselect((*a).s7, (*a).s6, ((*a).s5 ^ (*a).s7));
  ;
  (*a).s3 += (rotate((*a).s0, 7U) ^ rotate((*a).s0, 21U) ^ rotate((*a).s0, 26U)) + bitselect((*a).s2, (*a).s1, (*a).s0) + Gd[44];
  (*a).s7 += (*a).s3;
  (*a).s3 += (rotate((*a).s4, 10U) ^ rotate((*a).s4, 19U) ^ rotate((*a).s4, 30U)) + bitselect((*a).s6, (*a).s5, ((*a).s4 ^ (*a).s6));
  ;
  (*a).s2 += (rotate((*a).s7, 7U) ^ rotate((*a).s7, 21U) ^ rotate((*a).s7, 26U)) + bitselect((*a).s1, (*a).s0, (*a).s7) + Gd[45];
  (*a).s6 += (*a).s2;
  (*a).s2 += (rotate((*a).s3, 10U) ^ rotate((*a).s3, 19U) ^ rotate((*a).s3, 30U)) + bitselect((*a).s5, (*a).s4, ((*a).s3 ^ (*a).s5));
  ;
  (*a).s1 += (rotate((*a).s6, 7U) ^ rotate((*a).s6, 21U) ^ rotate((*a).s6, 26U)) + bitselect((*a).s0, (*a).s7, (*a).s6) + Gd[46];
  (*a).s5 += (*a).s1;
  (*a).s1 += (rotate((*a).s2, 10U) ^ rotate((*a).s2, 19U) ^ rotate((*a).s2, 30U)) + bitselect((*a).s4, (*a).s3, ((*a).s2 ^ (*a).s4));
  ;
  (*a).s0 += (rotate((*a).s5, 7U) ^ rotate((*a).s5, 21U) ^ rotate((*a).s5, 26U)) + bitselect((*a).s7, (*a).s6, (*a).s5) + Gd[47];
  (*a).s4 += (*a).s0;
  (*a).s0 += (rotate((*a).s1, 10U) ^ rotate((*a).s1, 19U) ^ rotate((*a).s1, 30U)) + bitselect((*a).s3, (*a).s2, ((*a).s1 ^ (*a).s3));
  ;
  (*a).s7 += (rotate((*a).s4, 7U) ^ rotate((*a).s4, 21U) ^ rotate((*a).s4, 26U)) + bitselect((*a).s6, (*a).s5, (*a).s4) + Gd[48];
  (*a).s3 += (*a).s7;
  (*a).s7 += (rotate((*a).s0, 10U) ^ rotate((*a).s0, 19U) ^ rotate((*a).s0, 30U)) + bitselect((*a).s2, (*a).s1, ((*a).s0 ^ (*a).s2));
  ;
  (*a).s6 += (rotate((*a).s3, 7U) ^ rotate((*a).s3, 21U) ^ rotate((*a).s3, 26U)) + bitselect((*a).s5, (*a).s4, (*a).s3) + Gd[49];
  (*a).s2 += (*a).s6;
  (*a).s6 += (rotate((*a).s7, 10U) ^ rotate((*a).s7, 19U) ^ rotate((*a).s7, 30U)) + bitselect((*a).s1, (*a).s0, ((*a).s7 ^ (*a).s1));
  ;
  (*a).s5 += (rotate((*a).s2, 7U) ^ rotate((*a).s2, 21U) ^ rotate((*a).s2, 26U)) + bitselect((*a).s4, (*a).s3, (*a).s2) + Gd[50];
  (*a).s1 += (*a).s5;
  (*a).s5 += (rotate((*a).s6, 10U) ^ rotate((*a).s6, 19U) ^ rotate((*a).s6, 30U)) + bitselect((*a).s0, (*a).s7, ((*a).s6 ^ (*a).s0));
  ;
  (*a).s4 += (rotate((*a).s1, 7U) ^ rotate((*a).s1, 21U) ^ rotate((*a).s1, 26U)) + bitselect((*a).s3, (*a).s2, (*a).s1) + Gd[51];
  (*a).s0 += (*a).s4;
  (*a).s4 += (rotate((*a).s5, 10U) ^ rotate((*a).s5, 19U) ^ rotate((*a).s5, 30U)) + bitselect((*a).s7, (*a).s6, ((*a).s5 ^ (*a).s7));
  ;
  (*a).s3 += (rotate((*a).s0, 7U) ^ rotate((*a).s0, 21U) ^ rotate((*a).s0, 26U)) + bitselect((*a).s2, (*a).s1, (*a).s0) + Gd[52];
  (*a).s7 += (*a).s3;
  (*a).s3 += (rotate((*a).s4, 10U) ^ rotate((*a).s4, 19U) ^ rotate((*a).s4, 30U)) + bitselect((*a).s6, (*a).s5, ((*a).s4 ^ (*a).s6));
  ;
  (*a).s2 += (rotate((*a).s7, 7U) ^ rotate((*a).s7, 21U) ^ rotate((*a).s7, 26U)) + bitselect((*a).s1, (*a).s0, (*a).s7) + Gd[53];
  (*a).s6 += (*a).s2;
  (*a).s2 += (rotate((*a).s3, 10U) ^ rotate((*a).s3, 19U) ^ rotate((*a).s3, 30U)) + bitselect((*a).s5, (*a).s4, ((*a).s3 ^ (*a).s5));
  ;
  (*a).s1 += (rotate((*a).s6, 7U) ^ rotate((*a).s6, 21U) ^ rotate((*a).s6, 26U)) + bitselect((*a).s0, (*a).s7, (*a).s6) + Gd[54];
  (*a).s5 += (*a).s1;
  (*a).s1 += (rotate((*a).s2, 10U) ^ rotate((*a).s2, 19U) ^ rotate((*a).s2, 30U)) + bitselect((*a).s4, (*a).s3, ((*a).s2 ^ (*a).s4));
  ;
  (*a).s0 += (rotate((*a).s5, 7U) ^ rotate((*a).s5, 21U) ^ rotate((*a).s5, 26U)) + bitselect((*a).s7, (*a).s6, (*a).s5) + Gd[55];
  (*a).s4 += (*a).s0;
  (*a).s0 += (rotate((*a).s1, 10U) ^ rotate((*a).s1, 19U) ^ rotate((*a).s1, 30U)) + bitselect((*a).s3, (*a).s2, ((*a).s1 ^ (*a).s3));
  ;
  (*a).s7 += (rotate((*a).s4, 7U) ^ rotate((*a).s4, 21U) ^ rotate((*a).s4, 26U)) + bitselect((*a).s6, (*a).s5, (*a).s4) + Gd[56];
  (*a).s3 += (*a).s7;
  (*a).s7 += (rotate((*a).s0, 10U) ^ rotate((*a).s0, 19U) ^ rotate((*a).s0, 30U)) + bitselect((*a).s2, (*a).s1, ((*a).s0 ^ (*a).s2));
  ;
  (*a).s6 += (rotate((*a).s3, 7U) ^ rotate((*a).s3, 21U) ^ rotate((*a).s3, 26U)) + bitselect((*a).s5, (*a).s4, (*a).s3) + Gd[57];
  (*a).s2 += (*a).s6;
  (*a).s6 += (rotate((*a).s7, 10U) ^ rotate((*a).s7, 19U) ^ rotate((*a).s7, 30U)) + bitselect((*a).s1, (*a).s0, ((*a).s7 ^ (*a).s1));
  ;
  (*a).s5 += (rotate((*a).s2, 7U) ^ rotate((*a).s2, 21U) ^ rotate((*a).s2, 26U)) + bitselect((*a).s4, (*a).s3, (*a).s2) + Gd[58];
  (*a).s1 += (*a).s5;
  (*a).s5 += (rotate((*a).s6, 10U) ^ rotate((*a).s6, 19U) ^ rotate((*a).s6, 30U)) + bitselect((*a).s0, (*a).s7, ((*a).s6 ^ (*a).s0));
  ;
  (*a).s4 += (rotate((*a).s1, 7U) ^ rotate((*a).s1, 21U) ^ rotate((*a).s1, 26U)) + bitselect((*a).s3, (*a).s2, (*a).s1) + Gd[59];
  (*a).s0 += (*a).s4;
  (*a).s4 += (rotate((*a).s5, 10U) ^ rotate((*a).s5, 19U) ^ rotate((*a).s5, 30U)) + bitselect((*a).s7, (*a).s6, ((*a).s5 ^ (*a).s7));
  ;
  (*a).s3 += (rotate((*a).s0, 7U) ^ rotate((*a).s0, 21U) ^ rotate((*a).s0, 26U)) + bitselect((*a).s2, (*a).s1, (*a).s0) + Gd[60];
  (*a).s7 += (*a).s3;
  (*a).s3 += (rotate((*a).s4, 10U) ^ rotate((*a).s4, 19U) ^ rotate((*a).s4, 30U)) + bitselect((*a).s6, (*a).s5, ((*a).s4 ^ (*a).s6));
  ;
  (*a).s7 += b;
}
__constant ulong Ge[16] = {1UL << 63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0x400};

uint D(ulong a) {
  uint b = (uint)(((a >> 38UL) + ((a >> 6) & 0xFFFFFFFF)) >> 32) + (uint)((a >> 38UL) + ((a >> 6) & 0xFFFFFFFF));
  return ((b % 5) << 6) + (a & 63U);
}

uint E(ulong a) {
  uint b = (uint)(((a >> 37UL) + ((a >> 5) & 0xFFFFFFFF)) >> 32) + (uint)((a >> 37UL) + ((a >> 5) & 0xFFFFFFFF));
  return ((b % 5) << 5) + (a & 31U);
}

uint F(ulong a) {
  a = (((a >> 32) * 208 + (uint)a) >> 32) * 208 + (uint)((a >> 32) * 208 + (uint)a);
  return ((uint)a + mul24((uint)(a >> 32), 208U)) % 316;
}

__constant ulong Gf[16] = {
    0x6A09E667F3BCC908UL, 0xBB67AE8584CAA73BUL, 0x3C6EF372FE94F82BUL, 0xA54FF53A5F1D36F1UL, 0x510E527FADE682D1UL, 0x9B05688C2B3E6C1FUL, 0x1F83D9ABFB41BD6BUL, 0x5BE0CD19137E2179UL,
};
__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void G(__global uint const* restrict a, __global uint* b, __global uint const* restrict c, uint8 d) {
  __local uchar e[32768];
  uint f = 460 * 64;
  uint g = 460 * get_local_id(0);
  __local uchar* h = e + f;
  __local uchar* i = e + g;
  __local uchar* j = e + 31744;
  uint k = get_local_id(0);
  {
    uint l = k;
    j[l] = ((uchar)(c[l * l >> 2] >> ((l * l & 3) << 3)));
    l += 128;
    j[l] = ((uchar)(c[l * l >> 2] >> ((l * l & 3) << 3)));
    l += 128;
    j[l] = ((uchar)(c[l * l >> 2] >> ((l * l & 3) << 3)));
    l += 128;
    j[l] = ((uchar)(c[l * l >> 2] >> ((l * l & 3) << 3)));
    l += 128;
    j[l] = ((uchar)(c[l * l >> 2] >> ((l * l & 3) << 3)));
    l += 128;
    j[l] = ((uchar)(c[l * l >> 2] >> ((l * l & 3) << 3)));
    l += 128;
    j[l] = ((uchar)(c[l * l >> 2] >> ((l * l & 3) << 3)));
    l += 128;
    j[l] = ((uchar)(c[l * l >> 2] >> ((l * l & 3) << 3)));
    l += 128;
    j[l] = ((uchar)(c[l * l >> 2] >> ((l * l & 3) << 3)));
  }

  ((__local uint*)h)[k & 15] = a[k & 15];
  for (uint l = 0; l < 16; ++l)
    ((__local uint*)i)[l] = a[l + 16];

  uint m = get_global_id(0);

  *(__local uint*)(i + 44) = m;

  ulong n[32];
  n[0] = 0x6A09E667F3BCC908UL;
  n[1] = 0xBB67AE8584CAA73BUL;
  n[2] = 0x3C6EF372FE94F82BUL;
  n[3] = 0xA54FF53A5F1D36F1UL;
  n[4] = 0x510E527FADE682D1UL;
  n[5] = 0x9B05688C2B3E6C1FUL;
  n[6] = 0x1F83D9ABFB41BD6BUL;
  n[7] = 0x5BE0CD19137E2179UL;
  n[8] = 0x243F6A8885A308D3UL;
  n[9] = 0x13198A2E03707344UL;
  n[10] = 0xA4093822299F31D0UL;
  n[11] = 0x082EFA98EC4E6C89UL;
  n[12] = 0x452821E638D01777UL;
  n[13] = 0xBE5466CF34E9086CUL;
  n[14] = 0xC0AC29B7C97C50DDUL;
  n[15] = 0x3F84D5B5B5470917UL;

  for (uint l = 0; l < 8; ++l)
    n[l + 16] = (((ulong)A(*(__local uint*)(h + l * 8)) << 32) | (ulong)A(*(__local uint*)((h + l * 8) + 4)));
  for (uint l = 0; l < 8; ++l)
    n[l + 24] = (((ulong)A(*(__local uint*)(i + l * 8)) << 32) | (ulong)A(*(__local uint*)((i + l * 8) + 4)));
  ulong* o = n + 16;
  for (uint l = 0; l < 256; l += 16) {
    n[0] += (o[Ga[l + 0]] ^ Gb[Ga[l + 0 + 1]]) + n[4];
    n[1] += (o[Ga[l + 2]] ^ Gb[Ga[l + 2 + 1]]) + n[5];
    n[2] += (o[Ga[l + 4]] ^ Gb[Ga[l + 4 + 1]]) + n[6];
    n[3] += (o[Ga[l + 6]] ^ Gb[Ga[l + 6 + 1]]) + n[7];
    n[12] = rotate(n[12] ^ n[0], 32UL);
    n[13] = rotate(n[13] ^ n[1], 32UL);
    n[14] = rotate(n[14] ^ n[2], 32UL);
    n[15] = rotate(n[15] ^ n[3], 32UL);
    n[8] += n[12];
    n[9] += n[13];
    n[10] += n[14];
    n[11] += n[15];
    n[4] = rotate(n[4] ^ n[8], 39UL);
    n[5] = rotate(n[5] ^ n[9], 39UL);
    n[6] = rotate(n[6] ^ n[10], 39UL);
    n[7] = rotate(n[7] ^ n[11], 39UL);
    n[0] += (o[Ga[l + 0 + 1]] ^ Gb[Ga[l + 0]]) + n[4];
    n[1] += (o[Ga[l + 2 + 1]] ^ Gb[Ga[l + 2]]) + n[5];
    n[2] += (o[Ga[l + 4 + 1]] ^ Gb[Ga[l + 4]]) + n[6];
    n[3] += (o[Ga[l + 6 + 1]] ^ Gb[Ga[l + 6]]) + n[7];
    n[12] = rotate(n[12] ^ n[0], 48UL);
    n[13] = rotate(n[13] ^ n[1], 48UL);
    n[14] = rotate(n[14] ^ n[2], 48UL);
    n[15] = rotate(n[15] ^ n[3], 48UL);
    n[8] += n[12];
    n[9] += n[13];
    n[10] += n[14];
    n[11] += n[15];
    n[4] = rotate(n[4] ^ n[8], 53UL);
    n[5] = rotate(n[5] ^ n[9], 53UL);
    n[6] = rotate(n[6] ^ n[10], 53UL);
    n[7] = rotate(n[7] ^ n[11], 53UL);
    ;
    n[3] += (o[Ga[l + 14]] ^ Gb[Ga[l + 14 + 1]]) + n[4];
    n[2] += (o[Ga[l + 12]] ^ Gb[Ga[l + 12 + 1]]) + n[7];
    n[0] += (o[Ga[l + 8]] ^ Gb[Ga[l + 8 + 1]]) + n[5];
    n[1] += (o[Ga[l + 10]] ^ Gb[Ga[l + 10 + 1]]) + n[6];
    n[14] = rotate(n[14] ^ n[3], 32UL);
    n[13] = rotate(n[13] ^ n[2], 32UL);
    n[15] = rotate(n[15] ^ n[0], 32UL);
    n[12] = rotate(n[12] ^ n[1], 32UL);
    n[9] += n[14];
    n[8] += n[13];
    n[10] += n[15];
    n[11] += n[12];
    n[4] = rotate(n[4] ^ n[9], 39UL);
    n[7] = rotate(n[7] ^ n[8], 39UL);
    n[5] = rotate(n[5] ^ n[10], 39UL);
    n[6] = rotate(n[6] ^ n[11], 39UL);
    n[3] += (o[Ga[l + 14 + 1]] ^ Gb[Ga[l + 14]]) + n[4];
    n[2] += (o[Ga[l + 12 + 1]] ^ Gb[Ga[l + 12]]) + n[7];
    n[0] += (o[Ga[l + 8 + 1]] ^ Gb[Ga[l + 8]]) + n[5];
    n[1] += (o[Ga[l + 10 + 1]] ^ Gb[Ga[l + 10]]) + n[6];
    n[14] = rotate(n[14] ^ n[3], 48UL);
    n[13] = rotate(n[13] ^ n[2], 48UL);
    n[15] = rotate(n[15] ^ n[0], 48UL);
    n[12] = rotate(n[12] ^ n[1], 48UL);
    n[9] += n[14];
    n[8] += n[13];
    n[10] += n[15];
    n[11] += n[12];
    n[4] = rotate(n[4] ^ n[9], 53UL);
    n[7] = rotate(n[7] ^ n[8], 53UL);
    n[5] = rotate(n[5] ^ n[10], 53UL);
    n[6] = rotate(n[6] ^ n[11], 53UL);
    ;
  }
  for (uint l = 0; l < 8; ++l) {
    n[l] ^= n[l + 8] ^ Gf[l];
    o[l] = n[l];
  }
  n[8] = 0x243F6A8885A308D3UL;
  n[9] = 0x13198A2E03707344UL;
  n[10] = 0xA4093822299F31D0UL;
  n[11] = 0x082EFA98EC4E6C89UL;
  n[12] = 0x452821E638D01377UL;
  n[13] = 0xBE5466CF34E90C6CUL;
  n[14] = 0xC0AC29B7C97C50DDUL;
  n[15] = 0x3F84D5B5B5470917UL;

  for (uint l = 0; l < 256; l += 16) {
    n[0] += (Ge[Ga[l + 0]] ^ Gb[Ga[l + 0 + 1]]) + n[4];
    n[1] += (Ge[Ga[l + 2]] ^ Gb[Ga[l + 2 + 1]]) + n[5];
    n[2] += (Ge[Ga[l + 4]] ^ Gb[Ga[l + 4 + 1]]) + n[6];
    n[3] += (Ge[Ga[l + 6]] ^ Gb[Ga[l + 6 + 1]]) + n[7];
    n[12] = rotate(n[12] ^ n[0], 32UL);
    n[13] = rotate(n[13] ^ n[1], 32UL);
    n[14] = rotate(n[14] ^ n[2], 32UL);
    n[15] = rotate(n[15] ^ n[3], 32UL);
    n[8] += n[12];
    n[9] += n[13];
    n[10] += n[14];
    n[11] += n[15];
    n[4] = rotate(n[4] ^ n[8], 39UL);
    n[5] = rotate(n[5] ^ n[9], 39UL);
    n[6] = rotate(n[6] ^ n[10], 39UL);
    n[7] = rotate(n[7] ^ n[11], 39UL);
    n[0] += (Ge[Ga[l + 0 + 1]] ^ Gb[Ga[l + 0]]) + n[4];
    n[1] += (Ge[Ga[l + 2 + 1]] ^ Gb[Ga[l + 2]]) + n[5];
    n[2] += (Ge[Ga[l + 4 + 1]] ^ Gb[Ga[l + 4]]) + n[6];
    n[3] += (Ge[Ga[l + 6 + 1]] ^ Gb[Ga[l + 6]]) + n[7];
    n[12] = rotate(n[12] ^ n[0], 48UL);
    n[13] = rotate(n[13] ^ n[1], 48UL);
    n[14] = rotate(n[14] ^ n[2], 48UL);
    n[15] = rotate(n[15] ^ n[3], 48UL);
    n[8] += n[12];
    n[9] += n[13];
    n[10] += n[14];
    n[11] += n[15];
    n[4] = rotate(n[4] ^ n[8], 53UL);
    n[5] = rotate(n[5] ^ n[9], 53UL);
    n[6] = rotate(n[6] ^ n[10], 53UL);
    n[7] = rotate(n[7] ^ n[11], 53UL);
    ;
    n[3] += (Ge[Ga[l + 14]] ^ Gb[Ga[l + 14 + 1]]) + n[4];
    n[2] += (Ge[Ga[l + 12]] ^ Gb[Ga[l + 12 + 1]]) + n[7];
    n[0] += (Ge[Ga[l + 8]] ^ Gb[Ga[l + 8 + 1]]) + n[5];
    n[1] += (Ge[Ga[l + 10]] ^ Gb[Ga[l + 10 + 1]]) + n[6];
    n[14] = rotate(n[14] ^ n[3], 32UL);
    n[13] = rotate(n[13] ^ n[2], 32UL);
    n[15] = rotate(n[15] ^ n[0], 32UL);
    n[12] = rotate(n[12] ^ n[1], 32UL);
    n[9] += n[14];
    n[8] += n[13];
    n[10] += n[15];
    n[11] += n[12];
    n[4] = rotate(n[4] ^ n[9], 39UL);
    n[7] = rotate(n[7] ^ n[8], 39UL);
    n[5] = rotate(n[5] ^ n[10], 39UL);
    n[6] = rotate(n[6] ^ n[11], 39UL);
    n[3] += (Ge[Ga[l + 14 + 1]] ^ Gb[Ga[l + 14]]) + n[4];
    n[2] += (Ge[Ga[l + 12 + 1]] ^ Gb[Ga[l + 12]]) + n[7];
    n[0] += (Ge[Ga[l + 8 + 1]] ^ Gb[Ga[l + 8]]) + n[5];
    n[1] += (Ge[Ga[l + 10 + 1]] ^ Gb[Ga[l + 10]]) + n[6];
    n[14] = rotate(n[14] ^ n[3], 48UL);
    n[13] = rotate(n[13] ^ n[2], 48UL);
    n[15] = rotate(n[15] ^ n[0], 48UL);
    n[12] = rotate(n[12] ^ n[1], 48UL);
    n[9] += n[14];
    n[8] += n[13];
    n[10] += n[15];
    n[11] += n[12];
    n[4] = rotate(n[4] ^ n[9], 53UL);
    n[7] = rotate(n[7] ^ n[8], 53UL);
    n[5] = rotate(n[5] ^ n[10], 53UL);
    n[6] = rotate(n[6] ^ n[11], 53UL);
    ;
  }

  __local uchar* p = i + 64;

  for (uint l = 0; l < 8; ++l) {
    o[l] ^= n[l] ^ n[l + 8];
    (*(__local uint*)((p + l * 8))) = A((uint)((o[l]) >> 32));
    ;
    (*(__local uint*)((p + l * 8) + 4)) = A((uint)((o[l])));
    ;
    ;
  }

  __local uint* q = (__local uint*)(i + 128);

  uint r = p[15] ^ p[1];
  uint s;
  uint t = (1 + r);
  s = ((t & 0x40) ? (g) : (f));
  r += (uint)((((uchar)(bool)(r & 0x80)) ? (e[s + (t & 0x3F)]) : (p[t & 0x3F])) ^ p[2]) << 8;
  t = (2 + (r >> 8));
  s = ((t & 0x40) ? (g) : (f));
  r += (uint)((((uchar)(bool)(r & 0x8000)) ? (e[s + (t & 0x3F)]) : (p[t & 0x3F])) ^ p[3]) << 16;
  t = (3 + (r >> 16));
  s = ((t & 0x40) ? (g) : (f));
  r += (uint)((((uchar)(bool)(r & 0x800000)) ? (e[s + (t & 0x3F)]) : (p[t & 0x3F])) ^ p[4]) << 24;
  q[0] = r;
  for (uint u = 4; u < 320; u += 4) {
    t = (u + (r >> 24));
    s = ((t & 0x40) ? (g) : (f));
    r = (((uchar)(bool)(r & 0x80000000)) ? (e[s + (t & 0x3F)]) : (p[t & 0x3F])) ^ p[((u + 1) & 0x3F)];
    t = (u + 1 + r);
    s = ((t & 0x40) ? (g) : (f));
    r += (uint)((((uchar)(bool)(r & 0x00000080)) ? (e[s + (t & 0x3F)]) : (p[t & 0x3F])) ^ p[((u + 2) & 0x3F)]) << 8;
    t = (u + 2 + (r >> 8));
    s = ((t & 0x40) ? (g) : (f));
    r += (uint)((((uchar)(bool)(r & 0x00008000)) ? (e[s + (t & 0x3F)]) : (p[t & 0x3F])) ^ p[((u + 3) & 0x3F)]) << 16;
    t = (u + 3 + (r >> 16));
    s = ((t & 0x40) ? (g) : (f));
    r += (uint)((((uchar)(bool)(r & 0x00800000)) ? (e[s + (t & 0x3F)]) : (p[t & 0x3F])) ^ p[((u + 4) & 0x3F)]) << 24;
    q[u >> 2] = r;
  }

  ulong v = (q[77] >> 16);
  v += (((ulong)q[78]) << 16) + (((ulong)q[79]) << 48);

  t = (v + (q[75] & 0xFF)) & 0x3FFFFF;
  uint w = (((uchar)(c[t >> 2] >> ((t & 3) << 3))) >> 3) + 512;
  uint u = 1;

  q[79] ^= *p * 0x1000000;
  __local uchar* x = i + 128;
  do {
    t = ((uint)v & 0x3FFFFF);
    v += (c[t >> 2] >> ((t & 3) * 8)) + (uint)((ulong)c[(t >> 2) + 1] << (32 - (t & 3) * 8));
    ;
    ++x[((((uint)v) & 0x87878700) ? (D(v)) : (320U))];
    t = ((uint)v + x[E(v)]) & 0x3FFFFF;
    uint y = v & 0x80000000;
    v -= ((uchar)(c[t >> 2] >> ((t & 3) << 3)));
    t = (v & ((y) ? (0xFFFFU) : (0x20FAFBU)));
    v += ((c[t >> 2] >> ((t & 3) * 8)) + (uint)((ulong)c[(t >> 2) + 1] << (32 - (t & 3) * 8))) & (((y) ? (0xFFU) : (0xFFFFFFFFU)));
    ;
    t = (((uint)v + x[E(v)]) & 0x3FFFFF);
    v += (c[t >> 2] >> ((t & 3) * 8)) + (uint)((ulong)c[(t >> 2) + 1] << (32 - (t & 3) * 8));
    ;
    ++x[((((uint)v) & 0xF0000000) ? (D(v)) : (320U))];
    t = ((((q[((uchar)v) >> 2] >> ((((uchar)v) & 3) * 8)) + (uint)((ulong)q[(((uchar)v) >> 2) + 1] << (32 - (((uchar)v) & 3) * 8))) & 0x3FFFFF));
    v += (c[t >> 2] >> ((t & 3) * 8)) + (uint)((ulong)c[(t >> 2) + 1] << (32 - (t & 3) * 8));
    ;
    x[u % 320] = (uint)(v) ^ p[u & 63];
    t = (((uint)(v >> 32) + x[u % 200]) & 0x3FFFFF);
    v += (c[t >> 2] >> ((t & 3) * 8)) + (uint)((ulong)c[(t >> 2) + 1] << (32 - (t & 3) * 8));
    ;
    __local uint* z = (__local uint*)(x + (F(v) & 0x1FC));

    z[0] ^= ((v >> 24) & 0xFFFFFFFFUL) << ((v & 3) * 8);
    z[1] ^= ((v >> 24) & 0xFFFFFFFFUL) >> (32 - (v & 3) * 8);

    u += ((((uint)v & 7) == 3) ? (1U) : (0U));
    v -= j[u];
    u += ((((uint)v & 7) == 1) ? (2U) : (1U));
  } while (u < w);

  B(&d, i);
  B(&d, i + 64);
  B(&d, i + 128);
  B(&d, i + 192);
  B(&d, i + 256);
  B(&d, i + 320);
  B(&d, i + 384);
  C(&d);

  if ((d.s7 & 0) == 0) {
    b[m & 0xFF] = m;
  }
}