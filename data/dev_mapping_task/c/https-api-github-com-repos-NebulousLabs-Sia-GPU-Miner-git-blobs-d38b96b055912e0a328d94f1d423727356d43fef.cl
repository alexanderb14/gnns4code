inline ulong A(__const ulong a, __const unsigned b) {
  return (a >> b) | (a << (64 - b));
}

__constant const uchar Ga[12][16] = {{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, {14, 10, 4, 8, 9, 15, 13, 6, 1, 12, 0, 2, 11, 7, 5, 3}, {11, 8, 12, 0, 5, 2, 15, 13, 10, 14, 3, 6, 7, 1, 9, 4}, {7, 9, 3, 1, 13, 12, 11, 14, 2, 6, 5, 10, 4, 0, 15, 8}, {9, 0, 5, 7, 2, 4, 10, 15, 14, 1, 11, 12, 6, 8, 3, 13}, {2, 12, 6, 10, 0, 11, 8, 3, 4, 13, 7, 5, 15, 14, 1, 9},
                                     {12, 5, 1, 15, 14, 13, 4, 10, 0, 7, 6, 3, 9, 2, 8, 11}, {13, 11, 7, 14, 12, 1, 3, 9, 5, 0, 15, 4, 8, 6, 2, 10}, {6, 15, 14, 9, 11, 3, 0, 8, 12, 2, 13, 7, 1, 4, 10, 5}, {10, 2, 8, 4, 7, 6, 1, 5, 15, 11, 9, 14, 3, 12, 13, 0}, {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, {14, 10, 4, 8, 9, 15, 13, 6, 1, 12, 0, 2, 11, 7, 5, 3}};

__kernel void B(__global ulong* a, __global ulong* b) {
  ulong c = a[4];
  ulong d[16] = {a a(ulong) get_global_id(0), a a a 0, 0, 0, 0, 0};

  ulong e[16] = {0x6a09e667f2bdc928, 0xbb67ae8584caa73b, 0x3c6ef372fe94f82b, 0xa54ff53a5f1d36f1, 0x510e527fade682d1, 0x9b05688c2b3e6c1f, 0x1f83d9abfb41bd6b, 0x5be0cd19137e2179, 0x6a09e667f3bcc908, 0xbb67ae8584caa73b, 0x3c6ef372fe94f82b, 0xa54ff53a5f1d36f1, 0x510e527fade68281, 0x9b05688c2b3e6c1f, 0xe07c265404be4294, 0x5be0cd19137e2179};
  e[0] = e[0] + e[4] + d[Ga[0][2 * 0]];
  e[12] = A(e[12] ^ e[0], 32);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 24);
  e[0] = e[0] + e[4] + d[Ga[0][2 * 0 + 1]];
  e[12] = A(e[12] ^ e[0], 16);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 63);
  ;
  e[1] = e[1] + e[5] + d[Ga[0][2 * 1]];
  e[13] = A(e[13] ^ e[1], 32);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 24);
  e[1] = e[1] + e[5] + d[Ga[0][2 * 1 + 1]];
  e[13] = A(e[13] ^ e[1], 16);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 63);
  ;
  e[2] = e[2] + e[6] + d[Ga[0][2 * 2]];
  e[14] = A(e[14] ^ e[2], 32);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 24);
  e[2] = e[2] + e[6] + d[Ga[0][2 * 2 + 1]];
  e[14] = A(e[14] ^ e[2], 16);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 63);
  ;
  e[3] = e[3] + e[7] + d[Ga[0][2 * 3]];
  e[15] = A(e[15] ^ e[3], 32);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 24);
  e[3] = e[3] + e[7] + d[Ga[0][2 * 3 + 1]];
  e[15] = A(e[15] ^ e[3], 16);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 63);
  ;
  e[0] = e[0] + e[5] + d[Ga[0][2 * 4]];
  e[15] = A(e[15] ^ e[0], 32);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 24);
  e[0] = e[0] + e[5] + d[Ga[0][2 * 4 + 1]];
  e[15] = A(e[15] ^ e[0], 16);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 63);
  ;
  e[1] = e[1] + e[6] + d[Ga[0][2 * 5]];
  e[12] = A(e[12] ^ e[1], 32);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 24);
  e[1] = e[1] + e[6] + d[Ga[0][2 * 5 + 1]];
  e[12] = A(e[12] ^ e[1], 16);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 63);
  ;
  e[2] = e[2] + e[7] + d[Ga[0][2 * 6]];
  e[13] = A(e[13] ^ e[2], 32);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 24);
  e[2] = e[2] + e[7] + d[Ga[0][2 * 6 + 1]];
  e[13] = A(e[13] ^ e[2], 16);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 63);
  ;
  e[3] = e[3] + e[4] + d[Ga[0][2 * 7]];
  e[14] = A(e[14] ^ e[3], 32);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 24);
  e[3] = e[3] + e[4] + d[Ga[0][2 * 7 + 1]];
  e[14] = A(e[14] ^ e[3], 16);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 63);
  ;
  ;
  e[0] = e[0] + e[4] + d[Ga[1][2 * 0]];
  e[12] = A(e[12] ^ e[0], 32);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 24);
  e[0] = e[0] + e[4] + d[Ga[1][2 * 0 + 1]];
  e[12] = A(e[12] ^ e[0], 16);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 63);
  ;
  e[1] = e[1] + e[5] + d[Ga[1][2 * 1]];
  e[13] = A(e[13] ^ e[1], 32);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 24);
  e[1] = e[1] + e[5] + d[Ga[1][2 * 1 + 1]];
  e[13] = A(e[13] ^ e[1], 16);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 63);
  ;
  e[2] = e[2] + e[6] + d[Ga[1][2 * 2]];
  e[14] = A(e[14] ^ e[2], 32);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 24);
  e[2] = e[2] + e[6] + d[Ga[1][2 * 2 + 1]];
  e[14] = A(e[14] ^ e[2], 16);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 63);
  ;
  e[3] = e[3] + e[7] + d[Ga[1][2 * 3]];
  e[15] = A(e[15] ^ e[3], 32);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 24);
  e[3] = e[3] + e[7] + d[Ga[1][2 * 3 + 1]];
  e[15] = A(e[15] ^ e[3], 16);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 63);
  ;
  e[0] = e[0] + e[5] + d[Ga[1][2 * 4]];
  e[15] = A(e[15] ^ e[0], 32);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 24);
  e[0] = e[0] + e[5] + d[Ga[1][2 * 4 + 1]];
  e[15] = A(e[15] ^ e[0], 16);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 63);
  ;
  e[1] = e[1] + e[6] + d[Ga[1][2 * 5]];
  e[12] = A(e[12] ^ e[1], 32);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 24);
  e[1] = e[1] + e[6] + d[Ga[1][2 * 5 + 1]];
  e[12] = A(e[12] ^ e[1], 16);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 63);
  ;
  e[2] = e[2] + e[7] + d[Ga[1][2 * 6]];
  e[13] = A(e[13] ^ e[2], 32);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 24);
  e[2] = e[2] + e[7] + d[Ga[1][2 * 6 + 1]];
  e[13] = A(e[13] ^ e[2], 16);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 63);
  ;
  e[3] = e[3] + e[4] + d[Ga[1][2 * 7]];
  e[14] = A(e[14] ^ e[3], 32);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 24);
  e[3] = e[3] + e[4] + d[Ga[1][2 * 7 + 1]];
  e[14] = A(e[14] ^ e[3], 16);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 63);
  ;
  ;
  e[0] = e[0] + e[4] + d[Ga[2][2 * 0]];
  e[12] = A(e[12] ^ e[0], 32);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 24);
  e[0] = e[0] + e[4] + d[Ga[2][2 * 0 + 1]];
  e[12] = A(e[12] ^ e[0], 16);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 63);
  ;
  e[1] = e[1] + e[5] + d[Ga[2][2 * 1]];
  e[13] = A(e[13] ^ e[1], 32);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 24);
  e[1] = e[1] + e[5] + d[Ga[2][2 * 1 + 1]];
  e[13] = A(e[13] ^ e[1], 16);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 63);
  ;
  e[2] = e[2] + e[6] + d[Ga[2][2 * 2]];
  e[14] = A(e[14] ^ e[2], 32);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 24);
  e[2] = e[2] + e[6] + d[Ga[2][2 * 2 + 1]];
  e[14] = A(e[14] ^ e[2], 16);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 63);
  ;
  e[3] = e[3] + e[7] + d[Ga[2][2 * 3]];
  e[15] = A(e[15] ^ e[3], 32);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 24);
  e[3] = e[3] + e[7] + d[Ga[2][2 * 3 + 1]];
  e[15] = A(e[15] ^ e[3], 16);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 63);
  ;
  e[0] = e[0] + e[5] + d[Ga[2][2 * 4]];
  e[15] = A(e[15] ^ e[0], 32);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 24);
  e[0] = e[0] + e[5] + d[Ga[2][2 * 4 + 1]];
  e[15] = A(e[15] ^ e[0], 16);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 63);
  ;
  e[1] = e[1] + e[6] + d[Ga[2][2 * 5]];
  e[12] = A(e[12] ^ e[1], 32);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 24);
  e[1] = e[1] + e[6] + d[Ga[2][2 * 5 + 1]];
  e[12] = A(e[12] ^ e[1], 16);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 63);
  ;
  e[2] = e[2] + e[7] + d[Ga[2][2 * 6]];
  e[13] = A(e[13] ^ e[2], 32);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 24);
  e[2] = e[2] + e[7] + d[Ga[2][2 * 6 + 1]];
  e[13] = A(e[13] ^ e[2], 16);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 63);
  ;
  e[3] = e[3] + e[4] + d[Ga[2][2 * 7]];
  e[14] = A(e[14] ^ e[3], 32);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 24);
  e[3] = e[3] + e[4] + d[Ga[2][2 * 7 + 1]];
  e[14] = A(e[14] ^ e[3], 16);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 63);
  ;
  ;
  e[0] = e[0] + e[4] + d[Ga[3][2 * 0]];
  e[12] = A(e[12] ^ e[0], 32);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 24);
  e[0] = e[0] + e[4] + d[Ga[3][2 * 0 + 1]];
  e[12] = A(e[12] ^ e[0], 16);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 63);
  ;
  e[1] = e[1] + e[5] + d[Ga[3][2 * 1]];
  e[13] = A(e[13] ^ e[1], 32);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 24);
  e[1] = e[1] + e[5] + d[Ga[3][2 * 1 + 1]];
  e[13] = A(e[13] ^ e[1], 16);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 63);
  ;
  e[2] = e[2] + e[6] + d[Ga[3][2 * 2]];
  e[14] = A(e[14] ^ e[2], 32);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 24);
  e[2] = e[2] + e[6] + d[Ga[3][2 * 2 + 1]];
  e[14] = A(e[14] ^ e[2], 16);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 63);
  ;
  e[3] = e[3] + e[7] + d[Ga[3][2 * 3]];
  e[15] = A(e[15] ^ e[3], 32);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 24);
  e[3] = e[3] + e[7] + d[Ga[3][2 * 3 + 1]];
  e[15] = A(e[15] ^ e[3], 16);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 63);
  ;
  e[0] = e[0] + e[5] + d[Ga[3][2 * 4]];
  e[15] = A(e[15] ^ e[0], 32);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 24);
  e[0] = e[0] + e[5] + d[Ga[3][2 * 4 + 1]];
  e[15] = A(e[15] ^ e[0], 16);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 63);
  ;
  e[1] = e[1] + e[6] + d[Ga[3][2 * 5]];
  e[12] = A(e[12] ^ e[1], 32);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 24);
  e[1] = e[1] + e[6] + d[Ga[3][2 * 5 + 1]];
  e[12] = A(e[12] ^ e[1], 16);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 63);
  ;
  e[2] = e[2] + e[7] + d[Ga[3][2 * 6]];
  e[13] = A(e[13] ^ e[2], 32);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 24);
  e[2] = e[2] + e[7] + d[Ga[3][2 * 6 + 1]];
  e[13] = A(e[13] ^ e[2], 16);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 63);
  ;
  e[3] = e[3] + e[4] + d[Ga[3][2 * 7]];
  e[14] = A(e[14] ^ e[3], 32);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 24);
  e[3] = e[3] + e[4] + d[Ga[3][2 * 7 + 1]];
  e[14] = A(e[14] ^ e[3], 16);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 63);
  ;
  ;
  e[0] = e[0] + e[4] + d[Ga[4][2 * 0]];
  e[12] = A(e[12] ^ e[0], 32);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 24);
  e[0] = e[0] + e[4] + d[Ga[4][2 * 0 + 1]];
  e[12] = A(e[12] ^ e[0], 16);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 63);
  ;
  e[1] = e[1] + e[5] + d[Ga[4][2 * 1]];
  e[13] = A(e[13] ^ e[1], 32);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 24);
  e[1] = e[1] + e[5] + d[Ga[4][2 * 1 + 1]];
  e[13] = A(e[13] ^ e[1], 16);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 63);
  ;
  e[2] = e[2] + e[6] + d[Ga[4][2 * 2]];
  e[14] = A(e[14] ^ e[2], 32);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 24);
  e[2] = e[2] + e[6] + d[Ga[4][2 * 2 + 1]];
  e[14] = A(e[14] ^ e[2], 16);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 63);
  ;
  e[3] = e[3] + e[7] + d[Ga[4][2 * 3]];
  e[15] = A(e[15] ^ e[3], 32);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 24);
  e[3] = e[3] + e[7] + d[Ga[4][2 * 3 + 1]];
  e[15] = A(e[15] ^ e[3], 16);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 63);
  ;
  e[0] = e[0] + e[5] + d[Ga[4][2 * 4]];
  e[15] = A(e[15] ^ e[0], 32);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 24);
  e[0] = e[0] + e[5] + d[Ga[4][2 * 4 + 1]];
  e[15] = A(e[15] ^ e[0], 16);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 63);
  ;
  e[1] = e[1] + e[6] + d[Ga[4][2 * 5]];
  e[12] = A(e[12] ^ e[1], 32);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 24);
  e[1] = e[1] + e[6] + d[Ga[4][2 * 5 + 1]];
  e[12] = A(e[12] ^ e[1], 16);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 63);
  ;
  e[2] = e[2] + e[7] + d[Ga[4][2 * 6]];
  e[13] = A(e[13] ^ e[2], 32);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 24);
  e[2] = e[2] + e[7] + d[Ga[4][2 * 6 + 1]];
  e[13] = A(e[13] ^ e[2], 16);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 63);
  ;
  e[3] = e[3] + e[4] + d[Ga[4][2 * 7]];
  e[14] = A(e[14] ^ e[3], 32);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 24);
  e[3] = e[3] + e[4] + d[Ga[4][2 * 7 + 1]];
  e[14] = A(e[14] ^ e[3], 16);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 63);
  ;
  ;
  e[0] = e[0] + e[4] + d[Ga[5][2 * 0]];
  e[12] = A(e[12] ^ e[0], 32);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 24);
  e[0] = e[0] + e[4] + d[Ga[5][2 * 0 + 1]];
  e[12] = A(e[12] ^ e[0], 16);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 63);
  ;
  e[1] = e[1] + e[5] + d[Ga[5][2 * 1]];
  e[13] = A(e[13] ^ e[1], 32);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 24);
  e[1] = e[1] + e[5] + d[Ga[5][2 * 1 + 1]];
  e[13] = A(e[13] ^ e[1], 16);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 63);
  ;
  e[2] = e[2] + e[6] + d[Ga[5][2 * 2]];
  e[14] = A(e[14] ^ e[2], 32);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 24);
  e[2] = e[2] + e[6] + d[Ga[5][2 * 2 + 1]];
  e[14] = A(e[14] ^ e[2], 16);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 63);
  ;
  e[3] = e[3] + e[7] + d[Ga[5][2 * 3]];
  e[15] = A(e[15] ^ e[3], 32);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 24);
  e[3] = e[3] + e[7] + d[Ga[5][2 * 3 + 1]];
  e[15] = A(e[15] ^ e[3], 16);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 63);
  ;
  e[0] = e[0] + e[5] + d[Ga[5][2 * 4]];
  e[15] = A(e[15] ^ e[0], 32);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 24);
  e[0] = e[0] + e[5] + d[Ga[5][2 * 4 + 1]];
  e[15] = A(e[15] ^ e[0], 16);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 63);
  ;
  e[1] = e[1] + e[6] + d[Ga[5][2 * 5]];
  e[12] = A(e[12] ^ e[1], 32);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 24);
  e[1] = e[1] + e[6] + d[Ga[5][2 * 5 + 1]];
  e[12] = A(e[12] ^ e[1], 16);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 63);
  ;
  e[2] = e[2] + e[7] + d[Ga[5][2 * 6]];
  e[13] = A(e[13] ^ e[2], 32);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 24);
  e[2] = e[2] + e[7] + d[Ga[5][2 * 6 + 1]];
  e[13] = A(e[13] ^ e[2], 16);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 63);
  ;
  e[3] = e[3] + e[4] + d[Ga[5][2 * 7]];
  e[14] = A(e[14] ^ e[3], 32);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 24);
  e[3] = e[3] + e[4] + d[Ga[5][2 * 7 + 1]];
  e[14] = A(e[14] ^ e[3], 16);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 63);
  ;
  ;
  e[0] = e[0] + e[4] + d[Ga[6][2 * 0]];
  e[12] = A(e[12] ^ e[0], 32);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 24);
  e[0] = e[0] + e[4] + d[Ga[6][2 * 0 + 1]];
  e[12] = A(e[12] ^ e[0], 16);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 63);
  ;
  e[1] = e[1] + e[5] + d[Ga[6][2 * 1]];
  e[13] = A(e[13] ^ e[1], 32);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 24);
  e[1] = e[1] + e[5] + d[Ga[6][2 * 1 + 1]];
  e[13] = A(e[13] ^ e[1], 16);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 63);
  ;
  e[2] = e[2] + e[6] + d[Ga[6][2 * 2]];
  e[14] = A(e[14] ^ e[2], 32);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 24);
  e[2] = e[2] + e[6] + d[Ga[6][2 * 2 + 1]];
  e[14] = A(e[14] ^ e[2], 16);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 63);
  ;
  e[3] = e[3] + e[7] + d[Ga[6][2 * 3]];
  e[15] = A(e[15] ^ e[3], 32);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 24);
  e[3] = e[3] + e[7] + d[Ga[6][2 * 3 + 1]];
  e[15] = A(e[15] ^ e[3], 16);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 63);
  ;
  e[0] = e[0] + e[5] + d[Ga[6][2 * 4]];
  e[15] = A(e[15] ^ e[0], 32);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 24);
  e[0] = e[0] + e[5] + d[Ga[6][2 * 4 + 1]];
  e[15] = A(e[15] ^ e[0], 16);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 63);
  ;
  e[1] = e[1] + e[6] + d[Ga[6][2 * 5]];
  e[12] = A(e[12] ^ e[1], 32);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 24);
  e[1] = e[1] + e[6] + d[Ga[6][2 * 5 + 1]];
  e[12] = A(e[12] ^ e[1], 16);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 63);
  ;
  e[2] = e[2] + e[7] + d[Ga[6][2 * 6]];
  e[13] = A(e[13] ^ e[2], 32);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 24);
  e[2] = e[2] + e[7] + d[Ga[6][2 * 6 + 1]];
  e[13] = A(e[13] ^ e[2], 16);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 63);
  ;
  e[3] = e[3] + e[4] + d[Ga[6][2 * 7]];
  e[14] = A(e[14] ^ e[3], 32);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 24);
  e[3] = e[3] + e[4] + d[Ga[6][2 * 7 + 1]];
  e[14] = A(e[14] ^ e[3], 16);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 63);
  ;
  ;
  e[0] = e[0] + e[4] + d[Ga[7][2 * 0]];
  e[12] = A(e[12] ^ e[0], 32);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 24);
  e[0] = e[0] + e[4] + d[Ga[7][2 * 0 + 1]];
  e[12] = A(e[12] ^ e[0], 16);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 63);
  ;
  e[1] = e[1] + e[5] + d[Ga[7][2 * 1]];
  e[13] = A(e[13] ^ e[1], 32);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 24);
  e[1] = e[1] + e[5] + d[Ga[7][2 * 1 + 1]];
  e[13] = A(e[13] ^ e[1], 16);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 63);
  ;
  e[2] = e[2] + e[6] + d[Ga[7][2 * 2]];
  e[14] = A(e[14] ^ e[2], 32);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 24);
  e[2] = e[2] + e[6] + d[Ga[7][2 * 2 + 1]];
  e[14] = A(e[14] ^ e[2], 16);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 63);
  ;
  e[3] = e[3] + e[7] + d[Ga[7][2 * 3]];
  e[15] = A(e[15] ^ e[3], 32);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 24);
  e[3] = e[3] + e[7] + d[Ga[7][2 * 3 + 1]];
  e[15] = A(e[15] ^ e[3], 16);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 63);
  ;
  e[0] = e[0] + e[5] + d[Ga[7][2 * 4]];
  e[15] = A(e[15] ^ e[0], 32);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 24);
  e[0] = e[0] + e[5] + d[Ga[7][2 * 4 + 1]];
  e[15] = A(e[15] ^ e[0], 16);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 63);
  ;
  e[1] = e[1] + e[6] + d[Ga[7][2 * 5]];
  e[12] = A(e[12] ^ e[1], 32);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 24);
  e[1] = e[1] + e[6] + d[Ga[7][2 * 5 + 1]];
  e[12] = A(e[12] ^ e[1], 16);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 63);
  ;
  e[2] = e[2] + e[7] + d[Ga[7][2 * 6]];
  e[13] = A(e[13] ^ e[2], 32);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 24);
  e[2] = e[2] + e[7] + d[Ga[7][2 * 6 + 1]];
  e[13] = A(e[13] ^ e[2], 16);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 63);
  ;
  e[3] = e[3] + e[4] + d[Ga[7][2 * 7]];
  e[14] = A(e[14] ^ e[3], 32);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 24);
  e[3] = e[3] + e[4] + d[Ga[7][2 * 7 + 1]];
  e[14] = A(e[14] ^ e[3], 16);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 63);
  ;
  ;
  e[0] = e[0] + e[4] + d[Ga[8][2 * 0]];
  e[12] = A(e[12] ^ e[0], 32);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 24);
  e[0] = e[0] + e[4] + d[Ga[8][2 * 0 + 1]];
  e[12] = A(e[12] ^ e[0], 16);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 63);
  ;
  e[1] = e[1] + e[5] + d[Ga[8][2 * 1]];
  e[13] = A(e[13] ^ e[1], 32);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 24);
  e[1] = e[1] + e[5] + d[Ga[8][2 * 1 + 1]];
  e[13] = A(e[13] ^ e[1], 16);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 63);
  ;
  e[2] = e[2] + e[6] + d[Ga[8][2 * 2]];
  e[14] = A(e[14] ^ e[2], 32);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 24);
  e[2] = e[2] + e[6] + d[Ga[8][2 * 2 + 1]];
  e[14] = A(e[14] ^ e[2], 16);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 63);
  ;
  e[3] = e[3] + e[7] + d[Ga[8][2 * 3]];
  e[15] = A(e[15] ^ e[3], 32);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 24);
  e[3] = e[3] + e[7] + d[Ga[8][2 * 3 + 1]];
  e[15] = A(e[15] ^ e[3], 16);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 63);
  ;
  e[0] = e[0] + e[5] + d[Ga[8][2 * 4]];
  e[15] = A(e[15] ^ e[0], 32);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 24);
  e[0] = e[0] + e[5] + d[Ga[8][2 * 4 + 1]];
  e[15] = A(e[15] ^ e[0], 16);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 63);
  ;
  e[1] = e[1] + e[6] + d[Ga[8][2 * 5]];
  e[12] = A(e[12] ^ e[1], 32);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 24);
  e[1] = e[1] + e[6] + d[Ga[8][2 * 5 + 1]];
  e[12] = A(e[12] ^ e[1], 16);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 63);
  ;
  e[2] = e[2] + e[7] + d[Ga[8][2 * 6]];
  e[13] = A(e[13] ^ e[2], 32);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 24);
  e[2] = e[2] + e[7] + d[Ga[8][2 * 6 + 1]];
  e[13] = A(e[13] ^ e[2], 16);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 63);
  ;
  e[3] = e[3] + e[4] + d[Ga[8][2 * 7]];
  e[14] = A(e[14] ^ e[3], 32);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 24);
  e[3] = e[3] + e[4] + d[Ga[8][2 * 7 + 1]];
  e[14] = A(e[14] ^ e[3], 16);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 63);
  ;
  ;
  e[0] = e[0] + e[4] + d[Ga[9][2 * 0]];
  e[12] = A(e[12] ^ e[0], 32);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 24);
  e[0] = e[0] + e[4] + d[Ga[9][2 * 0 + 1]];
  e[12] = A(e[12] ^ e[0], 16);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 63);
  ;
  e[1] = e[1] + e[5] + d[Ga[9][2 * 1]];
  e[13] = A(e[13] ^ e[1], 32);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 24);
  e[1] = e[1] + e[5] + d[Ga[9][2 * 1 + 1]];
  e[13] = A(e[13] ^ e[1], 16);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 63);
  ;
  e[2] = e[2] + e[6] + d[Ga[9][2 * 2]];
  e[14] = A(e[14] ^ e[2], 32);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 24);
  e[2] = e[2] + e[6] + d[Ga[9][2 * 2 + 1]];
  e[14] = A(e[14] ^ e[2], 16);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 63);
  ;
  e[3] = e[3] + e[7] + d[Ga[9][2 * 3]];
  e[15] = A(e[15] ^ e[3], 32);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 24);
  e[3] = e[3] + e[7] + d[Ga[9][2 * 3 + 1]];
  e[15] = A(e[15] ^ e[3], 16);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 63);
  ;
  e[0] = e[0] + e[5] + d[Ga[9][2 * 4]];
  e[15] = A(e[15] ^ e[0], 32);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 24);
  e[0] = e[0] + e[5] + d[Ga[9][2 * 4 + 1]];
  e[15] = A(e[15] ^ e[0], 16);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 63);
  ;
  e[1] = e[1] + e[6] + d[Ga[9][2 * 5]];
  e[12] = A(e[12] ^ e[1], 32);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 24);
  e[1] = e[1] + e[6] + d[Ga[9][2 * 5 + 1]];
  e[12] = A(e[12] ^ e[1], 16);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 63);
  ;
  e[2] = e[2] + e[7] + d[Ga[9][2 * 6]];
  e[13] = A(e[13] ^ e[2], 32);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 24);
  e[2] = e[2] + e[7] + d[Ga[9][2 * 6 + 1]];
  e[13] = A(e[13] ^ e[2], 16);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 63);
  ;
  e[3] = e[3] + e[4] + d[Ga[9][2 * 7]];
  e[14] = A(e[14] ^ e[3], 32);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 24);
  e[3] = e[3] + e[4] + d[Ga[9][2 * 7 + 1]];
  e[14] = A(e[14] ^ e[3], 16);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 63);
  ;
  ;
  e[0] = e[0] + e[4] + d[Ga[10][2 * 0]];
  e[12] = A(e[12] ^ e[0], 32);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 24);
  e[0] = e[0] + e[4] + d[Ga[10][2 * 0 + 1]];
  e[12] = A(e[12] ^ e[0], 16);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 63);
  ;
  e[1] = e[1] + e[5] + d[Ga[10][2 * 1]];
  e[13] = A(e[13] ^ e[1], 32);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 24);
  e[1] = e[1] + e[5] + d[Ga[10][2 * 1 + 1]];
  e[13] = A(e[13] ^ e[1], 16);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 63);
  ;
  e[2] = e[2] + e[6] + d[Ga[10][2 * 2]];
  e[14] = A(e[14] ^ e[2], 32);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 24);
  e[2] = e[2] + e[6] + d[Ga[10][2 * 2 + 1]];
  e[14] = A(e[14] ^ e[2], 16);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 63);
  ;
  e[3] = e[3] + e[7] + d[Ga[10][2 * 3]];
  e[15] = A(e[15] ^ e[3], 32);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 24);
  e[3] = e[3] + e[7] + d[Ga[10][2 * 3 + 1]];
  e[15] = A(e[15] ^ e[3], 16);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 63);
  ;
  e[0] = e[0] + e[5] + d[Ga[10][2 * 4]];
  e[15] = A(e[15] ^ e[0], 32);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 24);
  e[0] = e[0] + e[5] + d[Ga[10][2 * 4 + 1]];
  e[15] = A(e[15] ^ e[0], 16);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 63);
  ;
  e[1] = e[1] + e[6] + d[Ga[10][2 * 5]];
  e[12] = A(e[12] ^ e[1], 32);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 24);
  e[1] = e[1] + e[6] + d[Ga[10][2 * 5 + 1]];
  e[12] = A(e[12] ^ e[1], 16);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 63);
  ;
  e[2] = e[2] + e[7] + d[Ga[10][2 * 6]];
  e[13] = A(e[13] ^ e[2], 32);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 24);
  e[2] = e[2] + e[7] + d[Ga[10][2 * 6 + 1]];
  e[13] = A(e[13] ^ e[2], 16);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 63);
  ;
  e[3] = e[3] + e[4] + d[Ga[10][2 * 7]];
  e[14] = A(e[14] ^ e[3], 32);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 24);
  e[3] = e[3] + e[4] + d[Ga[10][2 * 7 + 1]];
  e[14] = A(e[14] ^ e[3], 16);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 63);
  ;
  ;
  e[0] = e[0] + e[4] + d[Ga[11][2 * 0]];
  e[12] = A(e[12] ^ e[0], 32);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 24);
  e[0] = e[0] + e[4] + d[Ga[11][2 * 0 + 1]];
  e[12] = A(e[12] ^ e[0], 16);
  e[8] = e[8] + e[12];
  e[4] = A(e[4] ^ e[8], 63);
  ;
  e[1] = e[1] + e[5] + d[Ga[11][2 * 1]];
  e[13] = A(e[13] ^ e[1], 32);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 24);
  e[1] = e[1] + e[5] + d[Ga[11][2 * 1 + 1]];
  e[13] = A(e[13] ^ e[1], 16);
  e[9] = e[9] + e[13];
  e[5] = A(e[5] ^ e[9], 63);
  ;
  e[2] = e[2] + e[6] + d[Ga[11][2 * 2]];
  e[14] = A(e[14] ^ e[2], 32);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 24);
  e[2] = e[2] + e[6] + d[Ga[11][2 * 2 + 1]];
  e[14] = A(e[14] ^ e[2], 16);
  e[10] = e[10] + e[14];
  e[6] = A(e[6] ^ e[10], 63);
  ;
  e[3] = e[3] + e[7] + d[Ga[11][2 * 3]];
  e[15] = A(e[15] ^ e[3], 32);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 24);
  e[3] = e[3] + e[7] + d[Ga[11][2 * 3 + 1]];
  e[15] = A(e[15] ^ e[3], 16);
  e[11] = e[11] + e[15];
  e[7] = A(e[7] ^ e[11], 63);
  ;
  e[0] = e[0] + e[5] + d[Ga[11][2 * 4]];
  e[15] = A(e[15] ^ e[0], 32);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 24);
  e[0] = e[0] + e[5] + d[Ga[11][2 * 4 + 1]];
  e[15] = A(e[15] ^ e[0], 16);
  e[10] = e[10] + e[15];
  e[5] = A(e[5] ^ e[10], 63);
  ;
  e[1] = e[1] + e[6] + d[Ga[11][2 * 5]];
  e[12] = A(e[12] ^ e[1], 32);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 24);
  e[1] = e[1] + e[6] + d[Ga[11][2 * 5 + 1]];
  e[12] = A(e[12] ^ e[1], 16);
  e[11] = e[11] + e[12];
  e[6] = A(e[6] ^ e[11], 63);
  ;
  e[2] = e[2] + e[7] + d[Ga[11][2 * 6]];
  e[13] = A(e[13] ^ e[2], 32);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 24);
  e[2] = e[2] + e[7] + d[Ga[11][2 * 6 + 1]];
  e[13] = A(e[13] ^ e[2], 16);
  e[8] = e[8] + e[13];
  e[7] = A(e[7] ^ e[8], 63);
  ;
  e[3] = e[3] + e[4] + d[Ga[11][2 * 7]];
  e[14] = A(e[14] ^ e[3], 32);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 24);
  e[3] = e[3] + e[4] + d[Ga[11][2 * 7 + 1]];
  e[14] = A(e[14] ^ e[3], 16);
  e[9] = e[9] + e[14];
  e[4] = A(e[4] ^ e[9], 63);
  ;
  ;

  if (__builtin_astype(__builtin_astype(0x6a09e667f2bdc928 ^ e[0] ^ e[8], uchar8).s76543210, ulong) < c) {
    *b = d[4];
    return;
  }
}