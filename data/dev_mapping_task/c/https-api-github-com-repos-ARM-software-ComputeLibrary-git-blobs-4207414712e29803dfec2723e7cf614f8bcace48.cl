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
__kernel void J(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r, __global uchar* s, uint t, uint u, uint v, uint w, uint x) {
  Image y = B(a, f, b, c, d, e);
  Image z = B(g, l, h, i, j, k);
  Image aa = B(m, r, n, o, p, q);
  Image ab = B(s, x, t, u, v, w);

  uchar16 ac = vload16(0, y.ptr);
  uchar16 ad = vload16(0, z.ptr);
  uchar16 ae = vload16(0, aa.ptr);

  uchar16 af = (uchar16)(ac, ad, ae, ac, ad, ae, ac, ad, ae, ac, ad, ae, ac, ad, ae, ac);
  vstore16(af, 0, ab.ptr);

  uchar16 ag = (uchar16)(ad, ae, ac, ad, ae, ac, ad, ae, ac, ad, ae, ac, ad, ae, ac, ad);
  vstore16(ag, 0, ab.ptr + 16);

  uchar16 ah = (uchar16)(ae, ac, ad, ae, ac, ad, ae, ac, ad, ae, ac, ad, ae, ac, ad, ae);
  vstore16(ah, 0, ab.ptr + 32);
}
__kernel void K(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r, __global uchar* s, uint t, uint u, uint v, uint w, uint x, __global uchar* y, uint z, uint aa, uint ab, uint ac, uint ad) {
  Image ae = B(a, f, b, c, d, e);
  Image af = B(g, l, h, i, j, k);
  Image ag = B(m, r, n, o, p, q);
  Image ah = B(s, x, t, u, v, w);
  Image ai = B(y, ad, z, aa, ab, ac);

  uchar16 aj = vload16(0, ae.ptr);
  uchar16 ak = vload16(0, af.ptr);
  uchar16 al = vload16(0, ag.ptr);
  uchar16 am = vload16(0, ah.ptr);

  uchar16 an = (uchar16)(aj, ak, al, am, aj, ak, al, am, aj, ak, al, am, aj, ak, al, am);
  vstore16(an, 0, ai.ptr);

  uchar16 ao = (uchar16)(aj, ak, al, am, aj, ak, al, am, aj, ak, al, am, aj, ak, al, am);
  vstore16(ao, 0, ai.ptr + 16);

  uchar16 ap = (uchar16)(aj, ak, al, am, aj, ak, al, am, aj, ak, al, am, aj, ak, al, am);
  vstore16(ap, 0, ai.ptr + 32);

  uchar16 aq = (uchar16)(aj, ak, al, am, aj, ak, al, am, aj, ak, al, am, aj, ak, al, am);
  vstore16(aq, 0, ai.ptr + 48);
}
__kernel void L(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r, __global uchar* s, uint t, uint u, uint v, uint w, uint x) {
  Image y = B(a, f, b, c, d, e);
  Image z = B(g, l, h, i, j, k);
  Image aa = B(m, r, n, o, p, q);
  Image ab = B(s, x, t, u, v, w);

  uchar16 ac = vload16(0, y.ptr);
  uchar8 ad = vload8(0, z.ptr);
  uchar8 ae = vload8(0, aa.ptr);

  uchar16 af = (uchar16)(ac, ad, ac, ae, ac, ad, ac, ae, ac, ad, ac, ae, ac, ad, ac, ae);
  vstore16(af, 0, ab.ptr);
  uchar16 ag = (uchar16)(ac, ad, ac, ae, ac, ad, ac, ae, ac, ad, ac, ae, ac, ad, ac, ae);
  vstore16(ag, 0, ab.ptr + 16);
}
__kernel void M(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r, __global uchar* s, uint t, uint u, uint v, uint w, uint x) {
  Image y = B(a, f, b, c, d, e);
  Image z = B(g, l, h, i, j, k);
  Image aa = B(m, r, n, o, p, q);
  Image ab = B(s, x, t, u, v, w);

  uchar16 ac = vload16(0, y.ptr);
  uchar8 ad = vload8(0, z.ptr);
  uchar8 ae = vload8(0, aa.ptr);

  uchar16 af = (uchar16)(ad, ac, ae, ac, ad, ac, ae, ac, ad, ac, ae, ac, ad, ac, ae, ac);
  vstore16(af, 0, ab.ptr);
  uchar16 ag = (uchar16)(ad, ac, ae, ac, ad, ac, ae, ac, ad, ac, ae, ac, ad, ac, ae, ac);
  vstore16(ag, 0, ab.ptr + 16);
}
__kernel void N(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r, __global uchar* s, uint t, uint u, uint v, uint w, uint x, __global uchar* y, uint z, uint aa, uint ab, uint ac, uint ad, uint ae) {
  Image af = B(a, f, b, c, d, e);
  Image ag = B(g, l, h, i, j, k);
  Image ah = B(m, r, n, o, p, q);
  Image ai = B(s, x, t, u, v, w);
  Image aj = B(y, ad, z, aa, ab, ac);

  vstore16(vload16(0, af.ptr), 0, ai.ptr);
  vstore16(vload16(0, G(&af, 0, ae)), 0, (__global uchar*)G(&ai, 0, ae));

  uchar8 ak = vload8(0, ag.ptr);
  uchar8 al = vload8(0, ah.ptr);
}
__kernel void O(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r, __global uchar* s, uint t, uint u, uint v, uint w, uint x, __global uchar* y, uint z, uint aa, uint ab, uint ac, uint ad, __global uchar* ae, uint af, uint ag, uint ah, uint ai, uint aj, uint ak) {
  Image al = B(a, f, b, c, d, e);
  Image am = B(g, l, h, i, j, k);
  Image an = B(m, r, n, o, p, q);
  Image ao = B(s, x, t, u, v, w);
  Image ap = B(y, ad, z, aa, ab, ac);
  Image aq = B(ae, aj, af, ag, ah, ai);

  vstore16(vload16(0, al.ptr), 0, ao.ptr);
}