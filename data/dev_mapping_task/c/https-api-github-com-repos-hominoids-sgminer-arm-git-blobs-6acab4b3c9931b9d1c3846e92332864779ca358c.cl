typedef struct sols_s {
  uint nr;
  uint likely_invalids;
  uchar valid[11];
  uint values[11][(1 << 9)];
} sols_t;

typedef struct potential_sols_s {
  uint nr;
  uint values[4096][2];
} potential_sols_t;
typedef union {
  struct {
    uint xi[7];
    uint padding;
  } slot;
  uint8 ui8;
  uint4 ui4[2];
  uint2 ui2[4];
  uint ui[8];
} slot_t;

typedef __global slot_t* global_pointer_to_slot_t;
__global char* A(__global char* a, uint b, uint c, uint d) {
  return a + (c * 684 + d) * (((b) <= 5) ? 32 : 32 - 16);
}

__global uint* B(__global char* a, uint b, uint c, uint d) {
  return (__global uint*)A(a, b, c, d);
}

__global uint* C(__global char* a, uint b, uint c, uint d) {
  return B(a, b, c, d) + (((b) == 0) ? 6 : ((b) == 1) ? 6 : ((b) == 2) ? 5 : ((b) == 3) ? 5 : ((b) == 4) ? 4 : ((b) == 5) ? 4 : ((b) == 6) ? 3 : ((b) == 7) ? 2 : 1);
}

void D(uint* a, uint* b, uint c) {
  if ((32 / ((684 < 3) ? 2 : (684 < 15) ? 4 : (684 < 255) ? 8 : 16)) == 3) {
    uint d = (0x55555555 * c + (c >> 1) - (c >> 3)) >> 30;
    *a = (c - d) * 0xAAAAAAAB;
    *b = ((684 < 3) ? 2 : (684 < 15) ? 4 : (684 < 255) ? 8 : 16) * d;
  } else if ((32 / ((684 < 3) ? 2 : (684 < 15) ? 4 : (684 < 255) ? 8 : 16)) == 6) {
    uint d = (0x55555555 * c + (c >> 1) - (c >> 3)) >> 29;
    *a = (c - d) * 0xAAAAAAAB * 2;
    *b = ((684 < 3) ? 2 : (684 < 15) ? 4 : (684 < 255) ? 8 : 16) * d;
  } else {
    *a = c / (32 / ((684 < 3) ? 2 : (684 < 15) ? 4 : (684 < 255) ? 8 : 16));
    *b = ((684 < 3) ? 2 : (684 < 15) ? 4 : (684 < 255) ? 8 : 16) * (c % (32 / ((684 < 3) ? 2 : (684 < 15) ? 4 : (684 < 255) ? 8 : 16)));
  }
}

uint E(uint a, uint b) {
  uint c = 0;

  if (12 == 12) {
    if (!(a % 2))
      c = (b & 0xfff);
    else
      c = ((b & 0x0f0f00) >> 8) | ((b & 0xf0000000) >> 24);
  } else if (12 == 13) {
    if (!(a % 2))
      c = (b & 0x1fff);
    else
      c = ((b & 0x1f0f00) >> 8) | ((b & 0xf0000000) >> 24);
  } else if (12 == 14) {
    if (!(a % 2))
      c = (b & 0x3fff);
    else
      c = ((b & 0x3f0f00) >> 8) | ((b & 0xf0000000) >> 24);
  } else if (12 == 15) {
    if (!(a % 2))
      c = (b & 0x7fff);
    else
      c = ((b & 0x7f0f00) >> 8) | ((b & 0xf0000000) >> 24);
  } else if (12 == 16) {
    if (!(a % 2))
      c = (b & 0xffff);
    else
      c = ((b & 0xff0f00) >> 8) | ((b & 0xf0000000) >> 24);
  }

  return c;
}

uint F(__global uint* a, uint b) {
  uint c, d, e;
  D(&c, &d, b);
  e = (a[c] >> d) & ((1 << ((684 < 3) ? 2 : (684 < 15) ? 4 : (684 < 255) ? 8 : 16)) - 1);
  e = min(e, (uint)684);
  return e;
}

uint G(__global uint* a, uint b) {
  uint c, d;
  D(&c, &d, b);
  uint e = atomic_add(a + c, 1U << d);
  e = (e >> d) & ((1 << ((684 < 3) ? 2 : (684 < 15) ? 4 : (684 < 255) ? 8 : 16)) - 1);
  if (e >= 684) {
    atomic_sub(a + c, 1 << d);
  }
  return e;
}

