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
__kernel void J(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __local uint* g, __global uint* restrict h, uint i, uint j, uint k, uint l) {
  Image m = B(a, f, b, c, d, e);
  uint n = get_local_id(0);

  uint o = get_local_size(0);

  if (i > o) {
    for (int p = n; p < i; p += o) {
      g[p] = 0;
    }
  } else {
    if (n <= i) {
      g[n] = 0;
    }
  }

  uint16 q = convert_uint16(vload16(0, m.ptr));

  uint16 r = (((q >= j && q < l)) ? (((q - j) * i) / k) : (i));

  barrier(1);
  {
    atomic_add(g + r.s0, 1);
    atomic_add(g + r.s1, 1);
    atomic_add(g + r.s2, 1);
    atomic_add(g + r.s3, 1);
    atomic_add(g + r.s4, 1);
    atomic_add(g + r.s5, 1);
    atomic_add(g + r.s6, 1);
    atomic_add(g + r.s7, 1);
    atomic_add(g + r.s8, 1);
    atomic_add(g + r.s9, 1);
    atomic_add(g + r.sa, 1);
    atomic_add(g + r.sb, 1);
    atomic_add(g + r.sc, 1);
    atomic_add(g + r.sd, 1);
    atomic_add(g + r.se, 1);
    atomic_add(g + r.sf, 1);
  };
  barrier(1);

  if (i > o) {
    for (int p = n; p < i; p += o) {
      atomic_add(h + p, g[p]);
    }
  } else {
    if (n <= i) {
      atomic_add(h + n, g[n]);
    }
  }
}
__kernel void K(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uint* restrict g, uint h, uint i, uint j, uint k) {
  Image l = B(a, f, b, c, d, e);

  uint m = (uint)(*l.ptr);

  uint n = (m >= i) ? (((m - i) * h) / j) : 0;

  if (m >= i && (m < k)) {
    atomic_add(g + n, 1);
  }
}
__kernel void L(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __local uint* g, __global uint* restrict h) {
  Image i = B(a, f, b, c, d, e);

  uint j = get_local_id(0);
  uint k = get_local_size(0);

  for (int l = j; l < 256; l += k) {
    g[l] = 0;
  }

  uint16 m = convert_uint16(vload16(0, i.ptr));

  barrier(1);

  atomic_add(g + m.s0, 1);
  atomic_add(g + m.s1, 1);
  atomic_add(g + m.s2, 1);
  atomic_add(g + m.s3, 1);
  atomic_add(g + m.s4, 1);
  atomic_add(g + m.s5, 1);
  atomic_add(g + m.s6, 1);
  atomic_add(g + m.s7, 1);
  atomic_add(g + m.s8, 1);
  atomic_add(g + m.s9, 1);
  atomic_add(g + m.sa, 1);
  atomic_add(g + m.sb, 1);
  atomic_add(g + m.sc, 1);
  atomic_add(g + m.sd, 1);
  atomic_add(g + m.se, 1);
  atomic_add(g + m.sf, 1);

  barrier(1);

  for (int l = j; l < 256; l += k) {
    atomic_add(h + l, g[l]);
  }
}
__kernel void M(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uint* restrict g) {
  Image h = B(a, f, b, c, d, e);
  atomic_add(g + *h.ptr, 1);
}