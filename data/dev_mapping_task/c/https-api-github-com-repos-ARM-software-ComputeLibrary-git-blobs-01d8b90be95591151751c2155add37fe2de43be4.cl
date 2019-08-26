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
  uchar16 p = vload16(0, m.ptr + 16);
  uchar16 q = vload16(0, m.ptr + 32);

  uchar16 r = (uchar16)(o2, 255, o5, 255, o8, 255, ob, 255);
  uchar16 s = (uchar16)(oe, 255, o p, 255, p4, 255, p7, 255);
  uchar16 t = (uchar16)(pa, 255, pd, 255, p, q 255, q3, 255);
  uchar16 u = (uchar16)(q6, 255, q9, 255, qc, 255, qf, 255);

  vstore16(r, 0, n.ptr);
  vstore16(s, 0, n.ptr + 16);
  vstore16(t, 0, n.ptr + 32);
  vstore16(u, 0, n.ptr + 48);
}
__kernel void K(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l) {
  Image m = B(a, f, b, c, d, e);
  Image n = B(g, l, h, i, j, k);

  uchar16 o = vload16(0, m.ptr);
  uchar16 p = vload16(0, m.ptr + 16);
  uchar16 q = vload16(0, m.ptr + 32);
  uchar16 r = vload16(0, m.ptr + 48);

  uchar16 s = (uchar16)(o45689, oe, p4);
  uchar16 t = (uchar16)(p9acde, q45689);
  uchar16 u = (uchar16)(qe, r45689, re);

  vstore16(s, 0, n.ptr);
  vstore16(t, 0, n.ptr + 16);
  vstore16(u, 0, n.ptr + 32);
}
__kernel void L(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l) {
  Image m = B(a, f, b, c, d, e);
  Image n = B(g, l, h, i, j, k);

  uchar16 o = vload16(0, m.ptr);

  uchar8 p = (uchar8)(o, o, o, o, o, o, o, o);
  char8 q = (char8)(o, o, o, o, o, o, o, o) - (char8)(128);
  char8 r = (char8)(o, o, o, o, o, o, o, o) - (char8)(128);

  float8 s = convert_float8(p) + (float8)(0.0000f) * convert_float8(q) + (float8)(1.5748f) * convert_float8(r);
  float8 t = convert_float8(p) - (float8)(0.1873f) * convert_float8(q) - (float8)(0.4681f) * convert_float8(r);
  float8 u = convert_float8(p) + (float8)(1.8556f) * convert_float8(q) + (float8)(0.0000f) * convert_float8(r);

  uchar8 v = convert_uchar8_rtz(s);
  uchar8 w = convert_uchar8_rtz(t);
  uchar8 x = convert_uchar8_rtz(u);

  uchar16 y = (uchar16)(v0, w0, x0, v1, w1, x1, v2, w2, x2, v3, w3, x3, v4, w4, x4, v5);
  uchar8 z = (uchar8)(w5, x5, v6, w6, x6, v7, w7, x7);

  vstore16(y, 0, n.ptr);
  vstore8(z, 0, n.ptr + 16);
}
__kernel void M(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l) {
  Image m = B(a, f, b, c, d, e);
  Image n = B(g, l, h, i, j, k);

  uchar16 o = vload16(0, m.ptr);

  uchar8 p = (uchar8)(o, o, o, o, o, o, o, o);
  char8 q = (char8)(o, o, o, o, o, o, o, o) - (char8)(128);
  char8 r = (char8)(o, o, o, o, o, o, o, o) - (char8)(128);

  float8 s = convert_float8(p) + (float8)(0.0000f) * convert_float8(q) + (float8)(1.5748f) * convert_float8(r);
  float8 t = convert_float8(p) - (float8)(0.1873f) * convert_float8(q) - (float8)(0.4681f) * convert_float8(r);
  float8 u = convert_float8(p) + (float8)(1.8556f) * convert_float8(q) + (float8)(0.0000f) * convert_float8(r);

  uchar8 v = convert_uchar8_rtz(s);
  uchar8 w = convert_uchar8_rtz(t);
  uchar8 x = convert_uchar8_rtz(u);

  uchar16 y = (uchar16)(v0, w0, x0, 255, v1, w1, x1, 255, v2, w2, x2, 255, v3, w3, x3, 255);
  uchar16 z = (uchar16)(v4, w4, x4, 255, v5, w5, x5, 255, v6, w6, x6, 255, v7, w7, x7, 255);

  vstore16(y, 0, n.ptr);
  vstore16(z, 0, n.ptr + 16);
}
__kernel void N(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l) {
  Image m = B(a, f, b, c, d, e);
  Image n = B(g, l, h, i, j, k);

  uchar16 o = vload16(0, m.ptr);

  uchar8 p = (uchar8)(o, o, o, o, o, o, o, o);
  char8 q = (char8)(o, o, o, o, o, o, o, o) - (char8)(128);
  char8 r = (char8)(o, o, o, o, o, o, o, o) - (char8)(128);

  float8 s = convert_float8(p) + (float8)(0.0000f) * convert_float8(q) + (float8)(1.5748f) * convert_float8(r);
  float8 t = convert_float8(p) - (float8)(0.1873f) * convert_float8(q) - (float8)(0.4681f) * convert_float8(r);
  float8 u = convert_float8(p) + (float8)(1.8556f) * convert_float8(q) + (float8)(0.0000f) * convert_float8(r);

  uchar8 v = convert_uchar8_rtz(s);
  uchar8 w = convert_uchar8_rtz(t);
  uchar8 x = convert_uchar8_rtz(u);

  uchar16 y = (uchar16)(v0, w0, x0, v1, w1, x1, v2, w2, x2, v3, w3, x3, v4, w4, x4, v5);
  uchar8 z = (uchar8)(w5, x5, v6, w6, x6, v7, w7, x7);

  vstore16(y, 0, n.ptr);
  vstore8(z, 0, n.ptr + 16);
}
__kernel void O(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l) {
  Image m = B(a, f, b, c, d, e);
  Image n = B(g, l, h, i, j, k);

  uchar16 o = vload16(0, m.ptr);

  uchar8 p = (uchar8)(o, o, o, o, o, o, o, o);
  char8 q = (char8)(o, o, o, o, o, o, o, o) - (char8)(128);
  char8 r = (char8)(o, o, o, o, o, o, o, o) - (char8)(128);

  float8 s = convert_float8(p) + (float8)(0.0000f) * convert_float8(q) + (float8)(1.5748f) * convert_float8(r);
  float8 t = convert_float8(p) - (float8)(0.1873f) * convert_float8(q) - (float8)(0.4681f) * convert_float8(r);
  float8 u = convert_float8(p) + (float8)(1.8556f) * convert_float8(q) + (float8)(0.0000f) * convert_float8(r);

  uchar8 v = convert_uchar8_rtz(s);
  uchar8 w = convert_uchar8_rtz(t);
  uchar8 x = convert_uchar8_rtz(u);

  uchar16 y = (uchar16)(v0, w0, x0, 255, v1, w1, x1, 255, v2, w2, x2, 255, v3, w3, x3, 255);
  uchar16 z = (uchar16)(v4, w4, x4, 255, v5, w5, x5, 255, v6, w6, x6, 255, v7, w7, x7, 255);

  vstore16(y, 0, n.ptr);
  vstore16(z, 0, n.ptr + 16);
}
__kernel void P(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r) {
  Image s = B(a, f, b, c, d, e);
  Image t = B(g, l, h, i, j, k);
  Image u = B(m, r, n, o, p, q);

  uchar8 v = vload8(0, s.ptr);
    uchar2 w = (uchar2)(v v;
    uchar2 x = (uchar2)(v v;
    uchar2 y = (uchar2)(v v;

    float2 z = (float2)(0.0000f) + (float2)(0.2126f) * convert_float2(w) + (float2)(0.7152f) * convert_float2(x) + (float2)(0.0722f) * convert_float2(y);
    float2 aa = (float2)(0.0000f) - (float2)(0.1146f) * convert_float2(w) - (float2)(0.3854f) * convert_float2(x) + (float2)(0.5000f) * convert_float2(y);
    float2 ab = (float2)(0.0000f) + (float2)(0.5000f) * convert_float2(w) - (float2)(0.4542f) * convert_float2(x) - (float2)(0.0458f) * convert_float2(y);

    short2 ac = convert_short2_rtz(z);
    short2 ad = convert_short2_rtz(aa) + (short2)(128);
    short2 ae = convert_short2_rtz(ab) + (short2)(128);

    uchar2 af = convert_uchar2(max((short2)(0), min(ac, (short2)(255))));
    vstore2(af, 0, t.ptr);

    uchar2 ag = convert_uchar2(max((short2)(0), min(ad, (short2)(255))));
    uchar2 ah = convert_uchar2(max((short2)(0), min(ae, (short2)(255))));


    uchar8 ai = vload8(0, s.ptr + d);
    uchar2 aj = (uchar2)(ai, ai);
    uchar2 ak = (uchar2)(ai, ai);
    uchar2 al = (uchar2)(ai, ai);

    z = (float2)(0.0000f) + (float2)(0.2126f) * convert_float2(aj) + (float2)(0.7152f) * convert_float2(ak) + (float2)(0.0722f) * convert_float2(al);
    aa = (float2)(0.0000f) - (float2)(0.1146f) * convert_float2(aj) - (float2)(0.3854f) * convert_float2(ak) + (float2)(0.5000f) * convert_float2(al);
    ab = (float2)(0.0000f) + (float2)(0.5000f) * convert_float2(aj) - (float2)(0.4542f) * convert_float2(ak) - (float2)(0.0458f) * convert_float2(al);

    ac = convert_short2_rtz(z);
    ad = convert_short2_rtz(aa) + (short2)(128);
    ae = convert_short2_rtz(ab) + (short2)(128);

    uchar2 am = convert_uchar2(max((short2)(0), min(ac, (short2)(255))));
    vstore2(am, 0, t.ptr + j);

    uchar2 an = convert_uchar2(max((short2)(0), min(ad, (short2)(255))));
    uchar2 ao = convert_uchar2(max((short2)(0), min(ae, (short2)(255))));
    uchar2 ap = (uchar2)(((ag0 + ag1 + an0 + an1) / 4),
                           ((ah0 + ah1 + ao0 + ao1) / 4));

    vstore2(ap, 0, u.ptr);
}
__kernel void Q(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r) {
  Image s = B(a, f, b, c, d, e);
  Image t = B(g, l, h, i, j, k);
  Image u = B(m, r, n, o, p, q);

  uchar4 v = vload4(0, s.ptr);
  uchar4 w = vload4(0, s.ptr + d);
  uchar4 x = vload4(0, t.ptr);
  char4 y = (char4)(x, x, x, x) - (char4)(128);
  char4 z = (char4)(x, x, x, x) - (char4)(128);

  float4 aa = (float4)(0.0000f) + (float4)(0.0000f) * convert_float4(y) + (float4)(1.5748f) * convert_float4(z);
  float4 ab = (float4)(0.0000f) - (float4)(0.1873f) * convert_float4(y) - (float4)(0.4681f) * convert_float4(z);
  float4 ac = (float4)(0.0000f) + (float4)(1.8556f) * convert_float4(y) + (float4)(0.0000f) * convert_float4(z);

  float4 ad = convert_float4(v) + aa;
  float4 ae = convert_float4(v) + ab;
  float4 af = convert_float4(v) + ac;

  uchar4 ag = convert_uchar4_rtz(ad);
  uchar4 ah = convert_uchar4_rtz(ae);
  uchar4 ai = convert_uchar4_rtz(af);

  uchar8 aj = (uchar8)(ags0, ahs0, ais0, ags1, ahs1, ais1, ags2, ahs2);
  uchar4 ak = (uchar4)(ais2, ags3, ahs3, ais3);
  vstore8(aj, 0, u.ptr);
  vstore4(ak, 0, u.ptr + 8);

  ad = convert_float4(w) + aa;
  ae = convert_float4(w) + ab;
  af = convert_float4(w) + ac;

  ag = convert_uchar4_rtz(ad);
  ah = convert_uchar4_rtz(ae);
  ai = convert_uchar4_rtz(af);

  aj = (uchar8)(ags0, ahs0, ais0, ags1, ahs1, ais1, ags2, ahs2);
  ak = (uchar4)(ais2, ags3, ahs3, ais3);
  vstore8(aj, 0, u.ptr + p);
  vstore4(ak, 0, u.ptr + p + 8);
}
__kernel void R(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r, __global uchar* s, uint t, uint u, uint v, uint w, uint x) {
  Image y = B(a, f, b, c, d, e);
  Image z = B(g, l, h, i, j, k);
  Image aa = B(m, r, n, o, p, q);
  Image ab = B(s, x, t, u, v, w);

  uchar16 ac = vload16(0, y.ptr);
  uchar4 ad = (uchar4)(ac, ac, ac, ac);
  uchar4 ae = (uchar4)(ac, ac, ac, ac);
  uchar4 af = (uchar4)(ac, ac, ac, ac);

  float4 ag = (float4)(0.0000f) + (float4)(0.2126f) * convert_float4(ad) + (float4)(0.7152f) * convert_float4(ae) + (float4)(0.0722f) * convert_float4(af);
  float4 ah = (float4)(0.0000f) - (float4)(0.1146f) * convert_float4(ad) - (float4)(0.3854f) * convert_float4(ae) + (float4)(0.5000f) * convert_float4(af);
  float4 ai = (float4)(0.0000f) + (float4)(0.5000f) * convert_float4(ad) - (float4)(0.4542f) * convert_float4(ae) - (float4)(0.0458f) * convert_float4(af);

  short4 aj = convert_short4_rtz(ag);
  short4 ak = convert_short4_rtz(ah) + (short4)(128);
  short4 al = convert_short4_rtz(ai) + (short4)(128);

  uchar4 am = convert_uchar4(max((short4)(0), min(aj, (short4)(255))));
  vstore4(am, 0, z.ptr);

  uchar4 an = convert_uchar4(max((short4)(0), min(ak, (short4)(255))));
  uchar4 ao = convert_uchar4(max((short4)(0), min(al, (short4)(255))));
  vstore4(an, 0, aa.ptr);
  vstore4(ao, 0, ab.ptr);
}
__kernel void S(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r, __global uchar* s, uint t, uint u, uint v, uint w, uint x) {
  Image y = B(a, f, b, c, d, e);
  Image z = B(g, l, h, i, j, k);
  Image aa = B(m, r, n, o, p, q);
  Image ab = B(s, x, t, u, v, w);

  uchar8 ac = vload8(0, y.ptr);
  uchar2 ad = (uchar2)(ac, ac);
  uchar2 ae = (uchar2)(ac, ac);
  uchar2 af = (uchar2)(ac, ac);

  float2 ag = (float2)(0.0000f) + (float2)(0.2126f) * convert_float2(ad) + (float2)(0.7152f) * convert_float2(ae) + (float2)(0.0722f) * convert_float2(af);
  float2 ah = (float2)(0.0000f) - (float2)(0.1146f) * convert_float2(ad) - (float2)(0.3854f) * convert_float2(ae) + (float2)(0.5000f) * convert_float2(af);
  float2 ai = (float2)(0.0000f) + (float2)(0.5000f) * convert_float2(ad) - (float2)(0.4542f) * convert_float2(ae) - (float2)(0.0458f) * convert_float2(af);

  short2 aj = convert_short2_rtz(ag);
  short2 ak = convert_short2_rtz(ah) + (short2)(128);
  short2 al = convert_short2_rtz(ai) + (short2)(128);

  uchar2 am = convert_uchar2(max((short2)(0), min(aj, (short2)(255))));
  vstore2(am, 0, z.ptr);

  uchar2 an = convert_uchar2(max((short2)(0), min(ak, (short2)(255))));
  uchar2 ao = convert_uchar2(max((short2)(0), min(al, (short2)(255))));

  uchar8 ap = vload8(0, y.ptr + d);
  uchar2 aq = (uchar2)(ap, ap);
  uchar2 ar = (uchar2)(ap, ap);
  uchar2 as = (uchar2)(ap, ap);

  ag = (float2)(0.0000f) + (float2)(0.2126f) * convert_float2(aq) + (float2)(0.7152f) * convert_float2(ar) + (float2)(0.0722f) * convert_float2(as);
  ah = (float2)(0.0000f) - (float2)(0.1146f) * convert_float2(aq) - (float2)(0.3854f) * convert_float2(ar) + (float2)(0.5000f) * convert_float2(as);
  ai = (float2)(0.0000f) + (float2)(0.5000f) * convert_float2(aq) - (float2)(0.4542f) * convert_float2(ar) - (float2)(0.0458f) * convert_float2(as);

  aj = convert_short2_rtz(ag);
  ak = convert_short2_rtz(ah) + (short2)(128);
  al = convert_short2_rtz(ai) + (short2)(128);

  uchar2 at = convert_uchar2(max((short2)(0), min(aj, (short2)(255))));
  vstore2(at, 0, z.ptr + j);

  uchar2 au = convert_uchar2(max((short2)(0), min(ak, (short2)(255))));
  uchar2 av = convert_uchar2(max((short2)(0), min(al, (short2)(255))));
  uchar2 aw = (uchar2)(((an0 + an1 + au0 + au1) / 4), ((ao0 + ao1 + av0 + av1) / 4));
  *aa.ptr = aw.x;
  *ab.ptr = aw.y;
}
__kernel void T(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r, __global uchar* s, uint t, uint u, uint v, uint w, uint x) {
  Image y = B(a, f, b, c, d, e);
  Image z = B(g, l, h, i, j, k);
  Image aa = B(m, r, n, o, p, q);
  Image ab = B(s, x, t, u, v, w);

  uchar16 ac = vload16(0, y.ptr);
  uchar4 ad = (uchar4)(ac, ac, ac, ac);
  uchar4 ae = (uchar4)(ac, ac, ac, ac);
  uchar4 af = (uchar4)(ac, ac, ac, ac);

  float4 ag = (float4)(0.0000f) + (float4)(0.2126f) * convert_float4(ad) + (float4)(0.7152f) * convert_float4(ae) + (float4)(0.0722f) * convert_float4(af);
  float4 ah = (float4)(0.0000f) - (float4)(0.1146f) * convert_float4(ad) - (float4)(0.3854f) * convert_float4(ae) + (float4)(0.5000f) * convert_float4(af);
  float4 ai = (float4)(0.0000f) + (float4)(0.5000f) * convert_float4(ad) - (float4)(0.4542f) * convert_float4(ae) - (float4)(0.0458f) * convert_float4(af);

  short4 aj = convert_short4(ag);
  short4 ak = convert_short4(ah) + (short4)(128);
  short4 al = convert_short4(ai) + (short4)(128);

  uchar4 am = convert_uchar4_sat(max((short4)(0), min(aj, (short4)(255))));
  vstore4(am, 0, z.ptr);

  uchar4 an = convert_uchar4_sat(max((short4)(0), min(ak, (short4)(255))));
  uchar4 ao = convert_uchar4_sat(max((short4)(0), min(al, (short4)(255))));
  vstore4(an, 0, aa.ptr);
  vstore4(ao, 0, ab.ptr);
}
__kernel void U(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r) {
  Image s = B(a, f, b, c, d, e);
  Image t = B(g, l, h, i, j, k);
  Image u = B(m, r, n, o, p, q);

  uchar8 v = vload8(0, s.ptr);
    uchar2 w = (uchar2)(v v;
    uchar2 x = (uchar2)(v v;
    uchar2 y = (uchar2)(v v;

    float2 z = (float2)(0.0000f) + (float2)(0.2126f) * convert_float2(w) + (float2)(0.7152f) * convert_float2(x) + (float2)(0.0722f) * convert_float2(y);
    float2 aa = (float2)(0.0000f) - (float2)(0.1146f) * convert_float2(w) - (float2)(0.3854f) * convert_float2(x) + (float2)(0.5000f) * convert_float2(y);
    float2 ab = (float2)(0.0000f) + (float2)(0.5000f) * convert_float2(w) - (float2)(0.4542f) * convert_float2(x) - (float2)(0.0458f) * convert_float2(y);

    short2 ac = convert_short2_rtz(z);
    short2 ad = convert_short2_rtz(aa) + (short2)(128);
    short2 ae = convert_short2_rtz(ab) + (short2)(128);

    uchar2 af = convert_uchar2(max((short2)(0), min(ac, (short2)(255))));
    vstore2(af, 0, t.ptr);

    uchar2 ag = convert_uchar2(max((short2)(0), min(ad, (short2)(255))));
    uchar2 ah = convert_uchar2(max((short2)(0), min(ae, (short2)(255))));


    uchar8 ai = vload8(0, s.ptr + d);
    uchar2 aj = (uchar2)(ai, ai);
    uchar2 ak = (uchar2)(ai, ai);
    uchar2 al = (uchar2)(ai, ai);

    z = (float2)(0.0000f) + (float2)(0.2126f) * convert_float2(aj) + (float2)(0.7152f) * convert_float2(ak) + (float2)(0.0722f) * convert_float2(al);
    aa = (float2)(0.0000f) - (float2)(0.1146f) * convert_float2(aj) - (float2)(0.3854f) * convert_float2(ak) + (float2)(0.5000f) * convert_float2(al);
    ab = (float2)(0.0000f) + (float2)(0.5000f) * convert_float2(aj) - (float2)(0.4542f) * convert_float2(ak) - (float2)(0.0458f) * convert_float2(al);

    ac = convert_short2_rtz(z);
    ad = convert_short2_rtz(aa) + (short2)(128);
    ae = convert_short2_rtz(ab) + (short2)(128);

    uchar2 am = convert_uchar2(max((short2)(0), min(ac, (short2)(255))));
    vstore2(am, 0, t.ptr + j);

    uchar2 an = convert_uchar2(max((short2)(0), min(ad, (short2)(255))));
    uchar2 ao = convert_uchar2(max((short2)(0), min(ae, (short2)(255))));
    uchar2 ap = (uchar2)(((ag0 + ag1 + an0 + an1) / 4),
                           ((ah0 + ah1 + ao0 + ao1) / 4));
    vstore2(ap, 0, u.ptr);
}
__kernel void V(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r, __global uchar* s, uint t, uint u, uint v, uint w, uint x) {
  Image y = B(a, f, b, c, d, e);
  Image z = B(g, l, h, i, j, k);
  Image aa = B(m, r, n, o, p, q);
  Image ab = B(s, x, t, u, v, w);

  uchar8 ac = vload8(0, y.ptr);
  uchar2 ad = (uchar2)(ac, ac);
  uchar2 ae = (uchar2)(ac, ac);
  uchar2 af = (uchar2)(ac, ac);

  float2 ag = (float2)(0.0000f) + (float2)(0.2126f) * convert_float2(ad) + (float2)(0.7152f) * convert_float2(ae) + (float2)(0.0722f) * convert_float2(af);
  float2 ah = (float2)(0.0000f) - (float2)(0.1146f) * convert_float2(ad) - (float2)(0.3854f) * convert_float2(ae) + (float2)(0.5000f) * convert_float2(af);
  float2 ai = (float2)(0.0000f) + (float2)(0.5000f) * convert_float2(ad) - (float2)(0.4542f) * convert_float2(ae) - (float2)(0.0458f) * convert_float2(af);

  short2 aj = convert_short2_rtz(ag);
  short2 ak = convert_short2_rtz(ah) + (short2)(128);
  short2 al = convert_short2_rtz(ai) + (short2)(128);

  uchar2 am = convert_uchar2(max((short2)(0), min(aj, (short2)(255))));
  vstore2(am, 0, z.ptr);

  uchar2 an = convert_uchar2(max((short2)(0), min(ak, (short2)(255))));
  uchar2 ao = convert_uchar2(max((short2)(0), min(al, (short2)(255))));

  uchar8 ap = vload8(0, y.ptr + d);
  uchar2 aq = (uchar2)(ap, ap);
  uchar2 ar = (uchar2)(ap, ap);
  uchar2 as = (uchar2)(ap, ap);

  ag = (float2)(0.0000f) + (float2)(0.2126f) * convert_float2(aq) + (float2)(0.7152f) * convert_float2(ar) + (float2)(0.0722f) * convert_float2(as);
  ah = (float2)(0.0000f) - (float2)(0.1146f) * convert_float2(aq) - (float2)(0.3854f) * convert_float2(ar) + (float2)(0.5000f) * convert_float2(as);
  ai = (float2)(0.0000f) + (float2)(0.5000f) * convert_float2(aq) - (float2)(0.4542f) * convert_float2(ar) - (float2)(0.0458f) * convert_float2(as);

  aj = convert_short2_rtz(ag);
  ak = convert_short2_rtz(ah) + (short2)(128);
  al = convert_short2_rtz(ai) + (short2)(128);

  uchar2 at = convert_uchar2(max((short2)(0), min(aj, (short2)(255))));
  vstore2(at, 0, z.ptr + j);

  uchar2 au = convert_uchar2(max((short2)(0), min(ak, (short2)(255))));
  uchar2 av = convert_uchar2(max((short2)(0), min(al, (short2)(255))));
  uchar2 aw = (uchar2)(((an0 + an1 + au0 + au1) / 4), ((ao0 + ao1 + av0 + av1) / 4));
  *aa.ptr = aw.x;
  *ab.ptr = aw.y;
}
__kernel void W(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r) {
  Image s = B(a, f, b, c, d, e);
  Image t = B(g, l, h, i, j, k);
  Image u = B(m, r, n, o, p, q);

  uchar4 v = vload4(0, s.ptr);
  uchar4 w = vload4(0, s.ptr + d);
  uchar4 x = vload4(0, t.ptr);
  char4 y = (char4)(x, x, x, x) - (char4)(128);
  char4 z = (char4)(x, x, x, x) - (char4)(128);

  float4 aa = (float4)(0.0000f) + (float4)(0.0000f) * convert_float4(y) + (float4)(1.5748f) * convert_float4(z);
  float4 ab = (float4)(0.0000f) - (float4)(0.1873f) * convert_float4(y) - (float4)(0.4681f) * convert_float4(z);
  float4 ac = (float4)(0.0000f) + (float4)(1.8556f) * convert_float4(y) + (float4)(0.0000f) * convert_float4(z);

  float4 ad = convert_float4(v) + aa;
  float4 ae = convert_float4(v) + ab;
  float4 af = convert_float4(v) + ac;

  uchar4 ag = convert_uchar4_rtz(ad);
  uchar4 ah = convert_uchar4_rtz(ae);
  uchar4 ai = convert_uchar4_rtz(af);

  uchar8 aj = (uchar8)(ags0, ahs0, ais0, 255, ags1, ahs1, ais1, 255);
  uchar8 ak = (uchar8)(ags2, ahs2, ais2, 255, ags3, ahs3, ais3, 255);
  vstore8(aj, 0, u.ptr);
  vstore8(ak, 0, u.ptr + 8);

  ad = convert_float4(w) + aa;
  ae = convert_float4(w) + ab;
  af = convert_float4(w) + ac;

  ag = convert_uchar4_rtz(ad);
  ah = convert_uchar4_rtz(ae);
  ai = convert_uchar4_rtz(af);

  aj = (uchar8)(ags0, ahs0, ais0, 255, ags1, ahs1, ais1, 255);
  ak = (uchar8)(ags2, ahs2, ais2, 255, ags3, ahs3, ais3, 255);
  vstore8(aj, 0, u.ptr + p);
  vstore8(ak, 0, u.ptr + p + 8);
}
__kernel void X(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r, __global uchar* s, uint t, uint u, uint v, uint w, uint x, __global uchar* y, uint z, uint aa, uint ab, uint ac, uint ad) {
  Image ae = B(a, f, b, c, d, e);
  Image af = B(g, l, h, i, j, k);
  Image ag = B(m, r, n, o, p, q);
  Image ah = B(s, x, t, u, v, w);
  Image ai = B(y, ad, z, aa, ab, ac);

  uchar16 aj = vload16(0, ae.ptr);
  uchar16 ak = vload16(0, ae.ptr + d);
  uchar16 al = vload16(0, af.ptr);
  uchar8 am = (uchar8)(al0, al2, al4, al6, al8, ala, alc, ale);
  uchar8 an = (uchar8)(al1, al3, al5, al7, al9, alb, ald, alf);

  vstore16(aj, 0, ag.ptr);
  vstore16(ak, 0, ag.ptr + p);
  vstore8(am, 0, ah.ptr);
  vstore8(an, 0, ai.ptr);
}
__kernel void Y(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r, __global uchar* s, uint t, uint u, uint v, uint w, uint x, __global uchar* y, uint z, uint aa, uint ab, uint ac, uint ad) {
  Image ae = B(a, f, b, c, d, e);
  Image af = B(g, l, h, i, j, k);
  Image ag = B(m, r, n, o, p, q);
  Image ah = B(s, x, t, u, v, w);
  Image ai = B(y, ad, z, aa, ab, ac);

  uchar16 aj = vload16(0, ae.ptr);
  uchar16 ak = vload16(0, ae.ptr + d);
  uchar16 al = vload16(0, af.ptr);
  uchar16 am = (uchar16)(al0, al0, al2, al2, al4, al4, al6, al6, al8, al8, ala, ala, alc, alc, ale, ale);
  uchar16 an = (uchar16)(al1, al1, al3, al3, al5, al5, al7, al7, al9, al9, alb, alb, ald, ald, alf, alf);

  vstore16(aj, 0, ag.ptr);
  vstore16(ak, 0, ag.ptr + p);
  vstore16(am, 0, ah.ptr);
  vstore16(am, 0, ah.ptr + v);
  vstore16(an, 0, ai.ptr);
  vstore16(an, 0, ai.ptr + ab);
}
__kernel void Z(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r) {
  Image s = B(a, f, b, c, d, e);
  Image t = B(g, l, h, i, j, k);
  Image u = B(m, r, n, o, p, q);

  uchar4 v = vload4(0, s.ptr);
  uchar4 w = vload4(0, s.ptr + d);
  uchar4 x = vload4(0, t.ptr);
  char4 y = (char4)(x, x, x, x) - (char4)(128);
  char4 z = (char4)(x, x, x, x) - (char4)(128);

  float4 aa = (float4)(0.0000f) + (float4)(0.0000f) * convert_float4(z) + (float4)(1.5748f) * convert_float4(y);
  float4 ab = (float4)(0.0000f) - (float4)(0.1873f) * convert_float4(z) - (float4)(0.4681f) * convert_float4(y);
  float4 ac = (float4)(0.0000f) + (float4)(1.8556f) * convert_float4(z) + (float4)(0.0000f) * convert_float4(y);

  float4 ad = convert_float4(v) + aa;
  float4 ae = convert_float4(v) + ab;
  float4 af = convert_float4(v) + ac;

  uchar4 ag = convert_uchar4_rtz(ad);
  uchar4 ah = convert_uchar4_rtz(ae);
  uchar4 ai = convert_uchar4_rtz(af);

  uchar8 aj = (uchar8)(ags0, ahs0, ais0, ags1, ahs1, ais1, ags2, ahs2);
  uchar4 ak = (uchar4)(ais2, ags3, ahs3, ais3);
  vstore8(aj, 0, u.ptr);
  vstore4(ak, 0, u.ptr + 8);

  ad = convert_float4(w) + aa;
  ae = convert_float4(w) + ab;
  af = convert_float4(w) + ac;

  ag = convert_uchar4_rtz(ad);
  ah = convert_uchar4_rtz(ae);
  ai = convert_uchar4_rtz(af);

  aj = (uchar8)(ags0, ahs0, ais0, ags1, ahs1, ais1, ags2, ahs2);
  ak = (uchar4)(ais2, ags3, ahs3, ais3);
  vstore8(aj, 0, u.ptr + p);
  vstore4(ak, 0, u.ptr + p + 8);
}
__kernel void AA(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r) {
  Image s = B(a, f, b, c, d, e);
  Image t = B(g, l, h, i, j, k);
  Image u = B(m, r, n, o, p, q);

  uchar4 v = vload4(0, s.ptr);
  uchar4 w = vload4(0, s.ptr + d);
  uchar4 x = vload4(0, t.ptr);
  char4 y = (char4)(x, x, x, x) - (char4)(128);
  char4 z = (char4)(x, x, x, x) - (char4)(128);

  float4 aa = (float4)(0.0000f) + (float4)(0.0000f) * convert_float4(z) + (float4)(1.5748f) * convert_float4(y);
  float4 ab = (float4)(0.0000f) - (float4)(0.1873f) * convert_float4(z) - (float4)(0.4681f) * convert_float4(y);
  float4 ac = (float4)(0.0000f) + (float4)(1.8556f) * convert_float4(z) + (float4)(0.0000f) * convert_float4(y);

  float4 ad = convert_float4(v) + aa;
  float4 ae = convert_float4(v) + ab;
  float4 af = convert_float4(v) + ac;

  uchar4 ag = convert_uchar4_rtz(ad);
  uchar4 ah = convert_uchar4_rtz(ae);
  uchar4 ai = convert_uchar4_rtz(af);

  uchar8 aj = (uchar8)(ags0, ahs0, ais0, 255, ags1, ahs1, ais1, 255);
  uchar8 ak = (uchar8)(ags2, ahs2, ais2, 255, ags3, ahs3, ais3, 255);
  vstore8(aj, 0, u.ptr);
  vstore8(ak, 0, u.ptr + 8);

  ad = convert_float4(w) + aa;
  ae = convert_float4(w) + ab;
  af = convert_float4(w) + ac;

  ag = convert_uchar4_rtz(ad);
  ah = convert_uchar4_rtz(ae);
  ai = convert_uchar4_rtz(af);

  aj = (uchar8)(ags0, ahs0, ais0, 255, ags1, ahs1, ais1, 255);
  ak = (uchar8)(ags2, ahs2, ais2, 255, ags3, ahs3, ais3, 255);
  vstore8(aj, 0, u.ptr + p);
  vstore8(ak, 0, u.ptr + p + 8);
}
__kernel void AB(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r, __global uchar* s, uint t, uint u, uint v, uint w, uint x, __global uchar* y, uint z, uint aa, uint ab, uint ac, uint ad) {
  Image ae = B(a, f, b, c, d, e);
  Image af = B(g, l, h, i, j, k);
  Image ag = B(m, r, n, o, p, q);
  Image ah = B(s, x, t, u, v, w);
  Image ai = B(y, ad, z, aa, ab, ac);

  uchar16 aj = vload16(0, ae.ptr);
  uchar16 ak = vload16(0, ae.ptr + d);
  uchar16 al = vload16(0, af.ptr);
  uchar16 am = (uchar16)(al0, al0, al2, al2, al4, al4, al6, al6, al8, al8, ala, ala, alc, alc, ale, ale);
  uchar16 an = (uchar16)(al1, al1, al3, al3, al5, al5, al7, al7, al9, al9, alb, alb, ald, ald, alf, alf);

  vstore16(aj, 0, ag.ptr);
  vstore16(ak, 0, ag.ptr + p);
  vstore16(an, 0, ah.ptr);
  vstore16(an, 0, ah.ptr + v);
  vstore16(am, 0, ai.ptr);
  vstore16(am, 0, ai.ptr + ab);
}
__kernel void AC(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r, __global uchar* s, uint t, uint u, uint v, uint w, uint x, __global uchar* y, uint z, uint aa, uint ab, uint ac, uint ad) {
  Image ae = B(a, f, b, c, d, e);
  Image af = B(g, l, h, i, j, k);
  Image ag = B(m, r, n, o, p, q);
  Image ah = B(s, x, t, u, v, w);
  Image ai = B(y, ad, z, aa, ab, ac);

  uchar16 aj = vload16(0, ae.ptr);
  uchar16 ak = vload16(0, ae.ptr + d);
  uchar16 al = vload16(0, af.ptr);
  uchar8 am = (uchar8)(al0, al2, al4, al6, al8, ala, alc, ale);
  uchar8 an = (uchar8)(al1, al3, al5, al7, al9, alb, ald, alf);

  vstore16(aj, 0, ag.ptr);
  vstore16(ak, 0, ag.ptr + p);
  vstore8(an, 0, ah.ptr);
  vstore8(am, 0, ai.ptr);
}
__kernel void AD(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r, __global uchar* s, uint t, uint u, uint v, uint w, uint x) {
  Image y = B(a, f, b, c, d, e);
  Image z = B(g, l, h, i, j, k);
  Image aa = B(m, r, n, o, p, q);
  Image ab = B(s, x, t, u, v, w);

  uchar16 ac = vload16(0, y.ptr);
  uchar8 ad = (uchar8)(ac1, ac3, ac5, ac7, ac9, acb, acd, acf);
  ushort4 ae = (ushort4)(ac0, ac4, ac8, acc);
  ushort4 af = (ushort4)(ac2, ac6, aca, ace);
  vstore8(ad, 0, z.ptr);

  ac = vload16(0, y.ptr + d);
  ad = (uchar8)(ac1, ac3, ac5, ac7, ac9, acb, acd, acf);
  ushort4 ag = (ushort4)(ac0, ac4, ac8, acc);
  ushort4 ah = (ushort4)(ac2, ac6, aca, ace);
  vstore8(ad, 0, z.ptr + j);

  uchar4 ai = convert_uchar4((ae + ag) / (ushort4)(2));
  uchar4 aj = convert_uchar4((af + ah) / (ushort4)(2));
  vstore4(ai, 0, aa.ptr);
  vstore4(aj, 0, ab.ptr);
}
__kernel void AE(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r, __global uchar* s, uint t, uint u, uint v, uint w, uint x) {
  Image y = B(a, f, b, c, d, e);
  Image z = B(g, l, h, i, j, k);
  Image aa = B(m, r, n, o, p, q);
  Image ab = B(s, x, t, u, v, w);

  uchar16 ac = vload16(0, y.ptr);
  uchar8 ad = (uchar8)(ac0, ac2, ac4, ac6, ac8, aca, acc, ace);
  ushort4 ae = (ushort4)(ac1, ac5, ac9, acd);
  ushort4 af = (ushort4)(ac3, ac7, acb, acf);
  vstore8(ad, 0, z.ptr);

  ac = vload16(0, y.ptr + d);
  ad = (uchar8)(ac0, ac2, ac4, ac6, ac8, aca, acc, ace);
  ushort4 ag = (ushort4)(ac1, ac5, ac9, acd);
  ushort4 ah = (ushort4)(ac3, ac7, acb, acf);
  vstore8(ad, 0, z.ptr + j);

  uchar4 ai = convert_uchar4((ae + ag) / (ushort4)(2));
  uchar4 aj = convert_uchar4((af + ah) / (ushort4)(2));
  vstore4(ai, 0, aa.ptr);
  vstore4(aj, 0, ab.ptr);
}
__kernel void AF(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r, __global uchar* s, uint t, uint u, uint v, uint w, uint x) {
  Image y = B(a, f, b, c, d, e);
  Image z = B(g, l, h, i, j, k);
  Image aa = B(m, r, n, o, p, q);
  Image ab = B(s, x, t, u, v, w);

  uchar4 ac = vload4(0, y.ptr);
  uchar4 ad = vload4(0, y.ptr + d);
  uchar4 ae = (uchar4)(vload2(0, zr), vload2(0, aatr));
  char4 af = (char4)(ae0, ae0, ae1, ae1) - (char4)(128);
  char4 ag = (char4)(ae2, ae2, ae3, ae3) - (char4)(128);

  float4 ah = (float4)(0.0000f) + (float4)(0.0000f) * convert_float4(af) + (float4)(1.5748f) * convert_float4(ag);
  float4 ai = (float4)(0.0000f) - (float4)(0.1873f) * convert_float4(af) - (float4)(0.4681f) * convert_float4(ag);
  float4 aj = (float4)(0.0000f) + (float4)(1.8556f) * convert_float4(af) + (float4)(0.0000f) * convert_float4(ag);

  float4 ak = convert_float4(ac) + ah;
  float4 al = convert_float4(ac) + ai;
  float4 am = convert_float4(ac) + aj;

  uchar4 an = convert_uchar4_rtz(ak);
  uchar4 ao = convert_uchar4_rtz(al);
  uchar4 ap = convert_uchar4_rtz(am);

  uchar8 aq = (uchar8)(ans0, aos0, aps0, ans1, aos1, aps1, ans2, aos2);
  uchar4 ar = (uchar4)(aps2, ans3, aos3, aps3);
  vstore8(aq, 0, ab.ptr);
  vstore4(ar, 0, ab.ptr + 8);

  ak = convert_float4(ad) + ah;
  al = convert_float4(ad) + ai;
  am = convert_float4(ad) + aj;

  an = convert_uchar4_rtz(ak);
  ao = convert_uchar4_rtz(al);
  ap = convert_uchar4_rtz(am);

  aq = (uchar8)(ans0, aos0, aps0, ans1, aos1, aps1, ans2, aos2);
  ar = (uchar4)(aps2, ans3, aos3, aps3);
  vstore8(aq, 0, ab.ptr + v);
  vstore4(ar, 0, ab.ptr + v + 8);
}
__kernel void AG(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r, __global uchar* s, uint t, uint u, uint v, uint w, uint x) {
  Image y = B(a, f, b, c, d, e);
  Image z = B(g, l, h, i, j, k);
  Image aa = B(m, r, n, o, p, q);
  Image ab = B(s, x, t, u, v, w);

  uchar4 ac = vload4(0, y.ptr);
  uchar4 ad = vload4(0, y.ptr + d);
  uchar4 ae = (uchar4)(vload2(0, zr), vload2(0, aatr));
  char4 af = (char4)(ae0, ae0, ae1, ae1) - (char4)(128);
  char4 ag = (char4)(ae2, ae2, ae3, ae3) - (char4)(128);

  float4 ah = (float4)(0.0000f) + (float4)(0.0000f) * convert_float4(af) + (float4)(1.5748f) * convert_float4(ag);
  float4 ai = (float4)(0.0000f) - (float4)(0.1873f) * convert_float4(af) - (float4)(0.4681f) * convert_float4(ag);
  float4 aj = (float4)(0.0000f) + (float4)(1.8556f) * convert_float4(af) + (float4)(0.0000f) * convert_float4(ag);

  float4 ak = convert_float4(ac) + ah;
  float4 al = convert_float4(ac) + ai;
  float4 am = convert_float4(ac) + aj;

  uchar4 an = convert_uchar4_rtz(ak);
  uchar4 ao = convert_uchar4_rtz(al);
  uchar4 ap = convert_uchar4_rtz(am);

  uchar8 aq = (uchar8)(ans0, aos0, aps0, 255, ans1, aos1, aps1, 255);
  uchar8 ar = (uchar8)(ans2, aos2, aps2, 255, ans3, aos3, aps3, 255);
  vstore8(aq, 0, ab.ptr);
  vstore8(ar, 0, ab.ptr + 8);

  ak = convert_float4(ad) + ah;
  al = convert_float4(ad) + ai;
  am = convert_float4(ad) + aj;

  an = convert_uchar4_rtz(ak);
  ao = convert_uchar4_rtz(al);
  ap = convert_uchar4_rtz(am);

  aq = (uchar8)(ans0, aos0, aps0, 255, ans1, aos1, aps1, 255);
  ar = (uchar8)(ans2, aos2, aps2, 255, ans3, aos3, aps3, 255);
  vstore8(aq, 0, ab.ptr + v);
  vstore8(ar, 0, ab.ptr + v + 8);
}
__kernel void AH(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r, __global uchar* s, uint t, uint u, uint v, uint w, uint x, __global uchar* y, uint z, uint aa, uint ab, uint ac, uint ad, __global uchar* ae, uint af, uint ag, uint ah, uint ai, uint aj) {
  Image ak = B(a, f, b, c, d, e);
  Image al = B(g, l, h, i, j, k);
  Image am = B(m, r, n, o, p, q);
  Image an = B(s, x, t, u, v, w);
  Image ao = B(y, ad, z, aa, ab, ac);
  Image ap = B(ae, aj, af, ag, ah, ai);

  uchar16 aq = vload16(0, ak.ptr);
  uchar16 ar = vload16(0, ak.ptr + d);
  uchar8 as = vload8(0, al.ptr);
  uchar8 at = vload8(0, am.ptr);
    uchar16 au = (uchar16)(as as as as as as as as
                               as as as as as as as as;
    uchar16 av = (uchar16)(at at at at at at at at
                           at at at at at at at at;

    vstore16(aq, 0, an.ptr);
    vstore16(ar, 0, an.ptr + v);
    vstore16(au, 0, ao.ptr);
    vstore16(au, 0, ao.ptr + ab);
    vstore16(av, 0, ap.ptr);
    vstore16(av, 0, ap.ptr + ah);
}
__kernel void AI(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r, __global uchar* s, uint t, uint u, uint v, uint w, uint x, __global uchar* y, uint z, uint aa, uint ab, uint ac, uint ad) {
  Image ae = B(a, f, b, c, d, e);
  Image af = B(g, l, h, i, j, k);
  Image ag = B(m, r, n, o, p, q);
  Image ah = B(s, x, t, u, v, w);
  Image ai = B(y, ad, z, aa, ab, ac);

  uchar16 aj = vload16(0, ae.ptr);
  uchar16 ak = vload16(0, ae.ptr + d);
  uchar8 al = vload8(0, af.ptr);
  uchar8 am = vload8(0, ag.ptr);
  uchar16 an = (uchar16)(al.s0, am.s0, al.s1, am.s1, al.s2, am.s2, al.s3, am.s3, al.s4, am.s4, al.s5, am.s5, al.s6, am.s6, al.s7, am.s7);

  vstore16(aj, 0, ah.ptr);
  vstore16(ak, 0, ah.ptr + v);
  vstore16(an, 0, ai.ptr);
}
__kernel void AJ(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r) {
  Image s = B(a, f, b, c, d, e);
  Image t = B(g, l, h, i, j, k);
  Image u = B(m, r, n, o, p, q);

  uchar16 v = vload16(0, s.ptr);
  ushort8 w = (ushort8)(v, v, v, v, v, v, v, v);
  uchar8 x = (uchar8)(v, v, v, v, v, v, v, v);
  vstore8(x, 0, t.ptr);

  v = vload16(0, s.ptr + d);
  ushort8 y = (ushort8)(v, v, v, v, v, v, v, v);
  x = (uchar8)(v, v, v, v, v, v, v, v);
  vstore8(x, 0, t.ptr + j);

  uchar8 z = convert_uchar8((w + y) / (ushort8)(2));
  vstore8(z, 0, u.ptr);
}
__kernel void AK(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r) {
  Image s = B(a, f, b, c, d, e);
  Image t = B(g, l, h, i, j, k);
  Image u = B(m, r, n, o, p, q);

  const uchar16 v = vload16(0, s.ptr);
  vstore8(v.s13579bdf, 0, t.ptr);

  const uchar16 w = vload16(0, s.ptr + d);
  vstore8(w.s13579bdf, 0, t.ptr + j);

    const ushort8 x = (ushort8)(vvvvvvvv
    const ushort8 y = (ushort8)(wwwwwwww
    const uchar8 z = convert_uchar8((x + y) / (ushort8)(2));
    vstore8(z, 0, u.ptr);
}