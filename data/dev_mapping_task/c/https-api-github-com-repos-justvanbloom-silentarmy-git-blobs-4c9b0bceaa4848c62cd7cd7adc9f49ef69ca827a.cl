typedef struct sols_s {
  uint nr;
  uint likely_invalids;
  uchar valid[10];
  uint values[10][(1 << 9)];
} sols_t;
__constant ulong Ga[] = {
    0x6a09e667f3bcc908, 0xbb67ae8584caa73b, 0x3c6ef372fe94f82b, 0xa54ff53a5f1d36f1, 0x510e527fade682d1, 0x9b05688c2b3e6c1f, 0x1f83d9abfb41bd6b, 0x5be0cd19137e2179,
};

__kernel void A(__global char* a) {
  uint b = get_global_id(0);
  *(__global uint*)(a + b * ((1 << (((200 / (9 + 1)) + 1) - 20)) * 9) * 32) = 0;
}
uint B(uint a, __global char* b, uint c, ulong d, ulong e, ulong f, ulong g) {
  uint h;
  __global char* i;
  uint j;
  if (!(a % 2))
    h = (d & 0xffff) | ((d & 0xf00000) >> 4);
  else
    h = ((d & 0xf0000) >> 0) | ((d & 0xf00) << 4) | ((d & 0xf00000) >> 12) | ((d & 0xf) << 4) | ((d & 0xf000) >> 12);

  d = (d >> 16) | (e << (64 - 16));
  e = (e >> 16) | (f << (64 - 16));
  f = (f >> 16) | (g << (64 - 16));
  i = b + h * ((1 << (((200 / (9 + 1)) + 1) - 20)) * 9) * 32;
  j = atomic_add((__global uint*)i, 1);
  if (j >= ((1 << (((200 / (9 + 1)) + 1) - 20)) * 9))
    return 1;
  i += j * 32 + (8 + ((a) / 2) * 4);

  *(__global uint*)(i - 4) = c;
  if (a == 0 || a == 1) {
    *(__global ulong*)(i + 0) = d;
    *(__global ulong*)(i + 8) = e;
    *(__global ulong*)(i + 16) = f;
  } else if (a == 2) {
    *(__global uint*)(i + 0) = d;
    *(__global ulong*)(i + 4) = (d >> 32) | (e << 32);
    *(__global ulong*)(i + 12) = (e >> 32) | (f << 32);
  } else if (a == 3) {
    *(__global uint*)(i + 0) = d;
    *(__global ulong*)(i + 4) = (d >> 32) | (e << 32);
    *(__global uint*)(i + 12) = (e >> 32);
  } else if (a == 4) {
    *(__global ulong*)(i + 0) = d;
    *(__global ulong*)(i + 8) = e;
  } else if (a == 5) {
    *(__global ulong*)(i + 0) = d;
    *(__global uint*)(i + 8) = e;
  } else if (a == 6 || a == 7) {
    *(__global uint*)(i + 0) = d;
    *(__global uint*)(i + 4) = (d >> 32);
  } else if (a == 8) {
    *(__global uint*)(i + 0) = d;
  }
  return 0;
}
__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void C(__global ulong* a, __global char* b, __global uint* c) {
  uint d = get_global_id(0);
  ulong e[16];
  uint f = (1 << (200 / (9 + 1))) / get_global_size(0);
  uint g = d * f;
  uint h = (d + 1) * f;
  uint i = 0;
  while (g < h) {
    ulong j = (ulong)g << 32;

    e[0] = a[0];
    e[1] = a[1];
    e[2] = a[2];
    e[3] = a[3];
    e[4] = a[4];
    e[5] = a[5];
    e[6] = a[6];
    e[7] = a[7];
    e[8] = Ga[0];
    e[9] = Ga[1];
    e[10] = Ga[2];
    e[11] = Ga[3];
    e[12] = Ga[4];
    e[13] = Ga[5];
    e[14] = Ga[6];
    e[15] = Ga[7];

    e[12] ^= 140 + 4;

    e[14] ^= (ulong)-1;

    e[0] = (e[0] + e[4] + 0);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 32);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 24);
    e[0] = (e[0] + e[4] + j);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 16);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[5] + 0);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 32);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 24);
    e[1] = (e[1] + e[5] + 0);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 16);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[6] + 0);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 32);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 24);
    e[2] = (e[2] + e[6] + 0);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 16);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[7] + 0);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 32);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 24);
    e[3] = (e[3] + e[7] + 0);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 16);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 63);
    ;
    e[0] = (e[0] + e[5] + 0);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 32);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 24);
    e[0] = (e[0] + e[5] + 0);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 16);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 32);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 24);
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 16);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[7] + 0);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 32);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 24);
    e[2] = (e[2] + e[7] + 0);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 16);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[4] + 0);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 32);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 24);
    e[3] = (e[3] + e[4] + 0);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 16);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 63);
    ;

    e[0] = (e[0] + e[4] + 0);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 32);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 24);
    e[0] = (e[0] + e[4] + 0);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 16);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[5] + 0);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 32);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 24);
    e[1] = (e[1] + e[5] + 0);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 16);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[6] + 0);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 32);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 24);
    e[2] = (e[2] + e[6] + 0);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 16);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[7] + 0);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 32);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 24);
    e[3] = (e[3] + e[7] + 0);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 16);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 63);
    ;
    e[0] = (e[0] + e[5] + j);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 32);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 24);
    e[0] = (e[0] + e[5] + 0);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 16);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 32);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 24);
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 16);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[7] + 0);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 32);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 24);
    e[2] = (e[2] + e[7] + 0);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 16);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[4] + 0);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 32);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 24);
    e[3] = (e[3] + e[4] + 0);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 16);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 63);
    ;

    e[0] = (e[0] + e[4] + 0);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 32);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 24);
    e[0] = (e[0] + e[4] + 0);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 16);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[5] + 0);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 32);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 24);
    e[1] = (e[1] + e[5] + 0);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 16);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[6] + 0);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 32);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 24);
    e[2] = (e[2] + e[6] + 0);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 16);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[7] + 0);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 32);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 24);
    e[3] = (e[3] + e[7] + 0);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 16);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 63);
    ;
    e[0] = (e[0] + e[5] + 0);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 32);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 24);
    e[0] = (e[0] + e[5] + 0);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 16);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 32);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 24);
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 16);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[7] + 0);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 32);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 24);
    e[2] = (e[2] + e[7] + j);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 16);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[4] + 0);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 32);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 24);
    e[3] = (e[3] + e[4] + 0);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 16);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 63);
    ;

    e[0] = (e[0] + e[4] + 0);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 32);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 24);
    e[0] = (e[0] + e[4] + 0);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 16);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[5] + 0);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 32);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 24);
    e[1] = (e[1] + e[5] + j);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 16);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[6] + 0);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 32);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 24);
    e[2] = (e[2] + e[6] + 0);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 16);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[7] + 0);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 32);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 24);
    e[3] = (e[3] + e[7] + 0);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 16);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 63);
    ;
    e[0] = (e[0] + e[5] + 0);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 32);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 24);
    e[0] = (e[0] + e[5] + 0);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 16);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 32);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 24);
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 16);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[7] + 0);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 32);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 24);
    e[2] = (e[2] + e[7] + 0);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 16);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[4] + 0);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 32);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 24);
    e[3] = (e[3] + e[4] + 0);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 16);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 63);
    ;

    e[0] = (e[0] + e[4] + 0);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 32);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 24);
    e[0] = (e[0] + e[4] + 0);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 16);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[5] + 0);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 32);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 24);
    e[1] = (e[1] + e[5] + 0);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 16);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[6] + 0);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 32);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 24);
    e[2] = (e[2] + e[6] + 0);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 16);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[7] + 0);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 32);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 24);
    e[3] = (e[3] + e[7] + 0);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 16);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 63);
    ;
    e[0] = (e[0] + e[5] + 0);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 32);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 24);
    e[0] = (e[0] + e[5] + j);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 16);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 32);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 24);
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 16);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[7] + 0);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 32);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 24);
    e[2] = (e[2] + e[7] + 0);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 16);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[4] + 0);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 32);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 24);
    e[3] = (e[3] + e[4] + 0);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 16);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 63);
    ;

    e[0] = (e[0] + e[4] + 0);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 32);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 24);
    e[0] = (e[0] + e[4] + 0);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 16);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[5] + 0);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 32);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 24);
    e[1] = (e[1] + e[5] + 0);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 16);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[6] + 0);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 32);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 24);
    e[2] = (e[2] + e[6] + 0);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 16);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[7] + 0);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 32);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 24);
    e[3] = (e[3] + e[7] + 0);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 16);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 63);
    ;
    e[0] = (e[0] + e[5] + 0);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 32);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 24);
    e[0] = (e[0] + e[5] + 0);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 16);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 32);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 24);
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 16);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[7] + 0);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 32);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 24);
    e[2] = (e[2] + e[7] + 0);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 16);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[4] + j);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 32);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 24);
    e[3] = (e[3] + e[4] + 0);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 16);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 63);
    ;

    e[0] = (e[0] + e[4] + 0);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 32);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 24);
    e[0] = (e[0] + e[4] + 0);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 16);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[5] + j);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 32);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 24);
    e[1] = (e[1] + e[5] + 0);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 16);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[6] + 0);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 32);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 24);
    e[2] = (e[2] + e[6] + 0);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 16);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[7] + 0);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 32);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 24);
    e[3] = (e[3] + e[7] + 0);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 16);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 63);
    ;
    e[0] = (e[0] + e[5] + 0);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 32);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 24);
    e[0] = (e[0] + e[5] + 0);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 16);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 32);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 24);
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 16);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[7] + 0);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 32);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 24);
    e[2] = (e[2] + e[7] + 0);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 16);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[4] + 0);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 32);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 24);
    e[3] = (e[3] + e[4] + 0);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 16);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 63);
    ;

    e[0] = (e[0] + e[4] + 0);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 32);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 24);
    e[0] = (e[0] + e[4] + 0);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 16);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[5] + 0);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 32);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 24);
    e[1] = (e[1] + e[5] + 0);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 16);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[6] + 0);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 32);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 24);
    e[2] = (e[2] + e[6] + j);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 16);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[7] + 0);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 32);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 24);
    e[3] = (e[3] + e[7] + 0);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 16);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 63);
    ;
    e[0] = (e[0] + e[5] + 0);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 32);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 24);
    e[0] = (e[0] + e[5] + 0);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 16);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 32);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 24);
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 16);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[7] + 0);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 32);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 24);
    e[2] = (e[2] + e[7] + 0);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 16);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[4] + 0);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 32);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 24);
    e[3] = (e[3] + e[4] + 0);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 16);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 63);
    ;

    e[0] = (e[0] + e[4] + 0);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 32);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 24);
    e[0] = (e[0] + e[4] + 0);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 16);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[5] + 0);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 32);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 24);
    e[1] = (e[1] + e[5] + 0);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 16);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[6] + 0);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 32);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 24);
    e[2] = (e[2] + e[6] + 0);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 16);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[7] + 0);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 32);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 24);
    e[3] = (e[3] + e[7] + 0);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 16);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 63);
    ;
    e[0] = (e[0] + e[5] + 0);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 32);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 24);
    e[0] = (e[0] + e[5] + 0);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 16);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 32);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 24);
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 16);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[7] + j);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 32);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 24);
    e[2] = (e[2] + e[7] + 0);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 16);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[4] + 0);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 32);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 24);
    e[3] = (e[3] + e[4] + 0);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 16);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 63);
    ;

    e[0] = (e[0] + e[4] + 0);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 32);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 24);
    e[0] = (e[0] + e[4] + 0);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 16);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[5] + 0);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 32);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 24);
    e[1] = (e[1] + e[5] + 0);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 16);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[6] + 0);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 32);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 24);
    e[2] = (e[2] + e[6] + 0);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 16);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[7] + j);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 32);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 24);
    e[3] = (e[3] + e[7] + 0);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 16);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 63);
    ;
    e[0] = (e[0] + e[5] + 0);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 32);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 24);
    e[0] = (e[0] + e[5] + 0);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 16);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 32);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 24);
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 16);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[7] + 0);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 32);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 24);
    e[2] = (e[2] + e[7] + 0);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 16);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[4] + 0);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 32);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 24);
    e[3] = (e[3] + e[4] + 0);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 16);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 63);
    ;

    e[0] = (e[0] + e[4] + 0);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 32);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 24);
    e[0] = (e[0] + e[4] + j);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 16);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[5] + 0);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 32);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 24);
    e[1] = (e[1] + e[5] + 0);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 16);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[6] + 0);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 32);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 24);
    e[2] = (e[2] + e[6] + 0);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 16);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[7] + 0);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 32);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 24);
    e[3] = (e[3] + e[7] + 0);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 16);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 63);
    ;
    e[0] = (e[0] + e[5] + 0);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 32);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 24);
    e[0] = (e[0] + e[5] + 0);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 16);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 32);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 24);
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 16);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[7] + 0);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 32);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 24);
    e[2] = (e[2] + e[7] + 0);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 16);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[4] + 0);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 32);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 24);
    e[3] = (e[3] + e[4] + 0);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 16);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 63);
    ;

    e[0] = (e[0] + e[4] + 0);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 32);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 24);
    e[0] = (e[0] + e[4] + 0);
    e[12] = rotate((e[12] ^ e[0]), (ulong)64 - 16);
    e[8] = (e[8] + e[12]);
    e[4] = rotate((e[4] ^ e[8]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[5] + 0);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 32);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 24);
    e[1] = (e[1] + e[5] + 0);
    e[13] = rotate((e[13] ^ e[1]), (ulong)64 - 16);
    e[9] = (e[9] + e[13]);
    e[5] = rotate((e[5] ^ e[9]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[6] + 0);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 32);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 24);
    e[2] = (e[2] + e[6] + 0);
    e[14] = rotate((e[14] ^ e[2]), (ulong)64 - 16);
    e[10] = (e[10] + e[14]);
    e[6] = rotate((e[6] ^ e[10]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[7] + 0);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 32);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 24);
    e[3] = (e[3] + e[7] + 0);
    e[15] = rotate((e[15] ^ e[3]), (ulong)64 - 16);
    e[11] = (e[11] + e[15]);
    e[7] = rotate((e[7] ^ e[11]), (ulong)64 - 63);
    ;
    e[0] = (e[0] + e[5] + j);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 32);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 24);
    e[0] = (e[0] + e[5] + 0);
    e[15] = rotate((e[15] ^ e[0]), (ulong)64 - 16);
    e[10] = (e[10] + e[15]);
    e[5] = rotate((e[5] ^ e[10]), (ulong)64 - 63);
    ;
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 32);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 24);
    e[1] = (e[1] + e[6] + 0);
    e[12] = rotate((e[12] ^ e[1]), (ulong)64 - 16);
    e[11] = (e[11] + e[12]);
    e[6] = rotate((e[6] ^ e[11]), (ulong)64 - 63);
    ;
    e[2] = (e[2] + e[7] + 0);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 32);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 24);
    e[2] = (e[2] + e[7] + 0);
    e[13] = rotate((e[13] ^ e[2]), (ulong)64 - 16);
    e[8] = (e[8] + e[13]);
    e[7] = rotate((e[7] ^ e[8]), (ulong)64 - 63);
    ;
    e[3] = (e[3] + e[4] + 0);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 32);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 24);
    e[3] = (e[3] + e[4] + 0);
    e[14] = rotate((e[14] ^ e[3]), (ulong)64 - 16);
    e[9] = (e[9] + e[14]);
    e[4] = rotate((e[4] ^ e[9]), (ulong)64 - 63);
    ;

    ulong k[7];
    k[0] = a[0] ^ e[0] ^ e[8];
    k[1] = a[1] ^ e[1] ^ e[9];
    k[2] = a[2] ^ e[2] ^ e[10];
    k[3] = a[3] ^ e[3] ^ e[11];
    k[4] = a[4] ^ e[4] ^ e[12];
    k[5] = a[5] ^ e[5] ^ e[13];
    k[6] = (a[6] ^ e[6] ^ e[14]) & 0xffff;

    i += B(0, b, g * 2, k[0], k[1], k[2], k[3]);
    i += B(0, b, g * 2 + 1, (k[3] >> 8) | (k[4] << (64 - 8)), (k[4] >> 8) | (k[5] << (64 - 8)), (k[5] >> 8) | (k[6] << (64 - 8)), (k[6] >> 8));

    g++;
  }

  c[d * 2] = 0;
  c[d * 2 + 1] = i;
}
ulong D(__global ulong* a, uint b) {
  return (((ulong) * (__global uint*)((__global char*)a + b + 0)) << 0) | (((ulong) * (__global uint*)((__global char*)a + b + 4)) << 32);
}

