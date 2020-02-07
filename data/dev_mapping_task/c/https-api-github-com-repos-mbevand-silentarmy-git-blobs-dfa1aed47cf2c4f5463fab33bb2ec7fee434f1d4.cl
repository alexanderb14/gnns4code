typedef struct sols_s {
  uint nr;
  uint likely_invalids;
  uchar valid[10];
  uint values[10][(1 << 9)];
} sols_t;

__constant ulong Ga[] = {
    0x6a09e667f3bcc908, 0xbb67ae8584caa73b, 0x3c6ef372fe94f82b, 0xa54ff53a5f1d36f1, 0x510e527fade682d1, 0x9b05688c2b3e6c1f, 0x1f83d9abfb41bd6b, 0x5be0cd19137e2179,
};

__kernel void A(__global char* a, __global uint* b) {
  b[get_global_id(0)] = 0;
}
uint B(uint a, __global char* b, uint c, ulong d, ulong e, ulong f, ulong g, __global uint* h) {
  uint i;
  __global char* j;
  uint k;
  if (!(a % 2))
    i = (d & 0xffff) | ((d & 0xf00000) >> 4);
  else
    i = ((d & 0xf0000) >> 0) | ((d & 0xf00) << 4) | ((d & 0xf00000) >> 12) | ((d & 0xf) << 4) | ((d & 0xf000) >> 12);

  d = (d >> 16) | (e << (64 - 16));
  e = (e >> 16) | (f << (64 - 16));
  f = (f >> 16) | (g << (64 - 16));
  j = b + i * ((1 << (((200 / (9 + 1)) + 1) - 20)) * 6) * 32;
  uint l = i / 8;
  uint m = 4 * (i % 8);
  uint n = atomic_add(h + l, 1 << m);
  n = (n >> m) & 0x0F;
  k = n;
  if (k >= ((1 << (((200 / (9 + 1)) + 1) - 20)) * 6)) {
    atomic_sub(h + l, 1 << m);
    return 1;
  }
  j += k * 32 + (8 + ((a) / 2) * 4);

  *(__global uint*)(j - 4) = c;
  if (a == 0 || a == 1) {
    *(__global ulong*)(j + 0) = d;
    *(__global ulong*)(j + 8) = e;
    *(__global ulong*)(j + 16) = f;
  } else if (a == 2) {
    *(__global uint*)(j + 0) = d;
    *(__global ulong*)(j + 4) = (d >> 32) | (e << 32);
    *(__global ulong*)(j + 12) = (e >> 32) | (f << 32);
  } else if (a == 3) {
    *(__global uint*)(j + 0) = d;
    *(__global ulong*)(j + 4) = (d >> 32) | (e << 32);
    *(__global uint*)(j + 12) = (e >> 32);
  } else if (a == 4) {
    *(__global ulong*)(j + 0) = d;
    *(__global ulong*)(j + 8) = e;
  } else if (a == 5) {
    *(__global ulong*)(j + 0) = d;
    *(__global uint*)(j + 8) = e;
  } else if (a == 6 || a == 7) {
    *(__global uint*)(j + 0) = d;
    *(__global uint*)(j + 4) = (d >> 32);
  } else if (a == 8) {
    *(__global uint*)(j + 0) = d;
  }
  return 0;
}
__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void C(__global ulong* a, __global char* b, __global uint* c, __global uint* d) {
  uint e = get_global_id(0);
  ulong f[16];
  uint g = (1 << (200 / (9 + 1))) / get_global_size(0);
  uint h = e * g;
  uint i = (e + 1) * g;
  uint j = 0;
  while (h < i) {
    ulong k = (ulong)h << 32;

    f[0] = a[0];
    f[1] = a[1];
    f[2] = a[2];
    f[3] = a[3];
    f[4] = a[4];
    f[5] = a[5];
    f[6] = a[6];
    f[7] = a[7];
    f[8] = Ga[0];
    f[9] = Ga[1];
    f[10] = Ga[2];
    f[11] = Ga[3];
    f[12] = Ga[4];
    f[13] = Ga[5];
    f[14] = Ga[6];
    f[15] = Ga[7];

    f[12] ^= 140 + 4;

    f[14] ^= (ulong)-1;

    f[0] = (f[0] + f[4] + 0);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
    f[0] = (f[0] + f[4] + k);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[5] + 0);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
    f[1] = (f[1] + f[5] + 0);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[6] + 0);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
    f[2] = (f[2] + f[6] + 0);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[7] + 0);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
    f[3] = (f[3] + f[7] + 0);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
    ;
    f[0] = (f[0] + f[5] + 0);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
    f[0] = (f[0] + f[5] + 0);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[7] + 0);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
    f[2] = (f[2] + f[7] + 0);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[4] + 0);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
    f[3] = (f[3] + f[4] + 0);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
    ;

    f[0] = (f[0] + f[4] + 0);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
    f[0] = (f[0] + f[4] + 0);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[5] + 0);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
    f[1] = (f[1] + f[5] + 0);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[6] + 0);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
    f[2] = (f[2] + f[6] + 0);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[7] + 0);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
    f[3] = (f[3] + f[7] + 0);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
    ;
    f[0] = (f[0] + f[5] + k);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
    f[0] = (f[0] + f[5] + 0);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[7] + 0);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
    f[2] = (f[2] + f[7] + 0);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[4] + 0);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
    f[3] = (f[3] + f[4] + 0);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
    ;

    f[0] = (f[0] + f[4] + 0);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
    f[0] = (f[0] + f[4] + 0);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[5] + 0);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
    f[1] = (f[1] + f[5] + 0);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[6] + 0);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
    f[2] = (f[2] + f[6] + 0);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[7] + 0);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
    f[3] = (f[3] + f[7] + 0);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
    ;
    f[0] = (f[0] + f[5] + 0);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
    f[0] = (f[0] + f[5] + 0);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[7] + 0);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
    f[2] = (f[2] + f[7] + k);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[4] + 0);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
    f[3] = (f[3] + f[4] + 0);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
    ;

    f[0] = (f[0] + f[4] + 0);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
    f[0] = (f[0] + f[4] + 0);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[5] + 0);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
    f[1] = (f[1] + f[5] + k);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[6] + 0);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
    f[2] = (f[2] + f[6] + 0);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[7] + 0);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
    f[3] = (f[3] + f[7] + 0);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
    ;
    f[0] = (f[0] + f[5] + 0);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
    f[0] = (f[0] + f[5] + 0);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[7] + 0);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
    f[2] = (f[2] + f[7] + 0);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[4] + 0);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
    f[3] = (f[3] + f[4] + 0);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
    ;

    f[0] = (f[0] + f[4] + 0);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
    f[0] = (f[0] + f[4] + 0);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[5] + 0);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
    f[1] = (f[1] + f[5] + 0);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[6] + 0);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
    f[2] = (f[2] + f[6] + 0);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[7] + 0);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
    f[3] = (f[3] + f[7] + 0);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
    ;
    f[0] = (f[0] + f[5] + 0);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
    f[0] = (f[0] + f[5] + k);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[7] + 0);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
    f[2] = (f[2] + f[7] + 0);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[4] + 0);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
    f[3] = (f[3] + f[4] + 0);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
    ;

    f[0] = (f[0] + f[4] + 0);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
    f[0] = (f[0] + f[4] + 0);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[5] + 0);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
    f[1] = (f[1] + f[5] + 0);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[6] + 0);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
    f[2] = (f[2] + f[6] + 0);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[7] + 0);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
    f[3] = (f[3] + f[7] + 0);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
    ;
    f[0] = (f[0] + f[5] + 0);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
    f[0] = (f[0] + f[5] + 0);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[7] + 0);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
    f[2] = (f[2] + f[7] + 0);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[4] + k);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
    f[3] = (f[3] + f[4] + 0);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
    ;

    f[0] = (f[0] + f[4] + 0);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
    f[0] = (f[0] + f[4] + 0);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[5] + k);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
    f[1] = (f[1] + f[5] + 0);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[6] + 0);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
    f[2] = (f[2] + f[6] + 0);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[7] + 0);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
    f[3] = (f[3] + f[7] + 0);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
    ;
    f[0] = (f[0] + f[5] + 0);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
    f[0] = (f[0] + f[5] + 0);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[7] + 0);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
    f[2] = (f[2] + f[7] + 0);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[4] + 0);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
    f[3] = (f[3] + f[4] + 0);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
    ;

    f[0] = (f[0] + f[4] + 0);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
    f[0] = (f[0] + f[4] + 0);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[5] + 0);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
    f[1] = (f[1] + f[5] + 0);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[6] + 0);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
    f[2] = (f[2] + f[6] + k);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[7] + 0);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
    f[3] = (f[3] + f[7] + 0);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
    ;
    f[0] = (f[0] + f[5] + 0);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
    f[0] = (f[0] + f[5] + 0);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[7] + 0);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
    f[2] = (f[2] + f[7] + 0);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[4] + 0);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
    f[3] = (f[3] + f[4] + 0);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
    ;

    f[0] = (f[0] + f[4] + 0);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
    f[0] = (f[0] + f[4] + 0);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[5] + 0);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
    f[1] = (f[1] + f[5] + 0);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[6] + 0);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
    f[2] = (f[2] + f[6] + 0);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[7] + 0);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
    f[3] = (f[3] + f[7] + 0);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
    ;
    f[0] = (f[0] + f[5] + 0);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
    f[0] = (f[0] + f[5] + 0);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[7] + k);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
    f[2] = (f[2] + f[7] + 0);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[4] + 0);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
    f[3] = (f[3] + f[4] + 0);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
    ;

    f[0] = (f[0] + f[4] + 0);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
    f[0] = (f[0] + f[4] + 0);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[5] + 0);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
    f[1] = (f[1] + f[5] + 0);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[6] + 0);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
    f[2] = (f[2] + f[6] + 0);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[7] + k);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
    f[3] = (f[3] + f[7] + 0);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
    ;
    f[0] = (f[0] + f[5] + 0);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
    f[0] = (f[0] + f[5] + 0);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[7] + 0);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
    f[2] = (f[2] + f[7] + 0);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[4] + 0);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
    f[3] = (f[3] + f[4] + 0);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
    ;

    f[0] = (f[0] + f[4] + 0);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
    f[0] = (f[0] + f[4] + k);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[5] + 0);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
    f[1] = (f[1] + f[5] + 0);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[6] + 0);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
    f[2] = (f[2] + f[6] + 0);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[7] + 0);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
    f[3] = (f[3] + f[7] + 0);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
    ;
    f[0] = (f[0] + f[5] + 0);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
    f[0] = (f[0] + f[5] + 0);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[7] + 0);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
    f[2] = (f[2] + f[7] + 0);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[4] + 0);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
    f[3] = (f[3] + f[4] + 0);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
    ;

    f[0] = (f[0] + f[4] + 0);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
    f[0] = (f[0] + f[4] + 0);
    f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
    f[8] = (f[8] + f[12]);
    f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[5] + 0);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
    f[1] = (f[1] + f[5] + 0);
    f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
    f[9] = (f[9] + f[13]);
    f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[6] + 0);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
    f[2] = (f[2] + f[6] + 0);
    f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
    f[10] = (f[10] + f[14]);
    f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[7] + 0);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
    f[3] = (f[3] + f[7] + 0);
    f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
    f[11] = (f[11] + f[15]);
    f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
    ;
    f[0] = (f[0] + f[5] + k);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
    f[0] = (f[0] + f[5] + 0);
    f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
    f[10] = (f[10] + f[15]);
    f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
    ;
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
    f[1] = (f[1] + f[6] + 0);
    f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
    f[11] = (f[11] + f[12]);
    f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
    ;
    f[2] = (f[2] + f[7] + 0);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
    f[2] = (f[2] + f[7] + 0);
    f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
    f[8] = (f[8] + f[13]);
    f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
    ;
    f[3] = (f[3] + f[4] + 0);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
    f[3] = (f[3] + f[4] + 0);
    f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
    f[9] = (f[9] + f[14]);
    f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
    ;

    ulong l[7];
    l[0] = a[0] ^ f[0] ^ f[8];
    l[1] = a[1] ^ f[1] ^ f[9];
    l[2] = a[2] ^ f[2] ^ f[10];
    l[3] = a[3] ^ f[3] ^ f[11];
    l[4] = a[4] ^ f[4] ^ f[12];
    l[5] = a[5] ^ f[5] ^ f[13];
    l[6] = (a[6] ^ f[6] ^ f[14]) & 0xffff;

    j += B(0, b, h * 2, l[0], l[1], l[2], l[3], c);
    j += B(0, b, h * 2 + 1, (l[3] >> 8) | (l[4] << (64 - 8)), (l[4] >> 8) | (l[5] << (64 - 8)), (l[5] >> 8) | (l[6] << (64 - 8)), (l[6] >> 8), c);

    h++;
  }
}
ulong D(__global ulong* a, uint b) {
  return (((ulong) * (__global uint*)((__global char*)a + b + 0)) << 0) | (((ulong) * (__global uint*)((__global char*)a + b + 4)) << 32);
}

