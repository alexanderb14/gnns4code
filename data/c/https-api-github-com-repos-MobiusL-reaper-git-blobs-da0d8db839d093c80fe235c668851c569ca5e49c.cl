typedef uchar u8; typedef ushort u16; typedef uint u32; typedef ulong u64; typedef uchar u8_v; __constant u8 Ga[256] = {0, 1,  2,  3, 4,  5, 6, 7, 8,  9, 10, 11, 12, 13, 14, 15, 14, 10, 4, 8, 9, 15, 13, 6, 1,  12, 0, 2,  11, 7,  5,  3, 11, 8, 12, 0, 5, 2, 15, 13, 10, 14, 3,  6,  7,  1,  9,  4,  7,  9,  3, 1, 13, 12, 11, 14, 2, 6,  5, 10, 4,  0, 15, 8, 9,  0, 5,  7, 2, 4, 10, 15, 14, 1,  11, 12, 6, 8, 3, 13, 2, 12, 6, 10, 0,  11, 8,  3,  4, 13, 7, 5,  15, 14, 1,  9, 12, 5, 1, 15, 14, 13, 4,  10, 0,  7, 6,  3,  9, 2, 8, 11, 13, 11, 7, 14, 12, 1,  3, 9, 5, 0,  15, 4, 8,  6,  2, 10,
                         6, 15, 14, 9, 11, 3, 0, 8, 12, 2, 13, 7,  1,  4,  10, 5,  10, 2,  8, 4, 7, 6,  1,  5, 15, 11, 9, 14, 3,  12, 13, 0, 0,  1, 2,  3, 4, 5, 6,  7,  8,  9,  10, 11, 12, 13, 14, 15, 14, 10, 4, 8, 9,  15, 13, 6,  1, 12, 0, 2,  11, 7, 5,  3, 11, 8, 12, 0, 5, 2, 15, 13, 10, 14, 3,  6,  7, 1, 9, 4,  7, 9,  3, 1,  13, 12, 11, 14, 2, 6,  5, 10, 4,  0,  15, 8, 9,  0, 5, 7,  2,  4,  10, 15, 14, 1, 11, 12, 6, 8, 3, 13, 2,  12, 6, 10, 0,  11, 8, 3, 4, 13, 7,  5, 15, 14, 1, 9};

__constant u64 Gb[16] = {0x243F6A8885A308D3UL, 0x13198A2E03707344UL, 0xA4093822299F31D0UL, 0x082EFA98EC4E6C89UL, 0x452821E638D01377UL, 0xBE5466CF34E90C6CUL, 0xC0AC29B7C97C50DDUL, 0x3F84D5B5B5470917UL, 0x9216D5D98979FB1BUL, 0xD1310BA698DFB5ACUL, 0x2FFD72DBD01ADFB7UL, 0xB8E1AFED6A267E96UL, 0xBA7C9045F12C7F99UL, 0x24A19947B3916CF7UL, 0x0801F2E2858EFC16UL, 0x636920D871574E69UL};

__constant u32 Gc[64] = {0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5, 0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174, 0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da, 0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
                         0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85, 0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070, 0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3, 0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2};

uint A(uint a, uint b) {
  return (a << b) | (a >> (32 - b));
}
u32 B(u32 a) {
  return ((a & 0xFF) << 24) | ((a & 0xFF00) << 8) | ((a & 0xFF0000) >> 8) | ((a & 0xFF000000) >> 24);
}

