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
  return a + (c * 688 + d) * (((((b) == 0) ? 6 : ((b) == 1) ? 6 : ((b) == 2) ? 5 : ((b) == 3) ? 5 : ((b) == 4) ? 4 : ((b) == 5) ? 4 : ((b) == 6) ? 3 : ((b) == 7) ? 2 : 1) >= 4) ? 32 : ((((b) == 0) ? 6 : ((b) == 1) ? 6 : ((b) == 2) ? 5 : ((b) == 3) ? 5 : ((b) == 4) ? 4 : ((b) == 5) ? 4 : ((b) == 6) ? 3 : ((b) == 7) ? 2 : 1) >= 2) ? 16 : 8);
}

__global uint* B(__global char* a, uint b, uint c, uint d) {
  return (__global uint*)A(a, b, c, d);
}

__global uint* C(__global char* a, uint b, uint c, uint d) {
  return B(a, b, c, d) + (((b) == 0) ? 6 : ((b) == 1) ? 6 : ((b) == 2) ? 5 : ((b) == 3) ? 5 : ((b) == 4) ? 4 : ((b) == 5) ? 4 : ((b) == 6) ? 3 : ((b) == 7) ? 2 : 1);
}

uint D(uint a, uint b) {
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
  }

  return c;
}

void E(uint* a, uint* b, uint c) {
  if ((32 / 10) == 3) {
    uint d = (0x55555555 * c + (c >> 1) - (c >> 3)) >> 30;
    *a = (c - d) * 0xAAAAAAAB;
    *b = 10 * d;
  } else if ((32 / 10) == 6) {
    uint d = (0x55555555 * c + (c >> 1) - (c >> 3)) >> 29;
    *a = (c - d) * 0xAAAAAAAB * 2;
    *b = 10 * d;
  } else

  {
    *a = c / (32 / 10);
    *b = 10 * (c % (32 / 10));
  }
}
uint F(uint a, __global uint* b, uint c) {
  uint d, e, f;
  E(&d, &e, c);
  f = (b[d] >> e) & ((1 << 10) - 1);
  f = min(f, (uint)688);
  return f;
}

uint G(uint a, __local uint* b, uint c) {
  uint d, e, f;
  E(&d, &e, c);
  f = (b[d] >> e) & ((1 << 10) - 1);
  f = min(f, (uint)688);
  return f;
}

uint H(uint a, __global uint* b, uint c) {
  uint d, e;
  E(&d, &e, c);
  uint f = atomic_add(b + d, 1U << e);
  f = (f >> e) & ((1 << 10) - 1);

  return f;
}

uint I(uint a, __local uint* b, uint c) {
  uint d, e;
  E(&d, &e, c);
  uint f = atomic_add(b + d, 1U << e);
  f = (f >> e) & ((1 << 10) - 1);

  return f;
}
__kernel void J(uint a, uint b, __global uint* c, __global uint* d, __global uint* e, __global sols_t* f, __global potential_sols_t* g, __global uint* h) {
  if (get_global_id(0) < (4096 + (32 / 10) - 1) / (32 / 10)) {
    e[get_global_id(0)] = 0;
  }
  if (!get_global_id(0))
    f->nr = f->likely_invalids = g->nr = h[0] = h[1] = 0;
}

