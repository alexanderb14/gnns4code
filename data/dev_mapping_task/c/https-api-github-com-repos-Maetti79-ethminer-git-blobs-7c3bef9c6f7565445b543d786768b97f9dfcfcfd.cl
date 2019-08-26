__constant ulong const Ga[24] = {
    (0x0000000000000001UL), (0x0000000000008082UL), (0x800000000000808AUL), (0x8000000080008000UL), (0x000000000000808BUL), (0x0000000080000001UL), (0x8000000080008081UL), (0x8000000000008009UL), (0x000000000000008AUL), (0x0000000000000088UL), (0x0000000080008009UL), (0x000000008000000AUL),
    (0x000000008000808BUL), (0x800000000000008BUL), (0x8000000000008089UL), (0x8000000000008003UL), (0x8000000000008002UL), (0x8000000000000080UL), (0x000000000000800AUL), (0x800000008000000AUL), (0x8000000080008081UL), (0x8000000000008080UL), (0x0000000080000001UL), (0x8000000080008008UL),
};

void A(ulong* a, const uint b, const uint c) {
  const ulong d = a[0] ^ a[5] ^ a[10] ^ a[15] ^ a[20] ^ __builtin_astype(rotate(__builtin_astype(a[2] ^ a[7] ^ a[12] ^ a[17] ^ a[22], ulong), (ulong)(1)), ulong);
  const ulong e = a[1] ^ a[6] ^ a[11] ^ a[16] ^ a[21] ^ __builtin_astype(rotate(__builtin_astype(a[3] ^ a[8] ^ a[13] ^ a[18] ^ a[23], ulong), (ulong)(1)), ulong);
  const ulong f = a[2] ^ a[7] ^ a[12] ^ a[17] ^ a[22] ^ __builtin_astype(rotate(__builtin_astype(a[4] ^ a[9] ^ a[14] ^ a[19] ^ a[24], ulong), (ulong)(1)), ulong);
  const ulong g = a[3] ^ a[8] ^ a[13] ^ a[18] ^ a[23] ^ __builtin_astype(rotate(__builtin_astype(a[0] ^ a[5] ^ a[10] ^ a[15] ^ a[20], ulong), (ulong)(1)), ulong);
  const ulong h = a[4] ^ a[9] ^ a[14] ^ a[19] ^ a[24] ^ __builtin_astype(rotate(__builtin_astype(a[1] ^ a[6] ^ a[11] ^ a[16] ^ a[21], ulong), (ulong)(1)), ulong);

  const ulong i = a[1] ^ d;

  a[0] ^= h;
  a[5] ^= h;
  a[10] ^= h;
  a[15] ^= h;
  a[20] ^= h;

  a[6] ^= d;
  a[11] ^= d;
  a[16] ^= d;
  a[21] ^= d;

  a[2] ^= e;
  a[7] ^= e;
  a[12] ^= e;
  a[17] ^= e;
  a[22] ^= e;

  a[3] ^= f;
  a[8] ^= f;
  a[13] ^= f;
  a[18] ^= f;
  a[23] ^= f;

  a[4] ^= g;
  a[9] ^= g;
  a[14] ^= g;
  a[19] ^= g;
  a[24] ^= g;

  a[1] = __builtin_astype(rotate(__builtin_astype(a[6], ulong), (ulong)((12) + 32)), ulong);
  a[6] = __builtin_astype(rotate(__builtin_astype(a[9], ulong), (ulong)(20)), ulong);
  a[9] = __builtin_astype(rotate(__builtin_astype(a[22], ulong), (ulong)((29) + 32)), ulong);
  a[22] = __builtin_astype(rotate(__builtin_astype(a[14], ulong), (ulong)((7) + 32)), ulong);
  a[14] = __builtin_astype(rotate(__builtin_astype(a[20], ulong), (ulong)(18)), ulong);
  a[20] = __builtin_astype(rotate(__builtin_astype(a[2], ulong), (ulong)((30) + 32)), ulong);
  a[2] = __builtin_astype(rotate(__builtin_astype(a[12], ulong), (ulong)((11) + 32)), ulong);
  a[12] = __builtin_astype(rotate(__builtin_astype(a[13], ulong), (ulong)(25)), ulong);
  a[13] = __builtin_astype(rotate(__builtin_astype(a[19], ulong), (ulong)(8)), ulong);
  a[19] = __builtin_astype(rotate(__builtin_astype(a[23], ulong), (ulong)((24) + 32)), ulong);
  a[23] = __builtin_astype(rotate(__builtin_astype(a[15], ulong), (ulong)((9) + 32)), ulong);
  a[15] = __builtin_astype(rotate(__builtin_astype(a[4], ulong), (ulong)(27)), ulong);
  a[4] = __builtin_astype(rotate(__builtin_astype(a[24], ulong), (ulong)(14)), ulong);
  a[24] = __builtin_astype(rotate(__builtin_astype(a[21], ulong), (ulong)(2)), ulong);
  a[21] = __builtin_astype(rotate(__builtin_astype(a[8], ulong), (ulong)((23) + 32)), ulong);
  a[8] = __builtin_astype(rotate(__builtin_astype(a[16], ulong), (ulong)((13) + 32)), ulong);
  a[16] = __builtin_astype(rotate(__builtin_astype(a[5], ulong), (ulong)((4) + 32)), ulong);
  a[5] = __builtin_astype(rotate(__builtin_astype(a[3], ulong), (ulong)(28)), ulong);
  a[3] = __builtin_astype(rotate(__builtin_astype(a[18], ulong), (ulong)(21)), ulong);
  a[18] = __builtin_astype(rotate(__builtin_astype(a[17], ulong), (ulong)(15)), ulong);
  a[17] = __builtin_astype(rotate(__builtin_astype(a[11], ulong), (ulong)(10)), ulong);
  a[11] = __builtin_astype(rotate(__builtin_astype(a[7], ulong), (ulong)(6)), ulong);
  a[7] = __builtin_astype(rotate(__builtin_astype(a[10], ulong), (ulong)(3)), ulong);
  a[10] = __builtin_astype(rotate(__builtin_astype(i, ulong), (ulong)(1)), ulong);

  ulong j = a[0];
  ulong k = a[1];

  a[0] = bitselect(a[0] ^ a[2], a[0], a[1]);

  a[0] ^= Ga[b];

  if (c > 1) {
    a[1] = bitselect(a[1] ^ a[3], a[1], a[2]);
    a[2] = bitselect(a[2] ^ a[4], a[2], a[3]);
    a[3] = bitselect(a[3] ^ j, a[3], a[4]);
    a[4] = bitselect(a[4] ^ k, a[4], j);

    if (c > 4) {
      j = a[5];
      k = a[6];
      a[5] = bitselect(a[5] ^ a[7], a[5], a[6]);
      a[6] = bitselect(a[6] ^ a[8], a[6], a[7]);
      a[7] = bitselect(a[7] ^ a[9], a[7], a[8]);
      a[8] = bitselect(a[8] ^ j, a[8], a[9]);
      a[9] = bitselect(a[9] ^ k, a[9], j);

      if (c > 8) {
        j = a[10];
        k = a[11];
        a[10] = bitselect(a[10] ^ a[12], a[10], a[11]);
        a[11] = bitselect(a[11] ^ a[13], a[11], a[12]);
        a[12] = bitselect(a[12] ^ a[14], a[12], a[13]);
        a[13] = bitselect(a[13] ^ j, a[13], a[14]);
        a[14] = bitselect(a[14] ^ k, a[14], j);

        j = a[15];
        k = a[16];
        a[15] = bitselect(a[15] ^ a[17], a[15], a[16]);
        a[16] = bitselect(a[16] ^ a[18], a[16], a[17]);
        a[17] = bitselect(a[17] ^ a[19], a[17], a[18]);
        a[18] = bitselect(a[18] ^ j, a[18], a[19]);
        a[19] = bitselect(a[19] ^ k, a[19], j);

        j = a[20];
        k = a[21];
        a[20] = bitselect(a[20] ^ a[22], a[20], a[21]);
        a[21] = bitselect(a[21] ^ a[23], a[21], a[22]);
        a[22] = bitselect(a[22] ^ a[24], a[22], a[23]);
        a[23] = bitselect(a[23] ^ j, a[23], a[24]);
        a[24] = bitselect(a[24] ^ k, a[24], j);
      }
    }
  }
}
typedef struct { ulong ulongs[32 / sizeof(ulong)]; } hash32_t;

