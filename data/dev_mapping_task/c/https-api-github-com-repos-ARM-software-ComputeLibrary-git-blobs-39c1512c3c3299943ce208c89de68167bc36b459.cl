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
__kernel void J(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l) {
  Image m = B(a, f, b, c, d, e);
  Image n = B(g, l, h, i, j, k);

  uchar16 o = vload16(0, m.ptr);
  short16 p = vload16(0, (__global short*)n.ptr);

  short16 q = add_sat(convert_short16(o), p);

  vstore16(q, 0, (__global short*)n.ptr);
}
__kernel void K(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, const float m) {
  Image n = B(a, f, b, c, d, e);
  Image o = B(g, l, h, i, j, k);

  const float16 p = convert_float16(vload16(0, n.ptr));
  const float16 q = convert_float16(vload16(0, o.ptr));

  const uchar16 r = convert_uchar16((1.0f - m) * q + m * p);

  vstore16(r, 0, o.ptr);
}
__kernel void L(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, const uint m) {
  Image n = B(a, f, b, c, d, e);
  Image o = B(g, l, h, i, j, k);

  ushort16 p = convert_ushort16(vload16(0, n.ptr));
  uint16 q = convert_uint16(vload16(0, (__global short*)o.ptr));

  short16 r = convert_short16_sat(q + convert_uint16((p * p) >> m));

  vstore16(r, 0, (__global short*)o.ptr);
}