uint E(__global ulong* a, uint b) {
  __global char* c = (__global char*)a;
  return *(__global uint*)(c + b);
}
uint F(uint a, __global char* b, uint c, uint d, uint e, __global ulong* f, __global ulong* g) {
  ulong h, i, j;

  if (a == 1 || a == 2) {
    h = *(f++) ^ *(g++);
    i = *(f++) ^ *(g++);
    j = *f ^ *g;
    if (a == 2) {
      h = (h >> 8) | (i << (64 - 8));
      i = (i >> 8) | (j << (64 - 8));
      j = (j >> 8);
    }
  } else if (a == 3) {
    h = D(f, 0) ^ D(g, 0);
    i = D(f, 8) ^ D(g, 8);
    j = E(f, 16) ^ E(g, 16);
  } else if (a == 4 || a == 5) {
    h = D(f, 0) ^ D(g, 0);
    i = D(f, 8) ^ D(g, 8);
    j = 0;
    if (a == 4) {
      h = (h >> 8) | (i << (64 - 8));
      i = (i >> 8);
    }
  } else if (a == 6) {
    h = *f++ ^ *g++;
    i = *(__global uint*)f ^ *(__global uint*)g;
    j = 0;
    if (a == 6) {
      h = (h >> 8) | (i << (64 - 8));
      i = (i >> 8);
    }
  } else if (a == 7 || a == 8) {
    h = D(f, 0) ^ D(g, 0);
    i = 0;
    j = 0;
    if (a == 8) {
      h = (h >> 8);
    }
  }

  if (!h && !i)
    return 0;

  return B(a, b, ((c << 12) | ((e & 0x3f) << 6) | (d & 0x3f)), h, i, j, 0);
}