uint E(__global ulong* a, uint b) {
  __global char* c = (__global char*)a;
  return *(__global uint*)(c + b);
}
uint F(uint a, __global char* b, uint c, uint d, uint e, __global ulong* f, __global ulong* g, __global uint* h) {
  ulong i, j, k;

  if (a == 1 || a == 2) {
    i = *(f++) ^ *(g++);
    j = *(f++) ^ *(g++);
    k = *f ^ *g;
    if (a == 2) {
      i = (i >> 8) | (j << (64 - 8));
      j = (j >> 8) | (k << (64 - 8));
      k = (k >> 8);
    }
  } else if (a == 3) {
    i = D(f, 0) ^ D(g, 0);
    j = D(f, 8) ^ D(g, 8);
    k = E(f, 16) ^ E(g, 16);
  } else if (a == 4 || a == 5) {
    i = D(f, 0) ^ D(g, 0);
    j = D(f, 8) ^ D(g, 8);
    k = 0;
    if (a == 4) {
      i = (i >> 8) | (j << (64 - 8));
      j = (j >> 8);
    }
  } else if (a == 6) {
    i = *f++ ^ *g++;
    j = *(__global uint*)f ^ *(__global uint*)g;
    k = 0;
    if (a == 6) {
      i = (i >> 8) | (j << (64 - 8));
      j = (j >> 8);
    }
  } else if (a == 7 || a == 8) {
    i = D(f, 0) ^ D(g, 0);
    j = 0;
    k = 0;
    if (a == 8) {
      i = (i >> 8);
    }
  }

  if (!i && !j)
    return 0;

  return B(a, b, ((c << 12) | ((e & 0x3f) << 6) | (d & 0x3f)), i, j, k, 0, h);
}