__constant ulong Ga[] = {
    0x6a09e667f3bcc908, 0xbb67ae8584caa73b, 0x3c6ef372fe94f82b, 0xa54ff53a5f1d36f1, 0x510e527fade682d1, 0x9b05688c2b3e6c1f, 0x1f83d9abfb41bd6b, 0x5be0cd19137e2179,
};
__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void K(uint a, __constant ulong* b, __global char* c, __global uint* d, __global uint* e) {
  ulong f[16];

  uint g, h, i, j, k, l, m;
  slot_t n;
  ulong o[7];

  uint p = get_global_id(0);

  ulong q = (ulong)p << 32;

  f[0] = b[0];
  f[1] = b[1];
  f[2] = b[2];
  f[3] = b[3];
  f[4] = b[4];
  f[5] = b[5];
  f[6] = b[6];
  f[7] = b[7];
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

  f[0] = (f[0] + f[4]);
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
  f[0] = (f[0] + f[4] + (q));
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[5]);
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
  f[1] = (f[1] + f[5]);
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[6]);
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
  f[2] = (f[2] + f[6]);
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[7]);
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
  f[3] = (f[3] + f[7]);
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
  ;
  f[0] = (f[0] + f[5]);
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
  f[0] = (f[0] + f[5]);
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[7]);
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
  f[2] = (f[2] + f[7]);
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[4]);
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
  f[3] = (f[3] + f[4]);
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
  ;

  f[0] = (f[0] + f[4]);
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
  f[0] = (f[0] + f[4]);
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[5]);
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
  f[1] = (f[1] + f[5]);
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[6]);
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
  f[2] = (f[2] + f[6]);
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[7]);
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
  f[3] = (f[3] + f[7]);
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
  ;
  f[0] = (f[0] + f[5] + (q));
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
  f[0] = (f[0] + f[5]);
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[7]);
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
  f[2] = (f[2] + f[7]);
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[4]);
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
  f[3] = (f[3] + f[4]);
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
  ;

  f[0] = (f[0] + f[4]);
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
  f[0] = (f[0] + f[4]);
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[5]);
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
  f[1] = (f[1] + f[5]);
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[6]);
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
  f[2] = (f[2] + f[6]);
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[7]);
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
  f[3] = (f[3] + f[7]);
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
  ;
  f[0] = (f[0] + f[5]);
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
  f[0] = (f[0] + f[5]);
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[7]);
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
  f[2] = (f[2] + f[7] + (q));
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[4]);
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
  f[3] = (f[3] + f[4]);
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
  ;

  f[0] = (f[0] + f[4]);
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
  f[0] = (f[0] + f[4]);
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[5]);
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
  f[1] = (f[1] + f[5] + (q));
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[6]);
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
  f[2] = (f[2] + f[6]);
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[7]);
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
  f[3] = (f[3] + f[7]);
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
  ;
  f[0] = (f[0] + f[5]);
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
  f[0] = (f[0] + f[5]);
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[7]);
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
  f[2] = (f[2] + f[7]);
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[4]);
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
  f[3] = (f[3] + f[4]);
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
  ;

  f[0] = (f[0] + f[4]);
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
  f[0] = (f[0] + f[4]);
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[5]);
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
  f[1] = (f[1] + f[5]);
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[6]);
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
  f[2] = (f[2] + f[6]);
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[7]);
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
  f[3] = (f[3] + f[7]);
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
  ;
  f[0] = (f[0] + f[5]);
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
  f[0] = (f[0] + f[5] + (q));
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[7]);
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
  f[2] = (f[2] + f[7]);
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[4]);
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
  f[3] = (f[3] + f[4]);
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
  ;

  f[0] = (f[0] + f[4]);
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
  f[0] = (f[0] + f[4]);
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[5]);
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
  f[1] = (f[1] + f[5]);
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[6]);
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
  f[2] = (f[2] + f[6]);
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[7]);
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
  f[3] = (f[3] + f[7]);
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
  ;
  f[0] = (f[0] + f[5]);
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
  f[0] = (f[0] + f[5]);
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[7]);
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
  f[2] = (f[2] + f[7]);
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[4] + (q));
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
  f[3] = (f[3] + f[4]);
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
  ;

  f[0] = (f[0] + f[4]);
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
  f[0] = (f[0] + f[4]);
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[5] + (q));
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
  f[1] = (f[1] + f[5]);
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[6]);
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
  f[2] = (f[2] + f[6]);
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[7]);
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
  f[3] = (f[3] + f[7]);
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
  ;
  f[0] = (f[0] + f[5]);
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
  f[0] = (f[0] + f[5]);
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[7]);
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
  f[2] = (f[2] + f[7]);
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[4]);
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
  f[3] = (f[3] + f[4]);
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
  ;

  f[0] = (f[0] + f[4]);
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
  f[0] = (f[0] + f[4]);
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[5]);
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
  f[1] = (f[1] + f[5]);
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[6]);
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
  f[2] = (f[2] + f[6] + (q));
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[7]);
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
  f[3] = (f[3] + f[7]);
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
  ;
  f[0] = (f[0] + f[5]);
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
  f[0] = (f[0] + f[5]);
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[7]);
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
  f[2] = (f[2] + f[7]);
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[4]);
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
  f[3] = (f[3] + f[4]);
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
  ;

  f[0] = (f[0] + f[4]);
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
  f[0] = (f[0] + f[4]);
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[5]);
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
  f[1] = (f[1] + f[5]);
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[6]);
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
  f[2] = (f[2] + f[6]);
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[7]);
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
  f[3] = (f[3] + f[7]);
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
  ;
  f[0] = (f[0] + f[5]);
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
  f[0] = (f[0] + f[5]);
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[7] + (q));
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
  f[2] = (f[2] + f[7]);
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[4]);
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
  f[3] = (f[3] + f[4]);
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
  ;

  f[0] = (f[0] + f[4]);
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
  f[0] = (f[0] + f[4]);
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[5]);
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
  f[1] = (f[1] + f[5]);
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[6]);
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
  f[2] = (f[2] + f[6]);
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[7] + (q));
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
  f[3] = (f[3] + f[7]);
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
  ;
  f[0] = (f[0] + f[5]);
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
  f[0] = (f[0] + f[5]);
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[7]);
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
  f[2] = (f[2] + f[7]);
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[4]);
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
  f[3] = (f[3] + f[4]);
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
  ;

  f[0] = (f[0] + f[4]);
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
  f[0] = (f[0] + f[4] + (q));
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[5]);
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
  f[1] = (f[1] + f[5]);
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[6]);
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
  f[2] = (f[2] + f[6]);
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[7]);
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
  f[3] = (f[3] + f[7]);
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
  ;
  f[0] = (f[0] + f[5]);
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
  f[0] = (f[0] + f[5]);
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[7]);
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
  f[2] = (f[2] + f[7]);
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[4]);
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
  f[3] = (f[3] + f[4]);
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
  ;

  f[0] = (f[0] + f[4]);
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 32);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 24);
  f[0] = (f[0] + f[4]);
  f[12] = rotate((f[12] ^ f[0]), (ulong)64 - 16);
  f[8] = (f[8] + f[12]);
  f[4] = rotate((f[4] ^ f[8]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[5]);
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 32);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 24);
  f[1] = (f[1] + f[5]);
  f[13] = rotate((f[13] ^ f[1]), (ulong)64 - 16);
  f[9] = (f[9] + f[13]);
  f[5] = rotate((f[5] ^ f[9]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[6]);
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 32);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 24);
  f[2] = (f[2] + f[6]);
  f[14] = rotate((f[14] ^ f[2]), (ulong)64 - 16);
  f[10] = (f[10] + f[14]);
  f[6] = rotate((f[6] ^ f[10]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[7]);
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 32);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 24);
  f[3] = (f[3] + f[7]);
  f[15] = rotate((f[15] ^ f[3]), (ulong)64 - 16);
  f[11] = (f[11] + f[15]);
  f[7] = rotate((f[7] ^ f[11]), (ulong)64 - 63);
  ;
  f[0] = (f[0] + f[5] + (q));
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 32);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 24);
  f[0] = (f[0] + f[5]);
  f[15] = rotate((f[15] ^ f[0]), (ulong)64 - 16);
  f[10] = (f[10] + f[15]);
  f[5] = rotate((f[5] ^ f[10]), (ulong)64 - 63);
  ;
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 32);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 24);
  f[1] = (f[1] + f[6]);
  f[12] = rotate((f[12] ^ f[1]), (ulong)64 - 16);
  f[11] = (f[11] + f[12]);
  f[6] = rotate((f[6] ^ f[11]), (ulong)64 - 63);
  ;
  f[2] = (f[2] + f[7]);
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 32);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 24);
  f[2] = (f[2] + f[7]);
  f[13] = rotate((f[13] ^ f[2]), (ulong)64 - 16);
  f[8] = (f[8] + f[13]);
  f[7] = rotate((f[7] ^ f[8]), (ulong)64 - 63);
  ;
  f[3] = (f[3] + f[4]);
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 32);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 24);
  f[3] = (f[3] + f[4]);
  f[14] = rotate((f[14] ^ f[3]), (ulong)64 - 16);
  f[9] = (f[9] + f[14]);
  f[4] = rotate((f[4] ^ f[9]), (ulong)64 - 63);
  ;

  o[0] = b[0] ^ f[0] ^ f[8];
  o[1] = b[1] ^ f[1] ^ f[9];
  o[2] = b[2] ^ f[2] ^ f[10];
  o[3] = b[3] ^ f[3] ^ f[11];
  o[4] = b[4] ^ f[4] ^ f[12];
  o[5] = b[5] ^ f[5] ^ f[13];
  o[6] = (b[6] ^ f[6] ^ f[14]) & 0xffff;

  for (uint r = 0; r < 2; ++r) {
    if (!r) {
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
    uint s = D(0, g);

    uint t = H((0), d, s);

    if (t < 688) {
      n.slot.xi[0] = ((h << 24) | (g >> 8));
      n.slot.xi[1] = ((i << 24) | (h >> 8));
      n.slot.xi[2] = ((j << 24) | (i >> 8));
      n.slot.xi[3] = ((k << 24) | (j >> 8));
      n.slot.xi[4] = ((l << 24) | (k >> 8));
      n.slot.xi[5] = ((m << 24) | (l >> 8));
      n.slot.xi[(((0) == 0) ? 6 : ((0) == 1) ? 6 : ((0) == 2) ? 5 : ((0) == 3) ? 5 : ((0) == 4) ? 4 : ((0) == 5) ? 4 : ((0) == 6) ? 3 : ((0) == 7) ? 2 : 1)] = p * 2 + r;
      __global char* u = A(c, 0, s, t);
      *(__global uint8*)u = n.ui8;
    }
  }
}
uint L(uint a, uint b, __global char* c, __global char* d, uint e, uint f, uint g, __local uint* h, __local uint* i, __global uint* j, __local uint* k) {
  uint l = 0;
  uint m, n, o, p, q, r;

  slot_t s;
  __global slot_t* t = 0;

  if (f < 688) {
    m = *h;
    n = *(h += 688);
    if (b <= 7)
      o = *(h += 688);
    if (b <= 6)
      p = *(h += 688);
    if (b <= 4)
      q = *(h += 688);
    if (b <= 2)
      r = *(h += 688);

    m ^= *i;
    n ^= *(i += 688);
    if (b <= 7)
      o ^= *(i += 688);
    if (b <= 6)
      p ^= *(i += 688);
    if (b <= 4)
      q ^= *(i += 688);
    if (b <= 2)
      r ^= *(i += 688);

    if (!(b & 0x1)) {
      m = (m >> 24) | (n << (32 - 24));

      s.slot.xi[0] = n;
      s.slot.xi[1] = o;
      s.slot.xi[2] = p;
      s.slot.xi[3] = q;
      s.slot.xi[4] = r;
    } else {
      s.slot.xi[0] = ((n << 24) | (m >> 8));
      if (b <= 7)
        s.slot.xi[1] = ((o << 24) | (n >> 8));
      if (b <= 6)
        s.slot.xi[2] = ((p << 24) | (o >> 8));
      if (b <= 5)
        s.slot.xi[3] = ((q << 24) | (p >> 8));
      if (b <= 3)
        s.slot.xi[4] = ((r << 24) | (q >> 8));
      if (b <= 1)
        s.slot.xi[5] = ((r >> 8));
    }
    s.slot.xi[(((b) == 0) ? 6 : ((b) == 1) ? 6 : ((b) == 2) ? 5 : ((b) == 3) ? 5 : ((b) == 4) ? 4 : ((b) == 5) ? 4 : ((b) == 6) ? 3 : ((b) == 7) ? 2 : 1)] = (((e) << (((32 - 12) / 2) * 2)) | (((g) & ((1 << ((32 - 12) / 2)) - 1)) << ((32 - 12) / 2)) | ((f) & ((1 << ((32 - 12) / 2)) - 1)));

    if (m || n) {
      uint u = D(b, m);

      uint v = H(b, j, u);

      if (v >= 688) {
        l = 1;
      } else {
        t = (__global slot_t*)A(d, b, u, v);
      }
    }
  }

  if (t) {
    if (b >= 8)
      *(__global uint2*)t = s.ui2[0];
    else

        if (b >= 6)
      *(__global uint4*)t = s.ui4[0];
    else

      *(__global uint8*)t = s.ui8;
  }
  return l;
}