void G(uint a, __global char* b, __global char* c, __global uint* d) {
  uint e = get_global_id(0);
  uint f = get_local_id(0);
  __global char* g;
  uint h;
  uchar i[((1 << (((200 / (9 + 1)) + 1) - 20)) * 9)];
  uchar j;
  uint k, l;

  ushort m[((1 << (((200 / (9 + 1)) + 1) - 20)) * 9) * 3];
  uint n = 0;
  uint o;
  uint p = 0;
  uint q = 0;
  __global ulong *r, *s;
  uint t;

  t = (8 + ((a - 1) / 2) * 4);
  j = 0;

  g = (b + e * ((1 << (((200 / (9 + 1)) + 1) - 20)) * 9) * 32);
  h = *(__global uint*)g;
  h = min(h, (uint)((1 << (((200 / (9 + 1)) + 1) - 20)) * 9));
  if (!h)

    return;

  g += t;
  for (k = 0; k < h; k++, g += 32)
    i[k] = *(__global uchar*)g;

  for (k = 0; k < h; k++)
    for (l = k + 1; l < h; l++)

      if ((i[k] & j) == (i[l] & j)) {
        if (n >= sizeof(m) / sizeof(*m))
          p++;
        else

          m[n++] = ((ushort)l << 8) | ((ushort)k & 0xff);
      }

  for (o = 0; o < n; o++) {
    k = m[o] & 0xff;
    l = m[o] >> 8;

    r = (__global ulong*)(b + e * ((1 << (((200 / (9 + 1)) + 1) - 20)) * 9) * 32 + k * 32 + t);
    s = (__global ulong*)(b + e * ((1 << (((200 / (9 + 1)) + 1) - 20)) * 9) * 32 + l * 32 + t);
    q += F(a, c, e, k, l, r, s);
  }
  if (a < 8)

    *(__global uint*)(b + e * ((1 << (((200 / (9 + 1)) + 1) - 20)) * 9) * 32) = 0;

  d[e * 2] = p;
  d[e * 2 + 1] = q;
}

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void H(__global char* a, __global char* b, __global uint* c) {
  G(1, a, b, c);
}
__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void I(__global char* a, __global char* b, __global uint* c) {
  G(2, a, b, c);
}
__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void J(__global char* a, __global char* b, __global uint* c) {
  G(3, a, b, c);
}
__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void K(__global char* a, __global char* b, __global uint* c) {
  G(4, a, b, c);
}
__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void L(__global char* a, __global char* b, __global uint* c) {
  G(5, a, b, c);
}
__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void M(__global char* a, __global char* b, __global uint* c) {
  G(6, a, b, c);
}
__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void N(__global char* a, __global char* b, __global uint* c) {
  G(7, a, b, c);
}

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void O(__global char* a, __global char* b, __global uint* c, __global sols_t* d) {
  uint e = get_global_id(0);
  G(8, a, b, c);
  if (!e)
    d->nr = d->likely_invalids = 0;
}

