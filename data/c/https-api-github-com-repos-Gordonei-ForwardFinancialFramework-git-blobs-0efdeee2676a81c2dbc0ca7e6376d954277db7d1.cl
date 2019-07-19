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
  uint8 x;
  uint8 c;
} mwc64xvec8_state_t;

enum { MWC64XVEC8_A = 4294883355U };
enum { MWC64XVEC8_M = 18446383549859758079UL };

void F(mwc64xvec8_state_t* a) {
  uint8 b = a->x, c = a->c;

  uint8 d = MWC64XVEC8_A * b + c;

  uint8 e = __builtin_astype(-(d < c), uint8);
  uint8 f = (mul_hi(((uint8)MWC64XVEC8_A), (b)) + (e));

  a->x = d;
  a->c = f;
}

void G(mwc64xvec8_state_t* a, ulong b) {
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

void H(mwc64xvec8_state_t* a, ulong b, ulong c) {
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

uint8 I(mwc64xvec8_state_t* a) {
  uint8 b = a->x ^ a->c;
  F(a);
  return b;
}