typedef union {
  ulong ulongs[64 / sizeof(ulong)];
  ulong4 ulong4s[64 / sizeof(ulong4)];

  uint uints[64 / sizeof(uint)];
  uint2 uint2s[64 / sizeof(uint2)];
  uint4 uint4s[64 / sizeof(uint4)];
  uint8 uint8s[64 / sizeof(uint8)];
  uint16 uint16s[1];
} hash64_t;

typedef union {
  ulong ulongs[128 / sizeof(ulong)];
  ulong4 ulong4s[128 / sizeof(ulong4)];
  ulong8 ulong8s[128 / sizeof(ulong8)];

  uint uints[128 / sizeof(uint)];
  uint2 uint2s[128 / sizeof(uint2)];
  uint4 uint4s[128 / sizeof(uint4)];
  uint8 uint8s[128 / sizeof(uint8)];
  uint16 uint16s[128 / sizeof(uint16)];
} hash128_t;

typedef union {
  ulong ulongs[200 / sizeof(ulong)];

  uint uints[200 / sizeof(uint)];
  uint2 uint2s[200 / sizeof(uint2)];
  uint8 uint8s[200 / sizeof(uint8)];
  uint16 uint16s[200 / sizeof(uint16)];
} hash200_t;

__attribute__((reqd_work_group_size(128, 1, 1)))