uint M(uint a, uint b, __global char* c, __global char* d, uint e, uint f, uint g, __local uint* h, __local uint* i, __global uint* j, __local ushort* k, __local uint* l) {
  uint m = 0;
  uint n, o, p, q, r, s;
  uint t = get_local_id(0) / 1;
  uint u = get_local_id(0) % 1;

  slot_t v;
  uint w;

  if (!u)
    k[t] = 688;

  if (f < 688) {
    n = *h;
    o = *(h += 688);
    if (b <= 7)
      p = *(h += 688);
    if (b <= 6)
      q = *(h += 688);
    if (b <= 4)
      r = *(h += 688);
    if (b <= 2)
      s = *(h += 688);

    n ^= *i;
    o ^= *(i += 688);
    if (b <= 7)
      p ^= *(i += 688);
    if (b <= 6)
      q ^= *(i += 688);
    if (b <= 4)
      r ^= *(i += 688);
    if (b <= 2)
      s ^= *(i += 688);

    if (!(b & 0x1)) {
      n = (n >> 24) | (o << (32 - 24));

      v.slot.xi[0] = o;
      v.slot.xi[1] = p;
      v.slot.xi[2] = q;
      v.slot.xi[3] = r;
      v.slot.xi[4] = s;
    } else {
      v.slot.xi[0] = ((o << 24) | (n >> 8));
      if (b <= 7)
        v.slot.xi[1] = ((p << 24) | (o >> 8));
      if (b <= 6)
        v.slot.xi[2] = ((q << 24) | (p >> 8));
      if (b <= 5)
        v.slot.xi[3] = ((r << 24) | (q >> 8));
      if (b <= 3)
        v.slot.xi[4] = ((s << 24) | (r >> 8));
      if (b <= 1)
        v.slot.xi[5] = ((s >> 8));
    }
    v.slot.xi[(((b) == 0) ? 6 : ((b) == 1) ? 6 : ((b) == 2) ? 5 : ((b) == 3) ? 5 : ((b) == 4) ? 4 : ((b) == 5) ? 4 : ((b) == 6) ? 3 : ((b) == 7) ? 2 : 1)] = (((e) << (((32 - 12) / 2) * 2)) | (((g) & ((1 << ((32 - 12) / 2)) - 1)) << ((32 - 12) / 2)) | ((f) & ((1 << ((32 - 12) / 2)) - 1)));
    w = D(b, n);

    if ((n || o) && !u) {
      k[t] = H(b, j, w);
    }
  }

  barrier(1);
  if (1 == 2 && k[t] < 688) {
    __global uint4* x = (__global uint4*)A(d, b, w, k[t]) + u;

    *x = v.ui4[u];

  } else if (1 == 4 && k[t] < 688) {
    __global uint2* x = (__global uint2*)A(d, b, w, k[t]) + u;
    *x = v.ui2[u];
  }

  return m;
}
void N(uint a, uint b, __global char* c, __global char* d, __global uint* e, __local uint* f, __local ushort* g, __local ushort* h, __local uint* i, __global uint* j, __global uint* k, __local uint* l, __local ushort* m, __local ushort* n, __local uint* o) {
  uint p, q;
  uint r = 0;
  uint s = get_group_id(0);
  if (s >= 4096)
    return;
  if (get_local_id(0) == 0)
    i[0] = r = F(b - 1, j, s);
  barrier(1);
  if (get_local_id(0))
    r = i[0];
  barrier(1);

  for (p = get_local_id(0); p < (1 << (((200) / ((9) + 1)) - 12)); p += get_local_size(0))
    l[p] = 688;
  for (p = get_local_id(0); p < 688; p += get_local_size(0))
    m[p] = 688;

  if (!get_local_id(0))
    *i = 0;

  barrier(1);

  for (p = get_local_id(0); p < r; p += get_local_size(0)) {
    uint t = p;
    uint u = p;
    uint v[6];
    for (q = 0; q < (((b - 1) == 0) ? 6 : ((b - 1) == 1) ? 6 : ((b - 1) == 2) ? 5 : ((b - 1) == 3) ? 5 : ((b - 1) == 4) ? 4 : ((b - 1) == 5) ? 4 : ((b - 1) == 6) ? 3 : ((b - 1) == 7) ? 2 : 1); ++q)
      v[q] = *((__global uint*)B(c, b - 1, s, t) + q);
    for (q = 0; q < (((b - 1) == 0) ? 6 : ((b - 1) == 1) ? 6 : ((b - 1) == 2) ? 5 : ((b - 1) == 3) ? 5 : ((b - 1) == 4) ? 4 : ((b - 1) == 5) ? 4 : ((b - 1) == 6) ? 3 : ((b - 1) == 7) ? 2 : 1); ++q)
      f[q * 688 + u] = v[q];
    uint w = v[0];

    uint x = p;
    uint y;
    uint z = ((w & ((((b - 1) + 1) % 2) ? 0xf000 : 0xf0000)) >> ((((b - 1) + 1) % 2) ? 3 * 4 : 4 * 4)) | ((w & ((12 == 12) ? ((((b - 1) + 1) % 2) ? 0x00f0 : 0xf000) : ((((b - 1) + 1) % 2) ? 0x00e0 : 0xe000))) >> ((12 == 12) ? ((((b - 1) + 1) % 2) ? 0 : 8) : ((((b - 1) + 1) % 2) ? 1 : 9)));
    m[p] = y = atomic_xchg(&l[z], p);
  }

  barrier(1);

  for (uint x = get_local_id(0); x < 688; x += get_local_size(0)) {
    uint y = m[x];
    while (y < 688) {
      uint aa = atomic_add(i, 1);
      if (aa >= ((b - 1) <= 6 ? 784 : 800))
        break;
      g[aa] = x;
      h[aa] = y;
      y = m[y];
    }
  }

  barrier(1);

  uint ab = *i;
  if (ab >= ((b - 1) <= 6 ? 784 : 800))
    ab = ((b - 1) <= 6 ? 784 : 800);
  while (ab > 0) {
    uint ac, ad = 688, ae;
    __local uint *af, *ag;
    uint ah = get_local_id(0) / 1;
    if (ah < ab) {
      ad = g[ab - 1 - ah];
      ae = h[ab - 1 - ah];
      af = (__local uint*)&f[ad];
      ag = (__local uint*)&f[ae];
    }
    barrier(1);
    if (1 > 1) {
      M(a, b, c, d, s, ad, ae, af, ag, k, n, o);
    } else {
      L(a, b, c, d, s, ad, ae, af, ag, k, o);
    }

    ab -= min(ab, (uint)get_local_size(0) / 1);
    barrier(1);
  }
}
__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void O(uint a, __global char* b, __global char* c, __global uint* d, __global uint* e, __global uint* f) {
  __local uint g[1];
  __local uint h[((((1 - 1) == 0) ? 6 : ((1 - 1) == 1) ? 6 : ((1 - 1) == 2) ? 5 : ((1 - 1) == 3) ? 5 : ((1 - 1) == 4) ? 4 : ((1 - 1) == 5) ? 4 : ((1 - 1) == 6) ? 3 : ((1 - 1) == 7) ? 2 : 1) * 688)];
  __local ushort i[(((1 - 1) <= 6 ? 784 : 800))];
  __local ushort j[(((1 - 1) <= 6 ? 784 : 800))];
  __local uint k[1];
  __local uint l[((1 << (((200) / ((9) + 1)) - 12)))];
  __local ushort m[(688)];
  __local ushort n[((1 > 1) ? 128 / 1 : 0)];
  N(a, (1), b, c, f, h, i, j, k, d, e, l, m, n, g);
}
__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void P(uint a, __global char* b, __global char* c, __global uint* d, __global uint* e, __global uint* f) {
  __local uint g[1];
  __local uint h[((((2 - 1) == 0) ? 6 : ((2 - 1) == 1) ? 6 : ((2 - 1) == 2) ? 5 : ((2 - 1) == 3) ? 5 : ((2 - 1) == 4) ? 4 : ((2 - 1) == 5) ? 4 : ((2 - 1) == 6) ? 3 : ((2 - 1) == 7) ? 2 : 1) * 688)];
  __local ushort i[(((2 - 1) <= 6 ? 784 : 800))];
  __local ushort j[(((2 - 1) <= 6 ? 784 : 800))];
  __local uint k[1];
  __local uint l[((1 << (((200) / ((9) + 1)) - 12)))];
  __local ushort m[(688)];
  __local ushort n[((1 > 1) ? 128 / 1 : 0)];
  N(a, (2), b, c, f, h, i, j, k, d, e, l, m, n, g);
}
__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void Q(uint a, __global char* b, __global char* c, __global uint* d, __global uint* e, __global uint* f) {
  __local uint g[1];
  __local uint h[((((3 - 1) == 0) ? 6 : ((3 - 1) == 1) ? 6 : ((3 - 1) == 2) ? 5 : ((3 - 1) == 3) ? 5 : ((3 - 1) == 4) ? 4 : ((3 - 1) == 5) ? 4 : ((3 - 1) == 6) ? 3 : ((3 - 1) == 7) ? 2 : 1) * 688)];
  __local ushort i[(((3 - 1) <= 6 ? 784 : 800))];
  __local ushort j[(((3 - 1) <= 6 ? 784 : 800))];
  __local uint k[1];
  __local uint l[((1 << (((200) / ((9) + 1)) - 12)))];
  __local ushort m[(688)];
  __local ushort n[((1 > 1) ? 128 / 1 : 0)];
  N(a, (3), b, c, f, h, i, j, k, d, e, l, m, n, g);
}
__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void R(uint a, __global char* b, __global char* c, __global uint* d, __global uint* e, __global uint* f) {
  __local uint g[1];
  __local uint h[((((4 - 1) == 0) ? 6 : ((4 - 1) == 1) ? 6 : ((4 - 1) == 2) ? 5 : ((4 - 1) == 3) ? 5 : ((4 - 1) == 4) ? 4 : ((4 - 1) == 5) ? 4 : ((4 - 1) == 6) ? 3 : ((4 - 1) == 7) ? 2 : 1) * 688)];
  __local ushort i[(((4 - 1) <= 6 ? 784 : 800))];
  __local ushort j[(((4 - 1) <= 6 ? 784 : 800))];
  __local uint k[1];
  __local uint l[((1 << (((200) / ((9) + 1)) - 12)))];
  __local ushort m[(688)];
  __local ushort n[((1 > 1) ? 128 / 1 : 0)];
  N(a, (4), b, c, f, h, i, j, k, d, e, l, m, n, g);
}
__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void S(uint a, __global char* b, __global char* c, __global uint* d, __global uint* e, __global uint* f) {
  __local uint g[1];
  __local uint h[((((5 - 1) == 0) ? 6 : ((5 - 1) == 1) ? 6 : ((5 - 1) == 2) ? 5 : ((5 - 1) == 3) ? 5 : ((5 - 1) == 4) ? 4 : ((5 - 1) == 5) ? 4 : ((5 - 1) == 6) ? 3 : ((5 - 1) == 7) ? 2 : 1) * 688)];
  __local ushort i[(((5 - 1) <= 6 ? 784 : 800))];
  __local ushort j[(((5 - 1) <= 6 ? 784 : 800))];
  __local uint k[1];
  __local uint l[((1 << (((200) / ((9) + 1)) - 12)))];
  __local ushort m[(688)];
  __local ushort n[((1 > 1) ? 128 / 1 : 0)];
  N(a, (5), b, c, f, h, i, j, k, d, e, l, m, n, g);
}
__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void T(uint a, __global char* b, __global char* c, __global uint* d, __global uint* e, __global uint* f) {
  __local uint g[1];
  __local uint h[((((6 - 1) == 0) ? 6 : ((6 - 1) == 1) ? 6 : ((6 - 1) == 2) ? 5 : ((6 - 1) == 3) ? 5 : ((6 - 1) == 4) ? 4 : ((6 - 1) == 5) ? 4 : ((6 - 1) == 6) ? 3 : ((6 - 1) == 7) ? 2 : 1) * 688)];
  __local ushort i[(((6 - 1) <= 6 ? 784 : 800))];
  __local ushort j[(((6 - 1) <= 6 ? 784 : 800))];
  __local uint k[1];
  __local uint l[((1 << (((200) / ((9) + 1)) - 12)))];
  __local ushort m[(688)];
  __local ushort n[((1 > 1) ? 128 / 1 : 0)];
  N(a, (6), b, c, f, h, i, j, k, d, e, l, m, n, g);
}
__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void U(uint a, __global char* b, __global char* c, __global uint* d, __global uint* e, __global uint* f) {
  __local uint g[1];
  __local uint h[((((7 - 1) == 0) ? 6 : ((7 - 1) == 1) ? 6 : ((7 - 1) == 2) ? 5 : ((7 - 1) == 3) ? 5 : ((7 - 1) == 4) ? 4 : ((7 - 1) == 5) ? 4 : ((7 - 1) == 6) ? 3 : ((7 - 1) == 7) ? 2 : 1) * 688)];
  __local ushort i[(((7 - 1) <= 6 ? 784 : 800))];
  __local ushort j[(((7 - 1) <= 6 ? 784 : 800))];
  __local uint k[1];
  __local uint l[((1 << (((200) / ((9) + 1)) - 12)))];
  __local ushort m[(688)];
  __local ushort n[((1 > 1) ? 128 / 1 : 0)];
  N(a, (7), b, c, f, h, i, j, k, d, e, l, m, n, g);
}
__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void V(uint a, __global char* b, __global char* c, __global uint* d, __global uint* e, __global uint* f) {
  __local uint g[1];
  __local uint h[((((8 - 1) == 0) ? 6 : ((8 - 1) == 1) ? 6 : ((8 - 1) == 2) ? 5 : ((8 - 1) == 3) ? 5 : ((8 - 1) == 4) ? 4 : ((8 - 1) == 5) ? 4 : ((8 - 1) == 6) ? 3 : ((8 - 1) == 7) ? 2 : 1) * 688)];
  __local ushort i[(((8 - 1) <= 6 ? 784 : 800))];
  __local ushort j[(((8 - 1) <= 6 ? 784 : 800))];
  __local uint k[1];
  __local uint l[((1 << (((200) / ((9) + 1)) - 12)))];
  __local ushort m[(688)];
  __local ushort n[((1 > 1) ? 128 / 1 : 0)];
  N(a, (8), b, c, f, h, i, j, k, d, e, l, m, n, g);
}

