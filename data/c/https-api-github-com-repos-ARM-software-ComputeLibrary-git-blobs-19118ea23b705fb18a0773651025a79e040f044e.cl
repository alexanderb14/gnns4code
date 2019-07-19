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
inline uchar8 J(uchar8 a, uchar8 b, uchar8 c, uchar8 d, uchar8 e) {
  {
    uchar8 f = min(a, b);
    uchar8 g = max(a, b);
    a = f;
    b = g;
  };
  {
    uchar8 f = min(c, d);
    uchar8 g = max(c, d);
    c = f;
    d = g;
  };
  {
    uchar8 f = min(a, c);
    uchar8 g = max(a, c);
    a = f;
    c = g;
  };
  {
    uchar8 f = min(b, d);
    uchar8 g = max(b, d);
    b = f;
    d = g;
  };
  {
    uchar8 f = min(b, c);
    uchar8 g = max(b, c);
    b = f;
    c = g;
  };
  {
    uchar8 f = min(a, e);
    uchar8 g = max(a, e);
    a = f;
    e = g;
  };
  {
    uchar8 f = min(b, e);
    uchar8 g = max(b, e);
    b = f;
    e = g;
  };
  {
    uchar8 f = min(c, e);
    uchar8 g = max(c, e);
    c = f;
    e = g;
  };

  return c;
}
inline uchar8 K(uchar8 a, uchar8 b, uchar8 c, uchar8 d, uchar8 e, uchar8 f, uchar8 g, uchar8 h, uchar8 i) {
  {
    uchar8 j = min(b, c);
    uchar8 k = max(b, c);
    b = j;
    c = k;
  };
  {
    uchar8 j = min(e, f);
    uchar8 k = max(e, f);
    e = j;
    f = k;
  };
  {
    uchar8 j = min(h, i);
    uchar8 k = max(h, i);
    h = j;
    i = k;
  };
  {
    uchar8 j = min(a, b);
    uchar8 k = max(a, b);
    a = j;
    b = k;
  };
  {
    uchar8 j = min(d, e);
    uchar8 k = max(d, e);
    d = j;
    e = k;
  };
  {
    uchar8 j = min(g, h);
    uchar8 k = max(g, h);
    g = j;
    h = k;
  };
  {
    uchar8 j = min(b, c);
    uchar8 k = max(b, c);
    b = j;
    c = k;
  };
  {
    uchar8 j = min(e, f);
    uchar8 k = max(e, f);
    e = j;
    f = k;
  };
  {
    uchar8 j = min(h, i);
    uchar8 k = max(h, i);
    h = j;
    i = k;
  };
  {
    uchar8 j = min(a, d);
    uchar8 k = max(a, d);
    a = j;
    d = k;
  };
  {
    uchar8 j = min(f, i);
    uchar8 k = max(f, i);
    f = j;
    i = k;
  };
  {
    uchar8 j = min(e, h);
    uchar8 k = max(e, h);
    e = j;
    h = k;
  };
  {
    uchar8 j = min(d, g);
    uchar8 k = max(d, g);
    d = j;
    g = k;
  };
  {
    uchar8 j = min(b, e);
    uchar8 k = max(b, e);
    b = j;
    e = k;
  };
  {
    uchar8 j = min(c, f);
    uchar8 k = max(c, f);
    c = j;
    f = k;
  };
  {
    uchar8 j = min(e, h);
    uchar8 k = max(e, h);
    e = j;
    h = k;
  };
  {
    uchar8 j = min(e, c);
    uchar8 k = max(e, c);
    e = j;
    c = k;
  };
  {
    uchar8 j = min(g, e);
    uchar8 k = max(g, e);
    g = j;
    e = k;
  };
  {
    uchar8 j = min(e, c);
    uchar8 k = max(e, c);
    e = j;
    c = k;
  };

  return e;
}

inline uchar8 L(uchar16 a) {
  return min(a.s01234567, min(a.s12345678, a.s23456789));
}

inline uchar8 M(uchar16 a) {
  return max(a.s01234567, max(a.s12345678, a.s23456789));
}

inline uchar8 N(uchar16 a) {
  return min(a.s01234567, min(min(a.s12345678, a.s23456789), min(a.s3456789A, a.s456789AB)));
}

inline uchar8 O(uchar16 a) {
  return max(a.s01234567, max(max(a.s12345678, a.s23456789), max(a.s3456789A, a.s456789AB)));
}
__kernel void P(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l) {
  Image m = B(a, f, b, c, d, e);
  Image n = B(g, l, h, i, j, k);

  uchar16 o = vload16(0, G(&m, -1, -1));
  uchar16 p = vload16(0, G(&m, -1, 0));
  uchar16 q = vload16(0, G(&m, -1, 1));

  uchar16 r = max(o, max(p, q));
  uchar8 s = M(r);
  vstore8(s, 0, n.ptr);
}
__kernel void Q(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l) {
  Image m = B(a, f, b, c, d, e);
  Image n = B(g, l, h, i, j, k);

  uchar8 o = vload8(0, G(&m, 0, -1));
  uchar16 p = vload16(0, G(&m, -1, 0));
  uchar8 q = vload8(0, G(&m, 0, 1));

  uchar8 r = M(p);
  uchar8 s = max(r, max(o, q));
  vstore8(s, 0, n.ptr);
}
__kernel void R(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l) {
  Image m = B(a, f, b, c, d, e);
  Image n = B(g, l, h, i, j, k);

  uchar16 o = vload16(0, G(&m, -1, -1));
  uchar16 p = vload16(0, G(&m, -1, 0));
  uchar16 q = vload16(0, G(&m, -1, 1));

  uchar16 r = max(o, max(p, q));
  uchar8 s = M(r);
  vstore8(s, 0, n.ptr);
}