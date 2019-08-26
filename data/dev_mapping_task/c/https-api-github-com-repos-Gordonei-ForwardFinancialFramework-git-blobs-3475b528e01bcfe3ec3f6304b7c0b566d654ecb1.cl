ulong A(ulong a, ulong b, ulong c) {
  ulong d = a + b;
  if ((d >= c) || (d < a))
    d = d - c;
  return d;
}

ulong B(ulong a, ulong b, ulong c) {
  ulong d = 0;
  while (a != 0) {
    if (a & 1)
      d = A(d, b, c);
    b = A(b, b, c);
    a = a >> 1;
  }
  return d;
}

ulong C(ulong a, ulong b, ulong c) {
  ulong d = a, e = 1;
  while (b != 0) {
    if (b & 1)
      e = B(e, d, c);
    d = B(d, d, c);
    b = b >> 1;
  }
  return e;
}

uint2 D(uint2 a, ulong b, ulong c, ulong d) {
  ulong e = C(b, d, c);
  ulong f = a.x * (ulong)b + a.y;
  f = B(f, e, c);
  return (uint2)((uint)(f / b), (uint)(f % b));
}

uint2 E(ulong a, ulong b, uint c, uint d, ulong e, ulong f) {
  enum { MWC_BASEID = 4077358422479273989UL };

  ulong g = e + (get_global_id(0) * c + d) * f;
  ulong h = C(a, g, b);

  ulong i = B(MWC_BASEID, h, b);
  return (uint2)((uint)(i / a), (uint)(i % a));
}

typedef struct {
  uint x;
  uint c;
} mwc64x_state_t;

enum { MWC64X_A = 4294883355U };
enum { MWC64X_M = 18446383549859758079UL };

void F(mwc64x_state_t* a) {
  uint b = a->x, c = a->c;

  uint d = MWC64X_A * b + c;
  uint e = (uint)(d < c);
  uint f = (mul_hi((MWC64X_A), (b)) + (e));

  a->x = d;
  a->c = f;
}

void G(mwc64x_state_t* a, ulong b) {
  uint2 c = D((uint2)(a->x, a->c), MWC64X_A, MWC64X_M, b);
  a->x = c.x;
  a->c = c.y;
}

void H(mwc64x_state_t* a, ulong b, ulong c) {
  uint2 d = E(MWC64X_A, MWC64X_M, 1, 0, b, c);
  a->x = d.x;
  a->c = d.y;
}

uint I(mwc64x_state_t* a) {
  uint b = a->x ^ a->c;
  F(a);
  return b;
}
typedef struct {
  uint2 x;
  uint2 c;
} mwc64xvec2_state_t;

enum { MWC64XVEC2_A = 4294883355U };
enum { MWC64XVEC2_M = 18446383549859758079UL };

void J(mwc64xvec2_state_t* a) {
  uint2 b = a->x, c = a->c;

  uint2 d = MWC64XVEC2_A * b + c;

  uint2 e = __builtin_astype(-(d < c), uint2);
  uint2 f = (mul_hi(((uint2)MWC64XVEC2_A), (b)) + (e));

  a->x = d;
  a->c = f;
}

