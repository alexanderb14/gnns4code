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
__kernel void J(__global uchar* a, uint b, uint c, uint d, uint e, uint f) {
  Image g = B(a, f, b, c, d, e);
  uchar16 h = vload16(0, G(&g, -1, -1));
  short8 i = convert_short8(h.s01234567);
  short8 j = convert_short8(h.s12345678);
  short8 k = convert_short8(h.s23456789);
  h = vload16(0, G(&g, -1, 0));
  i = convert_short8(h.s01234567);
  k = convert_short8(h.s23456789);

  h = vload16(0, G(&g, -1, 1));
  i = convert_short8(h.s01234567);
  j = convert_short8(h.s12345678);
  k = convert_short8(h.s23456789);
}
short16 K(Image* a, const short b, const short c, const short d, const short e, const short f, const short g, const short h, const short i, const short j, const short k) {
  uchar16 l = vload16(0, G(a, -2, 0));
  short8 m = 0;
  short8 n = 0;
  short8 o;

  o = convert_short8(l.s01234567);
  m += o * (short8)b;
  n += o * (short8)g;

  o = convert_short8(l.s12345678);
  m += o * (short8)c;
  n += o * (short8)h;

  o = convert_short8(l.s23456789);
  m += o * (short8)d;
  n += o * (short8)i;

  o = convert_short8(l.s3456789a);
  m += o * (short8)e;
  n += o * (short8)j;

  o = convert_short8(l.s456789ab);
  m += o * (short8)f;
  n += o * (short8)k;

    return (short16)(m n;
}
short8 L(Image* a, const short b, const short c, const short d, const short e, const short f) {
  short8 g;
  short8 h = (short8)0;

  g = vload8(0, (__global short*)G(a, 0, -2));
  h += g * (short8)b;

  g = vload8(0, (__global short*)G(a, 0, -1));
  h += g * (short8)c;

  g = vload8(0, (__global short*)G(a, 0, 0));
  h += g * (short8)d;

  g = vload8(0, (__global short*)G(a, 0, 1));
  h += g * (short8)e;

  g = vload8(0, (__global short*)G(a, 0, 2));
  h += g * (short8)f;

  return (short8)(h);
}
__kernel void M(__global uchar* a, uint b, uint c, uint d, uint e, uint f) {
  Image g = B(a, f, b, c, d, e);
  short16 h = K(&g, -1, -2, 0, 2, 1, 1, 4, 6, 4, 1);
}
__kernel void N(int a) {
}
__kernel void O(__global uchar* a, uint b, uint c, uint d, uint e, uint f) {
  Image g = B(a, f, b, c, d, e);

  int8 h = (int8)0;
  int8 i = (int8)0;

  {
    int8 j = convert_int8(vload8(0, G(&g, 0 - 3, 0)));
    h += j * -1;
    i += j * 1;
  }
  {
    int8 j = convert_int8(vload8(0, G(&g, 1 - 3, 0)));
    h += j * -4;
    i += j * 6;
  }
  {
    int8 j = convert_int8(vload8(0, G(&g, 2 - 3, 0)));
    h += j * -5;
    i += j * 15;
  }
  {
    int8 j = convert_int8(vload8(0, G(&g, 3 - 3, 0)));
    h += j * 0;
    i += j * 20;
  }
  {
    int8 j = convert_int8(vload8(0, G(&g, 4 - 3, 0)));
    h += j * 5;
    i += j * 15;
  }
  {
    int8 j = convert_int8(vload8(0, G(&g, 5 - 3, 0)));
    h += j * 4;
    i += j * 6;
  }
  {
    int8 j = convert_int8(vload8(0, G(&g, 6 - 3, 0)));
    h += j * 1;
    i += j * 1;
  };
}
__kernel void P(int a) {
}