void G(uint a, __global char* b, __global char* c, __global uint* d, __local uchar* e, __local uint* f, __local uint* g, __global uint* h, __global uint* i) {
  uint j = get_global_id(0);
  uint k = get_local_id(0);
  __global char* l;
  uint m;
  __local uchar* n = &e[(((1 << (((200 / (9 + 1)) + 1) - 20)) * 6) + 2) * k];
  uchar o;
  uint p, q;

  uint r;
  uint s = 0;
  uint t = 0;
  __global ulong *u, *v;
  uint w;

  w = (8 + ((a - 1) / 2) * 4);
  o = 0;

  uint x = 0;
  *g = 0;
  barrier(1);
  l = (b + j * ((1 << (((200 / (9 + 1)) + 1) - 20)) * 6) * 32);
  uint y = j / 8;
  uint z = 4 * (j % 8);
  m = (h[y] >> z) & 0x0F;
  m = min(m, (uint)((1 << (((200 / (9 + 1)) + 1) - 20)) * 6));
  if (!m)

    goto part2;
  l += w;
  for (p = 0; p < m; p++, l += 32)
    n[p] = (*(__global uchar*)l) & o;

  for (p = 0; p < m - 1 && x < (((1 << (((200 / (9 + 1)) + 1) - 20)) * 6) * 5); p++) {
    uchar aa = n[p];
    uint ab = (j << 10) | (p << 5) | (p + 1);
    for (q = p + 1; (q + 4) < m;) {
      {
        uint ac = ((aa == n[q]) ? 1 : 0);
        if (ac) {
          x++;
          uint ad = atomic_add(g, 1);
          f[ad] = ab;
        }
        ab++;
        q++;
      }
      {
        uint ac = ((aa == n[q]) ? 1 : 0);
        if (ac) {
          x++;
          uint ad = atomic_add(g, 1);
          f[ad] = ab;
        }
        ab++;
        q++;
      }
      {
        uint ac = ((aa == n[q]) ? 1 : 0);
        if (ac) {
          x++;
          uint ad = atomic_add(g, 1);
          f[ad] = ab;
        }
        ab++;
        q++;
      }
      {
        uint ac = ((aa == n[q]) ? 1 : 0);
        if (ac) {
          x++;
          uint ad = atomic_add(g, 1);
          f[ad] = ab;
        }
        ab++;
        q++;
      }
    }
    for (; q < m; q++) {
      uint ac = ((aa == n[q]) ? 1 : 0);
      if (ac) {
        x++;
        uint ad = atomic_add(g, 1);
        f[ad] = ab;
      }
      ab++;
    }
  }

part2:
  barrier(1);
  uint ae = *g;
  for (uint ad = k; ad < ae; ad += get_local_size(0)) {
    uint ab = f[ad];
    uint af = ab >> 10;
    uint p = (ab >> 5) & 0x1F;
    uint q = ab & 0x1F;
    __global uchar* ag = b + af * ((1 << (((200 / (9 + 1)) + 1) - 20)) * 6) * 32 + w;
    u = (__global ulong*)(ag + p * 32);
    v = (__global ulong*)(ag + q * 32);
    t += F(a, c, af, p, q, u, v, i);
  }
}
__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void H(__global char* a, __global char* b, __global uint* c, __global uint* d, __global uint* e) {
  __local uchar f[(((1 << (((200 / (9 + 1)) + 1) - 20)) * 6) + 2) * 64];
  __local uint g[(((1 << (((200 / (9 + 1)) + 1) - 20)) * 6) * 5) * 64];
  __local uint h;
  G(1, a, b, e, f, g, &h, c, d);
}
__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void I(__global char* a, __global char* b, __global uint* c, __global uint* d, __global uint* e) {
  __local uchar f[(((1 << (((200 / (9 + 1)) + 1) - 20)) * 6) + 2) * 64];
  __local uint g[(((1 << (((200 / (9 + 1)) + 1) - 20)) * 6) * 5) * 64];
  __local uint h;
  G(2, a, b, e, f, g, &h, c, d);
}
__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void J(__global char* a, __global char* b, __global uint* c, __global uint* d, __global uint* e) {
  __local uchar f[(((1 << (((200 / (9 + 1)) + 1) - 20)) * 6) + 2) * 64];
  __local uint g[(((1 << (((200 / (9 + 1)) + 1) - 20)) * 6) * 5) * 64];
  __local uint h;
  G(3, a, b, e, f, g, &h, c, d);
}
__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void K(__global char* a, __global char* b, __global uint* c, __global uint* d, __global uint* e) {
  __local uchar f[(((1 << (((200 / (9 + 1)) + 1) - 20)) * 6) + 2) * 64];
  __local uint g[(((1 << (((200 / (9 + 1)) + 1) - 20)) * 6) * 5) * 64];
  __local uint h;
  G(4, a, b, e, f, g, &h, c, d);
}
__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void L(__global char* a, __global char* b, __global uint* c, __global uint* d, __global uint* e) {
  __local uchar f[(((1 << (((200 / (9 + 1)) + 1) - 20)) * 6) + 2) * 64];
  __local uint g[(((1 << (((200 / (9 + 1)) + 1) - 20)) * 6) * 5) * 64];
  __local uint h;
  G(5, a, b, e, f, g, &h, c, d);
}
__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void M(__global char* a, __global char* b, __global uint* c, __global uint* d, __global uint* e) {
  __local uchar f[(((1 << (((200 / (9 + 1)) + 1) - 20)) * 6) + 2) * 64];
  __local uint g[(((1 << (((200 / (9 + 1)) + 1) - 20)) * 6) * 5) * 64];
  __local uint h;
  G(6, a, b, e, f, g, &h, c, d);
}
__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void N(__global char* a, __global char* b, __global uint* c, __global uint* d, __global uint* e) {
  __local uchar f[(((1 << (((200 / (9 + 1)) + 1) - 20)) * 6) + 2) * 64];
  __local uint g[(((1 << (((200 / (9 + 1)) + 1) - 20)) * 6) * 5) * 64];
  __local uint h;
  G(7, a, b, e, f, g, &h, c, d);
}

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void O(__global char* a, __global char* b, __global uint* c, __global uint* d, __global uint* e, __global sols_t* f) {
  uint g = get_global_id(0);
  __local uchar h[(((1 << (((200 / (9 + 1)) + 1) - 20)) * 6) + 2) * 64];
  __local uint i[(((1 << (((200 / (9 + 1)) + 1) - 20)) * 6) * 5) * 64];
  __local uint j;
  G(8, a, b, e, h, i, &j, c, d);
  if (!g)
    f->nr = f->likely_invalids = 0;
}