void K(mwc64xvec2_state_t* a, ulong b) {
  uint2 c = D((uint2)(a->x.s0, a->c.s0), MWC64XVEC2_A, MWC64XVEC2_M, b);
  uint2 d = D((uint2)(a->x.s1, a->c.s1), MWC64XVEC2_A, MWC64XVEC2_M, b);
 a->x=(uint2)(c d;
 a->c=(uint2)(c d;
}

void L(mwc64xvec2_state_t* a, ulong b, ulong c) {
  uint2 d = E(MWC64XVEC2_A, MWC64XVEC2_M, 2, 0, b, c);
  uint2 e = E(MWC64XVEC2_A, MWC64XVEC2_M, 2, 1, b, c);
 a->x=(uint2)(d e;
 a->c=(uint2)(d e;
}

uint2 M(mwc64xvec2_state_t* a) {
  uint2 b = a->x ^ a->c;
  J(a);
  return b;
}
typedef struct {
  uint4 x;
  uint4 c;
} mwc64xvec4_state_t;

enum { MWC64XVEC4_A = 4294883355U };
enum { MWC64XVEC4_M = 18446383549859758079UL };

void N(mwc64xvec4_state_t* a) {
  uint4 b = a->x, c = a->c;

  uint4 d = MWC64XVEC4_A * b + c;

  uint4 e = __builtin_astype(-(d < c), uint4);
  uint4 f = (mul_hi(((uint4)MWC64XVEC4_A), (b)) + (e));

  a->x = d;
  a->c = f;
}

void O(mwc64xvec4_state_t* a, ulong b) {
  uint2 c = D((uint2)(a->x.s0, a->c.s0), MWC64XVEC4_A, MWC64XVEC4_M, b);
  uint2 d = D((uint2)(a->x.s1, a->c.s1), MWC64XVEC4_A, MWC64XVEC4_M, b);
  uint2 e = D((uint2)(a->x.s2, a->c.s2), MWC64XVEC4_A, MWC64XVEC4_M, b);
  uint2 f = D((uint2)(a->x.s3, a->c.s3), MWC64XVEC4_A, MWC64XVEC4_M, b);
 a->x=(uint4)(c d e f;
 a->c=(uint4)(c d e f;
}

void P(mwc64xvec4_state_t* a, ulong b, ulong c) {
  uint2 d = E(MWC64XVEC4_A, MWC64XVEC4_M, 4, 0, b, c);
  uint2 e = E(MWC64XVEC4_A, MWC64XVEC4_M, 4, 1, b, c);
  uint2 f = E(MWC64XVEC4_A, MWC64XVEC4_M, 4, 2, b, c);
  uint2 g = E(MWC64XVEC4_A, MWC64XVEC4_M, 4, 3, b, c);
 a->x=(uint4)(d e f g;
 a->c=(uint4)(d e f g;
}

uint4 Q(mwc64xvec4_state_t* a) {
  uint4 b = a->x ^ a->c;
  N(a);
  return b;
}
typedef struct {
  uint8 x;
  uint8 c;
} mwc64xvec8_state_t;

enum { MWC64XVEC8_A = 4294883355U };
enum { MWC64XVEC8_M = 18446383549859758079UL };

void R(mwc64xvec8_state_t* a) {
  uint8 b = a->x, c = a->c;

  uint8 d = MWC64XVEC8_A * b + c;

  uint8 e = __builtin_astype(-(d < c), uint8);
  uint8 f = (mul_hi(((uint8)MWC64XVEC8_A), (b)) + (e));

  a->x = d;
  a->c = f;
}

void S(mwc64xvec8_state_t* a, ulong b) {
  uint2 c = D((uint2)(a->x.s0, a->c.s0), MWC64XVEC8_A, MWC64XVEC8_M, b);
  uint2 d = D((uint2)(a->x.s1, a->c.s1), MWC64XVEC8_A, MWC64XVEC8_M, b);
  uint2 e = D((uint2)(a->x.s2, a->c.s2), MWC64XVEC8_A, MWC64XVEC8_M, b);
  uint2 f = D((uint2)(a->x.s3, a->c.s3), MWC64XVEC8_A, MWC64XVEC8_M, b);
  uint2 g = D((uint2)(a->x.s4, a->c.s4), MWC64XVEC8_A, MWC64XVEC8_M, b);
  uint2 h = D((uint2)(a->x.s5, a->c.s5), MWC64XVEC8_A, MWC64XVEC8_M, b);
  uint2 i = D((uint2)(a->x.s6, a->c.s6), MWC64XVEC8_A, MWC64XVEC8_M, b);
  uint2 j = D((uint2)(a->x.s7, a->c.s7), MWC64XVEC8_A, MWC64XVEC8_M, b);
 a->x=(uint8)(c d e f g h i j;
 a->c=(uint8)(c d e f g h i j;
}

void T(mwc64xvec8_state_t* a, ulong b, ulong c) {
  uint2 d = E(MWC64XVEC8_A, MWC64XVEC8_M, 8, 0, b, c);
  uint2 e = E(MWC64XVEC8_A, MWC64XVEC8_M, 8, 1, b, c);
  uint2 f = E(MWC64XVEC8_A, MWC64XVEC8_M, 8, 2, b, c);
  uint2 g = E(MWC64XVEC8_A, MWC64XVEC8_M, 8, 3, b, c);
  uint2 h = E(MWC64XVEC8_A, MWC64XVEC8_M, 8, 4, b, c);
  uint2 i = E(MWC64XVEC8_A, MWC64XVEC8_M, 8, 5, b, c);
  uint2 j = E(MWC64XVEC8_A, MWC64XVEC8_M, 8, 6, b, c);
  uint2 k = E(MWC64XVEC8_A, MWC64XVEC8_M, 8, 7, b, c);
 a->x=(uint8)(d e f g h i j k;
 a->c=(uint8)(d e f g h i j k;
}

uint8 U(mwc64xvec8_state_t* a) {
  uint8 b = a->x ^ a->c;
  R(a);
  return b;
}

__kernel void V(__global uint* a) {
  mwc64xvec8_state_t b = {(uint8)(0, 0, 0, 0, 0, 0, 0, 0), (uint8)(1, 2, 3, 4, 5, 6, 7, 8)}, c;
  mwc64x_state_t d = {0, 1}, e;
  uint f = 1;

  for (uint g = 0; (g < 4096 && f); g++) {
    c = b;
    S(&c, g);
    G(&e, g);
    for (uint h = 0; h < g; h++) {
      U(&b);
      I(&d);
    }
    f &= ((b.x.s0 == d.x) && (b.c.s0 == d.c));
    f &= (all(b.x == c.x) && all(b.c == c.c));
  }

  *a = f;
}

__kernel void W(uint a, __global uint* b) {
  ulong c = a / (8 * get_global_size(0));

  mwc64xvec8_state_t d;
  T(&d, 0, c);

  for (uint e = 0; e < c; e++) {
    uint8 f = U(&d);
    b[get_global_id(0) * 8 * c + 0 * c + e] = f.s0;
    b[get_global_id(0) * 8 * c + 1 * c + e] = f.s1;
    b[get_global_id(0) * 8 * c + 2 * c + e] = f.s2;
    b[get_global_id(0) * 8 * c + 3 * c + e] = f.s3;
    b[get_global_id(0) * 8 * c + 4 * c + e] = f.s4;
    b[get_global_id(0) * 8 * c + 5 * c + e] = f.s5;
    b[get_global_id(0) * 8 * c + 6 * c + e] = f.s6;
    b[get_global_id(0) * 8 * c + 7 * c + e] = f.s7;
  }
}

__kernel void X(ulong a, ulong b, __global ulong* c) {
  mwc64xvec8_state_t d;
  ulong e = a / (8 * get_global_size(0));
  T(&d, b, 2 * e);
  uint f = 0;
  for (uint g = 0; g < e; g++) {
    ulong8 h = convert_ulong8(U(&d));
    ulong8 i = convert_ulong8(U(&d));
    ulong8 j = h * h;
    ulong8 k = i * i;
    long8 l = -(j + k >= j);
    f += l.s0 + l.s1 + l.s2 + l.s3 + l.s4 + l.s5 + l.s6 + l.s7;
  }
  c[get_global_id(0)] = f;
}