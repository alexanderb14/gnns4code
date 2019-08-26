typedef ulong uint64_t; typedef uint uint32_t; typedef uchar uint8_t; inline int A() {
  return 0;
}
struct r123array1x32 {
  uint32_t v[1];
};
struct r123array2x32 {
  uint32_t v[2];
};
struct r123array4x32 {
  uint32_t v[4];
};
struct r123array8x32 {
  uint32_t v[8];
};

struct r123array1x64 {
  uint64_t v[1];
};
struct r123array2x64 {
  uint64_t v[2];
};
struct r123array4x64 {
  uint64_t v[4];
};

struct r123array16x8 {
  uint8_t v[16];
};
enum r123_enum_threefry64x4 {

  R_64x4_0_0 = 14,
  R_64x4_0_1 = 16,
  R_64x4_1_0 = 52,
  R_64x4_1_1 = 57,
  R_64x4_2_0 = 23,
  R_64x4_2_1 = 40,
  R_64x4_3_0 = 5,
  R_64x4_3_1 = 37,
  R_64x4_4_0 = 25,
  R_64x4_4_1 = 33,
  R_64x4_5_0 = 46,
  R_64x4_5_1 = 12,
  R_64x4_6_0 = 58,
  R_64x4_6_1 = 22,
  R_64x4_7_0 = 32,
  R_64x4_7_1 = 32
};

enum r123_enum_threefry64x2 {

  R_64x2_0_0 = 16,
  R_64x2_1_0 = 42,
  R_64x2_2_0 = 12,
  R_64x2_3_0 = 31,
  R_64x2_4_0 = 16,
  R_64x2_5_0 = 32,
  R_64x2_6_0 = 24,
  R_64x2_7_0 = 21
};

enum r123_enum_threefry32x4 {

  R_32x4_0_0 = 10,
  R_32x4_0_1 = 26,
  R_32x4_1_0 = 11,
  R_32x4_1_1 = 21,
  R_32x4_2_0 = 13,
  R_32x4_2_1 = 27,
  R_32x4_3_0 = 23,
  R_32x4_3_1 = 5,
  R_32x4_4_0 = 6,
  R_32x4_4_1 = 20,
  R_32x4_5_0 = 17,
  R_32x4_5_1 = 11,
  R_32x4_6_0 = 25,
  R_32x4_6_1 = 10,
  R_32x4_7_0 = 18,
  R_32x4_7_1 = 20
};

enum r123_enum_threefry32x2 {

  R_32x2_0_0 = 13,
  R_32x2_1_0 = 15,
  R_32x2_2_0 = 26,
  R_32x2_3_0 = 6,
  R_32x2_4_0 = 17,
  R_32x2_5_0 = 29,
  R_32x2_6_0 = 16,
  R_32x2_7_0 = 24
};

enum r123_enum_threefry_wcnt { WCNT2 = 2, WCNT4 = 4 };
inline uint64_t B(uint64_t a, unsigned int b) __attribute__((always_inline));
inline uint64_t B(uint64_t a, unsigned int b) {
  return (a << (b & 63)) | (a >> ((64 - b) & 63));
}