void C(u32* a, u8_v* b) {
  u32 c[64];

  u32* d = (u32*)b;
  for (u32 e = 0; e < 16; ++e) {
    c[e] = B(d[e]);
  }

  u32 f = a[0];
  u32 g = a[1];
  u32 h = a[2];
  u32 i = a[3];
  u32 j = a[4];
  u32 k = a[5];
  u32 l = a[6];
  u32 m = a[7];
  for (u32 e = 0; e < 16; e += 8) {
    m += (A(j, 7) ^ A(j, 21) ^ A(j, 26)) + (l ^ (j & (k ^ l))) + Gc[e + 0] + c[e + 0];
    i += m;
    m += (A(f, 10) ^ A(f, 19) ^ A(f, 30)) + (h ^ ((f ^ h) & (g ^ h)));
    ;
    l += (A(i, 7) ^ A(i, 21) ^ A(i, 26)) + (k ^ (i & (j ^ k))) + Gc[e + 1] + c[e + 1];
    h += l;
    l += (A(m, 10) ^ A(m, 19) ^ A(m, 30)) + (g ^ ((m ^ g) & (f ^ g)));
    ;
    k += (A(h, 7) ^ A(h, 21) ^ A(h, 26)) + (j ^ (h & (i ^ j))) + Gc[e + 2] + c[e + 2];
    g += k;
    k += (A(l, 10) ^ A(l, 19) ^ A(l, 30)) + (f ^ ((l ^ f) & (m ^ f)));
    ;
    j += (A(g, 7) ^ A(g, 21) ^ A(g, 26)) + (i ^ (g & (h ^ i))) + Gc[e + 3] + c[e + 3];
    f += j;
    j += (A(k, 10) ^ A(k, 19) ^ A(k, 30)) + (m ^ ((k ^ m) & (l ^ m)));
    ;
    i += (A(f, 7) ^ A(f, 21) ^ A(f, 26)) + (h ^ (f & (g ^ h))) + Gc[e + 4] + c[e + 4];
    m += i;
    i += (A(j, 10) ^ A(j, 19) ^ A(j, 30)) + (l ^ ((j ^ l) & (k ^ l)));
    ;
    h += (A(m, 7) ^ A(m, 21) ^ A(m, 26)) + (g ^ (m & (f ^ g))) + Gc[e + 5] + c[e + 5];
    l += h;
    h += (A(i, 10) ^ A(i, 19) ^ A(i, 30)) + (k ^ ((i ^ k) & (j ^ k)));
    ;
    g += (A(l, 7) ^ A(l, 21) ^ A(l, 26)) + (f ^ (l & (m ^ f))) + Gc[e + 6] + c[e + 6];
    k += g;
    g += (A(h, 10) ^ A(h, 19) ^ A(h, 30)) + (j ^ ((h ^ j) & (i ^ j)));
    ;
    f += (A(k, 7) ^ A(k, 21) ^ A(k, 26)) + (m ^ (k & (l ^ m))) + Gc[e + 7] + c[e + 7];
    j += f;
    f += (A(g, 10) ^ A(g, 19) ^ A(g, 30)) + (i ^ ((g ^ i) & (h ^ i)));
    ;
  }
  for (u32 e = 16; e < 64; e += 8) {
    m += (A(j, 7) ^ A(j, 21) ^ A(j, 26)) + (l ^ (j & (k ^ l))) + Gc[e + 0] + (c[e + 0] = (A(c[e + 0 - 2], 15) ^ A(c[e + 0 - 2], 13) ^ (c[e + 0 - 2] >> 10)) + c[e + 0 - 7] + (A(c[e + 0 - 15], 25) ^ A(c[e + 0 - 15], 14) ^ (c[e + 0 - 15] >> 3)) + c[e + 0 - 16]);
    i += m;
    m += (A(f, 10) ^ A(f, 19) ^ A(f, 30)) + (h ^ ((f ^ h) & (g ^ h)));
    ;
    l += (A(i, 7) ^ A(i, 21) ^ A(i, 26)) + (k ^ (i & (j ^ k))) + Gc[e + 1] + (c[e + 1] = (A(c[e + 1 - 2], 15) ^ A(c[e + 1 - 2], 13) ^ (c[e + 1 - 2] >> 10)) + c[e + 1 - 7] + (A(c[e + 1 - 15], 25) ^ A(c[e + 1 - 15], 14) ^ (c[e + 1 - 15] >> 3)) + c[e + 1 - 16]);
    h += l;
    l += (A(m, 10) ^ A(m, 19) ^ A(m, 30)) + (g ^ ((m ^ g) & (f ^ g)));
    ;
    k += (A(h, 7) ^ A(h, 21) ^ A(h, 26)) + (j ^ (h & (i ^ j))) + Gc[e + 2] + (c[e + 2] = (A(c[e + 2 - 2], 15) ^ A(c[e + 2 - 2], 13) ^ (c[e + 2 - 2] >> 10)) + c[e + 2 - 7] + (A(c[e + 2 - 15], 25) ^ A(c[e + 2 - 15], 14) ^ (c[e + 2 - 15] >> 3)) + c[e + 2 - 16]);
    g += k;
    k += (A(l, 10) ^ A(l, 19) ^ A(l, 30)) + (f ^ ((l ^ f) & (m ^ f)));
    ;
    j += (A(g, 7) ^ A(g, 21) ^ A(g, 26)) + (i ^ (g & (h ^ i))) + Gc[e + 3] + (c[e + 3] = (A(c[e + 3 - 2], 15) ^ A(c[e + 3 - 2], 13) ^ (c[e + 3 - 2] >> 10)) + c[e + 3 - 7] + (A(c[e + 3 - 15], 25) ^ A(c[e + 3 - 15], 14) ^ (c[e + 3 - 15] >> 3)) + c[e + 3 - 16]);
    f += j;
    j += (A(k, 10) ^ A(k, 19) ^ A(k, 30)) + (m ^ ((k ^ m) & (l ^ m)));
    ;
    i += (A(f, 7) ^ A(f, 21) ^ A(f, 26)) + (h ^ (f & (g ^ h))) + Gc[e + 4] + (c[e + 4] = (A(c[e + 4 - 2], 15) ^ A(c[e + 4 - 2], 13) ^ (c[e + 4 - 2] >> 10)) + c[e + 4 - 7] + (A(c[e + 4 - 15], 25) ^ A(c[e + 4 - 15], 14) ^ (c[e + 4 - 15] >> 3)) + c[e + 4 - 16]);
    m += i;
    i += (A(j, 10) ^ A(j, 19) ^ A(j, 30)) + (l ^ ((j ^ l) & (k ^ l)));
    ;
    h += (A(m, 7) ^ A(m, 21) ^ A(m, 26)) + (g ^ (m & (f ^ g))) + Gc[e + 5] + (c[e + 5] = (A(c[e + 5 - 2], 15) ^ A(c[e + 5 - 2], 13) ^ (c[e + 5 - 2] >> 10)) + c[e + 5 - 7] + (A(c[e + 5 - 15], 25) ^ A(c[e + 5 - 15], 14) ^ (c[e + 5 - 15] >> 3)) + c[e + 5 - 16]);
    l += h;
    h += (A(i, 10) ^ A(i, 19) ^ A(i, 30)) + (k ^ ((i ^ k) & (j ^ k)));
    ;
    g += (A(l, 7) ^ A(l, 21) ^ A(l, 26)) + (f ^ (l & (m ^ f))) + Gc[e + 6] + (c[e + 6] = (A(c[e + 6 - 2], 15) ^ A(c[e + 6 - 2], 13) ^ (c[e + 6 - 2] >> 10)) + c[e + 6 - 7] + (A(c[e + 6 - 15], 25) ^ A(c[e + 6 - 15], 14) ^ (c[e + 6 - 15] >> 3)) + c[e + 6 - 16]);
    k += g;
    g += (A(h, 10) ^ A(h, 19) ^ A(h, 30)) + (j ^ ((h ^ j) & (i ^ j)));
    ;
    f += (A(k, 7) ^ A(k, 21) ^ A(k, 26)) + (m ^ (k & (l ^ m))) + Gc[e + 7] + (c[e + 7] = (A(c[e + 7 - 2], 15) ^ A(c[e + 7 - 2], 13) ^ (c[e + 7 - 2] >> 10)) + c[e + 7 - 7] + (A(c[e + 7 - 15], 25) ^ A(c[e + 7 - 15], 14) ^ (c[e + 7 - 15] >> 3)) + c[e + 7 - 16]);
    j += f;
    f += (A(g, 10) ^ A(g, 19) ^ A(g, 30)) + (i ^ ((g ^ i) & (h ^ i)));
    ;
  }
  a[0] += f;
  a[1] += g;
  a[2] += h;
  a[3] += i;
  a[4] += j;
  a[5] += k;
  a[6] += l;
  a[7] += m;
}