__kernel void H(__global char* a, __global uint* b, __global sols_t* c, __global potential_sols_t* d) {
  if (!get_global_id(0))
    c->nr = c->likely_invalids = d->nr = 0;
  if (get_global_id(0) < (((1 << 12) * 4 + (32 / ((684 < 3) ? 2 : (684 < 15) ? 4 : (684 < 255) ? 8 : 16)) - 1) / (32 / ((684 < 3) ? 2 : (684 < 15) ? 4 : (684 < 255) ? 8 : 16))) / 4)
    b[get_global_id(0)] = 0;
}

__constant ulong Ga[] = {
    0x6a09e667f3bcc908, 0xbb67ae8584caa73b, 0x3c6ef372fe94f82b, 0xa54ff53a5f1d36f1, 0x510e527fade682d1, 0x9b05688c2b3e6c1f, 0x1f83d9abfb41bd6b, 0x5be0cd19137e2179,
};
__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void I(__constant ulong* a, __global char* b, __global uint* c, __global uint* d) {
  uint e = get_global_id(0);
  ulong f[16];
  uint g, h, i, j, k, l, m;
  slot_t n;
  ulong o[7];
  uint p = ((1 << (200 / (9 + 1))) + get_global_size(0) - 1) / get_global_size(0);
  uint q = 0;

  for (uint r = 0; r < p; ++r) {
    uint s = e + get_global_size(0) * r;

    if (s < (1 << (200 / (9 + 1)))) {
      ulong t = (ulong)s << 32;

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

      for (uint u = 1; u <= 9; ++u) {
        f[0] = (f[0] + f[4] + (0));
        f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
        f[8] = (f[8] + f[12]);
        f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
        f[0] = (f[0] + f[4] + ((u == 1) ? t : 0));
        f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
        f[8] = (f[8] + f[12]);
        f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
        ;
        f[1] = (f[1] + f[5] + ((u == 7) ? t : 0));
        f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
        f[9] = (f[9] + f[13]);
        f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
        f[1] = (f[1] + f[5] + ((u == 4) ? t : 0));
        f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
        f[9] = (f[9] + f[13]);
        f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
        ;
        f[2] = (f[2] + f[6] + (0));
        f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
        f[10] = (f[10] + f[14]);
        f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
        f[2] = (f[2] + f[6] + ((u == 8) ? t : 0));
        f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
        f[10] = (f[10] + f[14]);
        f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
        ;
        f[3] = (f[3] + f[7] + (0));
        f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
        f[11] = (f[11] + f[15]);
        f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
        f[3] = (f[3] + f[7] + (0));
        f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
        f[11] = (f[11] + f[15]);
        f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
        ;
        f[0] = (f[0] + f[5] + ((u == 2) ? t : 0));
        f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
        f[10] = (f[10] + f[15]);
        f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
        f[0] = (f[0] + f[5] + ((u == 5) ? t : 0));
        f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
        f[10] = (f[10] + f[15]);
        f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
        ;
        f[1] = (f[1] + f[6] + (0));
        f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
        f[11] = (f[11] + f[12]);
        f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
        f[1] = (f[1] + f[6] + (0));
        f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
        f[11] = (f[11] + f[12]);
        f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
        ;
        f[2] = (f[2] + f[7] + ((u == 9) ? t : 0));
        f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
        f[8] = (f[8] + f[13]);
        f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
        f[2] = (f[2] + f[7] + ((u == 3) ? t : 0));
        f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
        f[8] = (f[8] + f[13]);
        f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
        ;
        f[3] = (f[3] + f[4] + ((u == 6) ? t : 0));
        f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
        f[9] = (f[9] + f[14]);
        f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
        f[3] = (f[3] + f[4] + (0));
        f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
        f[9] = (f[9] + f[14]);
        f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
        ;
      }

      f[0] = (f[0] + f[4] + (0));
      f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
      f[8] = (f[8] + f[12]);
      f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
      f[0] = (f[0] + f[4] + (0));
      f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
      f[8] = (f[8] + f[12]);
      f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
      ;
      f[1] = (f[1] + f[5] + (0));
      f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
      f[9] = (f[9] + f[13]);
      f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
      f[1] = (f[1] + f[5] + (0));
      f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
      f[9] = (f[9] + f[13]);
      f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
      ;
      f[2] = (f[2] + f[6] + (0));
      f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
      f[10] = (f[10] + f[14]);
      f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
      f[2] = (f[2] + f[6] + (0));
      f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
      f[10] = (f[10] + f[14]);
      f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
      ;
      f[3] = (f[3] + f[7] + (t));
      f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
      f[11] = (f[11] + f[15]);
      f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
      f[3] = (f[3] + f[7] + (0));
      f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
      f[11] = (f[11] + f[15]);
      f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
      ;
      f[0] = (f[0] + f[5] + (0));
      f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
      f[10] = (f[10] + f[15]);
      f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
      f[0] = (f[0] + f[5] + (0));
      f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
      f[10] = (f[10] + f[15]);
      f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
      ;
      f[1] = (f[1] + f[6] + (0));
      f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
      f[11] = (f[11] + f[12]);
      f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
      f[1] = (f[1] + f[6] + (0));
      f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
      f[11] = (f[11] + f[12]);
      f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
      ;
      f[2] = (f[2] + f[7] + (0));
      f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
      f[8] = (f[8] + f[13]);
      f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
      f[2] = (f[2] + f[7] + (0));
      f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
      f[8] = (f[8] + f[13]);
      f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
      ;
      f[3] = (f[3] + f[4] + (0));
      f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
      f[9] = (f[9] + f[14]);
      f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
      f[3] = (f[3] + f[4] + (0));
      f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
      f[9] = (f[9] + f[14]);
      f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
      ;

      f[0] = (f[0] + f[4] + (0));
      f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
      f[8] = (f[8] + f[12]);
      f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
      f[0] = (f[0] + f[4] + (t));
      f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
      f[8] = (f[8] + f[12]);
      f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
      ;
      f[1] = (f[1] + f[5] + (0));
      f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
      f[9] = (f[9] + f[13]);
      f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
      f[1] = (f[1] + f[5] + (0));
      f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
      f[9] = (f[9] + f[13]);
      f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
      ;
      f[2] = (f[2] + f[6] + (0));
      f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
      f[10] = (f[10] + f[14]);
      f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
      f[2] = (f[2] + f[6] + (0));
      f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
      f[10] = (f[10] + f[14]);
      f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
      ;
      f[3] = (f[3] + f[7] + (0));
      f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
      f[11] = (f[11] + f[15]);
      f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
      f[3] = (f[3] + f[7] + (0));
      f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
      f[11] = (f[11] + f[15]);
      f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
      ;
      f[0] = (f[0] + f[5] + (0));
      f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
      f[10] = (f[10] + f[15]);
      f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
      f[0] = (f[0] + f[5] + (0));
      f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
      f[10] = (f[10] + f[15]);
      f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
      ;
      f[1] = (f[1] + f[6] + (0));
      f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
      f[11] = (f[11] + f[12]);
      f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
      f[1] = (f[1] + f[6] + (0));
      f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
      f[11] = (f[11] + f[12]);
      f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
      ;
      f[2] = (f[2] + f[7] + (0));
      f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
      f[8] = (f[8] + f[13]);
      f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
      f[2] = (f[2] + f[7] + (0));
      f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
      f[8] = (f[8] + f[13]);
      f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
      ;
      f[3] = (f[3] + f[4] + (0));
      f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
      f[9] = (f[9] + f[14]);
      f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
      f[3] = (f[3] + f[4] + (0));
      f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
      f[9] = (f[9] + f[14]);
      f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
      ;

      f[0] = (f[0] + f[4] + (0));
      f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
      f[8] = (f[8] + f[12]);
      f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
      f[0] = (f[0] + f[4] + (0));
      f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
      f[8] = (f[8] + f[12]);
      f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
      ;
      f[1] = (f[1] + f[5] + (0));
      f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
      f[9] = (f[9] + f[13]);
      f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
      f[1] = (f[1] + f[5] + (0));
      f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
      f[9] = (f[9] + f[13]);
      f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
      ;
      f[2] = (f[2] + f[6] + (0));
      f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
      f[10] = (f[10] + f[14]);
      f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
      f[2] = (f[2] + f[6] + (0));
      f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
      f[10] = (f[10] + f[14]);
      f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
      ;
      f[3] = (f[3] + f[7] + (0));
      f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
      f[11] = (f[11] + f[15]);
      f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
      f[3] = (f[3] + f[7] + (0));
      f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
      f[11] = (f[11] + f[15]);
      f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
      ;
      f[0] = (f[0] + f[5] + (t));
      f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
      f[10] = (f[10] + f[15]);
      f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
      f[0] = (f[0] + f[5] + (0));
      f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
      f[10] = (f[10] + f[15]);
      f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
      ;
      f[1] = (f[1] + f[6] + (0));
      f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
      f[11] = (f[11] + f[12]);
      f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
      f[1] = (f[1] + f[6] + (0));
      f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
      f[11] = (f[11] + f[12]);
      f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
      ;
      f[2] = (f[2] + f[7] + (0));
      f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
      f[8] = (f[8] + f[13]);
      f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
      f[2] = (f[2] + f[7] + (0));
      f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
      f[8] = (f[8] + f[13]);
      f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
      ;
      f[3] = (f[3] + f[4] + (0));
      f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
      f[9] = (f[9] + f[14]);
      f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
      f[3] = (f[3] + f[4] + (0));
      f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
      f[9] = (f[9] + f[14]);
      f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
      ;

      o[0] = a[0] ^ f[0] ^ f[8];
      o[1] = a[1] ^ f[1] ^ f[9];
      o[2] = a[2] ^ f[2] ^ f[10];
      o[3] = a[3] ^ f[3] ^ f[11];
      o[4] = a[4] ^ f[4] ^ f[12];
      o[5] = a[5] ^ f[5] ^ f[13];
      o[6] = (a[6] ^ f[6] ^ f[14]) & 0xffff;
    }

    if (s < (1 << (200 / (9 + 1)))) {
      for (uint v = 0; v < 2; ++v) {
        if (!v) {
          g = o[0] & 0xffffffff;
          h = o[0] >> 32;
          i = o[1] & 0xffffffff;
          j = o[1] >> 32;
          k = o[2] & 0xffffffff;
          l = o[2] >> 32;
          m = o[3] & 0xffffffff;
        } else {
          g = ((o[3] >> 8) | (o[4] << (64 - 8))) & 0xffffffff;
          h = ((o[3] >> 8) | (o[4] << (64 - 8))) >> 32;
          i = ((o[4] >> 8) | (o[5] << (64 - 8))) & 0xffffffff;
          j = ((o[4] >> 8) | (o[5] << (64 - 8))) >> 32;
          k = ((o[5] >> 8) | (o[6] << (64 - 8))) & 0xffffffff;
          l = ((o[5] >> 8) | (o[6] << (64 - 8))) >> 32;
          m = (o[6] >> 8) & 0xffffffff;
        }

        uint w = E(0, g);
        uint x = G(c, w);
        if (x >= 684) {
          ++q;
        } else {
          n.slot.xi[0] = ((h << 24) | (g >> 8));
          n.slot.xi[1] = ((i << 24) | (h >> 8));
          n.slot.xi[2] = ((j << 24) | (i >> 8));
          n.slot.xi[3] = ((k << 24) | (j >> 8));
          n.slot.xi[4] = ((l << 24) | (k >> 8));
          n.slot.xi[5] = ((m << 24) | (l >> 8));
          n.slot.xi[(((0) == 0) ? 6 : ((0) == 1) ? 6 : ((0) == 2) ? 5 : ((0) == 3) ? 5 : ((0) == 4) ? 4 : ((0) == 5) ? 4 : ((0) == 6) ? 3 : ((0) == 7) ? 2 : 1)] = s * 2 + v;
          __global char* y = A(b, 0, w, x);
          *(__global uint8*)y = n.ui8;
        }
      }
    }
  }
}
uint J(uint a, __global char* b, __global char* c, uint d, uint e, uint f, __local uint* g, __local uint* h, __global uint* i) {
  uint j = 0;
  uint k, l, m, n, o, p;

  slot_t q;
  __global slot_t* r = 0;

  if (e < 684 && f < 684) {
    k = *g;
    l = *(g += 684);
    if (a <= 7)
      m = *(g += 684);
    if (a <= 6)
      n = *(g += 684);
    if (a <= 4)
      o = *(g += 684);
    if (a <= 2)
      p = *(g += 684);

    k ^= *h;
    l ^= *(h += 684);
    if (a <= 7)
      m ^= *(h += 684);
    if (a <= 6)
      n ^= *(h += 684);
    if (a <= 4)
      o ^= *(h += 684);
    if (a <= 2)
      p ^= *(h += 684);

    if (!(a & 0x1)) {
      k = (k >> 24) | (l << (32 - 24));

      q.slot.xi[0] = l;
      q.slot.xi[1] = m;
      q.slot.xi[2] = n;
      q.slot.xi[3] = o;
      q.slot.xi[4] = p;
    } else {
      q.slot.xi[0] = ((l << 24) | (k >> 8));
      if (a <= 7)
        q.slot.xi[1] = ((m << 24) | (l >> 8));
      if (a <= 6)
        q.slot.xi[2] = ((n << 24) | (m >> 8));
      if (a <= 5)
        q.slot.xi[3] = ((o << 24) | (n >> 8));
      if (a <= 3)
        q.slot.xi[4] = ((p << 24) | (o >> 8));
      if (a <= 1)
        q.slot.xi[5] = ((p >> 8));
    }
    q.slot.xi[(((a) == 0) ? 6 : ((a) == 1) ? 6 : ((a) == 2) ? 5 : ((a) == 3) ? 5 : ((a) == 4) ? 4 : ((a) == 5) ? 4 : ((a) == 6) ? 3 : ((a) == 7) ? 2 : 1)] = ((d << 20) | ((f & 0x3ff) << 10) | (e & 0x3ff));

    if (k || l) {
      uint s = E(a, k);
      uint t = G(i, s);
      if (t >= 684) {
        j = 1;
      } else {
        r = (__global slot_t*)A(c, a, s, t);
      }
    }
  }

  if (r) {
    if (a >= 8)
      *(__global uint2*)r = q.ui2[0];
    else
      *(__global uint8*)r = q.ui8;
  }
  return j;
}