void W(__global potential_sols_t* a, uint b, uint c) {
  uint d = atomic_add(&a->nr, 1);
  if (d >= 4096)
    return;
  a->values[d][0] = b;
  a->values[d][1] = c;
}

__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void X(uint a, __global char* b, __global potential_sols_t* c, __global uint* d) {
  __local uint e[(688)];
  __local uint f[(688)];

  uint g;
  uint h, i;
  __global char* j;
  uint k, l;
  __local uint m[((1 << (((200) / ((9) + 1)) - 12)))];
  __local ushort n[(688)];

  uint o = get_group_id(0);
  if (o >= 4096)
    return;

  for (h = get_local_id(0); h < (1 << (((200) / ((9) + 1)) - 12)); h += get_local_size(0))
    m[h] = 688;
  for (h = get_local_id(0); h < 688; h += get_local_size(0))
    n[h] = 688;

  __local uint p;
  if (get_local_id(0) == 0)
    p = g = F((9 - 1), d, o);
  barrier(1);
  if (get_local_id(0))
    g = p;

  barrier(1);

  for (uint h = get_local_id(0); h < g; h += get_local_size(0)) {
    __global uint* j = (__global uint*)A(b, 9 - 1, o, h);
    uint q = f[h] = *j++;
    uint k = e[h] = *j;
    uint r = ((q & ((((9 - 1) + 1) % 2) ? 0xf000 : 0xf0000)) >> ((((9 - 1) + 1) % 2) ? 3 * 4 : 4 * 4)) | ((q & ((12 == 12) ? ((((9 - 1) + 1) % 2) ? 0x00f0 : 0xf000) : ((((9 - 1) + 1) % 2) ? 0x00e0 : 0xe000))) >> ((12 == 12) ? ((((9 - 1) + 1) % 2) ? 0 : 8) : ((((9 - 1) + 1) % 2) ? 1 : 9)));
    i = n[h] = atomic_xchg(&m[r], h);

    while (i < g) {
      if (q == f[i])
        W(c, e[h], e[i]);
      i = n[i];
    }
  }
}

