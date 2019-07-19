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
  uint2 x;
  uint2 c;
} mwc64xvec2_state_t;

enum { MWC64XVEC2_A = 4294883355U };
enum { MWC64XVEC2_M = 18446383549859758079UL };

void F(mwc64xvec2_state_t* a) {
  uint2 b = a->x, c = a->c;

  uint2 d = MWC64XVEC2_A * b + c;

  uint2 e = __builtin_astype(-(d < c), uint2);
  uint2 f = (mul_hi(((uint2)MWC64XVEC2_A), (b)) + (e));

  a->x = d;
  a->c = f;
}

void G(mwc64xvec2_state_t* a, ulong b) {
  uint2 c = D((uint2)(a->x.s0, a->c.s0), MWC64XVEC2_A, MWC64XVEC2_M, b);
  uint2 d = D((uint2)(a->x.s1, a->c.s1), MWC64XVEC2_A, MWC64XVEC2_M, b);
 a->x=(uint2)(c d;
 a->c=(uint2)(c d;
}

void H(mwc64xvec2_state_t* a, ulong b, ulong c) {
  uint2 d = E(MWC64XVEC2_A, MWC64XVEC2_M, 2, 0, b, c);
  uint2 e = E(MWC64XVEC2_A, MWC64XVEC2_M, 2, 1, b, c);
 a->x=(uint2)(d e;
 a->c=(uint2)(d e;
}

uint2 I(mwc64xvec2_state_t* a) {
  uint2 b = a->x ^ a->c;
  F(a);
  return b;
}