uint K(uint a, __global char* b, __global char* c, uint d, uint e, uint f, __local uint* g, __local uint* h, __global uint* i, __local ushort* j) {
  uint k = 0;
  uint l, m, n, o, p, q;
  uint r = get_local_id(0) / 1;
  uint s = get_local_id(0) % 1;

  slot_t t;
  uint u;
  uint v;

  if (!s)
    j[r] = 684;
  barrier(1);

  if (e < 684 && f < 684) {
    l = *g;
    m = *(g += 684);
    if (a <= 7)
      n = *(g += 684);
    if (a <= 6)
      o = *(g += 684);
    if (a <= 4)
      p = *(g += 684);
    if (a <= 2)
      q = *(g += 684);

    l ^= *h;
    m ^= *(h += 684);
    if (a <= 7)
      n ^= *(h += 684);
    if (a <= 6)
      o ^= *(h += 684);
    if (a <= 4)
      p ^= *(h += 684);
    if (a <= 2)
      q ^= *(h += 684);

    if (!(a & 0x1)) {
      l = (l >> 24) | (m << (32 - 24));

      t.slot.xi[0] = m;
      t.slot.xi[1] = n;
      t.slot.xi[2] = o;
      t.slot.xi[3] = p;
      t.slot.xi[4] = q;
    } else {
      t.slot.xi[0] = ((m << 24) | (l >> 8));
      if (a <= 7)
        t.slot.xi[1] = ((n << 24) | (m >> 8));
      if (a <= 6)
        t.slot.xi[2] = ((o << 24) | (n >> 8));
      if (a <= 5)
        t.slot.xi[3] = ((p << 24) | (o >> 8));
      if (a <= 3)
        t.slot.xi[4] = ((q << 24) | (p >> 8));
      if (a <= 1)
        t.slot.xi[5] = ((q >> 8));
    }
    t.slot.xi[(((a) == 0) ? 6 : ((a) == 1) ? 6 : ((a) == 2) ? 5 : ((a) == 3) ? 5 : ((a) == 4) ? 4 : ((a) == 5) ? 4 : ((a) == 6) ? 3 : ((a) == 7) ? 2 : 1)] = ((d << 20) | ((f & 0x3ff) << 10) | (e & 0x3ff));
    v = E(a, l);

    if ((l || m) && !s) {
      j[r] = G(i, v);
    }
  }

  barrier(1);
  if (j[r] < 684) {
    __global slot_t* w = (__global slot_t*)A(c, a, v, j[r]);
    *(((__global uint4*)w) + s) = t.ui4[s];
  }

  return k;
}

