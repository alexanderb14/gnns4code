__constant int Ga = 1; __constant int Gb = 0; __constant int Gc = 0; char A(char a, char b) {
  return a + b;
}
char2 B(char2 a, char2 b) {
  return a + b;
}
char3 C(char3 a, char3 b) {
  return a + b;
}
char4 D(char4 a, char4 b) {
  return a + b;
}
char8 E(char8 a, char8 b) {
  return a + b;
}
char16 F(char16 a, char16 b) {
  return a + b;
}
uchar G(uchar a, uchar b) {
  return a + b;
}
uchar2 H(uchar2 a, uchar2 b) {
  return a + b;
}
uchar3 I(uchar3 a, uchar3 b) {
  return a + b;
}
uchar4 J(uchar4 a, uchar4 b) {
  return a + b;
}
uchar8 K(uchar8 a, uchar8 b) {
  return a + b;
}
uchar16 L(uchar16 a, uchar16 b) {
  return a + b;
}
short M(short a, short b) {
  return a + b;
}
short2 N(short2 a, short2 b) {
  return a + b;
}
short3 O(short3 a, short3 b) {
  return a + b;
}
short4 P(short4 a, short4 b) {
  return a + b;
}
short8 Q(short8 a, short8 b) {
  return a + b;
}
short16 R(short16 a, short16 b) {
  return a + b;
}
ushort S(ushort a, ushort b) {
  return a + b;
}
ushort2 T(ushort2 a, ushort2 b) {
  return a + b;
}
ushort3 U(ushort3 a, ushort3 b) {
  return a + b;
}
ushort4 V(ushort4 a, ushort4 b) {
  return a + b;
}
ushort8 W(ushort8 a, ushort8 b) {
  return a + b;
}
ushort16 X(ushort16 a, ushort16 b) {
  return a + b;
}
int Y(int a, int b) {
  return a + b;
}
int2 Z(int2 a, int2 b) {
  return a + b;
}
int3 AA(int3 a, int3 b) {
  return a + b;
}
int4 AB(int4 a, int4 b) {
  return a + b;
}
int8 AC(int8 a, int8 b) {
  return a + b;
}
int16 AD(int16 a, int16 b) {
  return a + b;
}
uint AE(uint a, uint b) {
  return a + b;
}
uint2 AF(uint2 a, uint2 b) {
  return a + b;
}
uint3 AG(uint3 a, uint3 b) {
  return a + b;
}
uint4 AH(uint4 a, uint4 b) {
  return a + b;
}
uint8 AI(uint8 a, uint8 b) {
  return a + b;
}
uint16 AJ(uint16 a, uint16 b) {
  return a + b;
}
long AK(long a, long b) {
  return a + b;
}
long2 AL(long2 a, long2 b) {
  return a + b;
}
long3 AM(long3 a, long3 b) {
  return a + b;
}
long4 AN(long4 a, long4 b) {
  return a + b;
}
long8 AO(long8 a, long8 b) {
  return a + b;
}
long16 AP(long16 a, long16 b) {
  return a + b;
}
ulong AQ(ulong a, ulong b) {
  return a + b;
}
ulong2 AR(ulong2 a, ulong2 b) {
  return a + b;
}
ulong3 AS(ulong3 a, ulong3 b) {
  return a + b;
}
ulong4 AT(ulong4 a, ulong4 b) {
  return a + b;
}
ulong8 AU(ulong8 a, ulong8 b) {
  return a + b;
}
ulong16 AV(ulong16 a, ulong16 b) {
  return a + b;
}

float AW(float a, float b) {
  return a + b;
}
float2 AX(float2 a, float2 b) {
  return a + b;
}
float3 AY(float3 a, float3 b) {
  return a + b;
}
float4 AZ(float4 a, float4 b) {
  return a + b;
}
float8 BA(float8 a, float8 b) {
  return a + b;
}
float16 BB(float16 a, float16 b) {
  return a + b;
}

