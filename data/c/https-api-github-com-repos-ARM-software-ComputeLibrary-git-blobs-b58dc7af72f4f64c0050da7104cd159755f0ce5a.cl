typedef struct Vector {
  __global uchar* ptr;
  int offset_first_element_in_bytes;
  int stride_x;
} Vector;

typedef struct Image {
  __global uchar* ptr;
  int offset_first_element_in_bytes;
  int stride_x;
  int stride_y;
} Image;

typedef struct Tensor3D {
  __global uchar* ptr;
  int offset_first_element_in_bytes;
  int stride_x;
  int stride_y;
  int stride_z;
} Tensor3D;

typedef struct Tensor4D {
  __global uchar* ptr;
  int offset_first_element_in_bytes;
  int stride_x;
  int stride_y;
  int stride_z;
  int stride_w;
} Tensor4D;
Vector inline A(__global uchar* a, uint b, uint c, uint d) {
  Vector e = {.ptr = a.offset_first_element_in_bytc;
  e.ptr += e.offset_first_element_in_bytes + get_global_id(0) * d;
  return e;
}
Image inline B(__global uchar* a, uint b, uint c, uint d, uint e, uint f) {
  Image g = {.ptr = a.offset_first_element_in_bytc.stride_y = e g.ptr += g.offset_first_element_in_bytes + get_global_id(0) * d + get_global_id(1) * f;
  return g;
}
Image inline C(__global uchar* a, uint b, uint c, uint d, uint e, uint f, uint g, uint h) {
  Image i = {.ptr = a.offset_first_element_in_bytc.stride_y = e i.ptr += i.offset_first_element_in_bytes + get_global_id(0) * d + get_global_id(1) * f + get_global_id(2) * h;
  return i;
}
Tensor3D inline D(__global uchar* a, uint b, uint c, uint d, uint e, uint f, uint g, uint h) {
  Tensor3D i = {.ptr = a.offset_first_element_in_bytc.stride_y = e.stride_z = g i.ptr += i.offset_first_element_in_bytes + get_global_id(0) * d + get_global_id(1) * f + get_global_id(2) * h;
  return i;
}

Tensor4D inline E(__global uchar* a, uint b, uint c, uint d, uint e, uint f, uint g, uint h, uint i, uint j, uint k) {
  Tensor4D l = {
    .ptr = a.offset_first_element_in_bytc.stride_y = e.stride_z = g.stride_w = i

                                                                                   l.ptr += l.offset_first_element_in_bytes + get_global_id(0) * d + get_global_id(1) * f + (get_global_id(2) % k) * h + (get_global_id(2) / k) * j;
  return l;
}

__global inline const uchar* F(const Vector* a, int b) {
  return a->ptr + b * a->stride_x;
}

__global inline uchar* G(const Image* a, int b, int c) {
  return a->ptr + b * a->stride_x + c * a->stride_y;
}
__global inline const uchar* H(const Tensor3D* a, int b, int c, int d) {
  return a->ptr + b * a->stride_x + c * a->stride_y + d * a->stride_z;
}
__global inline const uchar* I(const Tensor4D* a, int b, int c, int d, int e) {
  return a->ptr + b * a->stride_x + c * a->stride_y + d * a->stride_z + e * a->stride_w;
}
inline int2 J(int2 a, int b) {
  int2 c = (1 << b) - 1;
  const int2 d = 0;
  const int2 e = 1;
  int2 f = (c >> 1) + ((a < 0) ? (e) : (d));
  return (a >> b) + (((a & c) > f) ? (e) : (d));
}
inline int4 K(int4 a, int b) {
  int4 c = (1 << b) - 1;
  const int4 d = 0;
  const int4 e = 1;
  int4 f = (c >> 1) + ((a < 0) ? (e) : (d));
  return (a >> b) + (((a & c) > f) ? (e) : (d));
}
inline int8 L(int8 a, int b) {
  int8 c = (1 << b) - 1;
  const int8 d = 0;
  const int8 e = 1;
  int8 f = (c >> 1) + ((a < 0) ? (e) : (d));
  return (a >> b) + (((a & c) > f) ? (e) : (d));
}
inline int16 M(int16 a, int b) {
  int16 c = (1 << b) - 1;
  const int16 d = 0;
  const int16 e = 1;
  int16 f = (c >> 1) + ((a < 0) ? (e) : (d));
  return (a >> b) + (((a & c) > f) ? (e) : (d));
}

inline int2 N(int2 a, int2 b) {
  int2 c = a == b && a == (-2147483647 - 1);
  long2 d = convert_long2(a);
  long2 e = convert_long2(b);
  long2 f = d * e;
  int2 g = convert_int2(((f + (1 << 30)) >> 31));
  return ((c) ? (2147483647) : (g));
}
inline int4 O(int4 a, int4 b) {
  int4 c = a == b && a == (-2147483647 - 1);
  long4 d = convert_long4(a);
  long4 e = convert_long4(b);
  long4 f = d * e;
  int4 g = convert_int4(((f + (1 << 30)) >> 31));
  return ((c) ? (2147483647) : (g));
}
inline int8 P(int8 a, int8 b) {
  int8 c = a == b && a == (-2147483647 - 1);
  long8 d = convert_long8(a);
  long8 e = convert_long8(b);
  long8 f = d * e;
  int8 g = convert_int8(((f + (1 << 30)) >> 31));
  return ((c) ? (2147483647) : (g));
}
inline int16 Q(int16 a, int16 b) {
  int16 c = a == b && a == (-2147483647 - 1);
  long16 d = convert_long16(a);
  long16 e = convert_long16(b);
  long16 f = d * e;
  int16 g = convert_int16(((f + (1 << 30)) >> 31));
  return ((c) ? (2147483647) : (g));
}

inline int2 R(int2 a) {
  const int2 b = 1895147668;
  const int2 c = 715827883;
  const int d = 31;
  int2 e = a + (1 << (d - 3));
  int2 f = N(e, e);
  int2 g = N(f, e);
  int2 h = N(f, f);
  int2 i = J(h, 2);
  int2 j = N((i + g), c) + f;
  int2 k = J(j, 1);
  return b + N(b, e + k);
}
inline int4 S(int4 a) {
  const int4 b = 1895147668;
  const int4 c = 715827883;
  const int d = 31;
  int4 e = a + (1 << (d - 3));
  int4 f = O(e, e);
  int4 g = O(f, e);
  int4 h = O(f, f);
  int4 i = K(h, 2);
  int4 j = O((i + g), c) + f;
  int4 k = K(j, 1);
  return b + O(b, e + k);
}
inline int8 T(int8 a) {
  const int8 b = 1895147668;
  const int8 c = 715827883;
  const int d = 31;
  int8 e = a + (1 << (d - 3));
  int8 f = P(e, e);
  int8 g = P(f, e);
  int8 h = P(f, f);
  int8 i = L(h, 2);
  int8 j = P((i + g), c) + f;
  int8 k = L(j, 1);
  return b + P(b, e + k);
}
inline int16 U(int16 a) {
  const int16 b = 1895147668;
  const int16 c = 715827883;
  const int d = 31;
  int16 e = a + (1 << (d - 3));
  int16 f = Q(e, e);
  int16 g = Q(f, e);
  int16 h = Q(f, f);
  int16 i = M(h, 2);
  int16 j = Q((i + g), c) + f;
  int16 k = M(j, 1);
  return b + Q(b, e + k);
}

inline int2 V(int2 a, int2 b, int2 c) {
  return (a & b) ^ (~a & c);
}
inline int4 W(int4 a, int4 b, int4 c) {
  return (a & b) ^ (~a & c);
}
inline int8 X(int8 a, int8 b, int8 c) {
  return (a & b) ^ (~a & c);
}
inline int16 Y(int16 a, int16 b, int16 c) {
  return (a & b) ^ (~a & c);
}

inline int2 Z(int2 a) {
  const int2 b = 0;
  const int2 c = ~0;
  return ((a == 0) ? (c) : (b));
}
inline int4 AA(int4 a) {
  const int4 b = 0;
  const int4 c = ~0;
  return ((a == 0) ? (c) : (b));
}
inline int8 AB(int8 a) {
  const int8 b = 0;
  const int8 c = ~0;
  return ((a == 0) ? (c) : (b));
}
inline int16 AC(int16 a) {
  const int16 b = 0;
  const int16 c = ~0;
  return ((a == 0) ? (c) : (b));
}

inline int2 AD(int2 a) {
  const int2 b = 0;
  const int2 c = ~0;
  return ((a != 0) ? (c) : (b));
}
inline int4 AE(int4 a) {
  const int4 b = 0;
  const int4 c = ~0;
  return ((a != 0) ? (c) : (b));
}
inline int8 AF(int8 a) {
  const int8 b = 0;
  const int8 c = ~0;
  return ((a != 0) ? (c) : (b));
}
inline int16 AG(int16 a) {
  const int16 b = 0;
  const int16 c = ~0;
  return ((a != 0) ? (c) : (b));
}

inline int2 AH(int2 a, int b, int c, int d, int e, int2 f) {
  if (d > b) {
    const int g = d > b ? e + b : 0;
    return V(AD(f & (1 << g)), N(a, c), a);
  }
  return a;
}
inline int4 AI(int4 a, int b, int c, int d, int e, int4 f) {
  if (d > b) {
    const int g = d > b ? e + b : 0;
    return W(AE(f & (1 << g)), O(a, c), a);
  }
  return a;
}
inline int8 AJ(int8 a, int b, int c, int d, int e, int8 f) {
  if (d > b) {
    const int g = d > b ? e + b : 0;
    return X(AF(f & (1 << g)), P(a, c), a);
  }
  return a;
}
inline int16 AK(int16 a, int b, int c, int d, int e, int16 f) {
  if (d > b) {
    const int g = d > b ? e + b : 0;
    return Y(AG(f & (1 << g)), Q(a, c), a);
  }
  return a;
}

inline int2 AL(int2 a, int b) {
  const int c = 31 - b;
  int2 d = 1 << (c - 2);
  int2 e = d - 1;
  int2 f = (a & e) - d;
  int2 g = f << b;
  int2 h = R(g);
  int2 i = f - a;
  h = AH(h, -2, 1672461947, b, c, i);
  h = AH(h, -1, 1302514674, b, c, i);
  h = AH(h, +0, 790015084, b, c, i);
  h = AH(h, +1, 290630308, b, c, i);
  h = AH(h, +2, 39332535, b, c, i);
  h = AH(h, +3, 720401, b, c, i);
  h = AH(h, +4, 242, b, c, i);
  if (b > 5) {
    const int2 j = -(1 << (c + 5));
    h = V(AD(a < j), 0, h);
  }
  const int2 k = 2147483647;
  return V(Z(a), k, h);
}
inline int4 AM(int4 a, int b) {
  const int c = 31 - b;
  int4 d = 1 << (c - 2);
  int4 e = d - 1;
  int4 f = (a & e) - d;
  int4 g = f << b;
  int4 h = S(g);
  int4 i = f - a;
  h = AI(h, -2, 1672461947, b, c, i);
  h = AI(h, -1, 1302514674, b, c, i);
  h = AI(h, +0, 790015084, b, c, i);
  h = AI(h, +1, 290630308, b, c, i);
  h = AI(h, +2, 39332535, b, c, i);
  h = AI(h, +3, 720401, b, c, i);
  h = AI(h, +4, 242, b, c, i);
  if (b > 5) {
    const int4 j = -(1 << (c + 5));
    h = W(AE(a < j), 0, h);
  }
  const int4 k = 2147483647;
  return W(AA(a), k, h);
}
inline int8 AN(int8 a, int b) {
  const int c = 31 - b;
  int8 d = 1 << (c - 2);
  int8 e = d - 1;
  int8 f = (a & e) - d;
  int8 g = f << b;
  int8 h = T(g);
  int8 i = f - a;
  h = AJ(h, -2, 1672461947, b, c, i);
  h = AJ(h, -1, 1302514674, b, c, i);
  h = AJ(h, +0, 790015084, b, c, i);
  h = AJ(h, +1, 290630308, b, c, i);
  h = AJ(h, +2, 39332535, b, c, i);
  h = AJ(h, +3, 720401, b, c, i);
  h = AJ(h, +4, 242, b, c, i);
  if (b > 5) {
    const int8 j = -(1 << (c + 5));
    h = X(AF(a < j), 0, h);
  }
  const int8 k = 2147483647;
  return X(AB(a), k, h);
}
inline int16 AO(int16 a, int b) {
  const int c = 31 - b;
  int16 d = 1 << (c - 2);
  int16 e = d - 1;
  int16 f = (a & e) - d;
  int16 g = f << b;
  int16 h = U(g);
  int16 i = f - a;
  h = AK(h, -2, 1672461947, b, c, i);
  h = AK(h, -1, 1302514674, b, c, i);
  h = AK(h, +0, 790015084, b, c, i);
  h = AK(h, +1, 290630308, b, c, i);
  h = AK(h, +2, 39332535, b, c, i);
  h = AK(h, +3, 720401, b, c, i);
  h = AK(h, +4, 242, b, c, i);
  if (b > 5) {
    const int16 j = -(1 << (c + 5));
    h = Y(AG(a < j), 0, h);
  }
  const int16 k = 2147483647;
  return Y(AC(a), k, h);
}

inline int2 AP(int2 a, int b) {
  if (b < 0) {
    return J(a, -b);
  }
  const int2 c = (-2147483647 - 1);
  const int2 d = 2147483647;
  int e = ((1 << (31 - b)) - 1);
  int2 f = AD(a > e);
  int2 g = AD(a < -e);
  int2 h = a << b;
  h = V(f, d, h);
  h = V(g, c, h);
  return h;
}
inline int4 AQ(int4 a, int b) {
  if (b < 0) {
    return K(a, -b);
  }
  const int4 c = (-2147483647 - 1);
  const int4 d = 2147483647;
  int e = ((1 << (31 - b)) - 1);
  int4 f = AE(a > e);
  int4 g = AE(a < -e);
  int4 h = a << b;
  h = W(f, d, h);
  h = W(g, c, h);
  return h;
}
inline int8 AR(int8 a, int b) {
  if (b < 0) {
    return L(a, -b);
  }
  const int8 c = (-2147483647 - 1);
  const int8 d = 2147483647;
  int e = ((1 << (31 - b)) - 1);
  int8 f = AF(a > e);
  int8 g = AF(a < -e);
  int8 h = a << b;
  h = X(f, d, h);
  h = X(g, c, h);
  return h;
}
inline int16 AS(int16 a, int b) {
  if (b < 0) {
    return M(a, -b);
  }
  const int16 c = (-2147483647 - 1);
  const int16 d = 2147483647;
  int e = ((1 << (31 - b)) - 1);
  int16 f = AG(a > e);
  int16 g = AG(a < -e);
  int16 h = a << b;
  h = Y(f, d, h);
  h = Y(g, c, h);
  return h;
}

inline int2 AT(int2 a, int2 b) {
  long2 c = convert_long2(a);
  long2 d = convert_long2(b);
  long2 e = c + d;
  const long2 f = 1;
  const long2 g = -1;
  long2 h = ((e >= 0) ? (f) : (g));
  return convert_int2((e + h) / 2);
}
inline int4 AU(int4 a, int4 b) {
  long4 c = convert_long4(a);
  long4 d = convert_long4(b);
  long4 e = c + d;
  const long4 f = 1;
  const long4 g = -1;
  long4 h = ((e >= 0) ? (f) : (g));
  return convert_int4((e + h) / 2);
}
inline int8 AV(int8 a, int8 b) {
  long8 c = convert_long8(a);
  long8 d = convert_long8(b);
  long8 e = c + d;
  const long8 f = 1;
  const long8 g = -1;
  long8 h = ((e >= 0) ? (f) : (g));
  return convert_int8((e + h) / 2);
}
inline int16 AW(int16 a, int16 b) {
  long16 c = convert_long16(a);
  long16 d = convert_long16(b);
  long16 e = c + d;
  const long16 f = 1;
  const long16 g = -1;
  long16 h = ((e >= 0) ? (f) : (g));
  return convert_int16((e + h) / 2);
}

inline int2 AX(int2 a) {
  const int2 b = 2147483647;
  const int2 c = 1 << (31 - 2);
  int2 d = AT(a, b);
  const int2 e = 1515870810;
  const int2 f = -1010580540;
  int2 g = e + N(d, f);
  for (int h = 0; h < 3; h++) {
    int2 i = N(d, g);
    int2 j = c - i;
    int2 k = N(g, j);
    g = g + AP(k, 2);
  }
  return AP(g, 1);
}
inline int4 AY(int4 a) {
  const int4 b = 2147483647;
  const int4 c = 1 << (31 - 2);
  int4 d = AU(a, b);
  const int4 e = 1515870810;
  const int4 f = -1010580540;
  int4 g = e + O(d, f);
  for (int h = 0; h < 3; h++) {
    int4 i = O(d, g);
    int4 j = c - i;
    int4 k = O(g, j);
    g = g + AQ(k, 2);
  }
  return AQ(g, 1);
}
inline int8 AZ(int8 a) {
  const int8 b = 2147483647;
  const int8 c = 1 << (31 - 2);
  int8 d = AV(a, b);
  const int8 e = 1515870810;
  const int8 f = -1010580540;
  int8 g = e + P(d, f);
  for (int h = 0; h < 3; h++) {
    int8 i = P(d, g);
    int8 j = c - i;
    int8 k = P(g, j);
    g = g + AR(k, 2);
  }
  return AR(g, 1);
}
inline int16 BA(int16 a) {
  const int16 b = 2147483647;
  const int16 c = 1 << (31 - 2);
  int16 d = AW(a, b);
  const int16 e = 1515870810;
  const int16 f = -1010580540;
  int16 g = e + Q(d, f);
  for (int h = 0; h < 3; h++) {
    int16 i = Q(d, g);
    int16 j = c - i;
    int16 k = Q(g, j);
    g = g + AS(k, 2);
  }
  return AS(g, 1);
}

inline int2 BB(int2 a, int b, int c) {
  int d = b - c;
  return AP(a, d);
}
inline int4 BC(int4 a, int b, int c) {
  int d = b - c;
  return AQ(a, d);
}
inline int8 BD(int8 a, int b, int c) {
  int d = b - c;
  return AR(a, d);
}
inline int16 BE(int16 a, int b, int c) {
  int d = b - c;
  return AS(a, d);
}
__kernel void BF(__global uchar* a, uint b, uint c, uint d, uint e, uint f, uint g, uint h, __global uchar* i, uint j, uint k, uint l, uint m, uint n, uint o, uint p,

                 int q, int r, int s) {
  Image t = C(a, h, b, c, d, e, f, g);
  Image u = C(i, p, j, k, l, m, n, o);

  int16 v = vload16(0, (__global int*)(t.ptr));

  v = M(Q(v, r), s);
  v = v + q;

  vstore16(convert_uchar16_sat(v), 0, (__global uchar*)u.ptr);
}