void L(uint a, __global char* b, __global char* c, __global uint* d, __local uint* e, __local ushort* f, __local ushort* g, __local uint* h, __global uint* i, __global uint* j, __local uint* k, __local ushort* l, __local ushort* m) {
  uint n, o;
  uint p = 0;
  uint q = get_group_id(0);
  if (q >= (1 << 12))
    return;

  for (n = get_local_id(0); n < (1 << (20 - 12)); n += get_local_size(0))
    k[n] = 684;
  for (n = get_local_id(0); n < 684; n += get_local_size(0))
    l[n] = 684;
  if (get_local_id(0) == 0)
    *h = p = F(i, q);
  barrier(1);
  if (get_local_id(0))
    p = *h;

  barrier(1);

  for (uint r = 0; r < 1; ++r) {
    for (n = get_local_id(0); n < p; n += get_local_size(0)) {
      uint s = n;
      uint t = n;
      for (o = 0; o < (((a - 1) == 0) ? 6 : ((a - 1) == 1) ? 6 : ((a - 1) == 2) ? 5 : ((a - 1) == 3) ? 5 : ((a - 1) == 4) ? 4 : ((a - 1) == 5) ? 4 : ((a - 1) == 6) ? 3 : ((a - 1) == 7) ? 2 : 1); ++o)
        e[o * 684 + t] = *((__global uint*)B(b, a - 1, q, s) + o);
      uint u = e[0 * 684 + t];
      uint v = ((u & ((((a - 1) + 1) % 2) ? 0xf000 : 0xf0000)) >> ((((a - 1) + 1) % 2) ? 3 * 4 : 4 * 4)) |
               ((u & ((12 == 12) ? ((((a - 1) + 1) % 2) ? 0x00f0 : 0xf000) : (12 == 13) ? ((((a - 1) + 1) % 2) ? 0x00e0 : 0xe000) : (12 == 14) ? ((((a - 1) + 1) % 2) ? 0x00c0 : 0xc000) : (12 == 15) ? ((((a - 1) + 1) % 2) ? 0x0080 : 0x8000) : 0)) >> ((12 == 12) ? ((((a - 1) + 1) % 2) ? 0 : 8) : (12 == 13) ? ((((a - 1) + 1) % 2) ? 1 : 9) : (12 == 14) ? ((((a - 1) + 1) % 2) ? 2 : 10) : (12 == 15) ? ((((a - 1) + 1) % 2) ? 3 : 11) : 0));
      l[n] = atomic_xchg(&k[v], n);
    }

    if (!get_local_id(0))
      *h = 0;
    uint w = 684 + (get_local_size(0) - 684 % get_local_size(0)) - 1;
    barrier(1);
    for (uint x = get_local_id(0); x <= w; x += get_local_size(0)) {
      uint y = (x < 684) ? l[x] : 684;
      while (y < 684) {
        uint z = atomic_add(h, 1);
        if (z < (684 * 67 / 100)) {
          f[z] = x;
          g[z] = y;
        } else {
          atomic_sub(h, 1);
        }
        y = l[y];
      }

      barrier(1);

      uint aa = *h;

      while (aa > 0) {
        uint ab, ac = 684, ad = 684;
        __local uint *ae, *af;
        uint ag = get_local_id(0) / 1;
        if (ag < aa) {
          ac = f[aa - 1 - ag];
          ad = g[aa - 1 - ag];
          ae = (__local uint*)&e[ac];
          af = (__local uint*)&e[ad];
        }

        if (1 > 1) {
          K(a, b, c, q, ac, ad, ae, af, j, m);
        } else {
          J(a, b, c, q, ac, ad, ae, af, j);
        }

        if (!get_local_id(0))
          *h -= min(*h, (uint)get_local_size(0) / 1);

        barrier(1);
        aa = *h;
        barrier(1);
      }
      barrier(1);
    }
  }
}
__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void M(__global char* a, __global char* b, __global uint* c, __global uint* d, __global uint* e) {
  __local uint f[((((1 - 1) == 0) ? 6 : ((1 - 1) == 1) ? 6 : ((1 - 1) == 2) ? 5 : ((1 - 1) == 3) ? 5 : ((1 - 1) == 4) ? 4 : ((1 - 1) == 5) ? 4 : ((1 - 1) == 6) ? 3 : ((1 - 1) == 7) ? 2 : 1) * 684)];
  __local ushort g[((684 * 67 / 100))];
  __local ushort h[((684 * 67 / 100))];
  __local uint i;
  __local uint j[((1 << (20 - 12)))];
  __local ushort k[(684)];
  __local ushort l[((1 > 1) ? 128 / 1 : 0)];
  L((1), a, b, e, f, g, h, &i, c, d, j, k, l);
}
__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void N(__global char* a, __global char* b, __global uint* c, __global uint* d, __global uint* e) {
  __local uint f[((((2 - 1) == 0) ? 6 : ((2 - 1) == 1) ? 6 : ((2 - 1) == 2) ? 5 : ((2 - 1) == 3) ? 5 : ((2 - 1) == 4) ? 4 : ((2 - 1) == 5) ? 4 : ((2 - 1) == 6) ? 3 : ((2 - 1) == 7) ? 2 : 1) * 684)];
  __local ushort g[((684 * 67 / 100))];
  __local ushort h[((684 * 67 / 100))];
  __local uint i;
  __local uint j[((1 << (20 - 12)))];
  __local ushort k[(684)];
  __local ushort l[((1 > 1) ? 128 / 1 : 0)];
  L((2), a, b, e, f, g, h, &i, c, d, j, k, l);
}
__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void O(__global char* a, __global char* b, __global uint* c, __global uint* d, __global uint* e) {
  __local uint f[((((3 - 1) == 0) ? 6 : ((3 - 1) == 1) ? 6 : ((3 - 1) == 2) ? 5 : ((3 - 1) == 3) ? 5 : ((3 - 1) == 4) ? 4 : ((3 - 1) == 5) ? 4 : ((3 - 1) == 6) ? 3 : ((3 - 1) == 7) ? 2 : 1) * 684)];
  __local ushort g[((684 * 67 / 100))];
  __local ushort h[((684 * 67 / 100))];
  __local uint i;
  __local uint j[((1 << (20 - 12)))];
  __local ushort k[(684)];
  __local ushort l[((1 > 1) ? 128 / 1 : 0)];
  L((3), a, b, e, f, g, h, &i, c, d, j, k, l);
}
__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void P(__global char* a, __global char* b, __global uint* c, __global uint* d, __global uint* e) {
  __local uint f[((((4 - 1) == 0) ? 6 : ((4 - 1) == 1) ? 6 : ((4 - 1) == 2) ? 5 : ((4 - 1) == 3) ? 5 : ((4 - 1) == 4) ? 4 : ((4 - 1) == 5) ? 4 : ((4 - 1) == 6) ? 3 : ((4 - 1) == 7) ? 2 : 1) * 684)];
  __local ushort g[((684 * 67 / 100))];
  __local ushort h[((684 * 67 / 100))];
  __local uint i;
  __local uint j[((1 << (20 - 12)))];
  __local ushort k[(684)];
  __local ushort l[((1 > 1) ? 128 / 1 : 0)];
  L((4), a, b, e, f, g, h, &i, c, d, j, k, l);
}
__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void Q(__global char* a, __global char* b, __global uint* c, __global uint* d, __global uint* e) {
  __local uint f[((((5 - 1) == 0) ? 6 : ((5 - 1) == 1) ? 6 : ((5 - 1) == 2) ? 5 : ((5 - 1) == 3) ? 5 : ((5 - 1) == 4) ? 4 : ((5 - 1) == 5) ? 4 : ((5 - 1) == 6) ? 3 : ((5 - 1) == 7) ? 2 : 1) * 684)];
  __local ushort g[((684 * 67 / 100))];
  __local ushort h[((684 * 67 / 100))];
  __local uint i;
  __local uint j[((1 << (20 - 12)))];
  __local ushort k[(684)];
  __local ushort l[((1 > 1) ? 128 / 1 : 0)];
  L((5), a, b, e, f, g, h, &i, c, d, j, k, l);
}
__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void R(__global char* a, __global char* b, __global uint* c, __global uint* d, __global uint* e) {
  __local uint f[((((6 - 1) == 0) ? 6 : ((6 - 1) == 1) ? 6 : ((6 - 1) == 2) ? 5 : ((6 - 1) == 3) ? 5 : ((6 - 1) == 4) ? 4 : ((6 - 1) == 5) ? 4 : ((6 - 1) == 6) ? 3 : ((6 - 1) == 7) ? 2 : 1) * 684)];
  __local ushort g[((684 * 67 / 100))];
  __local ushort h[((684 * 67 / 100))];
  __local uint i;
  __local uint j[((1 << (20 - 12)))];
  __local ushort k[(684)];
  __local ushort l[((1 > 1) ? 128 / 1 : 0)];
  L((6), a, b, e, f, g, h, &i, c, d, j, k, l);
}
__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void S(__global char* a, __global char* b, __global uint* c, __global uint* d, __global uint* e) {
  __local uint f[((((7 - 1) == 0) ? 6 : ((7 - 1) == 1) ? 6 : ((7 - 1) == 2) ? 5 : ((7 - 1) == 3) ? 5 : ((7 - 1) == 4) ? 4 : ((7 - 1) == 5) ? 4 : ((7 - 1) == 6) ? 3 : ((7 - 1) == 7) ? 2 : 1) * 684)];
  __local ushort g[((684 * 67 / 100))];
  __local ushort h[((684 * 67 / 100))];
  __local uint i;
  __local uint j[((1 << (20 - 12)))];
  __local ushort k[(684)];
  __local ushort l[((1 > 1) ? 128 / 1 : 0)];
  L((7), a, b, e, f, g, h, &i, c, d, j, k, l);
}
__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void T(__global char* a, __global char* b, __global uint* c, __global uint* d, __global uint* e) {
  __local uint f[((((8 - 1) == 0) ? 6 : ((8 - 1) == 1) ? 6 : ((8 - 1) == 2) ? 5 : ((8 - 1) == 3) ? 5 : ((8 - 1) == 4) ? 4 : ((8 - 1) == 5) ? 4 : ((8 - 1) == 6) ? 3 : ((8 - 1) == 7) ? 2 : 1) * 684)];
  __local ushort g[((684 * 67 / 100))];
  __local ushort h[((684 * 67 / 100))];
  __local uint i;
  __local uint j[((1 << (20 - 12)))];
  __local ushort k[(684)];
  __local ushort l[((1 > 1) ? 128 / 1 : 0)];
  L((8), a, b, e, f, g, h, &i, c, d, j, k, l);
}