inline uint32_t C(uint32_t a, unsigned int b) __attribute__((always_inline));
inline uint32_t C(uint32_t a, unsigned int b) {
  return (a << (b & 31)) | (a >> ((32 - b) & 31));
}
typedef struct r123array2x64 threefry2x64_ctr_t;
typedef struct r123array2x64 threefry2x64_key_t;
typedef struct r123array2x64 threefry2x64_ukey_t;
inline threefry2x64_key_t D(threefry2x64_ukey_t a) {
  return a;
}
inline threefry2x64_ctr_t E(unsigned int a, threefry2x64_ctr_t b, threefry2x64_key_t c) __attribute__((always_inline));
inline threefry2x64_ctr_t E(unsigned int a, threefry2x64_ctr_t b, threefry2x64_key_t c) {
  threefry2x64_ctr_t d;
  uint64_t e[2 + 1];
  int f;
  ;
  e[2] = ((0xA9FC1A22) + (((uint64_t)(0x1BD11BDA)) << 32));
  for (f = 0; f < 2; f++) {
    e[f] = c.v[f];
    d.v[f] = b.v[f];
    e[2] ^= c.v[f];
  }
  d.v[0] += e[0];
  d.v[1] += e[1];
  if (a > 0) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_0_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 1) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_1_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 2) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_2_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 3) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_3_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 3) {
    d.v[0] += e[1];
    d.v[1] += e[2];
    d.v[1] += 1;
  }
  if (a > 4) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_4_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 5) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_5_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 6) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_6_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 7) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_7_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 7) {
    d.v[0] += e[2];
    d.v[1] += e[0];
    d.v[1] += 2;
  }
  if (a > 8) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_0_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 9) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_1_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 10) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_2_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 11) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_3_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 11) {
    d.v[0] += e[0];
    d.v[1] += e[1];
    d.v[1] += 3;
  }
  if (a > 12) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_4_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 13) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_5_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 14) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_6_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 15) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_7_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 15) {
    d.v[0] += e[1];
    d.v[1] += e[2];
    d.v[1] += 4;
  }
  if (a > 16) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_0_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 17) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_1_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 18) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_2_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 19) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_3_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 19) {
    d.v[0] += e[2];
    d.v[1] += e[0];
    d.v[1] += 5;
  }
  if (a > 20) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_4_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 21) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_5_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 22) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_6_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 23) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_7_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 23) {
    d.v[0] += e[0];
    d.v[1] += e[1];
    d.v[1] += 6;
  }
  if (a > 24) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_0_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 25) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_1_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 26) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_2_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 27) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_3_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 27) {
    d.v[0] += e[1];
    d.v[1] += e[2];
    d.v[1] += 7;
  }
  if (a > 28) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_4_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 29) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_5_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 30) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_6_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 31) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x2_7_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 31) {
    d.v[0] += e[2];
    d.v[1] += e[0];
    d.v[1] += 8;
  }
  return d;
}
enum r123_enum_threefry2x64 { threefry2x64_rounds = 20 };
inline threefry2x64_ctr_t F(threefry2x64_ctr_t a, threefry2x64_key_t b) __attribute__((always_inline));
inline threefry2x64_ctr_t F(threefry2x64_ctr_t a, threefry2x64_key_t b) {
  return E(threefry2x64_rounds, a, b);
}
typedef struct r123array2x32 threefry2x32_ctr_t;
typedef struct r123array2x32 threefry2x32_key_t;
typedef struct r123array2x32 threefry2x32_ukey_t;
inline threefry2x32_key_t G(threefry2x32_ukey_t a) {
  return a;
}
inline threefry2x32_ctr_t H(unsigned int a, threefry2x32_ctr_t b, threefry2x32_key_t c) __attribute__((always_inline));
inline threefry2x32_ctr_t H(unsigned int a, threefry2x32_ctr_t b, threefry2x32_key_t c) {
  threefry2x32_ctr_t d;
  uint32_t e[2 + 1];
  int f;
  ;
  e[2] = 0x1BD11BDA;
  for (f = 0; f < 2; f++) {
    e[f] = c.v[f];
    d.v[f] = b.v[f];
    e[2] ^= c.v[f];
  }
  d.v[0] += e[0];
  d.v[1] += e[1];
  if (a > 0) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_0_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 1) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_1_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 2) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_2_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 3) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_3_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 3) {
    d.v[0] += e[1];
    d.v[1] += e[2];
    d.v[1] += 1;
  }
  if (a > 4) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_4_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 5) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_5_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 6) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_6_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 7) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_7_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 7) {
    d.v[0] += e[2];
    d.v[1] += e[0];
    d.v[1] += 2;
  }
  if (a > 8) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_0_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 9) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_1_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 10) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_2_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 11) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_3_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 11) {
    d.v[0] += e[0];
    d.v[1] += e[1];
    d.v[1] += 3;
  }
  if (a > 12) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_4_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 13) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_5_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 14) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_6_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 15) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_7_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 15) {
    d.v[0] += e[1];
    d.v[1] += e[2];
    d.v[1] += 4;
  }
  if (a > 16) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_0_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 17) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_1_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 18) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_2_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 19) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_3_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 19) {
    d.v[0] += e[2];
    d.v[1] += e[0];
    d.v[1] += 5;
  }
  if (a > 20) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_4_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 21) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_5_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 22) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_6_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 23) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_7_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 23) {
    d.v[0] += e[0];
    d.v[1] += e[1];
    d.v[1] += 6;
  }
  if (a > 24) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_0_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 25) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_1_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 26) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_2_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 27) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_3_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 27) {
    d.v[0] += e[1];
    d.v[1] += e[2];
    d.v[1] += 7;
  }
  if (a > 28) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_4_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 29) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_5_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 30) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_6_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 31) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x2_7_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 31) {
    d.v[0] += e[2];
    d.v[1] += e[0];
    d.v[1] += 8;
  }
  return d;
}
enum r123_enum_threefry2x32 { threefry2x32_rounds = 20 };
inline threefry2x32_ctr_t I(threefry2x32_ctr_t a, threefry2x32_key_t b) __attribute__((always_inline));
inline threefry2x32_ctr_t I(threefry2x32_ctr_t a, threefry2x32_key_t b) {
  return H(threefry2x32_rounds, a, b);
}
typedef struct r123array4x64 threefry4x64_ctr_t;
typedef struct r123array4x64 threefry4x64_key_t;
typedef struct r123array4x64 threefry4x64_ukey_t;
inline threefry4x64_key_t J(threefry4x64_ukey_t a) {
  return a;
}
inline threefry4x64_ctr_t K(unsigned int a, threefry4x64_ctr_t b, threefry4x64_key_t c) __attribute__((always_inline));
inline threefry4x64_ctr_t K(unsigned int a, threefry4x64_ctr_t b, threefry4x64_key_t c) {
  threefry4x64_ctr_t d;
  uint64_t e[4 + 1];
  int f;
  ;
  e[4] = ((0xA9FC1A22) + (((uint64_t)(0x1BD11BDA)) << 32));
  for (f = 0; f < 4; f++) {
    e[f] = c.v[f];
    d.v[f] = b.v[f];
    e[4] ^= c.v[f];
  }
  d.v[0] += e[0];
  d.v[1] += e[1];
  d.v[2] += e[2];
  d.v[3] += e[3];
  if (a > 0) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 1) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 2) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 3) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_3_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 3) {
    d.v[0] += e[1];
    d.v[1] += e[2];
    d.v[2] += e[3];
    d.v[3] += e[4];
    d.v[4 - 1] += 1;
  }
  if (a > 4) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 5) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 6) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 7) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_7_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 7) {
    d.v[0] += e[2];
    d.v[1] += e[3];
    d.v[2] += e[4];
    d.v[3] += e[0];
    d.v[4 - 1] += 2;
  }
  if (a > 8) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 9) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 10) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 11) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_3_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 11) {
    d.v[0] += e[3];
    d.v[1] += e[4];
    d.v[2] += e[0];
    d.v[3] += e[1];
    d.v[4 - 1] += 3;
  }
  if (a > 12) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 13) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 14) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 15) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_7_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 15) {
    d.v[0] += e[4];
    d.v[1] += e[0];
    d.v[2] += e[1];
    d.v[3] += e[2];
    d.v[4 - 1] += 4;
  }
  if (a > 16) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 17) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 18) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 19) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_3_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 19) {
    d.v[0] += e[0];
    d.v[1] += e[1];
    d.v[2] += e[2];
    d.v[3] += e[3];
    d.v[4 - 1] += 5;
  }
  if (a > 20) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 21) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 22) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 23) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_7_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 23) {
    d.v[0] += e[1];
    d.v[1] += e[2];
    d.v[2] += e[3];
    d.v[3] += e[4];
    d.v[4 - 1] += 6;
  }
  if (a > 24) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 25) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 26) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 27) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_3_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 27) {
    d.v[0] += e[2];
    d.v[1] += e[3];
    d.v[2] += e[4];
    d.v[3] += e[0];
    d.v[4 - 1] += 7;
  }
  if (a > 28) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 29) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 30) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 31) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_7_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 31) {
    d.v[0] += e[3];
    d.v[1] += e[4];
    d.v[2] += e[0];
    d.v[3] += e[1];
    d.v[4 - 1] += 8;
  }
  if (a > 32) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 33) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 34) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 35) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_3_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 35) {
    d.v[0] += e[4];
    d.v[1] += e[0];
    d.v[2] += e[1];
    d.v[3] += e[2];
    d.v[4 - 1] += 9;
  }
  if (a > 36) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 37) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 38) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 39) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_7_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 39) {
    d.v[0] += e[0];
    d.v[1] += e[1];
    d.v[2] += e[2];
    d.v[3] += e[3];
    d.v[4 - 1] += 10;
  }
  if (a > 40) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 41) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 42) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 43) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_3_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 43) {
    d.v[0] += e[1];
    d.v[1] += e[2];
    d.v[2] += e[3];
    d.v[3] += e[4];
    d.v[4 - 1] += 11;
  }
  if (a > 44) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 45) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 46) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 47) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_7_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 47) {
    d.v[0] += e[2];
    d.v[1] += e[3];
    d.v[2] += e[4];
    d.v[3] += e[0];
    d.v[4 - 1] += 12;
  }
  if (a > 48) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 49) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 50) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 51) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_3_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 51) {
    d.v[0] += e[3];
    d.v[1] += e[4];
    d.v[2] += e[0];
    d.v[3] += e[1];
    d.v[4 - 1] += 13;
  }
  if (a > 52) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 53) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 54) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 55) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_7_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 55) {
    d.v[0] += e[4];
    d.v[1] += e[0];
    d.v[2] += e[1];
    d.v[3] += e[2];
    d.v[4 - 1] += 14;
  }
  if (a > 56) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 57) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 58) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 59) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_3_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 59) {
    d.v[0] += e[0];
    d.v[1] += e[1];
    d.v[2] += e[2];
    d.v[3] += e[3];
    d.v[4 - 1] += 15;
  }
  if (a > 60) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 61) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 62) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 63) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_7_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 63) {
    d.v[0] += e[1];
    d.v[1] += e[2];
    d.v[2] += e[3];
    d.v[3] += e[4];
    d.v[4 - 1] += 16;
  }
  if (a > 64) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 65) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 66) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 67) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_3_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 67) {
    d.v[0] += e[2];
    d.v[1] += e[3];
    d.v[2] += e[4];
    d.v[3] += e[0];
    d.v[4 - 1] += 17;
  }
  if (a > 68) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 69) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 70) {
    d.v[0] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 71) {
    d.v[0] += d.v[3];
    d.v[3] = B(d.v[3], R_64x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = B(d.v[1], R_64x4_7_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 71) {
    d.v[0] += e[3];
    d.v[1] += e[4];
    d.v[2] += e[0];
    d.v[3] += e[1];
    d.v[4 - 1] += 18;
  }
  return d;
}
enum r123_enum_threefry4x64 { threefry4x64_rounds = 20 };
inline threefry4x64_ctr_t L(threefry4x64_ctr_t a, threefry4x64_key_t b) __attribute__((always_inline));
inline threefry4x64_ctr_t L(threefry4x64_ctr_t a, threefry4x64_key_t b) {
  return K(threefry4x64_rounds, a, b);
}
typedef struct r123array4x32 threefry4x32_ctr_t;
typedef struct r123array4x32 threefry4x32_key_t;
typedef struct r123array4x32 threefry4x32_ukey_t;
inline threefry4x32_key_t M(threefry4x32_ukey_t a) {
  return a;
}
inline threefry4x32_ctr_t N(unsigned int a, threefry4x32_ctr_t b, threefry4x32_key_t c) __attribute__((always_inline));
inline threefry4x32_ctr_t N(unsigned int a, threefry4x32_ctr_t b, threefry4x32_key_t c) {
  threefry4x32_ctr_t d;
  uint32_t e[4 + 1];
  int f;
  ;
  e[4] = 0x1BD11BDA;
  for (f = 0; f < 4; f++) {
    e[f] = c.v[f];
    d.v[f] = b.v[f];
    e[4] ^= c.v[f];
  }
  d.v[0] += e[0];
  d.v[1] += e[1];
  d.v[2] += e[2];
  d.v[3] += e[3];
  if (a > 0) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 1) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 2) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 3) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_3_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 3) {
    d.v[0] += e[1];
    d.v[1] += e[2];
    d.v[2] += e[3];
    d.v[3] += e[4];
    d.v[4 - 1] += 1;
  }
  if (a > 4) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 5) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 6) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 7) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_7_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 7) {
    d.v[0] += e[2];
    d.v[1] += e[3];
    d.v[2] += e[4];
    d.v[3] += e[0];
    d.v[4 - 1] += 2;
  }
  if (a > 8) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 9) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 10) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 11) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_3_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 11) {
    d.v[0] += e[3];
    d.v[1] += e[4];
    d.v[2] += e[0];
    d.v[3] += e[1];
    d.v[4 - 1] += 3;
  }
  if (a > 12) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 13) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 14) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 15) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_7_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 15) {
    d.v[0] += e[4];
    d.v[1] += e[0];
    d.v[2] += e[1];
    d.v[3] += e[2];
    d.v[4 - 1] += 4;
  }
  if (a > 16) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 17) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 18) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 19) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_3_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 19) {
    d.v[0] += e[0];
    d.v[1] += e[1];
    d.v[2] += e[2];
    d.v[3] += e[3];
    d.v[4 - 1] += 5;
  }
  if (a > 20) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 21) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 22) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 23) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_7_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 23) {
    d.v[0] += e[1];
    d.v[1] += e[2];
    d.v[2] += e[3];
    d.v[3] += e[4];
    d.v[4 - 1] += 6;
  }
  if (a > 24) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 25) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 26) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 27) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_3_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 27) {
    d.v[0] += e[2];
    d.v[1] += e[3];
    d.v[2] += e[4];
    d.v[3] += e[0];
    d.v[4 - 1] += 7;
  }
  if (a > 28) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 29) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 30) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 31) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_7_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 31) {
    d.v[0] += e[3];
    d.v[1] += e[4];
    d.v[2] += e[0];
    d.v[3] += e[1];
    d.v[4 - 1] += 8;
  }
  if (a > 32) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 33) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 34) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 35) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_3_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 35) {
    d.v[0] += e[4];
    d.v[1] += e[0];
    d.v[2] += e[1];
    d.v[3] += e[2];
    d.v[4 - 1] += 9;
  }
  if (a > 36) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 37) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 38) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 39) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_7_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 39) {
    d.v[0] += e[0];
    d.v[1] += e[1];
    d.v[2] += e[2];
    d.v[3] += e[3];
    d.v[4 - 1] += 10;
  }
  if (a > 40) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 41) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 42) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 43) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_3_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 43) {
    d.v[0] += e[1];
    d.v[1] += e[2];
    d.v[2] += e[3];
    d.v[3] += e[4];
    d.v[4 - 1] += 11;
  }
  if (a > 44) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 45) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 46) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 47) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_7_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 47) {
    d.v[0] += e[2];
    d.v[1] += e[3];
    d.v[2] += e[4];
    d.v[3] += e[0];
    d.v[4 - 1] += 12;
  }
  if (a > 48) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 49) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 50) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 51) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_3_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 51) {
    d.v[0] += e[3];
    d.v[1] += e[4];
    d.v[2] += e[0];
    d.v[3] += e[1];
    d.v[4 - 1] += 13;
  }
  if (a > 52) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 53) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 54) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 55) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_7_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 55) {
    d.v[0] += e[4];
    d.v[1] += e[0];
    d.v[2] += e[1];
    d.v[3] += e[2];
    d.v[4 - 1] += 14;
  }
  if (a > 56) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 57) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 58) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 59) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_3_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 59) {
    d.v[0] += e[0];
    d.v[1] += e[1];
    d.v[2] += e[2];
    d.v[3] += e[3];
    d.v[4 - 1] += 15;
  }
  if (a > 60) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 61) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 62) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 63) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_7_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 63) {
    d.v[0] += e[1];
    d.v[1] += e[2];
    d.v[2] += e[3];
    d.v[3] += e[4];
    d.v[4 - 1] += 16;
  }
  if (a > 64) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 65) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 66) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 67) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_3_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 67) {
    d.v[0] += e[2];
    d.v[1] += e[3];
    d.v[2] += e[4];
    d.v[3] += e[0];
    d.v[4 - 1] += 17;
  }
  if (a > 68) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 69) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 70) {
    d.v[0] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 71) {
    d.v[0] += d.v[3];
    d.v[3] = C(d.v[3], R_32x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = C(d.v[1], R_32x4_7_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 71) {
    d.v[0] += e[3];
    d.v[1] += e[4];
    d.v[2] += e[0];
    d.v[3] += e[1];
    d.v[4 - 1] += 18;
  }
  return d;
}
enum r123_enum_threefry4x32 { threefry4x32_rounds = 20 };
inline threefry4x32_ctr_t O(threefry4x32_ctr_t a, threefry4x32_key_t b) __attribute__((always_inline));
inline threefry4x32_ctr_t O(threefry4x32_ctr_t a, threefry4x32_key_t b) {
  return N(threefry4x32_rounds, a, b);
}
__kernel void P(unsigned a, __global uint2* b) {
  unsigned c = get_global_id(0);
  unsigned d = 0, e = 0;
  threefry4x32_key_t f = {{ccafbad, 0xfacebead, 0x12345678}};
  threefry4x32_ctr_t g = {{0, 0xf00dcafe, 0xdeadbeef, 0xbeeff00d}};
  while (e < a) {
    union {
      threefry4x32_ctr_t c;
      int4 i;
    } h;
    g.v[0]++;
    h.c = N(threefry4x32_rounds, g, f);
    long i = h.i.x, j = h.i.y;
    long k = h.i.z, l = h.i.w;
    if ((i * i + j * j) < (1L << 62)) {
      d++;
    }
    e++;
    if ((k * k + l * l) < (1L << 62)) {
      d++;
    }
    e++;
  }
  b[c].x = d;
  b[c].y = e;
}