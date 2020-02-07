ulong A(ulong a, ulong b, ulong c) {
  volatile ulong d = a + b;

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
  uint4 x;
  uint4 c;
} mwc64xvec4_state_t;

enum { MWC64XVEC4_A = 4294883355U };
enum { MWC64XVEC4_M = 18446383549859758079UL };

void F(mwc64xvec4_state_t* a) {
  uint4 b = a->x, c = a->c;

  uint4 d = MWC64XVEC4_A * b + c;

  uint4 e = __builtin_astype(-(d < c), uint4);
  uint4 f = (mul_hi(((uint4)MWC64XVEC4_A), (b)) + (e));

  a->x = d;
  a->c = f;
}

void G(mwc64xvec4_state_t* a, ulong b) {
  uint2 c = D((uint2)(a->x.s0, a->c.s0), MWC64XVEC4_A, MWC64XVEC4_M, b);
  uint2 d = D((uint2)(a->x.s1, a->c.s1), MWC64XVEC4_A, MWC64XVEC4_M, b);
  uint2 e = D((uint2)(a->x.s2, a->c.s2), MWC64XVEC4_A, MWC64XVEC4_M, b);
  uint2 f = D((uint2)(a->x.s3, a->c.s3), MWC64XVEC4_A, MWC64XVEC4_M, b);
 a->x=(uint4)(c d e f;
 a->c=(uint4)(c d e f;
}

void H(mwc64xvec4_state_t* a, ulong b, ulong c) {
  uint2 d = E(MWC64XVEC4_A, MWC64XVEC4_M, 4, 0, b, c);
  uint2 e = E(MWC64XVEC4_A, MWC64XVEC4_M, 4, 1, b, c);
  uint2 f = E(MWC64XVEC4_A, MWC64XVEC4_M, 4, 2, b, c);
  uint2 g = E(MWC64XVEC4_A, MWC64XVEC4_M, 4, 3, b, c);
 a->x=(uint4)(d e f g;
 a->c=(uint4)(d e f g;
}

uint4 I(mwc64xvec4_state_t* a) {
  uint4 b = a->x ^ a->c;
  F(a);
  return b;
}