void U(__global potential_sols_t* a, uint b, uint c) {
  uint d = atomic_add(&a->nr, 1);
  if (d >= 4096)
    return;
  a->values[d][0] = b;
  a->values[d][1] = c;
}

__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void V(__global char* a, __global potential_sols_t* b, __global uint* c) {
  __local uint d[(684)];
  __local uint e[(684)];

  uint f;
  uint g, h;
  __global char* i;
  uint j, k;
  __local uint l[((1 << (20 - 12)))];
  __local ushort m[(684)];

  if (!get_global_id(0))
    b->nr = 0;
  barrier(2);

  uint n = (get_global_id(0) / get_local_size(0));
  if (n >= (1 << 12))
    return;

  __local uint o;
  for (g = get_local_id(0); g < (1 << (20 - 12)); g += get_local_size(0))
    l[g] = 684;
  for (g = get_local_id(0); g < 684; g += get_local_size(0))
    m[g] = 684;
  if (get_local_id(0) == 0)
    o = f = F(c, n);
  barrier(1);
  if (get_local_id(0))
    f = o;

  barrier(1);

  for (g = get_local_id(0); g < f; g += get_local_size(0)) {
    ulong p = *(__global ulong*)A(a, 9 - 1, n, g);
    uint j = d[g] = p >> 32;
    uint q = e[g] = p & 0xffffffff;
    uint r = ((q & ((((9 - 1) + 1) % 2) ? 0xf000 : 0xf0000)) >> ((((9 - 1) + 1) % 2) ? 3 * 4 : 4 * 4)) |
             ((q & ((12 == 12) ? ((((9 - 1) + 1) % 2) ? 0x00f0 : 0xf000) : (12 == 13) ? ((((9 - 1) + 1) % 2) ? 0x00e0 : 0xe000) : (12 == 14) ? ((((9 - 1) + 1) % 2) ? 0x00c0 : 0xc000) : (12 == 15) ? ((((9 - 1) + 1) % 2) ? 0x0080 : 0x8000) : 0)) >> ((12 == 12) ? ((((9 - 1) + 1) % 2) ? 0 : 8) : (12 == 13) ? ((((9 - 1) + 1) % 2) ? 1 : 9) : (12 == 14) ? ((((9 - 1) + 1) % 2) ? 2 : 10) : (12 == 15) ? ((((9 - 1) + 1) % 2) ? 3 : 11) : 0));
    m[g] = atomic_xchg(&l[r], g);
  }

  barrier(1);

  for (g = get_local_id(0); g < f; g += get_local_size(0)) {
    uint s = e[g];
    h = m[g];
    while (h < 684) {
      if (s == e[h]) {
        U(b, d[g], d[h]);
        return;
      }
      h = m[h];
    }
  }
}

