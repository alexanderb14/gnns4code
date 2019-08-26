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

  uint o = 0;

  for (uint p = 0; p < c; p += 16) {
    barrier(2);
    uint16 q = convert_uint16(vload16(0, G(&m, p, 0)));
    q.s0 += o;
    q.s1 += q.s0;
    q.s2 += q.s1;
    q.s3 += q.s2;
    q.s4 += q.s3;
    q.s5 += q.s4;
    q.s6 += q.s5;
    q.s7 += q.s6;
    q.s8 += q.s7;
    q.s9 += q.s8;
    q.sA += q.s9;
    q.sB += q.sA;
    q.sC += q.sB;
    q.sD += q.sC;
    q.sE += q.sD;
    q.sF += q.sE;
    o = q.sF;
    vstore16(q, 0, (__global uint*)G(&n, p, 0));
  }
}
__kernel void K(__global uchar* a, uint b, uint c, uint d, uint e, uint f, uint g) {
  Image h = B(a, f, b, c, d, e);

  uint8 i = vload8(0, (__global uint*)G(&h, 0, 0));
  for (uint j = 1; j < g; ++j) {
    barrier(2);
    uint8 k = vload8(0, (__global uint*)G(&h, 0, j));
    k += i;
    vstore8(k, 0, (__global uint*)G(&h, 0, j));
    i = k;
  }
}