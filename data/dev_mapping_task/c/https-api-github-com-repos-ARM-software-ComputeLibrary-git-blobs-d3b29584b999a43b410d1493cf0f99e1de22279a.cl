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
inline uchar8 P(uchar16 a, uchar16 b, uchar16 c, uchar16 d, uchar16 e) {
  uchar8 f = a.s01234567;
  uchar8 g = a.s12345678;
  uchar8 h = a.s23456789;
  uchar8 i = b.s01234567;
  uchar8 j = b.s12345678;
  uchar8 k = b.s23456789;
  uchar8 l = b.s3456789A;
  uchar8 m = b.s456789AB;
  uchar8 n = c.s01234567;
  uchar8 o = c.s12345678;
  uchar8 p = c.s23456789;
  uchar8 q = c.s3456789A;
  uchar8 r = c.s456789AB;
  uchar8 s = d.s01234567;
  uchar8 t = d.s12345678;
  uchar8 u = d.s23456789;
  uchar8 v = d.s3456789A;
  uchar8 w = d.s456789AB;
  uchar8 x = e.s01234567;
  uchar8 y = e.s12345678;
  uchar8 z = e.s23456789;

  {
    uchar8 aa = min(f, g);
    uchar8 ab = max(f, g);
    f = aa;
    g = ab;
  };
  {
    uchar8 aa = min(h, i);
    uchar8 ab = max(h, i);
    h = aa;
    i = ab;
  };
  {
    uchar8 aa = min(j, k);
    uchar8 ab = max(j, k);
    j = aa;
    k = ab;
  };
  {
    uchar8 aa = min(l, m);
    uchar8 ab = max(l, m);
    l = aa;
    m = ab;
  };
  {
    uchar8 aa = min(n, o);
    uchar8 ab = max(n, o);
    n = aa;
    o = ab;
  };
  {
    uchar8 aa = min(p, q);
    uchar8 ab = max(p, q);
    p = aa;
    q = ab;
  };
  {
    uchar8 aa = min(r, s);
    uchar8 ab = max(r, s);
    r = aa;
    s = ab;
  };
  {
    uchar8 aa = min(t, u);
    uchar8 ab = max(t, u);
    t = aa;
    u = ab;
  };
  {
    uchar8 aa = min(v, w);
    uchar8 ab = max(v, w);
    v = aa;
    w = ab;
  };
  {
    uchar8 aa = min(x, y);
    uchar8 ab = max(x, y);
    x = aa;
    y = ab;
  };
  {
    uchar8 aa = min(f, h);
    uchar8 ab = max(f, h);
    f = aa;
    h = ab;
  };
  {
    uchar8 aa = min(g, i);
    uchar8 ab = max(g, i);
    g = aa;
    i = ab;
  };
  {
    uchar8 aa = min(j, l);
    uchar8 ab = max(j, l);
    j = aa;
    l = ab;
  };
  {
    uchar8 aa = min(k, m);
    uchar8 ab = max(k, m);
    k = aa;
    m = ab;
  };
  {
    uchar8 aa = min(n, p);
    uchar8 ab = max(n, p);
    n = aa;
    p = ab;
  };
  {
    uchar8 aa = min(o, q);
    uchar8 ab = max(o, q);
    o = aa;
    q = ab;
  };
  {
    uchar8 aa = min(r, t);
    uchar8 ab = max(r, t);
    r = aa;
    t = ab;
  };
  {
    uchar8 aa = min(s, u);
    uchar8 ab = max(s, u);
    s = aa;
    u = ab;
  };
  {
    uchar8 aa = min(v, x);
    uchar8 ab = max(v, x);
    v = aa;
    x = ab;
  };
  {
    uchar8 aa = min(w, y);
    uchar8 ab = max(w, y);
    w = aa;
    y = ab;
  };
  {
    uchar8 aa = min(g, h);
    uchar8 ab = max(g, h);
    g = aa;
    h = ab;
  };
  {
    uchar8 aa = min(k, l);
    uchar8 ab = max(k, l);
    k = aa;
    l = ab;
  };
  {
    uchar8 aa = min(f, j);
    uchar8 ab = max(f, j);
    f = aa;
    j = ab;
  };
  {
    uchar8 aa = min(i, m);
    uchar8 ab = max(i, m);
    i = aa;
    m = ab;
  };
  {
    uchar8 aa = min(o, p);
    uchar8 ab = max(o, p);
    o = aa;
    p = ab;
  };
  {
    uchar8 aa = min(s, t);
    uchar8 ab = max(s, t);
    s = aa;
    t = ab;
  };
  {
    uchar8 aa = min(n, r);
    uchar8 ab = max(n, r);
    n = aa;
    r = ab;
  };
  {
    uchar8 aa = min(q, u);
    uchar8 ab = max(q, u);
    q = aa;
    u = ab;
  };
  {
    uchar8 aa = min(w, x);
    uchar8 ab = max(w, x);
    w = aa;
    x = ab;
  };
  {
    uchar8 aa = min(v, z);
    uchar8 ab = max(v, z);
    v = aa;
    z = ab;
  };
  {
    uchar8 aa = min(g, k);
    uchar8 ab = max(g, k);
    g = aa;
    k = ab;
  };
  {
    uchar8 aa = min(h, l);
    uchar8 ab = max(h, l);
    h = aa;
    l = ab;
  };
  {
    uchar8 aa = min(o, s);
    uchar8 ab = max(o, s);
    o = aa;
    s = ab;
  };
  {
    uchar8 aa = min(p, t);
    uchar8 ab = max(p, t);
    p = aa;
    t = ab;
  };
  {
    uchar8 aa = min(f, n);
    uchar8 ab = max(f, n);
    f = aa;
    n = ab;
  };
  {
    uchar8 aa = min(m, u);
    uchar8 ab = max(m, u);
    m = aa;
    u = ab;
  };
  {
    uchar8 aa = min(w, z);
    uchar8 ab = max(w, z);
    w = aa;
    z = ab;
  };
  {
    uchar8 aa = min(g, j);
    uchar8 ab = max(g, j);
    g = aa;
    j = ab;
  };
  {
    uchar8 aa = min(i, l);
    uchar8 ab = max(i, l);
    i = aa;
    l = ab;
  };
  {
    uchar8 aa = min(o, r);
    uchar8 ab = max(o, r);
    o = aa;
    r = ab;
  };
  {
    uchar8 aa = min(q, t);
    uchar8 ab = max(q, t);
    q = aa;
    t = ab;
  };
  {
    uchar8 aa = min(x, z);
    uchar8 ab = max(x, z);
    x = aa;
    z = ab;
  };
  {
    uchar8 aa = min(f, v);
    uchar8 ab = max(f, v);
    f = aa;
    v = ab;
  };
  {
    uchar8 aa = min(h, j);
    uchar8 ab = max(h, j);
    h = aa;
    j = ab;
  };
  {
    uchar8 aa = min(i, k);
    uchar8 ab = max(i, k);
    i = aa;
    k = ab;
  };
  {
    uchar8 aa = min(p, r);
    uchar8 ab = max(p, r);
    p = aa;
    r = ab;
  };
  {
    uchar8 aa = min(q, s);
    uchar8 ab = max(q, s);
    q = aa;
    s = ab;
  };
  {
    uchar8 aa = min(g, o);
    uchar8 ab = max(g, o);
    g = aa;
    o = ab;
  };
  {
    uchar8 aa = min(l, t);
    uchar8 ab = max(l, t);
    l = aa;
    t = ab;
  };
  {
    uchar8 aa = min(y, z);
    uchar8 ab = max(y, z);
    y = aa;
    z = ab;
  };
  {
    uchar8 aa = min(i, j);
    uchar8 ab = max(i, j);
    i = aa;
    j = ab;
  };
  {
    uchar8 aa = min(q, r);
    uchar8 ab = max(q, r);
    q = aa;
    r = ab;
  };
  {
    uchar8 aa = min(g, n);
    uchar8 ab = max(g, n);
    g = aa;
    n = ab;
  };
  {
    uchar8 aa = min(h, p);
    uchar8 ab = max(h, p);
    h = aa;
    p = ab;
  };
  {
    uchar8 aa = min(k, s);
    uchar8 ab = max(k, s);
    k = aa;
    s = ab;
  };
  {
    uchar8 aa = min(m, t);
    uchar8 ab = max(m, t);
    m = aa;
    t = ab;
  };
  {
    uchar8 aa = min(i, q);
    uchar8 ab = max(i, q);
    i = aa;
    q = ab;
  };
  {
    uchar8 aa = min(h, n);
    uchar8 ab = max(h, n);
    h = aa;
    n = ab;
  };
  {
    uchar8 aa = min(j, r);
    uchar8 ab = max(j, r);
    j = aa;
    r = ab;
  };
  {
    uchar8 aa = min(m, s);
    uchar8 ab = max(m, s);
    m = aa;
    s = ab;
  };
  {
    uchar8 aa = min(g, w);
    uchar8 ab = max(g, w);
    g = aa;
    w = ab;
  };
  {
    uchar8 aa = min(i, p);
    uchar8 ab = max(i, p);
    i = aa;
    p = ab;
  };
  {
    uchar8 aa = min(k, r);
    uchar8 ab = max(k, r);
    k = aa;
    r = ab;
  };
  {
    uchar8 aa = min(g, v);
    uchar8 ab = max(g, v);
    g = aa;
    v = ab;
  };
  {
    uchar8 aa = min(h, x);
    uchar8 ab = max(h, x);
    h = aa;
    x = ab;
  };
  {
    uchar8 aa = min(i, o);
    uchar8 ab = max(i, o);
    i = aa;
    o = ab;
  };
  {
    uchar8 aa = min(l, r);
    uchar8 ab = max(l, r);
    l = aa;
    r = ab;
  };
  {
    uchar8 aa = min(h, v);
    uchar8 ab = max(h, v);
    h = aa;
    v = ab;
  };
  {
    uchar8 aa = min(i, n);
    uchar8 ab = max(i, n);
    i = aa;
    n = ab;
  };
  {
    uchar8 aa = min(m, r);
    uchar8 ab = max(m, r);
    m = aa;
    r = ab;
  };
  {
    uchar8 aa = min(k, o);
    uchar8 ab = max(k, o);
    k = aa;
    o = ab;
  };
  {
    uchar8 aa = min(l, p);
    uchar8 ab = max(l, p);
    l = aa;
    p = ab;
  };
  {
    uchar8 aa = min(j, n);
    uchar8 ab = max(j, n);
    j = aa;
    n = ab;
  };
  {
    uchar8 aa = min(m, q);
    uchar8 ab = max(m, q);
    m = aa;
    q = ab;
  };
  {
    uchar8 aa = min(i, y);
    uchar8 ab = max(i, y);
    i = aa;
    y = ab;
  };
  {
    uchar8 aa = min(k, n);
    uchar8 ab = max(k, n);
    k = aa;
    n = ab;
  };
  {
    uchar8 aa = min(m, p);
    uchar8 ab = max(m, p);
    m = aa;
    p = ab;
  };
  {
    uchar8 aa = min(i, x);
    uchar8 ab = max(i, x);
    i = aa;
    x = ab;
  };
  {
    uchar8 aa = min(j, z);
    uchar8 ab = max(j, z);
    j = aa;
    z = ab;
  };
  {
    uchar8 aa = min(l, n);
    uchar8 ab = max(l, n);
    l = aa;
    n = ab;
  };
  {
    uchar8 aa = min(m, o);
    uchar8 ab = max(m, o);
    m = aa;
    o = ab;
  };
  {
    uchar8 aa = min(i, w);
    uchar8 ab = max(i, w);
    i = aa;
    w = ab;
  };
  {
    uchar8 aa = min(k, z);
    uchar8 ab = max(k, z);
    k = aa;
    z = ab;
  };
  {
    uchar8 aa = min(m, n);
    uchar8 ab = max(m, n);
    m = aa;
    n = ab;
  };
  {
    uchar8 aa = min(i, v);
    uchar8 ab = max(i, v);
    i = aa;
    v = ab;
  };
  {
    uchar8 aa = min(l, z);
    uchar8 ab = max(l, z);
    l = aa;
    z = ab;
  };
  {
    uchar8 aa = min(k, w);
    uchar8 ab = max(k, w);
    k = aa;
    w = ab;
  };
  {
    uchar8 aa = min(m, z);
    uchar8 ab = max(m, z);
    m = aa;
    z = ab;
  };
  {
    uchar8 aa = min(j, v);
    uchar8 ab = max(j, v);
    j = aa;
    v = ab;
  };
  {
    uchar8 aa = min(l, x);
    uchar8 ab = max(l, x);
    l = aa;
    x = ab;
  };
  {
    uchar8 aa = min(k, v);
    uchar8 ab = max(k, v);
    k = aa;
    v = ab;
  };
  {
    uchar8 aa = min(m, y);
    uchar8 ab = max(m, y);
    m = aa;
    y = ab;
  };
  {
    uchar8 aa = min(m, x);
    uchar8 ab = max(m, x);
    m = aa;
    x = ab;
  };
  {
    uchar8 aa = min(l, v);
    uchar8 ab = max(l, v);
    l = aa;
    v = ab;
  };
  {
    uchar8 aa = min(m, w);
    uchar8 ab = max(m, w);
    m = aa;
    w = ab;
  };
  {
    uchar8 aa = min(p, x);
    uchar8 ab = max(p, x);
    p = aa;
    x = ab;
  };
  {
    uchar8 aa = min(m, v);
    uchar8 ab = max(m, v);
    m = aa;
    v = ab;
  };
  {
    uchar8 aa = min(o, w);
    uchar8 ab = max(o, w);
    o = aa;
    w = ab;
  };
  {
    uchar8 aa = min(n, v);
    uchar8 ab = max(n, v);
    n = aa;
    v = ab;
  };
  {
    uchar8 aa = min(o, v);
    uchar8 ab = max(o, v);
    o = aa;
    v = ab;
  };
  {
    uchar8 aa = min(p, v);
    uchar8 ab = max(p, v);
    p = aa;
    v = ab;
  };

  return p;
}
inline uchar8 Q(uchar16 a, uchar16 b, uchar16 c, uchar16 d, uchar16 e) {
  uchar8 f = a.s01234567;
  uchar8 g = a.s12345678;
  uchar8 h = a.s23456789;
  uchar8 i = a.s3456789A;
  uchar8 j = a.s456789AB;
  uchar8 k = b.s01234567;
  uchar8 l = b.s12345678;
  uchar8 m = b.s23456789;
  uchar8 n = b.s3456789A;
  uchar8 o = b.s456789AB;
  uchar8 p = c.s01234567;
  uchar8 q = c.s12345678;
  uchar8 r = c.s23456789;
  uchar8 s = c.s3456789A;
  uchar8 t = c.s456789AB;
  uchar8 u = d.s01234567;
  uchar8 v = d.s12345678;
  uchar8 w = d.s23456789;
  uchar8 x = d.s3456789A;
  uchar8 y = d.s456789AB;
  uchar8 z = e.s01234567;
  uchar8 aa = e.s12345678;
  uchar8 ab = e.s23456789;
  uchar8 ac = e.s3456789A;
  uchar8 ad = e.s456789AB;

  {
    uchar8 ae = min(g, h);
    uchar8 af = max(g, h);
    g = ae;
    h = af;
  };
  {
    uchar8 ae = min(f, g);
    uchar8 af = max(f, g);
    f = ae;
    g = af;
  };
  {
    uchar8 ae = min(g, h);
    uchar8 af = max(g, h);
    g = ae;
    h = af;
  };
  {
    uchar8 ae = min(j, k);
    uchar8 af = max(j, k);
    j = ae;
    k = af;
  };
  {
    uchar8 ae = min(i, j);
    uchar8 af = max(i, j);
    i = ae;
    j = af;
  };
  {
    uchar8 ae = min(j, k);
    uchar8 af = max(j, k);
    j = ae;
    k = af;
  };
  {
    uchar8 ae = min(f, i);
    uchar8 af = max(f, i);
    f = ae;
    i = af;
  };
  {
    uchar8 ae = min(h, k);
    uchar8 af = max(h, k);
    h = ae;
    k = af;
  };
  {
    uchar8 ae = min(h, i);
    uchar8 af = max(h, i);
    h = ae;
    i = af;
  };
  {
    uchar8 ae = min(g, j);
    uchar8 af = max(g, j);
    g = ae;
    j = af;
  };
  {
    uchar8 ae = min(g, h);
    uchar8 af = max(g, h);
    g = ae;
    h = af;
  };
  {
    uchar8 ae = min(i, j);
    uchar8 af = max(i, j);
    i = ae;
    j = af;
  };
  {
    uchar8 ae = min(m, n);
    uchar8 af = max(m, n);
    m = ae;
    n = af;
  };
  {
    uchar8 ae = min(l, m);
    uchar8 af = max(l, m);
    l = ae;
    m = af;
  };
  {
    uchar8 ae = min(m, n);
    uchar8 af = max(m, n);
    m = ae;
    n = af;
  };
  {
    uchar8 ae = min(p, q);
    uchar8 af = max(p, q);
    p = ae;
    q = af;
  };
  {
    uchar8 ae = min(o, p);
    uchar8 af = max(o, p);
    o = ae;
    p = af;
  };
  {
    uchar8 ae = min(p, q);
    uchar8 af = max(p, q);
    p = ae;
    q = af;
  };
  {
    uchar8 ae = min(l, o);
    uchar8 af = max(l, o);
    l = ae;
    o = af;
  };
  {
    uchar8 ae = min(n, q);
    uchar8 af = max(n, q);
    n = ae;
    q = af;
  };
  {
    uchar8 ae = min(n, o);
    uchar8 af = max(n, o);
    n = ae;
    o = af;
  };
  {
    uchar8 ae = min(m, p);
    uchar8 af = max(m, p);
    m = ae;
    p = af;
  };
  {
    uchar8 ae = min(m, n);
    uchar8 af = max(m, n);
    m = ae;
    n = af;
  };
  {
    uchar8 ae = min(o, p);
    uchar8 af = max(o, p);
    o = ae;
    p = af;
  };
  {
    uchar8 ae = min(f, l);
    uchar8 af = max(f, l);
    f = ae;
    l = af;
  };
  {
    uchar8 ae = min(j, p);
    uchar8 af = max(j, p);
    j = ae;
    p = af;
  };
  {
    uchar8 ae = min(j, l);
    uchar8 af = max(j, l);
    j = ae;
    l = af;
  };
  {
    uchar8 ae = min(h, n);
    uchar8 af = max(h, n);
    h = ae;
    n = af;
  };
  {
    uchar8 ae = min(h, j);
    uchar8 af = max(h, j);
    h = ae;
    j = af;
  };
  {
    uchar8 ae = min(l, n);
    uchar8 af = max(l, n);
    l = ae;
    n = af;
  };
  {
    uchar8 ae = min(g, m);
    uchar8 af = max(g, m);
    g = ae;
    m = af;
  };
  {
    uchar8 ae = min(k, q);
    uchar8 af = max(k, q);
    k = ae;
    q = af;
  };
  {
    uchar8 ae = min(k, m);
    uchar8 af = max(k, m);
    k = ae;
    m = af;
  };
  {
    uchar8 ae = min(i, o);
    uchar8 af = max(i, o);
    i = ae;
    o = af;
  };
  {
    uchar8 ae = min(i, k);
    uchar8 af = max(i, k);
    i = ae;
    k = af;
  };
  {
    uchar8 ae = min(m, o);
    uchar8 af = max(m, o);
    m = ae;
    o = af;
  };
  {
    uchar8 ae = min(g, h);
    uchar8 af = max(g, h);
    g = ae;
    h = af;
  };
  {
    uchar8 ae = min(i, j);
    uchar8 af = max(i, j);
    i = ae;
    j = af;
  };
  {
    uchar8 ae = min(k, l);
    uchar8 af = max(k, l);
    k = ae;
    l = af;
  };
  {
    uchar8 ae = min(m, n);
    uchar8 af = max(m, n);
    m = ae;
    n = af;
  };
  {
    uchar8 ae = min(o, p);
    uchar8 af = max(o, p);
    o = ae;
    p = af;
  };
  {
    uchar8 ae = min(s, t);
    uchar8 af = max(s, t);
    s = ae;
    t = af;
  };
  {
    uchar8 ae = min(r, s);
    uchar8 af = max(r, s);
    r = ae;
    s = af;
  };
  {
    uchar8 ae = min(s, t);
    uchar8 af = max(s, t);
    s = ae;
    t = af;
  };
  {
    uchar8 ae = min(v, w);
    uchar8 af = max(v, w);
    v = ae;
    w = af;
  };
  {
    uchar8 ae = min(u, v);
    uchar8 af = max(u, v);
    u = ae;
    v = af;
  };
  {
    uchar8 ae = min(v, w);
    uchar8 af = max(v, w);
    v = ae;
    w = af;
  };
  {
    uchar8 ae = min(r, u);
    uchar8 af = max(r, u);
    r = ae;
    u = af;
  };
  {
    uchar8 ae = min(t, w);
    uchar8 af = max(t, w);
    t = ae;
    w = af;
  };
  {
    uchar8 ae = min(t, u);
    uchar8 af = max(t, u);
    t = ae;
    u = af;
  };
  {
    uchar8 ae = min(s, v);
    uchar8 af = max(s, v);
    s = ae;
    v = af;
  };
  {
    uchar8 ae = min(s, t);
    uchar8 af = max(s, t);
    s = ae;
    t = af;
  };
  {
    uchar8 ae = min(u, v);
    uchar8 af = max(u, v);
    u = ae;
    v = af;
  };
  {
    uchar8 ae = min(y, z);
    uchar8 af = max(y, z);
    y = ae;
    z = af;
  };
  {
    uchar8 ae = min(x, y);
    uchar8 af = max(x, y);
    x = ae;
    y = af;
  };
  {
    uchar8 ae = min(y, z);
    uchar8 af = max(y, z);
    y = ae;
    z = af;
  };
  {
    uchar8 ae = min(aa, ab);
    uchar8 af = max(aa, ab);
    aa = ae;
    ab = af;
  };
  {
    uchar8 ae = min(ac, ad);
    uchar8 af = max(ac, ad);
    ac = ae;
    ad = af;
  };
  {
    uchar8 ae = min(aa, ac);
    uchar8 af = max(aa, ac);
    aa = ae;
    ac = af;
  };
  {
    uchar8 ae = min(ab, ad);
    uchar8 af = max(ab, ad);
    ab = ae;
    ad = af;
  };
  {
    uchar8 ae = min(ab, ac);
    uchar8 af = max(ab, ac);
    ab = ae;
    ac = af;
  };
  {
    uchar8 ae = min(x, aa);
    uchar8 af = max(x, aa);
    x = ae;
    aa = af;
  };
  {
    uchar8 ae = min(z, ac);
    uchar8 af = max(z, ac);
    z = ae;
    ac = af;
  };
  {
    uchar8 ae = min(z, aa);
    uchar8 af = max(z, aa);
    z = ae;
    aa = af;
  };
  {
    uchar8 ae = min(y, ab);
    uchar8 af = max(y, ab);
    y = ae;
    ab = af;
  };
  {
    uchar8 ae = min(ab, ad);
    uchar8 af = max(ab, ad);
    ab = ae;
    ad = af;
  };
  {
    uchar8 ae = min(y, z);
    uchar8 af = max(y, z);
    y = ae;
    z = af;
  };
  {
    uchar8 ae = min(aa, ab);
    uchar8 af = max(aa, ab);
    aa = ae;
    ab = af;
  };
  {
    uchar8 ae = min(ac, ad);
    uchar8 af = max(ac, ad);
    ac = ae;
    ad = af;
  };
  {
    uchar8 ae = min(r, x);
    uchar8 af = max(r, x);
    r = ae;
    x = af;
  };
  {
    uchar8 ae = min(v, ab);
    uchar8 af = max(v, ab);
    v = ae;
    ab = af;
  };
  {
    uchar8 ae = min(v, x);
    uchar8 af = max(v, x);
    v = ae;
    x = af;
  };
  {
    uchar8 ae = min(t, z);
    uchar8 af = max(t, z);
    t = ae;
    z = af;
  };
  {
    uchar8 ae = min(z, ad);
    uchar8 af = max(z, ad);
    z = ae;
    ad = af;
  };
  {
    uchar8 ae = min(t, v);
    uchar8 af = max(t, v);
    t = ae;
    v = af;
  };
  {
    uchar8 ae = min(x, z);
    uchar8 af = max(x, z);
    x = ae;
    z = af;
  };
  {
    uchar8 ae = min(ab, ad);
    uchar8 af = max(ab, ad);
    ab = ae;
    ad = af;
  };
  {
    uchar8 ae = min(s, y);
    uchar8 af = max(s, y);
    s = ae;
    y = af;
  };
  {
    uchar8 ae = min(w, ac);
    uchar8 af = max(w, ac);
    w = ae;
    ac = af;
  };
  {
    uchar8 ae = min(w, y);
    uchar8 af = max(w, y);
    w = ae;
    y = af;
  };
  {
    uchar8 ae = min(u, aa);
    uchar8 af = max(u, aa);
    u = ae;
    aa = af;
  };
  {
    uchar8 ae = min(u, w);
    uchar8 af = max(u, w);
    u = ae;
    w = af;
  };
  {
    uchar8 ae = min(y, aa);
    uchar8 af = max(y, aa);
    y = ae;
    aa = af;
  };
  {
    uchar8 ae = min(s, t);
    uchar8 af = max(s, t);
    s = ae;
    t = af;
  };
  {
    uchar8 ae = min(u, v);
    uchar8 af = max(u, v);
    u = ae;
    v = af;
  };
  {
    uchar8 ae = min(w, x);
    uchar8 af = max(w, x);
    w = ae;
    x = af;
  };
  {
    uchar8 ae = min(y, z);
    uchar8 af = max(y, z);
    y = ae;
    z = af;
  };
  {
    uchar8 ae = min(aa, ab);
    uchar8 af = max(aa, ab);
    aa = ae;
    ab = af;
  };
  {
    uchar8 ae = min(ac, ad);
    uchar8 af = max(ac, ad);
    ac = ae;
    ad = af;
  };
  {
    uchar8 ae = min(f, r);
    uchar8 af = max(f, r);
    f = ae;
    r = af;
  };
  {
    uchar8 ae = min(n, z);
    uchar8 af = max(n, z);
    n = ae;
    z = af;
  };
  {
    uchar8 ae = min(n, r);
    uchar8 af = max(n, r);
    n = ae;
    r = af;
  };
  {
    uchar8 ae = min(j, v);
    uchar8 af = max(j, v);
    j = ae;
    v = af;
  };
  {
    uchar8 ae = min(v, ad);
    uchar8 af = max(v, ad);
    v = ae;
    ad = af;
  };
  {
    uchar8 ae = min(r, v);
    uchar8 af = max(r, v);
    r = ae;
    v = af;
  };
  {
    uchar8 ae = min(h, t);
    uchar8 af = max(h, t);
    h = ae;
    t = af;
  };
  {
    uchar8 ae = min(p, ab);
    uchar8 af = max(p, ab);
    p = ae;
    ab = af;
  };
  {
    uchar8 ae = min(p, t);
    uchar8 af = max(p, t);
    p = ae;
    t = af;
  };
  {
    uchar8 ae = min(l, x);
    uchar8 af = max(l, x);
    l = ae;
    x = af;
  };
  {
    uchar8 ae = min(l, p);
    uchar8 af = max(l, p);
    l = ae;
    p = af;
  };
  {
    uchar8 ae = min(p, r);
    uchar8 af = max(p, r);
    p = ae;
    r = af;
  };
  {
    uchar8 ae = min(g, s);
    uchar8 af = max(g, s);
    g = ae;
    s = af;
  };
  {
    uchar8 ae = min(o, aa);
    uchar8 af = max(o, aa);
    o = ae;
    aa = af;
  };
  {
    uchar8 ae = min(o, s);
    uchar8 af = max(o, s);
    o = ae;
    s = af;
  };
  {
    uchar8 ae = min(k, w);
    uchar8 af = max(k, w);
    k = ae;
    w = af;
  };
  {
    uchar8 ae = min(s, w);
    uchar8 af = max(s, w);
    s = ae;
    w = af;
  };
  {
    uchar8 ae = min(i, u);
    uchar8 af = max(i, u);
    i = ae;
    u = af;
  };
  {
    uchar8 ae = min(q, ac);
    uchar8 af = max(q, ac);
    q = ae;
    ac = af;
  };
  {
    uchar8 ae = min(q, u);
    uchar8 af = max(q, u);
    q = ae;
    u = af;
  };
  {
    uchar8 ae = min(m, y);
    uchar8 af = max(m, y);
    m = ae;
    y = af;
  };
  {
    uchar8 ae = min(m, q);
    uchar8 af = max(m, q);
    m = ae;
    q = af;
  };
  {
    uchar8 ae = min(q, s);
    uchar8 af = max(q, s);
    q = ae;
    s = af;
  };
  {
    uchar8 ae = min(q, r);
    uchar8 af = max(q, r);
    q = ae;
    r = af;
  };
  return r;
}
__kernel void R(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l) {
  Image m = B(a, f, b, c, d, e);
  Image n = B(g, l, h, i, j, k);

  uchar16 o = vload16(0, G(&m, -2, -2));
  uchar16 p = vload16(0, G(&m, -2, -1));
  uchar16 q = vload16(0, G(&m, -2, 0));
  uchar16 r = vload16(0, G(&m, -2, 1));
  uchar16 s = vload16(0, G(&m, -2, 2));

  uchar16 t = max(q, max(max(o, p), max(r, s)));
  uchar8 u = O(t);

  vstore8(u, 0, n.ptr);
}
__kernel void S(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l) {
  Image m = B(a, f, b, c, d, e);
  Image n = B(g, l, h, i, j, k);

  uchar8 o = vload8(0, G(&m, 0, -2));
  uchar8 p = vload8(0, G(&m, 0, -1));
  uchar16 q = vload16(0, G(&m, -2, 0));
  uchar8 r = vload8(0, G(&m, 0, 1));
  uchar8 s = vload8(0, G(&m, 0, 2));

  uchar8 t = O(q);
  uchar8 u = max(t, max(max(o, p.s01234567), max(r, s)));
  vstore8(u, 0, n.ptr);
}
__kernel void T(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l) {
  Image m = B(a, f, b, c, d, e);
  Image n = B(g, l, h, i, j, k);

  uchar16 o = vload16(0, G(&m, -2, -2));
  uchar16 p = vload16(0, G(&m, -2, -1));
  uchar16 q = vload16(0, G(&m, -2, 0));
  uchar16 r = vload16(0, G(&m, -2, 1));
  uchar16 s = vload16(0, G(&m, -2, 2));

  o = o.s123456789ABCDEFF;
  s = s.s123456789ABCDEFF;
  uchar16 t = max(o, s);
  uchar16 u = max(q, max(p, r));
  uchar8 v = M(t);
  uchar8 w = O(u);
  uchar8 x = max(v, w);

  vstore8(x, 0, n.ptr);
}