uint P(__global char* a, uint b, uint c, uint d) {
  return *(__global uint*)(a + c * ((1 << (((200 / (9 + 1)) + 1) - 20)) * 9) * 32 + d * 32 + b - 4);
}

uint Q(uint* a, uint b, __global char** c, uint d) {
  __global char* e = c[d % 2];
  uint f = b - 1;
  uint g = b * 2 - 1;
  uint h = (8 + ((d) / 2) * 4);
  int i = -1;
  do {
    a[g] = P(e, h, (a[f] >> 12), ((a[f] >> 6) & 0x3f));
    a[g - 1] = P(e, h, (a[f] >> 12), (a[f] & 0x3f));
    if (!d) {
      if (i == -1)
        i = a[g];
      else if (a[g] == i || a[g - 1] == i)
        return 0;
    }
    if (!f)
      break;
    f--;
    g -= 2;
  } while (1);
  return 1;
}

void R(__global char** a, __global sols_t* b, uint c, uint d) {
  uint e;
  uint f[(1 << 9)];
  uint g;
  uint h;
  e = 0;
  f[e++] = c;
  f[e++] = d;
  uint i = 9 - 1;
  do {
    i--;
    if (!Q(f, e, a, i))
      return;
    e *= 2;
  } while (i > 0);

  g = atomic_add(&b->nr, 1);
  if (g >= 10)
    return;
  for (h = 0; h < (1 << 9); h++)
    b->values[g][h] = f[h];
  b->valid[g] = 1;
}