__constant u32 Gd[61] = {0xc28a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5, 0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19c0174, 0x649b69c1, 0xf9be478a, 0x0fe1edc6, 0x240ca60c, 0x4fe9346f, 0x4d1c84ab, 0x61b94f1e, 0xf6f993db, 0xe8465162, 0xad13066f, 0xb0214c0d, 0x695a0283, 0xa0323379, 0x2bd376e9, 0xe1d0537c,
                         0x03a244a0, 0xfc13a4a5, 0xfafda43e, 0x56bea8bb, 0x445ec9b6, 0x39907315, 0x8c0d4e9f, 0xc832dccc, 0xdaffb65b, 0x1fed4f61, 0x2f646808, 0x1ff32294, 0x2634ccd7, 0xb0ebdefa, 0xd6fc592b, 0xa63c5c8f, 0xbe9fbab9, 0x0158082c, 0x68969712, 0x51e1d7e1, 0x5cf12d0d, 0xc4be2155, 0x7d7c8a34, 0x611f2c60, 0x036324af, 0xa4f08d87, 0x9e3e8435, 0x2c6dae30, 0x11921afc, 0xb76d720e};

void D(u32* a) {
  u32 b = a[0];
  u32 c = a[1];
  u32 d = a[2];
  u32 e = a[3];
  u32 f = a[4];
  u32 g = a[5];
  u32 h = a[6];
  u32 i = a[7];
  for (uint j = 0; j < 64; j += 8) {
    i += (A(f, 7) ^ A(f, 21) ^ A(f, 26)) + (h ^ (f & (g ^ h))) + Gd[j + 0];
    e += i;
    i += (A(b, 10) ^ A(b, 19) ^ A(b, 30)) + (d ^ ((b ^ d) & (c ^ d)));
    ;
    h += (A(e, 7) ^ A(e, 21) ^ A(e, 26)) + (g ^ (e & (f ^ g))) + Gd[j + 1];
    d += h;
    h += (A(i, 10) ^ A(i, 19) ^ A(i, 30)) + (c ^ ((i ^ c) & (b ^ c)));
    ;
    g += (A(d, 7) ^ A(d, 21) ^ A(d, 26)) + (f ^ (d & (e ^ f))) + Gd[j + 2];
    c += g;
    g += (A(h, 10) ^ A(h, 19) ^ A(h, 30)) + (b ^ ((h ^ b) & (i ^ b)));
    ;
    f += (A(c, 7) ^ A(c, 21) ^ A(c, 26)) + (e ^ (c & (d ^ e))) + Gd[j + 3];
    b += f;
    f += (A(g, 10) ^ A(g, 19) ^ A(g, 30)) + (i ^ ((g ^ i) & (h ^ i)));
    ;
    e += (A(b, 7) ^ A(b, 21) ^ A(b, 26)) + (d ^ (b & (c ^ d))) + Gd[j + 4];
    i += e;
    e += (A(f, 10) ^ A(f, 19) ^ A(f, 30)) + (h ^ ((f ^ h) & (g ^ h)));
    ;
    d += (A(i, 7) ^ A(i, 21) ^ A(i, 26)) + (c ^ (i & (b ^ c))) + Gd[j + 5];
    h += d;
    d += (A(e, 10) ^ A(e, 19) ^ A(e, 30)) + (g ^ ((e ^ g) & (f ^ g)));
    ;
    c += (A(h, 7) ^ A(h, 21) ^ A(h, 26)) + (b ^ (h & (i ^ b))) + Gd[j + 6];
    g += c;
    c += (A(d, 10) ^ A(d, 19) ^ A(d, 30)) + (f ^ ((d ^ f) & (e ^ f)));
    ;
    b += (A(g, 7) ^ A(g, 21) ^ A(g, 26)) + (i ^ (g & (h ^ i))) + Gd[j + 7];
    f += b;
    b += (A(c, 10) ^ A(c, 19) ^ A(c, 30)) + (e ^ ((c ^ e) & (d ^ e)));
    ;
  }
  a[7] += i;
}
__kernel void E(__global uchar* a, __global uint* b, __global uint* c) {
  u8_v d[512];
  for (uint e = 0; e < 128; ++e)
    d[e] = a[e];

  uint f = get_global_id(0);

  *(u32*)(d + 108) = f;

  u64 g[8];
  g[0] = 0x6A09E667F3BCC908UL;
  g[1] = 0xBB67AE8584CAA73BUL;
  g[2] = 0x3C6EF372FE94F82BUL;
  g[3] = 0xA54FF53A5F1D36F1UL;
  g[4] = 0x510E527FADE682D1UL;
  g[5] = 0x9B05688C2B3E6C1FUL;
  g[6] = 0x1F83D9ABFB41BD6BUL;
  g[7] = 0x5BE0CD19137E2179UL;

  u64 h[16];
  for (uint e = 0; e < 8; ++e)
    h[e] = g[e];
  h[8] = 0x243F6A8885A308D3UL;
  h[9] = 0x13198A2E03707344UL;
  h[10] = 0xA4093822299F31D0UL;
  h[11] = 0x082EFA98EC4E6C89UL;
  h[12] = 0x452821E638D01777UL;
  h[13] = 0xBE5466CF34E9086CUL;
  h[14] = 0xC0AC29B7C97C50DDUL;
  h[15] = 0x3F84D5B5B5470917UL;

  u64 i[16];
  for (uint e = 0; e < 16; ++e)
    i[e] = (((u64)(((u32)((d + e * 8)[0]) << 24) | ((u32)((d + e * 8)[1]) << 16) | ((u32)((d + e * 8)[2]) << 8) | ((u32)((d + e * 8)[3]))) << 32) | (u64)(((u32)(((d + e * 8) + 4)[0]) << 24) | ((u32)(((d + e * 8) + 4)[1]) << 16) | ((u32)(((d + e * 8) + 4)[2]) << 8) | ((u32)(((d + e * 8) + 4)[3]))));
  for (uint e = 0; e < 256; e += 16) {
    h[0] += (i[Ga[e + 0]] ^ Gb[Ga[e + 0 + 1]]) + h[4];
    h[1] += (i[Ga[e + 2]] ^ Gb[Ga[e + 2 + 1]]) + h[5];
    h[2] += (i[Ga[e + 4]] ^ Gb[Ga[e + 4 + 1]]) + h[6];
    h[3] += (i[Ga[e + 6]] ^ Gb[Ga[e + 6 + 1]]) + h[7];
    h[12] = (((h[12] ^ h[0]) << (64 - 32)) | ((h[12] ^ h[0]) >> (32)));
    h[13] = (((h[13] ^ h[1]) << (64 - 32)) | ((h[13] ^ h[1]) >> (32)));
    h[14] = (((h[14] ^ h[2]) << (64 - 32)) | ((h[14] ^ h[2]) >> (32)));
    h[15] = (((h[15] ^ h[3]) << (64 - 32)) | ((h[15] ^ h[3]) >> (32)));
    h[8] += h[12];
    h[9] += h[13];
    h[10] += h[14];
    h[11] += h[15];
    h[4] = (((h[4] ^ h[8]) << (64 - 25)) | ((h[4] ^ h[8]) >> (25)));
    h[5] = (((h[5] ^ h[9]) << (64 - 25)) | ((h[5] ^ h[9]) >> (25)));
    h[6] = (((h[6] ^ h[10]) << (64 - 25)) | ((h[6] ^ h[10]) >> (25)));
    h[7] = (((h[7] ^ h[11]) << (64 - 25)) | ((h[7] ^ h[11]) >> (25)));
    h[0] += (i[Ga[e + 0 + 1]] ^ Gb[Ga[e + 0]]) + h[4];
    h[1] += (i[Ga[e + 2 + 1]] ^ Gb[Ga[e + 2]]) + h[5];
    h[2] += (i[Ga[e + 4 + 1]] ^ Gb[Ga[e + 4]]) + h[6];
    h[3] += (i[Ga[e + 6 + 1]] ^ Gb[Ga[e + 6]]) + h[7];
    h[12] = (((h[12] ^ h[0]) << (64 - 16)) | ((h[12] ^ h[0]) >> (16)));
    h[13] = (((h[13] ^ h[1]) << (64 - 16)) | ((h[13] ^ h[1]) >> (16)));
    h[14] = (((h[14] ^ h[2]) << (64 - 16)) | ((h[14] ^ h[2]) >> (16)));
    h[15] = (((h[15] ^ h[3]) << (64 - 16)) | ((h[15] ^ h[3]) >> (16)));
    h[8] += h[12];
    h[9] += h[13];
    h[10] += h[14];
    h[11] += h[15];
    h[4] = (((h[4] ^ h[8]) << (64 - 11)) | ((h[4] ^ h[8]) >> (11)));
    h[5] = (((h[5] ^ h[9]) << (64 - 11)) | ((h[5] ^ h[9]) >> (11)));
    h[6] = (((h[6] ^ h[10]) << (64 - 11)) | ((h[6] ^ h[10]) >> (11)));
    h[7] = (((h[7] ^ h[11]) << (64 - 11)) | ((h[7] ^ h[11]) >> (11)));
    ;
    h[3] += (i[Ga[e + 14]] ^ Gb[Ga[e + 14 + 1]]) + h[4];
    h[2] += (i[Ga[e + 12]] ^ Gb[Ga[e + 12 + 1]]) + h[7];
    h[0] += (i[Ga[e + 8]] ^ Gb[Ga[e + 8 + 1]]) + h[5];
    h[1] += (i[Ga[e + 10]] ^ Gb[Ga[e + 10 + 1]]) + h[6];
    h[14] = (((h[14] ^ h[3]) << (64 - 32)) | ((h[14] ^ h[3]) >> (32)));
    h[13] = (((h[13] ^ h[2]) << (64 - 32)) | ((h[13] ^ h[2]) >> (32)));
    h[15] = (((h[15] ^ h[0]) << (64 - 32)) | ((h[15] ^ h[0]) >> (32)));
    h[12] = (((h[12] ^ h[1]) << (64 - 32)) | ((h[12] ^ h[1]) >> (32)));
    h[9] += h[14];
    h[8] += h[13];
    h[10] += h[15];
    h[11] += h[12];
    h[4] = (((h[4] ^ h[9]) << (64 - 25)) | ((h[4] ^ h[9]) >> (25)));
    h[7] = (((h[7] ^ h[8]) << (64 - 25)) | ((h[7] ^ h[8]) >> (25)));
    h[5] = (((h[5] ^ h[10]) << (64 - 25)) | ((h[5] ^ h[10]) >> (25)));
    h[6] = (((h[6] ^ h[11]) << (64 - 25)) | ((h[6] ^ h[11]) >> (25)));
    h[3] += (i[Ga[e + 14 + 1]] ^ Gb[Ga[e + 14]]) + h[4];
    h[2] += (i[Ga[e + 12 + 1]] ^ Gb[Ga[e + 12]]) + h[7];
    h[0] += (i[Ga[e + 8 + 1]] ^ Gb[Ga[e + 8]]) + h[5];
    h[1] += (i[Ga[e + 10 + 1]] ^ Gb[Ga[e + 10]]) + h[6];
    h[14] = (((h[14] ^ h[3]) << (64 - 16)) | ((h[14] ^ h[3]) >> (16)));
    h[13] = (((h[13] ^ h[2]) << (64 - 16)) | ((h[13] ^ h[2]) >> (16)));
    h[15] = (((h[15] ^ h[0]) << (64 - 16)) | ((h[15] ^ h[0]) >> (16)));
    h[12] = (((h[12] ^ h[1]) << (64 - 16)) | ((h[12] ^ h[1]) >> (16)));
    h[9] += h[14];
    h[8] += h[13];
    h[10] += h[15];
    h[11] += h[12];
    h[4] = (((h[4] ^ h[9]) << (64 - 11)) | ((h[4] ^ h[9]) >> (11)));
    h[7] = (((h[7] ^ h[8]) << (64 - 11)) | ((h[7] ^ h[8]) >> (11)));
    h[5] = (((h[5] ^ h[10]) << (64 - 11)) | ((h[5] ^ h[10]) >> (11)));
    h[6] = (((h[6] ^ h[11]) << (64 - 11)) | ((h[6] ^ h[11]) >> (11)));
    ;
  }
  for (uint e = 0; e < 8; ++e) {
    g[e] ^= h[e] ^ h[e + 8];
    h[e] = g[e];
  }
  h[8] = 0x243F6A8885A308D3UL;
  h[9] = 0x13198A2E03707344UL;
  h[10] = 0xA4093822299F31D0UL;
  h[11] = 0x082EFA98EC4E6C89UL;
  h[12] = 0x452821E638D01377UL;
  h[13] = 0xBE5466CF34E90C6CUL;
  h[14] = 0xC0AC29B7C97C50DDUL;
  h[15] = 0x3F84D5B5B5470917UL;

  u64 j[16] = {1UL << 63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0x400};
  for (uint e = 0; e < 256; e += 16) {
    h[0] += (j[Ga[e + 0]] ^ Gb[Ga[e + 0 + 1]]) + h[4];
    h[1] += (j[Ga[e + 2]] ^ Gb[Ga[e + 2 + 1]]) + h[5];
    h[2] += (j[Ga[e + 4]] ^ Gb[Ga[e + 4 + 1]]) + h[6];
    h[3] += (j[Ga[e + 6]] ^ Gb[Ga[e + 6 + 1]]) + h[7];
    h[12] = (((h[12] ^ h[0]) << (64 - 32)) | ((h[12] ^ h[0]) >> (32)));
    h[13] = (((h[13] ^ h[1]) << (64 - 32)) | ((h[13] ^ h[1]) >> (32)));
    h[14] = (((h[14] ^ h[2]) << (64 - 32)) | ((h[14] ^ h[2]) >> (32)));
    h[15] = (((h[15] ^ h[3]) << (64 - 32)) | ((h[15] ^ h[3]) >> (32)));
    h[8] += h[12];
    h[9] += h[13];
    h[10] += h[14];
    h[11] += h[15];
    h[4] = (((h[4] ^ h[8]) << (64 - 25)) | ((h[4] ^ h[8]) >> (25)));
    h[5] = (((h[5] ^ h[9]) << (64 - 25)) | ((h[5] ^ h[9]) >> (25)));
    h[6] = (((h[6] ^ h[10]) << (64 - 25)) | ((h[6] ^ h[10]) >> (25)));
    h[7] = (((h[7] ^ h[11]) << (64 - 25)) | ((h[7] ^ h[11]) >> (25)));
    h[0] += (j[Ga[e + 0 + 1]] ^ Gb[Ga[e + 0]]) + h[4];
    h[1] += (j[Ga[e + 2 + 1]] ^ Gb[Ga[e + 2]]) + h[5];
    h[2] += (j[Ga[e + 4 + 1]] ^ Gb[Ga[e + 4]]) + h[6];
    h[3] += (j[Ga[e + 6 + 1]] ^ Gb[Ga[e + 6]]) + h[7];
    h[12] = (((h[12] ^ h[0]) << (64 - 16)) | ((h[12] ^ h[0]) >> (16)));
    h[13] = (((h[13] ^ h[1]) << (64 - 16)) | ((h[13] ^ h[1]) >> (16)));
    h[14] = (((h[14] ^ h[2]) << (64 - 16)) | ((h[14] ^ h[2]) >> (16)));
    h[15] = (((h[15] ^ h[3]) << (64 - 16)) | ((h[15] ^ h[3]) >> (16)));
    h[8] += h[12];
    h[9] += h[13];
    h[10] += h[14];
    h[11] += h[15];
    h[4] = (((h[4] ^ h[8]) << (64 - 11)) | ((h[4] ^ h[8]) >> (11)));
    h[5] = (((h[5] ^ h[9]) << (64 - 11)) | ((h[5] ^ h[9]) >> (11)));
    h[6] = (((h[6] ^ h[10]) << (64 - 11)) | ((h[6] ^ h[10]) >> (11)));
    h[7] = (((h[7] ^ h[11]) << (64 - 11)) | ((h[7] ^ h[11]) >> (11)));
    ;
    h[3] += (j[Ga[e + 14]] ^ Gb[Ga[e + 14 + 1]]) + h[4];
    h[2] += (j[Ga[e + 12]] ^ Gb[Ga[e + 12 + 1]]) + h[7];
    h[0] += (j[Ga[e + 8]] ^ Gb[Ga[e + 8 + 1]]) + h[5];
    h[1] += (j[Ga[e + 10]] ^ Gb[Ga[e + 10 + 1]]) + h[6];
    h[14] = (((h[14] ^ h[3]) << (64 - 32)) | ((h[14] ^ h[3]) >> (32)));
    h[13] = (((h[13] ^ h[2]) << (64 - 32)) | ((h[13] ^ h[2]) >> (32)));
    h[15] = (((h[15] ^ h[0]) << (64 - 32)) | ((h[15] ^ h[0]) >> (32)));
    h[12] = (((h[12] ^ h[1]) << (64 - 32)) | ((h[12] ^ h[1]) >> (32)));
    h[9] += h[14];
    h[8] += h[13];
    h[10] += h[15];
    h[11] += h[12];
    h[4] = (((h[4] ^ h[9]) << (64 - 25)) | ((h[4] ^ h[9]) >> (25)));
    h[7] = (((h[7] ^ h[8]) << (64 - 25)) | ((h[7] ^ h[8]) >> (25)));
    h[5] = (((h[5] ^ h[10]) << (64 - 25)) | ((h[5] ^ h[10]) >> (25)));
    h[6] = (((h[6] ^ h[11]) << (64 - 25)) | ((h[6] ^ h[11]) >> (25)));
    h[3] += (j[Ga[e + 14 + 1]] ^ Gb[Ga[e + 14]]) + h[4];
    h[2] += (j[Ga[e + 12 + 1]] ^ Gb[Ga[e + 12]]) + h[7];
    h[0] += (j[Ga[e + 8 + 1]] ^ Gb[Ga[e + 8]]) + h[5];
    h[1] += (j[Ga[e + 10 + 1]] ^ Gb[Ga[e + 10]]) + h[6];
    h[14] = (((h[14] ^ h[3]) << (64 - 16)) | ((h[14] ^ h[3]) >> (16)));
    h[13] = (((h[13] ^ h[2]) << (64 - 16)) | ((h[13] ^ h[2]) >> (16)));
    h[15] = (((h[15] ^ h[0]) << (64 - 16)) | ((h[15] ^ h[0]) >> (16)));
    h[12] = (((h[12] ^ h[1]) << (64 - 16)) | ((h[12] ^ h[1]) >> (16)));
    h[9] += h[14];
    h[8] += h[13];
    h[10] += h[15];
    h[11] += h[12];
    h[4] = (((h[4] ^ h[9]) << (64 - 11)) | ((h[4] ^ h[9]) >> (11)));
    h[7] = (((h[7] ^ h[8]) << (64 - 11)) | ((h[7] ^ h[8]) >> (11)));
    h[5] = (((h[5] ^ h[10]) << (64 - 11)) | ((h[5] ^ h[10]) >> (11)));
    h[6] = (((h[6] ^ h[11]) << (64 - 11)) | ((h[6] ^ h[11]) >> (11)));
    ;
  }

  for (uint e = 0; e < 8; ++e)
    g[e] ^= h[e] ^ h[e + 8];

  u8_v* k = d + 128;

  ((k + 0))[0] = (u8)(((u32)((g[0]) >> 32)) >> 24);
  ((k + 0))[1] = (u8)(((u32)((g[0]) >> 32)) >> 16);
  ((k + 0))[2] = (u8)(((u32)((g[0]) >> 32)) >> 8);
  ((k + 0))[3] = (u8)(((u32)((g[0]) >> 32)));
  ;
  ((k + 0) + 4)[0] = (u8)(((u32)((g[0]))) >> 24);
  ((k + 0) + 4)[1] = (u8)(((u32)((g[0]))) >> 16);
  ((k + 0) + 4)[2] = (u8)(((u32)((g[0]))) >> 8);
  ((k + 0) + 4)[3] = (u8)(((u32)((g[0]))));
  ;
  ;
  ((k + 8))[0] = (u8)(((u32)((g[1]) >> 32)) >> 24);
  ((k + 8))[1] = (u8)(((u32)((g[1]) >> 32)) >> 16);
  ((k + 8))[2] = (u8)(((u32)((g[1]) >> 32)) >> 8);
  ((k + 8))[3] = (u8)(((u32)((g[1]) >> 32)));
  ;
  ((k + 8) + 4)[0] = (u8)(((u32)((g[1]))) >> 24);
  ((k + 8) + 4)[1] = (u8)(((u32)((g[1]))) >> 16);
  ((k + 8) + 4)[2] = (u8)(((u32)((g[1]))) >> 8);
  ((k + 8) + 4)[3] = (u8)(((u32)((g[1]))));
  ;
  ;
  ((k + 16))[0] = (u8)(((u32)((g[2]) >> 32)) >> 24);
  ((k + 16))[1] = (u8)(((u32)((g[2]) >> 32)) >> 16);
  ((k + 16))[2] = (u8)(((u32)((g[2]) >> 32)) >> 8);
  ((k + 16))[3] = (u8)(((u32)((g[2]) >> 32)));
  ;
  ((k + 16) + 4)[0] = (u8)(((u32)((g[2]))) >> 24);
  ((k + 16) + 4)[1] = (u8)(((u32)((g[2]))) >> 16);
  ((k + 16) + 4)[2] = (u8)(((u32)((g[2]))) >> 8);
  ((k + 16) + 4)[3] = (u8)(((u32)((g[2]))));
  ;
  ;
  ((k + 24))[0] = (u8)(((u32)((g[3]) >> 32)) >> 24);
  ((k + 24))[1] = (u8)(((u32)((g[3]) >> 32)) >> 16);
  ((k + 24))[2] = (u8)(((u32)((g[3]) >> 32)) >> 8);
  ((k + 24))[3] = (u8)(((u32)((g[3]) >> 32)));
  ;
  ((k + 24) + 4)[0] = (u8)(((u32)((g[3]))) >> 24);
  ((k + 24) + 4)[1] = (u8)(((u32)((g[3]))) >> 16);
  ((k + 24) + 4)[2] = (u8)(((u32)((g[3]))) >> 8);
  ((k + 24) + 4)[3] = (u8)(((u32)((g[3]))));
  ;
  ;
  ((k + 32))[0] = (u8)(((u32)((g[4]) >> 32)) >> 24);
  ((k + 32))[1] = (u8)(((u32)((g[4]) >> 32)) >> 16);
  ((k + 32))[2] = (u8)(((u32)((g[4]) >> 32)) >> 8);
  ((k + 32))[3] = (u8)(((u32)((g[4]) >> 32)));
  ;
  ((k + 32) + 4)[0] = (u8)(((u32)((g[4]))) >> 24);
  ((k + 32) + 4)[1] = (u8)(((u32)((g[4]))) >> 16);
  ((k + 32) + 4)[2] = (u8)(((u32)((g[4]))) >> 8);
  ((k + 32) + 4)[3] = (u8)(((u32)((g[4]))));
  ;
  ;
  ((k + 40))[0] = (u8)(((u32)((g[5]) >> 32)) >> 24);
  ((k + 40))[1] = (u8)(((u32)((g[5]) >> 32)) >> 16);
  ((k + 40))[2] = (u8)(((u32)((g[5]) >> 32)) >> 8);
  ((k + 40))[3] = (u8)(((u32)((g[5]) >> 32)));
  ;
  ((k + 40) + 4)[0] = (u8)(((u32)((g[5]))) >> 24);
  ((k + 40) + 4)[1] = (u8)(((u32)((g[5]))) >> 16);
  ((k + 40) + 4)[2] = (u8)(((u32)((g[5]))) >> 8);
  ((k + 40) + 4)[3] = (u8)(((u32)((g[5]))));
  ;
  ;
  ((k + 48))[0] = (u8)(((u32)((g[6]) >> 32)) >> 24);
  ((k + 48))[1] = (u8)(((u32)((g[6]) >> 32)) >> 16);
  ((k + 48))[2] = (u8)(((u32)((g[6]) >> 32)) >> 8);
  ((k + 48))[3] = (u8)(((u32)((g[6]) >> 32)));
  ;
  ((k + 48) + 4)[0] = (u8)(((u32)((g[6]))) >> 24);
  ((k + 48) + 4)[1] = (u8)(((u32)((g[6]))) >> 16);
  ((k + 48) + 4)[2] = (u8)(((u32)((g[6]))) >> 8);
  ((k + 48) + 4)[3] = (u8)(((u32)((g[6]))));
  ;
  ;
  ((k + 56))[0] = (u8)(((u32)((g[7]) >> 32)) >> 24);
  ((k + 56))[1] = (u8)(((u32)((g[7]) >> 32)) >> 16);
  ((k + 56))[2] = (u8)(((u32)((g[7]) >> 32)) >> 8);
  ((k + 56))[3] = (u8)(((u32)((g[7]) >> 32)));
  ;
  ((k + 56) + 4)[0] = (u8)(((u32)((g[7]))) >> 24);
  ((k + 56) + 4)[1] = (u8)(((u32)((g[7]))) >> 16);
  ((k + 56) + 4)[2] = (u8)(((u32)((g[7]))) >> 8);
  ((k + 56) + 4)[3] = (u8)(((u32)((g[7]))));
  ;
  ;

  u8_v* l = k + 64;

  l[0] = k[15] ^ k[1];
  if (l[1 - 1] & 0x80)
    l[1] = d[(1 + l[1 - 1]) & 0x7F] ^ k[1 + 1];
  else
    l[1] = k[(1 + l[1 - 1]) & 0x3F] ^ k[1 + 1];
  ;
  if (l[2 - 1] & 0x80)
    l[2] = d[(2 + l[2 - 1]) & 0x7F] ^ k[2 + 1];
  else
    l[2] = k[(2 + l[2 - 1]) & 0x3F] ^ k[2 + 1];
  ;
  if (l[3 - 1] & 0x80)
    l[3] = d[(3 + l[3 - 1]) & 0x7F] ^ k[3 + 1];
  else
    l[3] = k[(3 + l[3 - 1]) & 0x3F] ^ k[3 + 1];
  ;
  u32 m = ((u32)l[3]) << 24;
  for (uint n = 4; n < 320; n += 4) {
    if (m & 0x80000000)
      m = d[(n + (m >> 24)) & 0x7F] ^ k[(n + 1) & 0x3F];
    else
      m = k[(n + (m >> 24)) & 0x3F] ^ k[(n + 1) & 0x3F];
    if (m & 0x00000080)
      m += ((u32)(d[(n + 1 + m) & 0x7F] ^ k[(n + 2) & 0x3F])) << 8;
    else
      m += ((u32)(k[(n + 1 + m) & 0x3F] ^ k[(n + 2) & 0x3F])) << 8;
    if (m & 0x00008000)
      m += ((u32)(d[(n + 2 + (m >> 8)) & 0x7F] ^ k[(n + 3) & 0x3F])) << 16;
    else
      m += ((u32)(k[(n + 2 + (m >> 8)) & 0x3F] ^ k[(n + 3) & 0x3F])) << 16;
    if (m & 0x00800000)
      m += ((u32)(d[(n + 3 + (m >> 16)) & 0x7F] ^ k[(n + 4) & 0x3F])) << 24;
    else
      m += ((u32)(k[(n + 3 + (m >> 16)) & 0x3F] ^ k[(n + 4) & 0x3F])) << 24;
    *(u32*)(l + n) = m;
  }
  l[319] ^= k[0];

  u16* o = (u16*)(l + 310);
  u64 p = o[0];
  p |= ((u64)o[3]) << 48;
  u32* q = (u32*)(l + 312);
  p |= ((u64)*q) << 16;

  u32 r = (((u8)c[(p + l[300]) & 0x3FFFFF]) >> 3) + 512;
  for (u32 n = 1; n < r; ++n) {
    p += c[p & 0x3FFFFF];

    if (p & 0x87878700)
      ++l[p % 320];

    p -= (u8)c[(p + l[p % 160]) & 0x3FFFFF];

    if (p & 0x80000000)
      p += (u8)c[p & 0xFFFF];
    else
      p += c[p & 0x20FAFB];

    p += c[(p + l[p % 160]) & 0x3FFFFF];

    if (p & 0xF0000000)
      ++l[p % 320];

    p += c[((u32)l[(u8)p] + (((u32)l[((u8)p) + 1]) << 8) + (((u32)l[((u8)p) + 2] & 0x3F) << 16))];
    l[n % 320] = k[n & 63] ^ ((u8)p);
    p += c[((p >> 32) + l[n % 200]) & 0x3FFFFF];

    u32 s = (p % 316) & 0x1FC;
    if (s & 4) {
      *(u32*)(l + s) ^= ((p >> 24) & 0xFFFFFFFFUL) << ((p & 3) * 8);
      if ((p & 3) != 0)
        *(u32*)(l + s + 4) ^= (((p >> 24) & 0xFFFFFFFFUL) >> (32 - (p & 3) * 8));
    } else {
      *(u64*)(l + s) ^= ((p >> 24) & 0xFFFFFFFFUL) << ((p & 3) * 8);
    }
    if ((p & 7) == 3)
      ++n;
    p -= (u8)c[n * n];
    if ((p & 7) == 1)
      ++n;
  }

  u32 t[8] = {0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a, 0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19};
  C(t, d);
  C(t, d + 64);
  C(t, d + 128);
  C(t, d + 192);
  C(t, d + 256);
  C(t, d + 320);
  C(t, d + 384);
  C(t, d + 448);
  D(t);

  if ((t[7] & 0x80FFFF) == 0) {
    b[f & 0xFF] = f;
  }
}