__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void Y(__global char* a, __global char* b, __global sols_t* c, __global uint* d, __global uint* e, __global char* f, __global char* g, __global char* h, __global char* i, __global char* j, __global char* k, __global char* l, __global potential_sols_t* m) {
  __local uint n[(1 << 9)], o[(1 << (9 - 1))];
  __global char* p[] = { abfghijkl;

  if (get_group_id(0) < m->nr && get_group_id(0) < 4096) {
    __local uint q;
    if (get_local_id(0) == 0) {
      q = 0;
      n[0] = m->values[get_group_id(0)][0];
      n[1] = m->values[get_group_id(0)][1];
    }
    barrier(1);

    for (int r = 7; r >= 0; --r) {
      if (r % 2) {
        for (uint s = get_local_id(0); s < (1 << ((9 - 1) - r)); s += get_local_size(0)) {
          o[s * 2 + 1] = *C(p[r], r, ((n[s]) >> (((32 - 12) / 2) * 2)), (((n[s]) >> ((32 - 12) / 2)) & ((1 << ((32 - 12) / 2)) - 1)));
          o[s * 2] = *C(p[r], r, ((n[s]) >> (((32 - 12) / 2) * 2)), ((n[s]) & ((1 << ((32 - 12) / 2)) - 1)));
        }
      } else {
        for (uint s = get_local_id(0); s < (1 << ((9 - 1) - r)); s += get_local_size(0)) {
          n[s * 2 + 1] = *C(p[r], r, ((o[s]) >> (((32 - 12) / 2) * 2)), (((o[s]) >> ((32 - 12) / 2)) & ((1 << ((32 - 12) / 2)) - 1)));
          n[s * 2] = *C(p[r], r, ((o[s]) >> (((32 - 12) / 2) * 2)), ((o[s]) & ((1 << ((32 - 12) / 2)) - 1)));
        }
      }
      barrier(1);
    }

    int t = n[(1 << 9) - 1];
    uint u = 3 + get_local_id(0);
    if (n[u] == t)
      atomic_add(&q, 1);
    u += get_local_size(0);
    if (u < (1 << 9) - 2 && n[u] == t)
      atomic_add(&q, 1);
    barrier(1);

    if (!q) {
      __local uint v;
      if (!get_local_id(0))
        v = atomic_add(&c->nr, 1);
      barrier(1);
      if (v < 11) {
        if (!get_local_id(0))
          c->valid[v] = 1;
        c->values[v][get_local_id(0)] = n[get_local_id(0)];
        c->values[v][get_local_id(0) + get_local_size(0)] = n[get_local_id(0) + get_local_size(0)];
      }
    }
  }
}