uint P(__global char* a, uint b, uint c, uint d) {
  return *(__global uint*)(a + c * ((1 << (((200 / (9 + 1)) + 1) - 20)) * 6) * 32 + d * 32 + b - 4);
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

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void S(__global char* a, __global char* b, __global sols_t* c, __global uint* d, __global uint* e) {
  uint f = get_global_id(0);
  __global char* g[2] = { ab;
  __global char ei = (9 - 1) % 2;
  uint j;
  uint k = (8 + ((9 - 1) / 2) * 4);
  uint l, m;
  __global char *n, *o;
  uint p, q;

  ulong r;
  uint s;

  uint t = 0xffffff;

  n = g[i] + f * ((1 << (((200 / (9 + 1)) + 1) - 20)) * 6) * 32;
  uint u = f / 8;
  uint v = 4 * (f % 8);
  j = (d[u] >> v) & 0x0F;
  j = min(j, (uint)((1 << (((200 / (9 + 1)) + 1) - 20)) * 6));
  s = 0;
  n += k;
  for (l = 0; l < j; l++, n += 32) {
    uint w = ((*(__global uint*)n) & t);
    p = *(__global uint*)(n - 4);
    for (m = l + 1, o = n + 32; m < j; m++, o += 32) {
      if (w == ((*(__global uint*)o) & t)) {
        q = *(__global uint*)(o - 4);
        r = ((ulong)p << 32) | q;
        goto exit1;
      }
    }
  }
  return;

exit1:
  R(g, c, r >> 32, r & 0xffffffff);
}