__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void W(__global char* a, __global char* b, __global sols_t* c, __global uint* d, __global uint* e, __global char* f, __global char* g, __global char* h, __global char* i, __global char* j, __global char* k, __global char* l, __global potential_sols_t* m) {
  __local uint n[(1 << 9)], o[(1 << (9 - 1))];
  __global char* p[] = { abfghijkl;

  if ((get_global_id(0) / get_local_size(0)) < m->nr && (get_global_id(0) / get_local_size(0)) < 4096) {
    __local uint q;
    if (get_local_id(0) == 0) {
      q = 0;
      n[0] = m->values[(get_global_id(0) / get_local_size(0))][0];
      n[1] = m->values[(get_global_id(0) / get_local_size(0))][1];
    }
    barrier(1);

    for (int r = 7; r >= 0; --r) {
      if (r % 2) {
        for (uint s = get_local_id(0); s < (1 << (8 - r)); s += get_local_size(0)) {
          o[s * 2 + 1] = *C(p[r], r, (n[s] >> 20), ((n[s] >> 10) & 0x3ff));
          o[s * 2] = *C(p[r], r, (n[s] >> 20), (n[s] & 0x3ff));
        }
      } else {
        for (uint s = get_local_id(0); s < (1 << (8 - r)); s += get_local_size(0)) {
          n[s * 2 + 1] = *C(p[r], r, (o[s] >> 20), ((o[s] >> 10) & 0x3ff));
          n[s * 2] = *C(p[r], r, (o[s] >> 20), (o[s] & 0x3ff));
        }
      }
      barrier(1);
    }

    int t = n[256 * 2 - 1];
    for (uint u = 3 + get_local_id(0); u < 256 * 2 - 2; u += get_local_size(0))
      if (n[u] == t)
        atomic_add(&q, 1);
    barrier(1);

    __local uint v;
    if (get_local_id(0) == 0 && !q)
      v = atomic_add(&c->nr, 1);
    barrier(1);
    if (v < 11 && !q) {
      for (uint s = get_local_id(0); s < (1 << 9); s += get_local_size(0))
        c->values[v][s] = n[s];
      if (get_local_id(0) == 0)
        c->valid[v] = 1;
    }
    barrier(1);
  }
}