__kernel void S(__global char* a, __global char* b, __global sols_t* c) {
  uint d = get_global_id(0);
  __global char* e[2] = { ab;
  uint f = (9 - 1) % 2;
  uint g;
  uint h = (8 + ((9 - 1) / 2) * 4);
  uint i, j;
  __global char *k, *l;
  uint m, n;

  ulong o[1];
  uint p;

  uint q = 0xffffff;

  k = e[f] + d * ((1 << (((200 / (9 + 1)) + 1) - 20)) * 9) * 32;
  g = *(__global uint*)k;
  g = min(g, (uint)((1 << (((200 / (9 + 1)) + 1) - 20)) * 9));
  p = 0;
  k += h;
  for (i = 0; i < g; i++, k += 32)
    for (j = i + 1, l = k + 32; j < g; j++, l += 32)
      if (((*(__global uint*)k) & q) == ((*(__global uint*)l) & q)) {
        m = *(__global uint*)(k - 4);
        n = *(__global uint*)(l - 4);
        if (p < sizeof(o) / sizeof(*o))
          o[p++] = ((ulong)m << 32) | n;
        else
          atomic_add(&c->likely_invalids, 1);
      }
  if (!p)
    return;
  for (i = 0; i < p; i++)
    R(e, c, o[i] >> 32, o[i] & 0xffffffff);
}