double BC(double a, double b) {
  return a + b;
}
double2 BD(double2 a, double2 b) {
  return a + b;
}
double3 BE(double3 a, double3 b) {
  return a + b;
}
double4 BF(double4 a, double4 b) {
  return a + b;
}
double8 BG(double8 a, double8 b) {
  return a + b;
}
double16 BH(double16 a, double16 b) {
  return a + b;
}
__kernel void BI(__global int* a) {
  bool b = 0;

  char c = 1;
  char2 d = (char2)(1, 2);

  char3 e = (char3)(1, 2, 3);

  char4 f = (char4)(1, 2, 3, 4);
  char8 g = (char8)(1, 2, 3, 4, 5, 6, 7, 8);
  char16 h = (char16)(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);

  uchar i = 1;
  uchar2 j = (uchar2)(1, 2);

  uchar3 k = (uchar3)(1, 2, 3);

  uchar4 l = (uchar4)(1, 2, 3, 4);
  uchar8 m = (uchar8)(1, 2, 3, 4, 5, 6, 7, 8);
  uchar16 n = (uchar16)(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);

  short o = 1;
  short2 p = (short2)(1, 2);

  short3 q = (short3)(1, 2, 3);

  short4 r = (short4)(1, 2, 3, 4);
  short8 s = (short8)(1, 2, 3, 4, 5, 6, 7, 8);
  short16 t = (short16)(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);

  ushort u = 1;
  ushort2 v = (ushort2)(1, 2);

  ushort3 w = (ushort3)(1, 2, 3);

  ushort4 x = (ushort4)(1, 2, 3, 4);
  ushort8 y = (ushort8)(1, 2, 3, 4, 5, 6, 7, 8);
  ushort16 z = (ushort16)(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);

  int aa = 1;
  int2 ab = (int2)(1, 2);

  int3 ac = (int3)(1, 2, 3);

  int4 ad = (int4)(1, 2, 3, 4);
  int8 ae = (int8)(1, 2, 3, 4, 5, 6, 7, 8);
  int16 af = (int16)(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);

  uint ag = 1;
  uint2 ah = (uint2)(1, 2);

  uint3 ai = (uint3)(1, 2, 3);

  uint4 aj = (uint4)(1, 2, 3, 4);
  uint8 ak = (uint8)(1, 2, 3, 4, 5, 6, 7, 8);
  uint16 al = (uint16)(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);

  long am = 1;
  long2 an = (long2)(1, 2);

  long3 ao = (long3)(1, 2, 3);

  long4 ap = (long4)(1, 2, 3, 4);
  long8 aq = (long8)(1, 2, 3, 4, 5, 6, 7, 8);
  long16 ar = (long16)(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);

  ulong as = 1;
  ulong2 at = (ulong2)(1, 2);

  ulong3 au = (ulong3)(1, 2, 3);

  ulong4 av = (ulong4)(1, 2, 3, 4);
  ulong8 aw = (ulong8)(1, 2, 3, 4, 5, 6, 7, 8);
  ulong16 ax = (ulong16)(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);
  float ay = 1.0;
  float2 az = (float2)(1.0, 2.0);

  float3 ba = (float3)(1.0, 2.0, 3.0);

  float4 bb = (float4)(1.0, 2.0, 3.0, 4.0);
  float8 bc = (float8)(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0);
  float16 bd = (float16)(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0);

  double be = 1.0;
  double2 bf = (double2)(1.0, 2.0);

  double3 bg = (double3)(1.0, 2.0, 3.0);

  double4 bh = (double4)(1.0, 2.0, 3.0, 4.0);
  double8 bi = (double8)(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0);
  double16 bj = (double16)(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0);

  c = A(c, c);
  d = B(d, d);
  e = C(e, e);
  f = D(f, f);
  g = E(g, g);
  h = F(h, h);
  ;
  i = G(i, i);
  j = H(j, j);
  k = I(k, k);
  l = J(l, l);
  m = K(m, m);
  n = L(n, n);
  ;
  o = M(o, o);
  p = N(p, p);
  q = O(q, q);
  r = P(r, r);
  s = Q(s, s);
  t = R(t, t);
  ;
  u = S(u, u);
  v = T(v, v);
  w = U(w, w);
  x = V(x, x);
  y = W(y, y);
  z = X(z, z);
  ;
  aa = Y(aa, aa);
  ab = Z(ab, ab);
  ac = AA(ac, ac);
  ad = AB(ad, ad);
  ae = AC(ae, ae);
  af = AD(af, af);
  ;
  ag = AE(ag, ag);
  ah = AF(ah, ah);
  ai = AG(ai, ai);
  aj = AH(aj, aj);
  ak = AI(ak, ak);
  al = AJ(al, al);
  ;
  am = AK(am, am);
  an = AL(an, an);
  ao = AM(ao, ao);
  ap = AN(ap, ap);
  aq = AO(aq, aq);
  ar = AP(ar, ar);
  ;
  as = AQ(as, as);
  at = AR(at, at);
  au = AS(au, au);
  av = AT(av, av);
  aw = AU(aw, aw);
  ax = AV(ax, ax);
  ;

  ay = AW(ay, ay);
  az = AX(az, az);
  ba = AY(ba, ba);
  bb = AZ(bb, bb);
  bc = BA(bc, bc);
  bd = BB(bd, bd);
  ;

  be = BC(be, be);
  bf = BD(bf, bf);
  bg = BE(bg, bg);
  bh = BF(bh, bh);
  bi = BG(bi, bi);
  bj = BH(bj, bj);
  ;

  a[get_global_id(0)] = 1;
}