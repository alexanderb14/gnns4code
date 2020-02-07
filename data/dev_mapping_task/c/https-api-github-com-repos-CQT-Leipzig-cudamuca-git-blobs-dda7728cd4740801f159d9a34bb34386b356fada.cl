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
inline uint32_t B(uint32_t a, uint32_t b, uint32_t* c) {
  uint64_t d = ((uint64_t)a) * ((uint64_t)b);
  *c = d >> 32;
  return (uint32_t)d;
}
inline uint64_t C(uint64_t a, uint64_t b, uint64_t* c) {
  *c = mul_hi(a, b);
  return a * b;
}
inline struct r123array1x32 D(struct r123array1x32 a) {
  a.v[0] += ((uint32_t)0x9E3779B9);
  return a;
} inline struct r123array2x32 E(struct r123array2x32 a) {
  a.v[0] += ((uint32_t)0x9E3779B9);
  a.v[1] += ((uint32_t)0xBB67AE85);
  return a;
} inline struct r123array2x32 F(struct r123array2x32 a, struct r123array1x32 b) __attribute__((always_inline));
inline struct r123array2x32 F(struct r123array2x32 a, struct r123array1x32 b) {
  uint32_t c;
  uint32_t d = B(((uint32_t)0xd256d193), a.v[0], &c);
  struct r123array2x32 e = {ba d return e;
} inline struct r123array4x32 G(struct r123array4x32 a, struct r123array2x32 b) __attribute__((always_inline));
inline struct r123array4x32 G(struct r123array4x32 a, struct r123array2x32 b) {
  uint32_t c;
  uint32_t d;
  uint32_t e = B(((uint32_t)0xD2511F53), a.v[0], &c);
  uint32_t f = B(((uint32_t)0xCD9E8D57), a.v[2], &d);
  struct r123array4x3ab eturn g;
}

enum r123_enum_philox2x32 {
  philox2x32_rounds = 10
};
typedef struct r123array2x32 philox2x32_ctr_t;
typedef struct r123array1x32 philox2x32_key_t;
typedef struct r123array1x32 philox2x32_ukey_t;
inline philox2x32_key_t H(philox2x32_ukey_t a) {
  return a;
}
inline philox2x32_ctr_t I(unsigned int a, philox2x32_ctr_t b, philox2x32_key_t c) __attribute__((always_inline));
inline philox2x32_ctr_t I(unsigned int a, philox2x32_ctr_t b, philox2x32_key_t c) {
  ;
  if (a > 0) {
    b = F(b, c);
  }
  if (a > 1) {
    c = D(c);
    b = F(b, c);
  }
  if (a > 2) {
    c = D(c);
    b = F(b, c);
  }
  if (a > 3) {
    c = D(c);
    b = F(b, c);
  }
  if (a > 4) {
    c = D(c);
    b = F(b, c);
  }
  if (a > 5) {
    c = D(c);
    b = F(b, c);
  }
  if (a > 6) {
    c = D(c);
    b = F(b, c);
  }
  if (a > 7) {
    c = D(c);
    b = F(b, c);
  }
  if (a > 8) {
    c = D(c);
    b = F(b, c);
  }
  if (a > 9) {
    c = D(c);
    b = F(b, c);
  }
  if (a > 10) {
    c = D(c);
    b = F(b, c);
  }
  if (a > 11) {
    c = D(c);
    b = F(b, c);
  }
  if (a > 12) {
    c = D(c);
    b = F(b, c);
  }
  if (a > 13) {
    c = D(c);
    b = F(b, c);
  }
  if (a > 14) {
    c = D(c);
    b = F(b, c);
  }
  if (a > 15) {
    c = D(c);
    b = F(b, c);
  }
  return b;
}
enum r123_enum_philox4x32 { philox4x32_rounds = 10 };
typedef struct r123array4x32 philox4x32_ctr_t;
typedef struct r123array2x32 philox4x32_key_t;
typedef struct r123array2x32 philox4x32_ukey_t;
inline philox4x32_key_t J(philox4x32_ukey_t a) {
  return a;
}
inline philox4x32_ctr_t K(unsigned int a, philox4x32_ctr_t b, philox4x32_key_t c) __attribute__((always_inline));
inline philox4x32_ctr_t K(unsigned int a, philox4x32_ctr_t b, philox4x32_key_t c) {
  ;
  if (a > 0) {
    b = G(b, c);
  }
  if (a > 1) {
    c = E(c);
    b = G(b, c);
  }
  if (a > 2) {
    c = E(c);
    b = G(b, c);
  }
  if (a > 3) {
    c = E(c);
    b = G(b, c);
  }
  if (a > 4) {
    c = E(c);
    b = G(b, c);
  }
  if (a > 5) {
    c = E(c);
    b = G(b, c);
  }
  if (a > 6) {
    c = E(c);
    b = G(b, c);
  }
  if (a > 7) {
    c = E(c);
    b = G(b, c);
  }
  if (a > 8) {
    c = E(c);
    b = G(b, c);
  }
  if (a > 9) {
    c = E(c);
    b = G(b, c);
  }
  if (a > 10) {
    c = E(c);
    b = G(b, c);
  }
  if (a > 11) {
    c = E(c);
    b = G(b, c);
  }
  if (a > 12) {
    c = E(c);
    b = G(b, c);
  }
  if (a > 13) {
    c = E(c);
    b = G(b, c);
  }
  if (a > 14) {
    c = E(c);
    b = G(b, c);
  }
  if (a > 15) {
    c = E(c);
    b = G(b, c);
  }
  return b;
}

inline struct r123array1x64 L(struct r123array1x64 a) {
  a.v[0] += ((ulong)(0x9E3779B97F4A7C15UL));
  return a;
} inline struct r123array2x64 M(struct r123array2x64 a) {
  a.v[0] += ((ulong)(0x9E3779B97F4A7C15UL));
  a.v[1] += ((ulong)(0xBB67AE8584CAA73BUL));
  return a;
} inline struct r123array2x64 N(struct r123array2x64 a, struct r123array1x64 b) __attribute__((always_inline));
inline struct r123array2x64 N(struct r123array2x64 a, struct r123array1x64 b) {
  uint64_t c;
  uint64_t d = C(((ulong)(0xD2B74407B1CE6E93UL)), a.v[0], &c);
  struct r123array2x64 e = {ba d return e;
} inline struct r123array4x64 O(struct r123array4x64 a, struct r123array2x64 b) __attribute__((always_inline));
inline struct r123array4x64 O(struct r123array4x64 a, struct r123array2x64 b) {
  uint64_t c;
  uint64_t d;
  uint64_t e = C(((ulong)(0xD2E7470EE14C6C93UL)), a.v[0], &c);
  uint64_t f = C(((ulong)(0xCA5A826395121157UL)), a.v[2], &d);
  struct r123array4x6ab eturn g;
}

enum r123_enum_philox2x64 {
  philox2x64_rounds = 10
};
typedef struct r123array2x64 philox2x64_ctr_t;
typedef struct r123array1x64 philox2x64_key_t;
typedef struct r123array1x64 philox2x64_ukey_t;
inline philox2x64_key_t P(philox2x64_ukey_t a) {
  return a;
}
inline philox2x64_ctr_t Q(unsigned int a, philox2x64_ctr_t b, philox2x64_key_t c) __attribute__((always_inline));
inline philox2x64_ctr_t Q(unsigned int a, philox2x64_ctr_t b, philox2x64_key_t c) {
  ;
  if (a > 0) {
    b = N(b, c);
  }
  if (a > 1) {
    c = L(c);
    b = N(b, c);
  }
  if (a > 2) {
    c = L(c);
    b = N(b, c);
  }
  if (a > 3) {
    c = L(c);
    b = N(b, c);
  }
  if (a > 4) {
    c = L(c);
    b = N(b, c);
  }
  if (a > 5) {
    c = L(c);
    b = N(b, c);
  }
  if (a > 6) {
    c = L(c);
    b = N(b, c);
  }
  if (a > 7) {
    c = L(c);
    b = N(b, c);
  }
  if (a > 8) {
    c = L(c);
    b = N(b, c);
  }
  if (a > 9) {
    c = L(c);
    b = N(b, c);
  }
  if (a > 10) {
    c = L(c);
    b = N(b, c);
  }
  if (a > 11) {
    c = L(c);
    b = N(b, c);
  }
  if (a > 12) {
    c = L(c);
    b = N(b, c);
  }
  if (a > 13) {
    c = L(c);
    b = N(b, c);
  }
  if (a > 14) {
    c = L(c);
    b = N(b, c);
  }
  if (a > 15) {
    c = L(c);
    b = N(b, c);
  }
  return b;
}
enum r123_enum_philox4x64 { philox4x64_rounds = 10 };
typedef struct r123array4x64 philox4x64_ctr_t;
typedef struct r123array2x64 philox4x64_key_t;
typedef struct r123array2x64 philox4x64_ukey_t;
inline philox4x64_key_t R(philox4x64_ukey_t a) {
  return a;
}
inline philox4x64_ctr_t S(unsigned int a, philox4x64_ctr_t b, philox4x64_key_t c) __attribute__((always_inline));
inline philox4x64_ctr_t S(unsigned int a, philox4x64_ctr_t b, philox4x64_key_t c) {
  ;
  if (a > 0) {
    b = O(b, c);
  }
  if (a > 1) {
    c = M(c);
    b = O(b, c);
  }
  if (a > 2) {
    c = M(c);
    b = O(b, c);
  }
  if (a > 3) {
    c = M(c);
    b = O(b, c);
  }
  if (a > 4) {
    c = M(c);
    b = O(b, c);
  }
  if (a > 5) {
    c = M(c);
    b = O(b, c);
  }
  if (a > 6) {
    c = M(c);
    b = O(b, c);
  }
  if (a > 7) {
    c = M(c);
    b = O(b, c);
  }
  if (a > 8) {
    c = M(c);
    b = O(b, c);
  }
  if (a > 9) {
    c = M(c);
    b = O(b, c);
  }
  if (a > 10) {
    c = M(c);
    b = O(b, c);
  }
  if (a > 11) {
    c = M(c);
    b = O(b, c);
  }
  if (a > 12) {
    c = M(c);
    b = O(b, c);
  }
  if (a > 13) {
    c = M(c);
    b = O(b, c);
  }
  if (a > 14) {
    c = M(c);
    b = O(b, c);
  }
  if (a > 15) {
    c = M(c);
    b = O(b, c);
  }
  return b;
}
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
inline uint64_t T(uint64_t a, unsigned int b) __attribute__((always_inline));
inline uint64_t T(uint64_t a, unsigned int b) {
  return (a << (b & 63)) | (a >> ((64 - b) & 63));
}

inline uint32_t U(uint32_t a, unsigned int b) __attribute__((always_inline));
inline uint32_t U(uint32_t a, unsigned int b) {
  return (a << (b & 31)) | (a >> ((32 - b) & 31));
}
typedef struct r123array2x64 threefry2x64_ctr_t;
typedef struct r123array2x64 threefry2x64_key_t;
typedef struct r123array2x64 threefry2x64_ukey_t;
inline threefry2x64_key_t V(threefry2x64_ukey_t a) {
  return a;
}
inline threefry2x64_ctr_t W(unsigned int a, threefry2x64_ctr_t b, threefry2x64_key_t c) __attribute__((always_inline));
inline threefry2x64_ctr_t W(unsigned int a, threefry2x64_ctr_t b, threefry2x64_key_t c) {
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
    d.v[1] = T(d.v[1], R_64x2_0_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 1) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_1_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 2) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_2_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 3) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_3_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 3) {
    d.v[0] += e[1];
    d.v[1] += e[2];
    d.v[1] += 1;
  }
  if (a > 4) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_4_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 5) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_5_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 6) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_6_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 7) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_7_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 7) {
    d.v[0] += e[2];
    d.v[1] += e[0];
    d.v[1] += 2;
  }
  if (a > 8) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_0_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 9) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_1_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 10) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_2_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 11) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_3_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 11) {
    d.v[0] += e[0];
    d.v[1] += e[1];
    d.v[1] += 3;
  }
  if (a > 12) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_4_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 13) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_5_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 14) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_6_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 15) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_7_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 15) {
    d.v[0] += e[1];
    d.v[1] += e[2];
    d.v[1] += 4;
  }
  if (a > 16) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_0_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 17) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_1_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 18) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_2_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 19) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_3_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 19) {
    d.v[0] += e[2];
    d.v[1] += e[0];
    d.v[1] += 5;
  }
  if (a > 20) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_4_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 21) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_5_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 22) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_6_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 23) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_7_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 23) {
    d.v[0] += e[0];
    d.v[1] += e[1];
    d.v[1] += 6;
  }
  if (a > 24) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_0_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 25) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_1_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 26) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_2_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 27) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_3_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 27) {
    d.v[0] += e[1];
    d.v[1] += e[2];
    d.v[1] += 7;
  }
  if (a > 28) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_4_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 29) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_5_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 30) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_6_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 31) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x2_7_0);
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
inline threefry2x64_ctr_t X(threefry2x64_ctr_t a, threefry2x64_key_t b) __attribute__((always_inline));
inline threefry2x64_ctr_t X(threefry2x64_ctr_t a, threefry2x64_key_t b) {
  return W(threefry2x64_rounds, a, b);
}
typedef struct r123array2x32 threefry2x32_ctr_t;
typedef struct r123array2x32 threefry2x32_key_t;
typedef struct r123array2x32 threefry2x32_ukey_t;
inline threefry2x32_key_t Y(threefry2x32_ukey_t a) {
  return a;
}
inline threefry2x32_ctr_t Z(unsigned int a, threefry2x32_ctr_t b, threefry2x32_key_t c) __attribute__((always_inline));
inline threefry2x32_ctr_t Z(unsigned int a, threefry2x32_ctr_t b, threefry2x32_key_t c) {
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
    d.v[1] = U(d.v[1], R_32x2_0_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 1) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_1_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 2) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_2_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 3) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_3_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 3) {
    d.v[0] += e[1];
    d.v[1] += e[2];
    d.v[1] += 1;
  }
  if (a > 4) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_4_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 5) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_5_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 6) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_6_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 7) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_7_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 7) {
    d.v[0] += e[2];
    d.v[1] += e[0];
    d.v[1] += 2;
  }
  if (a > 8) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_0_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 9) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_1_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 10) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_2_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 11) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_3_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 11) {
    d.v[0] += e[0];
    d.v[1] += e[1];
    d.v[1] += 3;
  }
  if (a > 12) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_4_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 13) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_5_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 14) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_6_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 15) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_7_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 15) {
    d.v[0] += e[1];
    d.v[1] += e[2];
    d.v[1] += 4;
  }
  if (a > 16) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_0_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 17) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_1_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 18) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_2_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 19) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_3_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 19) {
    d.v[0] += e[2];
    d.v[1] += e[0];
    d.v[1] += 5;
  }
  if (a > 20) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_4_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 21) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_5_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 22) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_6_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 23) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_7_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 23) {
    d.v[0] += e[0];
    d.v[1] += e[1];
    d.v[1] += 6;
  }
  if (a > 24) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_0_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 25) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_1_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 26) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_2_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 27) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_3_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 27) {
    d.v[0] += e[1];
    d.v[1] += e[2];
    d.v[1] += 7;
  }
  if (a > 28) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_4_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 29) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_5_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 30) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_6_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 31) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x2_7_0);
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
inline threefry2x32_ctr_t AA(threefry2x32_ctr_t a, threefry2x32_key_t b) __attribute__((always_inline));
inline threefry2x32_ctr_t AA(threefry2x32_ctr_t a, threefry2x32_key_t b) {
  return Z(threefry2x32_rounds, a, b);
}
typedef struct r123array4x64 threefry4x64_ctr_t;
typedef struct r123array4x64 threefry4x64_key_t;
typedef struct r123array4x64 threefry4x64_ukey_t;
inline threefry4x64_key_t AB(threefry4x64_ukey_t a) {
  return a;
}
inline threefry4x64_ctr_t AC(unsigned int a, threefry4x64_ctr_t b, threefry4x64_key_t c) __attribute__((always_inline));
inline threefry4x64_ctr_t AC(unsigned int a, threefry4x64_ctr_t b, threefry4x64_key_t c) {
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
    d.v[1] = T(d.v[1], R_64x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 1) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 2) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 3) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_3_1);
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
    d.v[1] = T(d.v[1], R_64x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 5) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 6) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 7) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_7_1);
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
    d.v[1] = T(d.v[1], R_64x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 9) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 10) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 11) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_3_1);
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
    d.v[1] = T(d.v[1], R_64x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 13) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 14) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 15) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_7_1);
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
    d.v[1] = T(d.v[1], R_64x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 17) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 18) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 19) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_3_1);
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
    d.v[1] = T(d.v[1], R_64x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 21) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 22) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 23) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_7_1);
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
    d.v[1] = T(d.v[1], R_64x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 25) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 26) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 27) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_3_1);
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
    d.v[1] = T(d.v[1], R_64x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 29) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 30) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 31) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_7_1);
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
    d.v[1] = T(d.v[1], R_64x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 33) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 34) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 35) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_3_1);
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
    d.v[1] = T(d.v[1], R_64x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 37) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 38) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 39) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_7_1);
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
    d.v[1] = T(d.v[1], R_64x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 41) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 42) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 43) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_3_1);
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
    d.v[1] = T(d.v[1], R_64x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 45) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 46) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 47) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_7_1);
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
    d.v[1] = T(d.v[1], R_64x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 49) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 50) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 51) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_3_1);
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
    d.v[1] = T(d.v[1], R_64x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 53) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 54) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 55) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_7_1);
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
    d.v[1] = T(d.v[1], R_64x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 57) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 58) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 59) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_3_1);
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
    d.v[1] = T(d.v[1], R_64x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 61) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 62) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 63) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_7_1);
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
    d.v[1] = T(d.v[1], R_64x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 65) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 66) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 67) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_3_1);
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
    d.v[1] = T(d.v[1], R_64x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 69) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 70) {
    d.v[0] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 71) {
    d.v[0] += d.v[3];
    d.v[3] = T(d.v[3], R_64x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = T(d.v[1], R_64x4_7_1);
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
inline threefry4x64_ctr_t AD(threefry4x64_ctr_t a, threefry4x64_key_t b) __attribute__((always_inline));
inline threefry4x64_ctr_t AD(threefry4x64_ctr_t a, threefry4x64_key_t b) {
  return AC(threefry4x64_rounds, a, b);
}
typedef struct r123array4x32 threefry4x32_ctr_t;
typedef struct r123array4x32 threefry4x32_key_t;
typedef struct r123array4x32 threefry4x32_ukey_t;
inline threefry4x32_key_t AE(threefry4x32_ukey_t a) {
  return a;
}
inline threefry4x32_ctr_t AF(unsigned int a, threefry4x32_ctr_t b, threefry4x32_key_t c) __attribute__((always_inline));
inline threefry4x32_ctr_t AF(unsigned int a, threefry4x32_ctr_t b, threefry4x32_key_t c) {
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
    d.v[1] = U(d.v[1], R_32x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 1) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 2) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 3) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_3_1);
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
    d.v[1] = U(d.v[1], R_32x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 5) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 6) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 7) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_7_1);
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
    d.v[1] = U(d.v[1], R_32x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 9) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 10) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 11) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_3_1);
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
    d.v[1] = U(d.v[1], R_32x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 13) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 14) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 15) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_7_1);
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
    d.v[1] = U(d.v[1], R_32x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 17) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 18) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 19) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_3_1);
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
    d.v[1] = U(d.v[1], R_32x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 21) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 22) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 23) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_7_1);
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
    d.v[1] = U(d.v[1], R_32x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 25) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 26) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 27) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_3_1);
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
    d.v[1] = U(d.v[1], R_32x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 29) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 30) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 31) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_7_1);
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
    d.v[1] = U(d.v[1], R_32x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 33) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 34) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 35) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_3_1);
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
    d.v[1] = U(d.v[1], R_32x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 37) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 38) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 39) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_7_1);
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
    d.v[1] = U(d.v[1], R_32x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 41) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 42) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 43) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_3_1);
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
    d.v[1] = U(d.v[1], R_32x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 45) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 46) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 47) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_7_1);
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
    d.v[1] = U(d.v[1], R_32x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 49) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 50) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 51) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_3_1);
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
    d.v[1] = U(d.v[1], R_32x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 53) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 54) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 55) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_7_1);
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
    d.v[1] = U(d.v[1], R_32x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 57) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 58) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 59) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_3_1);
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
    d.v[1] = U(d.v[1], R_32x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 61) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 62) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 63) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_7_1);
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
    d.v[1] = U(d.v[1], R_32x4_0_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_0_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 65) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_1_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_1_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 66) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_2_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_2_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 67) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_3_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_3_1);
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
    d.v[1] = U(d.v[1], R_32x4_4_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_4_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 69) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_5_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_5_1);
    d.v[1] ^= d.v[2];
  }
  if (a > 70) {
    d.v[0] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_6_0);
    d.v[1] ^= d.v[0];
    d.v[2] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_6_1);
    d.v[3] ^= d.v[2];
  }
  if (a > 71) {
    d.v[0] += d.v[3];
    d.v[3] = U(d.v[3], R_32x4_7_0);
    d.v[3] ^= d.v[0];
    d.v[2] += d.v[1];
    d.v[1] = U(d.v[1], R_32x4_7_1);
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
inline threefry4x32_ctr_t AG(threefry4x32_ctr_t a, threefry4x32_key_t b) __attribute__((always_inline));
inline threefry4x32_ctr_t AG(threefry4x32_ctr_t a, threefry4x32_key_t b) {
  return AF(threefry4x32_rounds, a, b);
}
__kernel void AH(uint64_t a, philox4x32_ukey_t b, philox4x32_ctr_t c, __global philox4x32_ctr_t* d) {
  uint e = (uint)a;
  unsigned f = get_global_id(0);
  uint g;
  philox4x32_ctr_t h, i = {{0}};
  philox4x32_key_t j = J(b);
  h = c;
  if (7 == philox4x32_rounds) {
    for (g = 0; g < e; ++g) {
      i = K(philox4x32_rounds, h, j);
      do {
        if (4 == 4)
          if (!(i.v[4 > 2 ? 3 : 0] ^ i.v[4 > 2 ? 2 : 0] ^ i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 2)
          if (!(i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  } else {
    for (g = 0; g < e; ++g) {
      i = K(7, h, j);
      do {
        if (4 == 4)
          if (!(i.v[4 > 2 ? 3 : 0] ^ i.v[4 > 2 ? 2 : 0] ^ i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 2)
          if (!(i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  }
  d[f] = i;
}
__kernel void AI(uint64_t a, philox4x32_ukey_t b, philox4x32_ctr_t c, __global philox4x32_ctr_t* d) {
  uint e = (uint)a;
  unsigned f = get_global_id(0);
  uint g;
  philox4x32_ctr_t h, i = {{0}};
  philox4x32_key_t j = J(b);
  h = c;
  if (10 == philox4x32_rounds) {
    for (g = 0; g < e; ++g) {
      i = K(philox4x32_rounds, h, j);
      do {
        if (4 == 4)
          if (!(i.v[4 > 2 ? 3 : 0] ^ i.v[4 > 2 ? 2 : 0] ^ i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 2)
          if (!(i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  } else {
    for (g = 0; g < e; ++g) {
      i = K(10, h, j);
      do {
        if (4 == 4)
          if (!(i.v[4 > 2 ? 3 : 0] ^ i.v[4 > 2 ? 2 : 0] ^ i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 2)
          if (!(i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  }
  d[f] = i;
}

__kernel void AJ(uint64_t a, philox2x64_ukey_t b, philox2x64_ctr_t c, __global philox2x64_ctr_t* d) {
  uint e = (uint)a;
  unsigned f = get_global_id(0);
  uint g;
  philox2x64_ctr_t h, i = {{0}};
  philox2x64_key_t j = P(b);
  h = c;
  if (6 == philox2x64_rounds) {
    for (g = 0; g < e; ++g) {
      i = Q(philox2x64_rounds, h, j);
      do {
        if (2 == 4)
          if (!(i.v[2 > 2 ? 3 : 0] ^ i.v[2 > 2 ? 2 : 0] ^ i.v[2 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (2 == 2)
          if (!(i.v[2 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (2 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  } else {
    for (g = 0; g < e; ++g) {
      i = Q(6, h, j);
      do {
        if (2 == 4)
          if (!(i.v[2 > 2 ? 3 : 0] ^ i.v[2 > 2 ? 2 : 0] ^ i.v[2 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (2 == 2)
          if (!(i.v[2 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (2 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  }
  d[f] = i;
}
__kernel void AK(uint64_t a, philox2x64_ukey_t b, philox2x64_ctr_t c, __global philox2x64_ctr_t* d) {
  uint e = (uint)a;
  unsigned f = get_global_id(0);
  uint g;
  philox2x64_ctr_t h, i = {{0}};
  philox2x64_key_t j = P(b);
  h = c;
  if (10 == philox2x64_rounds) {
    for (g = 0; g < e; ++g) {
      i = Q(philox2x64_rounds, h, j);
      do {
        if (2 == 4)
          if (!(i.v[2 > 2 ? 3 : 0] ^ i.v[2 > 2 ? 2 : 0] ^ i.v[2 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (2 == 2)
          if (!(i.v[2 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (2 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  } else {
    for (g = 0; g < e; ++g) {
      i = Q(10, h, j);
      do {
        if (2 == 4)
          if (!(i.v[2 > 2 ? 3 : 0] ^ i.v[2 > 2 ? 2 : 0] ^ i.v[2 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (2 == 2)
          if (!(i.v[2 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (2 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  }
  d[f] = i;
}
__kernel void AL(uint64_t a, philox4x64_ukey_t b, philox4x64_ctr_t c, __global philox4x64_ctr_t* d) {
  uint e = (uint)a;
  unsigned f = get_global_id(0);
  uint g;
  philox4x64_ctr_t h, i = {{0}};
  philox4x64_key_t j = R(b);
  h = c;
  if (7 == philox4x64_rounds) {
    for (g = 0; g < e; ++g) {
      i = S(philox4x64_rounds, h, j);
      do {
        if (4 == 4)
          if (!(i.v[4 > 2 ? 3 : 0] ^ i.v[4 > 2 ? 2 : 0] ^ i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 2)
          if (!(i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  } else {
    for (g = 0; g < e; ++g) {
      i = S(7, h, j);
      do {
        if (4 == 4)
          if (!(i.v[4 > 2 ? 3 : 0] ^ i.v[4 > 2 ? 2 : 0] ^ i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 2)
          if (!(i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  }
  d[f] = i;
}
__kernel void AM(uint64_t a, philox4x64_ukey_t b, philox4x64_ctr_t c, __global philox4x64_ctr_t* d) {
  uint e = (uint)a;
  unsigned f = get_global_id(0);
  uint g;
  philox4x64_ctr_t h, i = {{0}};
  philox4x64_key_t j = R(b);
  h = c;
  if (10 == philox4x64_rounds) {
    for (g = 0; g < e; ++g) {
      i = S(philox4x64_rounds, h, j);
      do {
        if (4 == 4)
          if (!(i.v[4 > 2 ? 3 : 0] ^ i.v[4 > 2 ? 2 : 0] ^ i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 2)
          if (!(i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  } else {
    for (g = 0; g < e; ++g) {
      i = S(10, h, j);
      do {
        if (4 == 4)
          if (!(i.v[4 > 2 ? 3 : 0] ^ i.v[4 > 2 ? 2 : 0] ^ i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 2)
          if (!(i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  }
  d[f] = i;
}

__kernel void AN(uint64_t a, threefry2x64_ukey_t b, threefry2x64_ctr_t c, __global threefry2x64_ctr_t* d) {
  uint e = (uint)a;
  unsigned f = get_global_id(0);
  uint g;
  threefry2x64_ctr_t h, i = {{0}};
  threefry2x64_key_t j = V(b);
  h = c;
  if (13 == threefry2x64_rounds) {
    for (g = 0; g < e; ++g) {
      i = W(threefry2x64_rounds, h, j);
      do {
        if (2 == 4)
          if (!(i.v[2 > 2 ? 3 : 0] ^ i.v[2 > 2 ? 2 : 0] ^ i.v[2 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (2 == 2)
          if (!(i.v[2 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (2 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  } else {
    for (g = 0; g < e; ++g) {
      i = W(13, h, j);
      do {
        if (2 == 4)
          if (!(i.v[2 > 2 ? 3 : 0] ^ i.v[2 > 2 ? 2 : 0] ^ i.v[2 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (2 == 2)
          if (!(i.v[2 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (2 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  }
  d[f] = i;
}
__kernel void AO(uint64_t a, threefry2x64_ukey_t b, threefry2x64_ctr_t c, __global threefry2x64_ctr_t* d) {
  uint e = (uint)a;
  unsigned f = get_global_id(0);
  uint g;
  threefry2x64_ctr_t h, i = {{0}};
  threefry2x64_key_t j = V(b);
  h = c;
  if (20 == threefry2x64_rounds) {
    for (g = 0; g < e; ++g) {
      i = W(threefry2x64_rounds, h, j);
      do {
        if (2 == 4)
          if (!(i.v[2 > 2 ? 3 : 0] ^ i.v[2 > 2 ? 2 : 0] ^ i.v[2 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (2 == 2)
          if (!(i.v[2 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (2 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  } else {
    for (g = 0; g < e; ++g) {
      i = W(20, h, j);
      do {
        if (2 == 4)
          if (!(i.v[2 > 2 ? 3 : 0] ^ i.v[2 > 2 ? 2 : 0] ^ i.v[2 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (2 == 2)
          if (!(i.v[2 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (2 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  }
  d[f] = i;
}
__kernel void AP(uint64_t a, threefry4x64_ukey_t b, threefry4x64_ctr_t c, __global threefry4x64_ctr_t* d) {
  uint e = (uint)a;
  unsigned f = get_global_id(0);
  uint g;
  threefry4x64_ctr_t h, i = {{0}};
  threefry4x64_key_t j = AB(b);
  h = c;
  if (12 == threefry4x64_rounds) {
    for (g = 0; g < e; ++g) {
      i = AC(threefry4x64_rounds, h, j);
      do {
        if (4 == 4)
          if (!(i.v[4 > 2 ? 3 : 0] ^ i.v[4 > 2 ? 2 : 0] ^ i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 2)
          if (!(i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  } else {
    for (g = 0; g < e; ++g) {
      i = AC(12, h, j);
      do {
        if (4 == 4)
          if (!(i.v[4 > 2 ? 3 : 0] ^ i.v[4 > 2 ? 2 : 0] ^ i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 2)
          if (!(i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  }
  d[f] = i;
}
__kernel void AQ(uint64_t a, threefry4x64_ukey_t b, threefry4x64_ctr_t c, __global threefry4x64_ctr_t* d) {
  uint e = (uint)a;
  unsigned f = get_global_id(0);
  uint g;
  threefry4x64_ctr_t h, i = {{0}};
  threefry4x64_key_t j = AB(b);
  h = c;
  if (20 == threefry4x64_rounds) {
    for (g = 0; g < e; ++g) {
      i = AC(threefry4x64_rounds, h, j);
      do {
        if (4 == 4)
          if (!(i.v[4 > 2 ? 3 : 0] ^ i.v[4 > 2 ? 2 : 0] ^ i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 2)
          if (!(i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  } else {
    for (g = 0; g < e; ++g) {
      i = AC(20, h, j);
      do {
        if (4 == 4)
          if (!(i.v[4 > 2 ? 3 : 0] ^ i.v[4 > 2 ? 2 : 0] ^ i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 2)
          if (!(i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  }
  d[f] = i;
}
__kernel void AR(uint64_t a, threefry4x32_ukey_t b, threefry4x32_ctr_t c, __global threefry4x32_ctr_t* d) {
  uint e = (uint)a;
  unsigned f = get_global_id(0);
  uint g;
  threefry4x32_ctr_t h, i = {{0}};
  threefry4x32_key_t j = AE(b);
  h = c;
  if (12 == threefry4x32_rounds) {
    for (g = 0; g < e; ++g) {
      i = AF(threefry4x32_rounds, h, j);
      do {
        if (4 == 4)
          if (!(i.v[4 > 2 ? 3 : 0] ^ i.v[4 > 2 ? 2 : 0] ^ i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 2)
          if (!(i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  } else {
    for (g = 0; g < e; ++g) {
      i = AF(12, h, j);
      do {
        if (4 == 4)
          if (!(i.v[4 > 2 ? 3 : 0] ^ i.v[4 > 2 ? 2 : 0] ^ i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 2)
          if (!(i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  }
  d[f] = i;
}
__kernel void AS(uint64_t a, threefry4x32_ukey_t b, threefry4x32_ctr_t c, __global threefry4x32_ctr_t* d) {
  uint e = (uint)a;
  unsigned f = get_global_id(0);
  uint g;
  threefry4x32_ctr_t h, i = {{0}};
  threefry4x32_key_t j = AE(b);
  h = c;
  if (20 == threefry4x32_rounds) {
    for (g = 0; g < e; ++g) {
      i = AF(threefry4x32_rounds, h, j);
      do {
        if (4 == 4)
          if (!(i.v[4 > 2 ? 3 : 0] ^ i.v[4 > 2 ? 2 : 0] ^ i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 2)
          if (!(i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  } else {
    for (g = 0; g < e; ++g) {
      i = AF(20, h, j);
      do {
        if (4 == 4)
          if (!(i.v[4 > 2 ? 3 : 0] ^ i.v[4 > 2 ? 2 : 0] ^ i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 2)
          if (!(i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  }
  d[f] = i;
}
__kernel void AT(uint64_t a, threefry4x64_ukey_t b, threefry4x64_ctr_t c, __global threefry4x64_ctr_t* d) {
  uint e = (uint)a;
  unsigned f = get_global_id(0);
  uint g;
  threefry4x64_ctr_t h, i = {{0}};
  threefry4x64_key_t j = AB(b);
  h = c;
  if (72 == threefry4x64_rounds) {
    for (g = 0; g < e; ++g) {
      i = AC(threefry4x64_rounds, h, j);
      do {
        if (4 == 4)
          if (!(i.v[4 > 2 ? 3 : 0] ^ i.v[4 > 2 ? 2 : 0] ^ i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 2)
          if (!(i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  } else {
    for (g = 0; g < e; ++g) {
      i = AC(72, h, j);
      do {
        if (4 == 4)
          if (!(i.v[4 > 2 ? 3 : 0] ^ i.v[4 > 2 ? 2 : 0] ^ i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 2)
          if (!(i.v[4 > 1 ? 1 : 0] ^ i.v[0]))
            ++g;
        if (4 == 1)
          if (!(i.v[0]))
            ++g;
      } while (0);
      h.v[0]++;
    }
  }
  d[f] = i;
}