__kernel void
B(__global volatile uint* restrict a, __constant hash32_t const* b, __global hash128_t const* c, ulong d, ulong e, uint f) {
  uint const g = get_global_id(0);
  uint const h = g & (1 - 1);
  uint const i = (g % 128) >> 0;

  __local hash64_t j[(128 / 1)];
  __local hash64_t* const k = j + i;

  ulong l[25];

  ((ulong4*)l)[0] = ((__constant ulong4*)b)[0];

  l[4] = d + g;

  for (uint m = 6; m != 25; ++m) {
    l[m] = 0;
  }

  l[5] = 0x0000000000000001UL;
  l[8] = 0x8000000000000000UL;

  {
    for (uint n = 0; n < 23;) {
      A(l, n++, 25);
    }
    A(l, 23, 8);
  };

  hash128_t o;
  k[i].uint16s[0] = ((uint16*)l)[0];

  for (uint m = 0; m < 4; m++) {
    o.uint4s[m] = k[i].uint4s[m];
    o.uint4s[m + 4] = k[i].uint4s[m];
  }

  uint p = k[i].uints[0];

  for (uint m = 0; m < 16; m++) {
    uint q = ((m ^ p) * 0x01000193 ^ (o.uints[m & 31])) % 8388593;

    for (uint r = 0; r < 8; r++)
      o.uint4s[r] = ((o.uint4s[r]) * 0x01000193 ^ (c[q].uint4s[r]));
  }

  for (uint m = 0; m < 8; m++) {
    k[i].uints[m] = ((((((o.uint4s[m].x) * 0x01000193 ^ (o.uint4s[m].y))) * 0x01000193 ^ (o.uint4s[m].z))) * 0x01000193 ^ (o.uint4s[m].w));
  }

  for (uint m = 0; m < 4; m++) {
    (l + 8)[m] = k[i].ulongs[m];
  }
  for (uint m = 13; m != 25; ++m) {
    l[m] = 0;
  }

  l[12] = 0x0000000000000001UL;
  l[16] = 0x8000000000000000UL;

  {
    for (uint n = 0; n < 23;) {
      A(l, n++, 25);
    }
    A(l, 23, 1);
  };

  if (__builtin_astype(__builtin_astype(l[0], uchar8).s76543210, ulong) < e) {
    uint s = min(63U, atomic_add(&a[0], 1) + 1);
    a[s] = g;
  }
}

__kernel void C(uint a, __global hash64_t const* b, __global hash64_t* c, uint d) {
  uint const e = a + get_global_id(0);
  if (e > 8388593 * 2)
    return;

  hash200_t f;
  f.uint16s[0] = b[e % 262139].uint16s[0];
  f.uints[0] ^= e;
  {
    for (uint g = 8; g != 25; ++g) {
      f.ulongs[g] = 0UL;
    }
    f.ulongs[8] = 0x8000000000000001UL;
    {
      for (uint h = 0; h < 23;) {
        A(f.ulongs, h++, 25);
      }
      A(f.ulongs, 23, 8);
    };
  };

  for (uint g = 0; g != 256; ++g) {
    uint i = ((e ^ g) * 0x01000193 ^ (f.uints[g % (64 / 4)])) % 262139;
    f.uint16s[0] = ((f.uint16s[0]) * 0x01000193 ^ (b[i].uint16s[0]));
  }

  {
    for (uint g = 8; g != 25; ++g) {
      f.ulongs[g] = 0UL;
    }
    f.ulongs[8] = 0x8000000000000001UL;
    {
      for (uint h = 0; h < 23;) {
        A(f.ulongs, h++, 25);
      }
      A(f.ulongs, 23, 8);
    };
  };
  c[e].uint16s[0] = f.uint16s[0];
}