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
float T(int a, unsigned int b, unsigned int c) {
  philox4x32_key_t d = c, 0x12345678
}
}
;
philox4x32_ctr_t e = {{bxbeeff00d}};

union {
  philox4x32_ctr_t c;
  int4 i;
} f;

f.c = K(philox4x32_rounds, e, d);
unsigned int g = (unsigned int)f.i.x;

float h = g * (1.0 / 4294967296.0);
return h;
}
int U(int a, unsigned int b, unsigned int c, int d, int e) {
  e++;
  return (int)((abs(e - d) * T(a, b, c)) + d);
}
float V(int a, unsigned int b, unsigned int c, float d, float e) {
  return (float)((__clc_fabs(e - d) * T(a, b, c)) + d);
}
__constant float Ga[2] = {0.039210598915815353f, 0.039210598915815353f};
__constant float Gb[2] = {20.0f, 22.0f};
__constant float Gc[2] = {0.064493000507354736, 0.064493000507354736};
__constant float Gd[2] = {-2.4271199703216553, -2.4271199703216553};
__constant float Ge[2] = {0.01, 0.02};
__constant float Gf[2] = {10, 15};
__constant float Gg[2] = {1, 1};

float W(float a, unsigned char b, unsigned char c) {
  if (__clc_fabs(a) > 0)
    a -= (a * Gc[c]);
  else
    a = 0;

  if (b)
    a += Gd[c];

  return a;
}

float X(unsigned int a, unsigned short b, __global float* c) {
  unsigned int d = a + b;

  float e = 0;
  for (unsigned int f = a; f < d; f++)
    e += c[f];

  return e;
}

inline void Y(unsigned int a, unsigned short* b, unsigned char* c, unsigned int* d) {
  *b = (a & 0x0000007F);
  *c = (a & 0x00000080) >> 7;
  *d = (a & 0xFFFFFF00) >> 8;
}

inline unsigned int Z(unsigned short a, unsigned char b, unsigned int c) {
  c = (c << 1) | b;
  unsigned int d = (c << 8) | (b << 7) | (a & 0x0000007F);
  return d;
}

inline void AA(unsigned int a, unsigned short* b, unsigned char* c) {
  *b = (a & 0x0000FFFF);
  *c = (a & 0x00FF0000) >> 16;
}

__kernel void AB(unsigned int a, unsigned int b, __global float* c, __global float* d, __global float* e, __global float* f, __global unsigned int* g, __global unsigned int* h, __global unsigned int* i, __global float* j, __global float* k) {
  unsigned int l = get_global_id(0);

  float m = c[l];
  float n = d[l];
  float o = e[l];

  unsigned int p = h[l];
  unsigned int q = i[l];
  unsigned short r = 0;
  unsigned char s = 0;
  unsigned char t = 0;
  unsigned int u = 0;

  float v = f[l];
  unsigned int w = g[l];
  unsigned short x = 0;
  unsigned char y = 0;

  Y(p, &r, &s, &u);
  AA(q, &x, &y);

  t = s;

  float z = X(w, x, j);

  n = W(n, s, y);

  float aa = o * Gg[y];

  float ab = 0;

  m += (n + aa + z + ab - (m * Ga[y]));

  if (r > 0) {
    r--;
    s = 0;
  } else if (m > Gb[y]) {
    r = Gf[y];
    s = 1;
  } else {
    r = 0;
    s = 0;
  }

  p = Z(r, s, u);

  c[l] = m;
  d[l] = n;
  f[l] = 0;
  h[l] = p;
  k[l] = ab;
}