typedef enum { are16x16 = 0, are8x8 = 1, are4x4 = 2 } partition_mode;

typedef enum { LAST = 0, GOLDEN = 1, ALTREF = 2 } ref_frame;

typedef enum { intra_segment = 0, UQ_segment = 0, HQ_segment = 1, AQ_segment = 2, LQ_segment = 3 } segment_ids;

typedef struct {
  int y_ac_i;
  int y_dc_idelta;
  int y2_dc_idelta;
  int y2_ac_idelta;
  int uv_dc_idelta;
  int uv_ac_idelta;
  int loop_filter_level;
  int mbedge_limit;
  int sub_bedge_limit;
  int interior_limit;
  int hev_threshold;
} segment_data;

typedef struct {
  short coeffs[25][16];
  int vector_x[4];
  int vector_y[4];
  float SSIM;
  int non_zero_coeffs;
  int parts;
  int reference_frame;
  segment_ids segment_id;
} macroblock;

typedef struct {
  int vector_x;
  int vector_y;
} vector_net;

__constant int Ga[128] = {
    4,  5,  6,  7,  8,  9,  10, 10, 11, 12, 13, 14, 15, 16, 17, 17, 18, 19, 20, 20, 21, 21, 22, 22, 23, 23, 24, 25, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34,  35,  36,  37,  37,  38,  39,  40,  41,  42,  43,  44,  45,  46,  46,  47,  48,  49,  50,  51,  52,  53,  54,  55,  56,  57,  58,
    59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 91, 93, 95, 96, 98, 100, 101, 102, 104, 106, 108, 110, 112, 114, 116, 118, 122, 124, 126, 128, 130, 132, 134, 136, 138, 140, 143, 145, 148, 151, 154, 157,
};

__constant int Gb[128] = {
    4,  5,  6,  7,  8,  9,  10, 11, 12, 13, 14, 15,  16,  17,  18,  19,  20,  21,  22,  23,  24,  25,  26,  27,  28,  29,  30,  31,  32,  33,  34,  35,  36,  37,  38,  39,  40,  41,  42,  43,  44,  45,  46,  47,  48,  49,  50,  51,  52,  53,  54,  55,  56,  57,  58,  60,  62,  64,  66,  68,  70,  72,  74,  76,
    78, 80, 82, 84, 86, 88, 90, 92, 94, 96, 98, 100, 102, 104, 106, 108, 110, 112, 114, 116, 119, 122, 125, 128, 131, 134, 137, 140, 143, 146, 149, 152, 155, 158, 161, 164, 167, 170, 173, 177, 181, 185, 189, 193, 197, 201, 205, 209, 213, 217, 221, 225, 229, 234, 239, 245, 249, 254, 259, 264, 269, 274, 279, 284,
};

__constant int Gc = 64;
__constant int Gd = 4;

void A(int4* const a, int4* const b, int4* const c, int4* const d) {
  int4 e = *a;
  int4 f = *b;
  int4 g = *c;
  int4 h = *d;

  *a = ((e + h) << 3);
  *b = ((f + g) << 3);
  *c = ((f - g) << 3);
  *d = ((e - h) << 3);

  e = *a + *b;
  g = *a - *b;

  f = (((*c * 2217) + (*d * 5352) + 14500) >> 12);

  h = (((*d * 2217) - (*c * 5352) + 7500) >> 12);

  *a = (int4)(ex, fx, gx, hx);
  *b = (int4)(ey, fy, gy, hy);
  *c = (int4)(ez, fz, gz, hz);
  *d = (int4)(ew, fw, gw, hw);

  e = *a + *d;
  f = *b + *c;
  g = *b - *c;
  h = *a - *d;

  *a = ((e + f + 7) >> 4);
  *c = ((e - f + 7) >> 4);

  *b = ((g * 2217) + (h * 5352) + 12000) >> 16;
  (*b).x += (h.x != 0);
  (*b).y += (h.y != 0);
  (*b).z += (h.z != 0);
  (*b).w += (h.w != 0);

  *d = (((h * 2217) - (g * 5352) + 51000) >> 16);

  *a = convert_int4(abs(*a));
  *b = convert_int4(abs(*b));
  *c = convert_int4(abs(*c));
  *d = convert_int4(abs(*d));

  (*a).x /= Gd;

  (*a).x += (*a).y + (*a).z + (*a).w + (*b).x + (*b).y + (*b).z + (*b).w + (*c).x + (*c).y + (*c).z + (*c).w + (*d).x + (*d).y + (*d).z + (*d).w;

  return;
}

inline void B(int4* const restrict a, int16* const restrict b) {
  *a = (*b).s0123;

  (*b).s0 = (((*b).s0 + (*b).sC) << 3);
  (*b).s1 = (((*b).s1 + (*b).sD) << 3);
  (*b).s2 = (((*b).s2 + (*b).sE) << 3);
  (*b).s3 = (((*b).s3 + (*b).sF) << 3);

  (*b).sC = (((*a).s0 - (*b).sC) << 3);
  (*b).sD = (((*a).s1 - (*b).sD) << 3);
  (*b).sE = (((*a).s2 - (*b).sE) << 3);
  (*b).sF = (((*a).s3 - (*b).sF) << 3);
  *a = (*b).s4567;

  (*b).s4 = (((*b).s4 + (*b).s8) << 3);
  (*b).s5 = (((*b).s5 + (*b).s9) << 3);
  (*b).s6 = (((*b).s6 + (*b).sA) << 3);
  (*b).s7 = (((*b).s7 + (*b).sB) << 3);

  (*b).s4 = (((*a).s0 - (*b).s8) << 3);
  (*b).s5 = (((*a).s1 - (*b).s9) << 3);
  (*b).s6 = (((*a).s2 - (*b).sA) << 3);
  (*b).s7 = (((*a).s3 - (*b).sB) << 3);

  *a = (*b).s89AB;

  (*b).s8 = (*b).s0 - (*b).s4;
  (*b).s9 = (*b).s1 - (*b).s5;
  (*b).sA = (*b).s2 - (*b).s6;
  (*b).sB = (*b).s3 - (*b).s7;

  (*b).s0 = (*b).s0 + (*b).s4;
  (*b).s1 = (*b).s1 + (*b).s5;
  (*b).s2 = (*b).s2 + (*b).s6;
  (*b).s3 = (*b).s3 + (*b).s7;

  (*b).s4 = ((((*a).s0 * 2217) + ((*b).sC * 5352) + 14500) >> 12);
  (*b).s5 = ((((*a).s1 * 2217) + ((*b).sD * 5352) + 14500) >> 12);
  (*b).s6 = ((((*a).s2 * 2217) + ((*b).sE * 5352) + 14500) >> 12);
  (*b).s7 = ((((*a).s3 * 2217) + ((*b).sF * 5352) + 14500) >> 12);

  (*b).sC = ((((*b).sC * 2217) - ((*a).s0 * 5352) + 7500) >> 12);
  (*b).sD = ((((*b).sD * 2217) - ((*a).s1 * 5352) + 7500) >> 12);
  (*b).sE = ((((*b).sE * 2217) - ((*a).s2 * 5352) + 7500) >> 12);
  (*b).sF = ((((*b).sF * 2217) - ((*a).s3 * 5352) + 7500) >> 12);

  (*a).x = (*b).s0;
  (*a).y = (*b).s4;
  (*a).z = (*b).s8;
  (*a).w = (*b).sC;

  (*b).s0 = (*b).s0 + (*b).s3;
  (*b).s4 = (*b).s4 + (*b).s7;
  (*b).s8 = (*b).s8 + (*b).sB;
  (*b).sC = (*b).sC + (*b).sF;

  (*b).s3 = (*a).x - (*b).s3;
  (*b).s7 = (*a).y - (*b).s7;
  (*b).sB = (*a).z - (*b).sB;
  (*b).sF = (*a).w - (*b).sF;
  (*a).x = (*b).s1;
  (*a).y = (*b).s5;
  (*a).z = (*b).s9;
  (*a).w = (*b).sD;

  (*b).s1 = (*b).s1 + (*b).s2;
  (*b).s5 = (*b).s5 + (*b).s6;
  (*b).s9 = (*b).s9 + (*b).sA;
  (*b).sD = (*b).sD + (*b).sE;

  (*b).s2 = (*a).x - (*b).s2;
  (*b).s6 = (*a).y - (*b).s6;
  (*b).sA = (*a).z - (*b).sA;
  (*b).sE = (*a).w - (*b).sE;

  (*a).x = (*b).s2;
  (*a).y = (*b).s6;
  (*a).z = (*b).sA;
  (*a).w = (*b).sE;

  (*b).s2 = (((*b).s0 - (*b).s1 + 7) >> 4);
  (*b).s6 = (((*b).s4 - (*b).s5 + 7) >> 4);
  (*b).sA = (((*b).s8 - (*b).s9 + 7) >> 4);
  (*b).sE = (((*b).sC - (*b).sD + 7) >> 4);

  (*b).s0 = (((*b).s0 + (*b).s1 + 7) >> 4);
  (*b).s4 = (((*b).s4 + (*b).s5 + 7) >> 4);
  (*b).s8 = (((*b).s8 + (*b).s9 + 7) >> 4);
  (*b).sC = (((*b).sC + (*b).sD + 7) >> 4);

  (*b).s1 = ((((*a).x * 2217) + ((*b).s3 * 5352) + 12000) >> 16) + ((*b).s3 != 0);
  (*b).s5 = ((((*a).y * 2217) + ((*b).s7 * 5352) + 12000) >> 16) + ((*b).s7 != 0);
  (*b).s9 = ((((*a).z * 2217) + ((*b).sB * 5352) + 12000) >> 16) + ((*b).sB != 0);
  (*b).sD = ((((*a).w * 2217) + ((*b).sF * 5352) + 12000) >> 16) + ((*b).sF != 0);

  (*b).s3 = ((((*b).s3 * 2217) - ((*a).x * 5352) + 51000) >> 16);
  (*b).s7 = ((((*b).s7 * 2217) - ((*a).y * 5352) + 51000) >> 16);
  (*b).sB = ((((*b).sB * 2217) - ((*a).z * 5352) + 51000) >> 16);
  (*b).sF = ((((*b).sF * 2217) - ((*a).w * 5352) + 51000) >> 16);

  *b = convert_int16(abs(*b));
  (*b).s0 /= Gd;
  (*a).x = (*b).s0 + (*b).s1 + (*b).s2 + (*b).s3 + (*b).s4 + (*b).s5 + (*b).s6 + (*b).s7 + (*b).s8 + (*b).s9 + (*b).sA + (*b).sB + (*b).sC + (*b).sD + (*b).sE + (*b).sF;

  return;
}

void C(int4* const a, int4* const b, int4* const c, int4* const d, const int e, const int f) {
  __private int4 g, h, i, j;
 g = (int4)((*a*b*c*d h = (int4)((*a*b*c*d i = (int4)((*a*b*c*d j = (int4)((*a*b*c*d
 *a = ((g + j) << 3);
 *b = ((h + i) << 3);
 *c = ((h - i) << 3);
 *d = ((g - j) << 3);


 g = *a + *b;
 i = *a - *b;

 h = (((*c * 2217) + (*d * 5352) + 14500) >> 12);

 j = (((*d * 2217) - (*c * 5352) + 7500) >> 12);


 *a = (int4)(ghij
 *b = (int4)(ghij
 *c = (int4)(ghij
 *d = (int4)(ghij

 g = *a + *d;
 h = *b + *c;
 i = *b - *c;
 j = *a - *d;


 *a = ((g + h + 7) >> 4);
 *c = ((g - h + 7) >> 4);

 *b = ((i * 2217) + (j * 5352) + 12000) >> 16;
 (*b).x += (j.x != 0);
 (*b).y += (j.y != 0);
 (*b).z += (j.z != 0);
 (*b).w += (j.w != 0);

 *d = (((j * 2217) - (i * 5352) + 51000) >>16 );


 *a /= (int4)(f *b /= f;
 *c /= f;
 *d /= f;

 return;
}

void D(int4* const a, int4* const b, int4* const c, int4* const d, const int e, const int f) {
  __private int4 g, h, i, j;

 g = (*a)*((int4)(f
 h = (*b)*f;
 i = (*c)*f;
 j = (*d)*f;

 *a = g + i;
 *b = g - i;

 *c = ((h * 35468) >> 16) - (j + ((j * 20091)>>16));



 *d = (h + ((h * 20091)>>16)) + ((j * 35468) >> 16);




 g = *a + *d;
 j = *a - *d;
 h = *b + *c;
 i = *b - *c;


 *a = (int4)(ghij
 *b = (int4)(ghij
 *c = (int4)(ghij
 *d = (int4)(ghij


 g = *a + *c;
 h = *a - *c;

 i = ((*b * 35468) >> 16) - (*d + ((*d * 20091)>>16));



 j = (*b + ((*b * 20091)>>16)) + ((*d * 35468) >> 16);



 *a = ((g + j + 4) >> 3);

 *b = ((h + i + 4) >> 3);

 *c = ((h - i + 4) >> 3);

 *d = ((g - j + 4) >> 3);


 g = *a;
 h = *b;
 i = *c;
 j = *d;
 *a = (int4)(ghij
 *b = (int4)(ghij
 *c = (int4)(ghij
 *d = (int4)(ghij

 return;
}

void E(int4* const a, int4* const b, int4* const c, int4* const d, const int e, const int f) {
  int4 g, h, i, j;

  g = *a + *d;
  h = *b + *c;
  i = *b - *c;
  j = *a - *d;

  *a = g + h;
  *b = i + j;
  *c = g - h;
  *d = j - i;

  g.x = (*a).x + (*a).w;
  h.x = (*b).x + (*b).w;
  i.x = (*c).x + (*c).w;
  j.x = (*d).x + (*d).w;

  g.y = (*a).y + (*a).z;
  h.y = (*b).y + (*b).z;
  i.y = (*c).y + (*c).z;
  j.y = (*d).y + (*d).z;

  g.z = (*a).y - (*a).z;
  h.z = (*b).y - (*b).z;
  i.z = (*c).y - (*c).z;
  j.z = (*d).y - (*d).z;

  g.w = (*a).x - (*a).w;
  h.w = (*b).x - (*b).w;
  i.w = (*c).x - (*c).w;
  j.w = (*d).x - (*d).w;

  (*a).x = g.x + g.y;
  (*b).x = h.x + h.y;
  (*c).x = i.x + i.y;
  (*d).x = j.x + j.y;

  (*a).y = g.z + g.w;
  (*b).y = h.z + h.w;
  (*c).y = i.z + i.w;
  (*d).y = j.z + j.w;

  (*a).z = g.x - g.y;
  (*b).z = h.x - h.y;
  (*c).z = i.x - i.y;
  (*d).z = j.x - j.y;

  (*a).w = g.w - g.z;
  (*b).w = h.w - h.z;
  (*c).w = i.w - i.z;
  (*d).w = j.w - j.z;

  (*a).x += ((*a).x > 0);
  (*b).x += ((*b).x > 0);
  (*c).x += ((*c).x > 0);
  (*d).x += ((*d).x > 0);
  (*a).y += ((*a).y > 0);
  (*b).y += ((*b).y > 0);
  (*c).y += ((*c).y > 0);
  (*d).y += ((*d).y > 0);
  (*a).z += ((*a).z > 0);
  (*b).z += ((*b).z > 0);
  (*c).z += ((*c).z > 0);
  (*d).z += ((*d).z > 0);
  (*a).w += ((*a).w > 0);
  (*b).w += ((*b).w > 0);
  (*c).w += ((*c).w > 0);
  (*d).w += ((*d).w > 0);

  *a >>= 1;
  *b >>= 1;
  *c >>= 1;
  *d >>= 1;

 *a /= (int4)(f *b /= f;
 *c /= f;
 *d /= f;

 return;
}

void F(int4* const a, int4* const b, int4* const c, int4* const d, const int e, const int f) {
  int4 g, h, i, j;
 *a *= (int4)(f *b *= f;
 *c *= f;
 *d *= f;

 g.x = (*a).x + (*a).w;
 h.x = (*b).x + (*b).w;
 i.x = (*c).x + (*c).w;
 j.x = (*d).x + (*d).w;

    g.y = (*a).y + (*a).z;
 h.y = (*b).y + (*b).z;
 i.y = (*c).y + (*c).z;
 j.y = (*d).y + (*d).z;

    g.z = (*a).y - (*a).z;
 h.z = (*b).y - (*b).z;
 i.z = (*c).y - (*c).z;
 j.z = (*d).y - (*d).z;

 g.w = (*a).x - (*a).w;
 h.w = (*b).x - (*b).w;
 i.w = (*c).x - (*c).w;
 j.w = (*d).x - (*d).w;

 (*a).x = g.x + g.y;
 (*b).x = h.x + h.y;
 (*c).x = i.x + i.y;
 (*d).x = j.x + j.y;

 (*a).y = g.z + g.w;
 (*b).y = h.z + h.w;
 (*c).y = i.z + i.w;
 (*d).y = j.z + j.w;

 (*a).z = g.x - g.y;
 (*b).z = h.x - h.y;
 (*c).z = i.x - i.y;
 (*d).z = j.x - j.y;

 (*a).w = g.w - g.z;
 (*b).w = h.w - h.z;
 (*c).w = i.w - i.z;
 (*d).w = j.w - j.z;

    g = *a + *d;
    h = *b + *c;
    i = *b - *c;
    j = *a - *d;

    *a = g + h; *b = i + j;
 *c = g - h; *d = j - i;

    *a += 3; *b += 3; *c += 3; *d += 3;
 *a >>= 3; *b >>= 3; *c >>= 3; *d >>= 3;

 return;
}

__kernel void G(__global vector_net* const a, __global vector_net* const b, __global vector_net* const c, __global vector_net* const d, __global vector_net* const e, __global vector_net* const f, __global int* const g, __global int* const h, __global int* const i) {
  int j = get_global_id(0);
  a[j].vector_x = 0;
  a[j].vector_y = 0;
  b[j].vector_x = 0;
  b[j].vector_y = 0;
  c[j].vector_x = 0;
  c[j].vector_y = 0;
  d[j].vector_x = 0;
  d[j].vector_y = 0;
  e[j].vector_x = 0;
  e[j].vector_y = 0;
  f[j].vector_x = 0;
  f[j].vector_y = 0;
  g[j] = 0x7fffffff;
  h[j] = 0x7fffffff;
  i[j] = 0x7fffffff;

  return;
}

__kernel void H(__global uchar* const a, __global uchar* const b, const signed int c, const signed int d) {
  int e = get_global_id(0);
  int f = (e % (c / 2)) * 2;
  int g = (e / (c / 2)) * 2;
  int h = g * c + f;
  int2 i;

  i = convert_int2(vload2(0, a + h));
  h += c;
  i += convert_int2(vload2(0, a + h));
  i.x += i.y + 2;
  i.x /= 4;

  f /= 2;
  g /= 2;
  h = g * (c / 2) + f;

  b[h] = i.x;
  return;
}

__kernel void I(__global uchar* const a, __global uchar* const b, __global vector_net* const c, __global vector_net* const d, const signed int e, const signed int f, const signed int g, const signed int h) {
  __private uchar8 i, j, k, l, m, n, o, p;
  __private uchar8 q, r, s, t, u, v, w, x;

  __private int4 y, z, aa, ab;

  __private int ac, ad, ae, af;
  __private unsigned int ag, ah;
  __private int ai, aj, ak, al;
  __private int am, an, ao, ap;
  __private int aq, ar;
  __private int as;
  __private int at;

  at = (f / 8) * 8;

  as = get_global_id(0);

  ak = (as % (at / 8)) * 8;
  al = (as / (at / 8)) * 8;

  am = 0;
  an = 0;

  ai = ak / 2;
  aj = al / 2;
  as = (aj / 8) * e + (ai / 8);

  am = c[as].vector_x;
  an = c[as].vector_y;
  am /= h;
  an /= h;
  am = ((h > 8) ? (0) : (am));
  an = ((h > 8) ? (0) : (an));
  ao = am;
  ap = an;

  as = (al / 8) * e + (ak / 8);

  aq = al * f + ak;
  i = vload8(0, a + aq);
  aq += f;
  j = vload8(0, a + aq);
  aq += f;
  k = vload8(0, a + aq);
  aq += f;
  l = vload8(0, a + aq);
  aq += f;
  m = vload8(0, a + aq);
  aq += f;
  n = vload8(0, a + aq);
  aq += f;
  o = vload8(0, a + aq);
  aq += f;
  p = vload8(0, a + aq);
  aq += f;

  ag = 0xffff;

  ac = ak + am - 2;
  ad = ak + am + 2;
  ae = al + an - 2;
  af = al + an + 2;

  ac = (ac < 0) ? 0 : ac;
  ad = (ad > (f - 8)) ? (f - 8) : ad;
  ae = (ae < 0) ? 0 : ae;
  af = (af > (g - 8)) ? (g - 8) : af;

  for (ai = ac; ai <= ad; ++ai) {
    for (aj = ae; aj <= af; ++aj) {
      ar = aj * f + ai;
      q = vload8(0, b + ar);
      ar += f;
      r = vload8(0, b + ar);
      ar += f;
      s = vload8(0, b + ar);
      ar += f;
      t = vload8(0, b + ar);
      ar += f;
      u = vload8(0, b + ar);
      ar += f;
      v = vload8(0, b + ar);
      ar += f;
      w = vload8(0, b + ar);
      ar += f;
      x = vload8(0, b + ar);

      y = convert_int4(i.s0123) - convert_int4(q.s0123);
      z = convert_int4(j.s0123) - convert_int4(r.s0123);
      aa = convert_int4(k.s0123) - convert_int4(s.s0123);
      ab = convert_int4(l.s0123) - convert_int4(t.s0123);

      A(&y, &z, &aa, &ab);
      ah = y.x;

      y = convert_int4(m.s0123) - convert_int4(u.s0123);
      z = convert_int4(n.s0123) - convert_int4(v.s0123);
      aa = convert_int4(o.s0123) - convert_int4(w.s0123);
      ab = convert_int4(p.s0123) - convert_int4(x.s0123);

      A(&y, &z, &aa, &ab);
      ah += y.x;

      y = convert_int4(i.s4567) - convert_int4(q.s4567);
      z = convert_int4(j.s4567) - convert_int4(r.s4567);
      aa = convert_int4(k.s4567) - convert_int4(s.s4567);
      ab = convert_int4(l.s4567) - convert_int4(t.s4567);

      A(&y, &z, &aa, &ab);
      ah += y.x;

      y = convert_int4(m.s4567) - convert_int4(u.s4567);
      z = convert_int4(n.s4567) - convert_int4(v.s4567);
      aa = convert_int4(o.s4567) - convert_int4(w.s4567);
      ab = convert_int4(p.s4567) - convert_int4(x.s4567);

      A(&y, &z, &aa, &ab);
      ah += y.x;

      ah += (int)(abs((int)abs(ai - ak) - ao) + abs((int)abs(aj - al) - ap)) * (h < 4) * Gc / 2;

      am = (ah < ag) ? ai : am;
      an = (ah < ag) ? aj : an;
      ag = (ah < ag) ? ah : ag;
    }
  }

  d[as].vector_x = (am - ak) * h;
  d[as].vector_y = (an - al) * h;

  return;
}

__constant sampler_t Ge = 0x0000 | 0x0002 | 0x0000;
__constant int Gf[8][6] = {{0, 0, 128, 0, 0, 0}, {0, -6, 123, 12, -1, 0}, {2, -11, 108, 36, -8, 1}, {0, -9, 93, 50, -6, 0}, {3, -16, 77, 77, -16, 3}, {0, -6, 50, 93, -9, 0}, {1, -8, 36, 108, -11, 2}, {0, -1, 12, 123, -6, 0}};

inline void J(__read_only image2d_t a, const int2 b, const int2 c, int4* const d, int4* const e, int4* const f, int4* const g) {
  __private int2 h;
  __private uint4 i;
  __private int4 j;
  __private uchar4 k;
  __private uchar2 l;
  __private uchar4 m, n, o, p, q, r;

  h.x = b.x - 2;
  h.y = b.y - 2;
  i = read_imageui(a, Ge, h);
  k.s0 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s1 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s2 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s3 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  l.s0 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  j.s0 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  j.s1 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  j.s2 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  j.s3 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  q = convert_uchar4_sat(j);

  h.x = b.x - 2;
  h.y = b.y - 1;
  i = read_imageui(a, Ge, h);
  k.s0 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s1 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s2 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s3 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  l.s0 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  j.s0 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  j.s1 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  j.s2 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  j.s3 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  r = convert_uchar4_sat(j);

  h.x = b.x - 2;
  h.y = b.y;
  i = read_imageui(a, Ge, h);
  k.s0 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s1 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s2 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s3 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  l.s0 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  j.s0 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  j.s1 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  j.s2 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  j.s3 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  m = convert_uchar4_sat(j);

  h.x = b.x - 2;
  h.y = b.y + 1;
  i = read_imageui(a, Ge, h);
  k.s0 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s1 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s2 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s3 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  l.s0 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  j.s0 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  j.s1 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  j.s2 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  j.s3 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  n = convert_uchar4_sat(j);

  h.x = b.x - 2;
  h.y = b.y + 2;
  i = read_imageui(a, Ge, h);
  k.s0 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s1 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s2 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s3 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  l.s0 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  j.s0 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  j.s1 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  j.s2 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  j.s3 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  o = convert_uchar4_sat(j);

  h.x = b.x - 2;
  h.y = b.y + 3;
  i = read_imageui(a, Ge, h);
  k.s0 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s1 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s2 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s3 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  l.s0 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  j.s0 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  j.s1 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  j.s2 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  j.s3 = (mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  p = convert_uchar4_sat(j);

  k.s0 = q.s0;
  k.s1 = r.s0;
  k.s2 = m.s0;
  k.s3 = n.s0;
  l.s0 = o.s0;
  l.s1 = p.s0;
  (*d).s0 = (mad24((int)k.s0, Gf[c.y][0], mad24((int)k.s1, Gf[c.y][1], mad24((int)k.s2, Gf[c.y][2], mad24((int)k.s3, Gf[c.y][3], mad24((int)l.s0, Gf[c.y][4], mad24((int)l.s1, Gf[c.y][5], 64)))))) / 128);
  k.s0 = q.s1;
  k.s1 = r.s1;
  k.s2 = m.s1;
  k.s3 = n.s1;
  l.s0 = o.s1;
  l.s1 = p.s1;
  (*d).s1 = (mad24((int)k.s0, Gf[c.y][0], mad24((int)k.s1, Gf[c.y][1], mad24((int)k.s2, Gf[c.y][2], mad24((int)k.s3, Gf[c.y][3], mad24((int)l.s0, Gf[c.y][4], mad24((int)l.s1, Gf[c.y][5], 64)))))) / 128);
  k.s0 = q.s2;
  k.s1 = r.s2;
  k.s2 = m.s2;
  k.s3 = n.s2;
  l.s0 = o.s2;
  l.s1 = p.s2;
  (*d).s2 = (mad24((int)k.s0, Gf[c.y][0], mad24((int)k.s1, Gf[c.y][1], mad24((int)k.s2, Gf[c.y][2], mad24((int)k.s3, Gf[c.y][3], mad24((int)l.s0, Gf[c.y][4], mad24((int)l.s1, Gf[c.y][5], 64)))))) / 128);
  k.s0 = q.s3;
  k.s1 = r.s3;
  k.s2 = m.s3;
  k.s3 = n.s3;
  l.s0 = o.s3;
  l.s1 = p.s3;
  (*d).s3 = (mad24((int)k.s0, Gf[c.y][0], mad24((int)k.s1, Gf[c.y][1], mad24((int)k.s2, Gf[c.y][2], mad24((int)k.s3, Gf[c.y][3], mad24((int)l.s0, Gf[c.y][4], mad24((int)l.s1, Gf[c.y][5], 64)))))) / 128);

  q = r;
  r = m;
  m = n;
  n = o;
  o = p;

  h.x = b.x - 2;
  h.y = b.y + 4;
  i = read_imageui(a, Ge, h);
  k.s0 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s1 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s2 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s3 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  l.s0 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  p.s0 = (uchar)(mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  p.s1 = (uchar)(mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  p.s2 = (uchar)(mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  p.s3 = (uchar)(mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = q.s0;
  k.s1 = r.s0;
  k.s2 = m.s0;
  k.s3 = n.s0;
  l.s0 = o.s0;
  l.s1 = p.s0;

  (*e).s0 = (mad24((int)k.s0, Gf[c.y][0], mad24((int)k.s1, Gf[c.y][1], mad24((int)k.s2, Gf[c.y][2], mad24((int)k.s3, Gf[c.y][3], mad24((int)l.s0, Gf[c.y][4], mad24((int)l.s1, Gf[c.y][5], 64)))))) / 128);
  k.s0 = q.s1;
  k.s1 = r.s1;
  k.s2 = m.s1;
  k.s3 = n.s1;
  l.s0 = o.s1;
  l.s1 = p.s1;
  (*e).s1 = (mad24((int)k.s0, Gf[c.y][0], mad24((int)k.s1, Gf[c.y][1], mad24((int)k.s2, Gf[c.y][2], mad24((int)k.s3, Gf[c.y][3], mad24((int)l.s0, Gf[c.y][4], mad24((int)l.s1, Gf[c.y][5], 64)))))) / 128);
  k.s0 = q.s2;
  k.s1 = r.s2;
  k.s2 = m.s2;
  k.s3 = n.s2;
  l.s0 = o.s2;
  l.s1 = p.s2;
  (*e).s2 = (mad24((int)k.s0, Gf[c.y][0], mad24((int)k.s1, Gf[c.y][1], mad24((int)k.s2, Gf[c.y][2], mad24((int)k.s3, Gf[c.y][3], mad24((int)l.s0, Gf[c.y][4], mad24((int)l.s1, Gf[c.y][5], 64)))))) / 128);
  k.s0 = q.s3;
  k.s1 = r.s3;
  k.s2 = m.s3;
  k.s3 = n.s3;
  l.s0 = o.s3;
  l.s1 = p.s3;
  (*e).s3 = (mad24((int)k.s0, Gf[c.y][0], mad24((int)k.s1, Gf[c.y][1], mad24((int)k.s2, Gf[c.y][2], mad24((int)k.s3, Gf[c.y][3], mad24((int)l.s0, Gf[c.y][4], mad24((int)l.s1, Gf[c.y][5], 64)))))) / 128);

  q = r;
  r = m;
  m = n;
  n = o;
  o = p;
  h.x = b.x - 2;
  h.y = b.y + 5;
  i = read_imageui(a, Ge, h);
  k.s0 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s1 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s2 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s3 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  l.s0 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  p.s0 = (uchar)(mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  p.s1 = (uchar)(mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  p.s2 = (uchar)(mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  p.s3 = (uchar)(mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = q.s0;
  k.s1 = r.s0;
  k.s2 = m.s0;
  k.s3 = n.s0;
  l.s0 = o.s0;
  l.s1 = p.s0;
  (*f).s0 = (mad24((int)k.s0, Gf[c.y][0], mad24((int)k.s1, Gf[c.y][1], mad24((int)k.s2, Gf[c.y][2], mad24((int)k.s3, Gf[c.y][3], mad24((int)l.s0, Gf[c.y][4], mad24((int)l.s1, Gf[c.y][5], 64)))))) / 128);
  k.s0 = q.s1;
  k.s1 = r.s1;
  k.s2 = m.s1;
  k.s3 = n.s1;
  l.s0 = o.s1;
  l.s1 = p.s1;
  (*f).s1 = (mad24((int)k.s0, Gf[c.y][0], mad24((int)k.s1, Gf[c.y][1], mad24((int)k.s2, Gf[c.y][2], mad24((int)k.s3, Gf[c.y][3], mad24((int)l.s0, Gf[c.y][4], mad24((int)l.s1, Gf[c.y][5], 64)))))) / 128);
  k.s0 = q.s2;
  k.s1 = r.s2;
  k.s2 = m.s2;
  k.s3 = n.s2;
  l.s0 = o.s2;
  l.s1 = p.s2;
  (*f).s2 = (mad24((int)k.s0, Gf[c.y][0], mad24((int)k.s1, Gf[c.y][1], mad24((int)k.s2, Gf[c.y][2], mad24((int)k.s3, Gf[c.y][3], mad24((int)l.s0, Gf[c.y][4], mad24((int)l.s1, Gf[c.y][5], 64)))))) / 128);
  k.s0 = q.s3;
  k.s1 = r.s3;
  k.s2 = m.s3;
  k.s3 = n.s3;
  l.s0 = o.s3;
  l.s1 = p.s3;
  (*f).s3 = (mad24((int)k.s0, Gf[c.y][0], mad24((int)k.s1, Gf[c.y][1], mad24((int)k.s2, Gf[c.y][2], mad24((int)k.s3, Gf[c.y][3], mad24((int)l.s0, Gf[c.y][4], mad24((int)l.s1, Gf[c.y][5], 64)))))) / 128);

  q = r;
  r = m;
  m = n;
  n = o;
  o = p;
  h.x = b.x - 2;
  h.y = b.y + 6;
  i = read_imageui(a, Ge, h);
  k.s0 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s1 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s2 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  k.s3 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  l.s0 = (uchar)i.s0;
  ++h.x;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  p.s0 = (uchar)(mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  p.s1 = (uchar)(mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  ++h.x;
  p.s2 = (uchar)(mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = k.s1;
  k.s1 = k.s2;
  k.s2 = k.s3;
  k.s3 = l.s0;
  l.s0 = l.s1;
  i = read_imageui(a, Ge, h);
  l.s1 = (uchar)i.s0;
  p.s3 = (uchar)(mad24((int)k.s0, Gf[c.x][0], mad24((int)k.s1, Gf[c.x][1], mad24((int)k.s2, Gf[c.x][2], mad24((int)k.s3, Gf[c.x][3], mad24((int)l.s0, Gf[c.x][4], mad24((int)l.s1, Gf[c.x][5], 64)))))) / 128);
  k.s0 = q.s0;
  k.s1 = r.s0;
  k.s2 = m.s0;
  k.s3 = n.s0;
  l.s0 = o.s0;
  l.s1 = p.s0;
  (*g).s0 = (mad24((int)k.s0, Gf[c.y][0], mad24((int)k.s1, Gf[c.y][1], mad24((int)k.s2, Gf[c.y][2], mad24((int)k.s3, Gf[c.y][3], mad24((int)l.s0, Gf[c.y][4], mad24((int)l.s1, Gf[c.y][5], 64)))))) / 128);
  k.s0 = q.s1;
  k.s1 = r.s1;
  k.s2 = m.s1;
  k.s3 = n.s1;
  l.s0 = o.s1;
  l.s1 = p.s1;
  (*g).s1 = (mad24((int)k.s0, Gf[c.y][0], mad24((int)k.s1, Gf[c.y][1], mad24((int)k.s2, Gf[c.y][2], mad24((int)k.s3, Gf[c.y][3], mad24((int)l.s0, Gf[c.y][4], mad24((int)l.s1, Gf[c.y][5], 64)))))) / 128);
  k.s0 = q.s2;
  k.s1 = r.s2;
  k.s2 = m.s2;
  k.s3 = n.s2;
  l.s0 = o.s2;
  l.s1 = p.s2;
  (*g).s2 = (mad24((int)k.s0, Gf[c.y][0], mad24((int)k.s1, Gf[c.y][1], mad24((int)k.s2, Gf[c.y][2], mad24((int)k.s3, Gf[c.y][3], mad24((int)l.s0, Gf[c.y][4], mad24((int)l.s1, Gf[c.y][5], 64)))))) / 128);
  k.s0 = q.s3;
  k.s1 = r.s3;
  k.s2 = m.s3;
  k.s3 = n.s3;
  l.s0 = o.s3;
  l.s1 = p.s3;
  (*g).s3 = (mad24((int)k.s0, Gf[c.y][0], mad24((int)k.s1, Gf[c.y][1], mad24((int)k.s2, Gf[c.y][2], mad24((int)k.s3, Gf[c.y][3], mad24((int)l.s0, Gf[c.y][4], mad24((int)l.s1, Gf[c.y][5], 64)))))) / 128);

  *d = convert_int4(convert_uchar4_sat(*d));
  *e = convert_int4(convert_uchar4_sat(*e));
  *f = convert_int4(convert_uchar4_sat(*f));
  *g = convert_int4(convert_uchar4_sat(*g));

  return;
}

void K(__read_only image2d_t a, const short2 b, const short2 c, int16* const restrict d, uchar16* const restrict e, uchar16* const restrict f, int4* const restrict g, uint4* const restrict h, __local uchar4* const restrict i, const int j, const int k) {
  __private int2 l;
  *f = 0;
  *e = 0;

  __private int m;
  for (m = 0; m < 6; ++m) {
    l.x = b.x - 2;
    l.y = b.y - 2 + m;
    (*h) = read_imageui(a, Ge, l);
    (*f).s8 = (uchar)(*h).s0;
    ++l.x;
    (*h) = read_imageui(a, Ge, l);
    (*f).s9 = (uchar)(*h).s0;
    ++l.x;
    (*h) = read_imageui(a, Ge, l);
    (*f).sA = (uchar)(*h).s0;
    ++l.x;
    (*h) = read_imageui(a, Ge, l);
    (*f).sB = (uchar)(*h).s0;
    ++l.x;
    (*h) = read_imageui(a, Ge, l);
    (*f).sC = (uchar)(*h).s0;
    ++l.x;
    (*h) = read_imageui(a, Ge, l);
    (*f).sD = (uchar)(*h).s0;
    ++l.x;
    (*g).s0 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
    (*f).s8 = (*f).s9;
    (*f).s9 = (*f).sA;
    (*f).sA = (*f).sB;
    (*f).sB = (*f).sC;
    (*f).sC = (*f).sD;
    (*h) = read_imageui(a, Ge, l);
    (*f).sD = (uchar)(*h).s0;
    ++l.x;
    (*g).s1 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
    (*f).s8 = (*f).s9;
    (*f).s9 = (*f).sA;
    (*f).sA = (*f).sB;
    (*f).sB = (*f).sC;
    (*f).sC = (*f).sD;
    (*h) = read_imageui(a, Ge, l);
    (*f).sD = (uchar)(*h).s0;
    ++l.x;
    (*g).s2 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
    (*f).s8 = (*f).s9;
    (*f).s9 = (*f).sA;
    (*f).sA = (*f).sB;
    (*f).sB = (*f).sC;
    (*f).sC = (*f).sD;
    (*h) = read_imageui(a, Ge, l);
    (*f).sD = (uchar)(*h).s0;
    (*g).s3 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
    (*e).sCDEF = convert_uchar4_sat((*g));
    (*f).s0123 = (m == 0) ? convert_uchar4_sat((*g)) : (*f).s0123;
    (*f).s4567 = (m == 1) ? convert_uchar4_sat((*g)) : (*f).s4567;
    (*e).s0123 = (m == 2) ? convert_uchar4_sat((*g)) : (*e).s0123;
    (*e).s4567 = (m == 3) ? convert_uchar4_sat((*g)) : (*e).s4567;
    (*e).s89AB = (m == 4) ? convert_uchar4_sat((*g)) : (*e).s89AB;
    (*e).sCDEF = (m >= 5) ? convert_uchar4_sat((*g)) : (*e).sCDEF;
  }

  (*f).s8 = (*f).s0;
  (*f).s9 = (*f).s4;
  (*f).sA = (*e).s0;
  (*f).sB = (*e).s4;
  (*f).sC = (*e).s8;
  (*f).sD = (*e).sC;
  (*d).s0 = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s1;
  (*f).s9 = (*f).s5;
  (*f).sA = (*e).s1;
  (*f).sB = (*e).s5;
  (*f).sC = (*e).s9;
  (*f).sD = (*e).sD;
  (*d).s1 = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s2;
  (*f).s9 = (*f).s6;
  (*f).sA = (*e).s2;
  (*f).sB = (*e).s6;
  (*f).sC = (*e).sA;
  (*f).sD = (*e).sE;
  (*d).s2 = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s3;
  (*f).s9 = (*f).s7;
  (*f).sA = (*e).s3;
  (*f).sB = (*e).s7;
  (*f).sC = (*e).sB;
  (*f).sD = (*e).sF;
  (*d).s3 = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s0123 = (*f).s4567;
  (*f).s4567 = (*e).s0123;
  (*e).s0123 = (*e).s4567;
  (*e).s4567 = (*e).s89AB;
  (*e).s89AB = (*e).sCDEF;

  l.x = b.x - 2;
  l.y = b.y + 4;
  (*h) = read_imageui(a, Ge, l);
  (*f).s8 = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).s9 = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sA = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sB = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sC = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  ++l.x;
  (*g).s0 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*f).s8 = (*f).s9;
  (*f).s9 = (*f).sA;
  (*f).sA = (*f).sB;
  (*f).sB = (*f).sC;
  (*f).sC = (*f).sD;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  ++l.x;
  (*g).s1 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*f).s8 = (*f).s9;
  (*f).s9 = (*f).sA;
  (*f).sA = (*f).sB;
  (*f).sB = (*f).sC;
  (*f).sC = (*f).sD;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  ++l.x;
  (*g).s2 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*f).s8 = (*f).s9;
  (*f).s9 = (*f).sA;
  (*f).sA = (*f).sB;
  (*f).sB = (*f).sC;
  (*f).sC = (*f).sD;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  (*g).s3 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*e).sCDEF = convert_uchar4_sat((*g));

  (*f).s8 = (*f).s0;
  (*f).s9 = (*f).s4;
  (*f).sA = (*e).s0;
  (*f).sB = (*e).s4;
  (*f).sC = (*e).s8;
  (*f).sD = (*e).sC;
  (*d).s4 = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s1;
  (*f).s9 = (*f).s5;
  (*f).sA = (*e).s1;
  (*f).sB = (*e).s5;
  (*f).sC = (*e).s9;
  (*f).sD = (*e).sD;
  (*d).s5 = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s2;
  (*f).s9 = (*f).s6;
  (*f).sA = (*e).s2;
  (*f).sB = (*e).s6;
  (*f).sC = (*e).sA;
  (*f).sD = (*e).sE;
  (*d).s6 = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s3;
  (*f).s9 = (*f).s7;
  (*f).sA = (*e).s3;
  (*f).sB = (*e).s7;
  (*f).sC = (*e).sB;
  (*f).sD = (*e).sF;
  (*d).s7 = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);

  (*f).s0123 = (*f).s4567;
  (*f).s4567 = (*e).s0123;
  (*e).s0123 = (*e).s4567;
  (*e).s4567 = (*e).s89AB;
  (*e).s89AB = (*e).sCDEF;
  l.x = b.x - 2;
  l.y = b.y + 5;
  (*h) = read_imageui(a, Ge, l);
  (*f).s8 = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).s9 = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sA = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sB = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sC = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  ++l.x;
  (*g).s0 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*f).s8 = (*f).s9;
  (*f).s9 = (*f).sA;
  (*f).sA = (*f).sB;
  (*f).sB = (*f).sC;
  (*f).sC = (*f).sD;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  ++l.x;
  (*g).s1 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*f).s8 = (*f).s9;
  (*f).s9 = (*f).sA;
  (*f).sA = (*f).sB;
  (*f).sB = (*f).sC;
  (*f).sC = (*f).sD;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  ++l.x;
  (*g).s2 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*f).s8 = (*f).s9;
  (*f).s9 = (*f).sA;
  (*f).sA = (*f).sB;
  (*f).sB = (*f).sC;
  (*f).sC = (*f).sD;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  (*g).s3 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*e).sCDEF = convert_uchar4_sat((*g));
  (*f).s8 = (*f).s0;
  (*f).s9 = (*f).s4;
  (*f).sA = (*e).s0;
  (*f).sB = (*e).s4;
  (*f).sC = (*e).s8;
  (*f).sD = (*e).sC;
  (*d).s8 = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s1;
  (*f).s9 = (*f).s5;
  (*f).sA = (*e).s1;
  (*f).sB = (*e).s5;
  (*f).sC = (*e).s9;
  (*f).sD = (*e).sD;
  (*d).s9 = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s2;
  (*f).s9 = (*f).s6;
  (*f).sA = (*e).s2;
  (*f).sB = (*e).s6;
  (*f).sC = (*e).sA;
  (*f).sD = (*e).sE;
  (*d).sA = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s3;
  (*f).s9 = (*f).s7;
  (*f).sA = (*e).s3;
  (*f).sB = (*e).s7;
  (*f).sC = (*e).sB;
  (*f).sD = (*e).sF;
  (*d).sB = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);

  (*f).s0123 = (*f).s4567;
  (*f).s4567 = (*e).s0123;
  (*e).s0123 = (*e).s4567;
  (*e).s4567 = (*e).s89AB;
  (*e).s89AB = (*e).sCDEF;
  l.x = b.x - 2;
  l.y = b.y + 6;
  (*h) = read_imageui(a, Ge, l);
  (*f).s8 = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).s9 = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sA = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sB = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sC = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  ++l.x;
  (*g).s0 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*f).s8 = (*f).s9;
  (*f).s9 = (*f).sA;
  (*f).sA = (*f).sB;
  (*f).sB = (*f).sC;
  (*f).sC = (*f).sD;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  ++l.x;
  (*g).s1 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*f).s8 = (*f).s9;
  (*f).s9 = (*f).sA;
  (*f).sA = (*f).sB;
  (*f).sB = (*f).sC;
  (*f).sC = (*f).sD;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  ++l.x;
  (*g).s2 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*f).s8 = (*f).s9;
  (*f).s9 = (*f).sA;
  (*f).sA = (*f).sB;
  (*f).sB = (*f).sC;
  (*f).sC = (*f).sD;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  (*g).s3 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*e).sCDEF = convert_uchar4_sat((*g));
  (*f).s8 = (*f).s0;
  (*f).s9 = (*f).s4;
  (*f).sA = (*e).s0;
  (*f).sB = (*e).s4;
  (*f).sC = (*e).s8;
  (*f).sD = (*e).sC;
  (*d).sC = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s1;
  (*f).s9 = (*f).s5;
  (*f).sA = (*e).s1;
  (*f).sB = (*e).s5;
  (*f).sC = (*e).s9;
  (*f).sD = (*e).sD;
  (*d).sD = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s2;
  (*f).s9 = (*f).s6;
  (*f).sA = (*e).s2;
  (*f).sB = (*e).s6;
  (*f).sC = (*e).sA;
  (*f).sD = (*e).sE;
  (*d).sE = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s3;
  (*f).s9 = (*f).s7;
  (*f).sA = (*e).s3;
  (*f).sB = (*e).s7;
  (*f).sC = (*e).sB;
  (*f).sD = (*e).sF;
  (*d).sF = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);

  *d = convert_int16(convert_uchar16_sat(*d));

  i[(int)j] = (*f).s4567;
  i[(int)(k + j)] = (*e).s0123;
  i[(int)mad24(k, 2, j)] = (*e).s4567;
  i[(int)mad24(k, 3, j)] = (*e).s89AB;
  i[(int)mad24(k, 4, j)] = (*e).sCDEF;

  return;
}

void L(__read_only image2d_t a, const short2 b, const short2 c, int16* const restrict d, uchar16* const restrict e, uchar16* const restrict f, int4* const restrict g, uint4* const restrict h, const __local uchar4* const restrict i, const int j, const int k) {
  __private int2 l;

  (*f).s0123 = i[(int)j];
  (*f).s4567 = i[(int)(k + j)];
  (*e).s0123 = i[(int)mad24(k, 2, j)];
  (*e).s4567 = i[(int)mad24(k, 3, j)];
  (*e).s89AB = i[(int)mad24(k, 4, j)];

  l.x = b.x - 2;
  l.y = b.y + 3;
  (*h) = read_imageui(a, Ge, l);
  (*f).s8 = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).s9 = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sA = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sB = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sC = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  ++l.x;
  (*g).s0 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*f).s8 = (*f).s9;
  (*f).s9 = (*f).sA;
  (*f).sA = (*f).sB;
  (*f).sB = (*f).sC;
  (*f).sC = (*f).sD;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  ++l.x;
  (*g).s1 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*f).s8 = (*f).s9;
  (*f).s9 = (*f).sA;
  (*f).sA = (*f).sB;
  (*f).sB = (*f).sC;
  (*f).sC = (*f).sD;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  ++l.x;
  (*g).s2 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*f).s8 = (*f).s9;
  (*f).s9 = (*f).sA;
  (*f).sA = (*f).sB;
  (*f).sB = (*f).sC;
  (*f).sC = (*f).sD;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  (*g).s3 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*e).sCDEF = convert_uchar4_sat((*g));

  (*f).s8 = (*f).s0;
  (*f).s9 = (*f).s4;
  (*f).sA = (*e).s0;
  (*f).sB = (*e).s4;
  (*f).sC = (*e).s8;
  (*f).sD = (*e).sC;
  (*d).s0 = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s1;
  (*f).s9 = (*f).s5;
  (*f).sA = (*e).s1;
  (*f).sB = (*e).s5;
  (*f).sC = (*e).s9;
  (*f).sD = (*e).sD;
  (*d).s1 = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s2;
  (*f).s9 = (*f).s6;
  (*f).sA = (*e).s2;
  (*f).sB = (*e).s6;
  (*f).sC = (*e).sA;
  (*f).sD = (*e).sE;
  (*d).s2 = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s3;
  (*f).s9 = (*f).s7;
  (*f).sA = (*e).s3;
  (*f).sB = (*e).s7;
  (*f).sC = (*e).sB;
  (*f).sD = (*e).sF;
  (*d).s3 = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);

  (*f).s0123 = (*f).s4567;
  (*f).s4567 = (*e).s0123;
  (*e).s0123 = (*e).s4567;
  (*e).s4567 = (*e).s89AB;
  (*e).s89AB = (*e).sCDEF;

  l.x = b.x - 2;
  l.y = b.y + 4;
  (*h) = read_imageui(a, Ge, l);
  (*f).s8 = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).s9 = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sA = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sB = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sC = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  ++l.x;
  (*g).s0 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*f).s8 = (*f).s9;
  (*f).s9 = (*f).sA;
  (*f).sA = (*f).sB;
  (*f).sB = (*f).sC;
  (*f).sC = (*f).sD;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  ++l.x;
  (*g).s1 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*f).s8 = (*f).s9;
  (*f).s9 = (*f).sA;
  (*f).sA = (*f).sB;
  (*f).sB = (*f).sC;
  (*f).sC = (*f).sD;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  ++l.x;
  (*g).s2 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*f).s8 = (*f).s9;
  (*f).s9 = (*f).sA;
  (*f).sA = (*f).sB;
  (*f).sB = (*f).sC;
  (*f).sC = (*f).sD;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  (*g).s3 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*e).sCDEF = convert_uchar4_sat((*g));

  (*f).s8 = (*f).s0;
  (*f).s9 = (*f).s4;
  (*f).sA = (*e).s0;
  (*f).sB = (*e).s4;
  (*f).sC = (*e).s8;
  (*f).sD = (*e).sC;
  (*d).s4 = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s1;
  (*f).s9 = (*f).s5;
  (*f).sA = (*e).s1;
  (*f).sB = (*e).s5;
  (*f).sC = (*e).s9;
  (*f).sD = (*e).sD;
  (*d).s5 = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s2;
  (*f).s9 = (*f).s6;
  (*f).sA = (*e).s2;
  (*f).sB = (*e).s6;
  (*f).sC = (*e).sA;
  (*f).sD = (*e).sE;
  (*d).s6 = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s3;
  (*f).s9 = (*f).s7;
  (*f).sA = (*e).s3;
  (*f).sB = (*e).s7;
  (*f).sC = (*e).sB;
  (*f).sD = (*e).sF;
  (*d).s7 = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);

  (*f).s0123 = (*f).s4567;
  (*f).s4567 = (*e).s0123;
  (*e).s0123 = (*e).s4567;
  (*e).s4567 = (*e).s89AB;
  (*e).s89AB = (*e).sCDEF;
  l.x = b.x - 2;
  l.y = b.y + 5;
  (*h) = read_imageui(a, Ge, l);
  (*f).s8 = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).s9 = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sA = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sB = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sC = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  ++l.x;
  (*g).s0 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*f).s8 = (*f).s9;
  (*f).s9 = (*f).sA;
  (*f).sA = (*f).sB;
  (*f).sB = (*f).sC;
  (*f).sC = (*f).sD;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  ++l.x;
  (*g).s1 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*f).s8 = (*f).s9;
  (*f).s9 = (*f).sA;
  (*f).sA = (*f).sB;
  (*f).sB = (*f).sC;
  (*f).sC = (*f).sD;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  ++l.x;
  (*g).s2 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*f).s8 = (*f).s9;
  (*f).s9 = (*f).sA;
  (*f).sA = (*f).sB;
  (*f).sB = (*f).sC;
  (*f).sC = (*f).sD;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  (*g).s3 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*e).sCDEF = convert_uchar4_sat((*g));
  (*f).s8 = (*f).s0;
  (*f).s9 = (*f).s4;
  (*f).sA = (*e).s0;
  (*f).sB = (*e).s4;
  (*f).sC = (*e).s8;
  (*f).sD = (*e).sC;
  (*d).s8 = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s1;
  (*f).s9 = (*f).s5;
  (*f).sA = (*e).s1;
  (*f).sB = (*e).s5;
  (*f).sC = (*e).s9;
  (*f).sD = (*e).sD;
  (*d).s9 = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s2;
  (*f).s9 = (*f).s6;
  (*f).sA = (*e).s2;
  (*f).sB = (*e).s6;
  (*f).sC = (*e).sA;
  (*f).sD = (*e).sE;
  (*d).sA = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s3;
  (*f).s9 = (*f).s7;
  (*f).sA = (*e).s3;
  (*f).sB = (*e).s7;
  (*f).sC = (*e).sB;
  (*f).sD = (*e).sF;
  (*d).sB = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);

  (*f).s0123 = (*f).s4567;
  (*f).s4567 = (*e).s0123;
  (*e).s0123 = (*e).s4567;
  (*e).s4567 = (*e).s89AB;
  (*e).s89AB = (*e).sCDEF;
  l.x = b.x - 2;
  l.y = b.y + 6;
  (*h) = read_imageui(a, Ge, l);
  (*f).s8 = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).s9 = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sA = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sB = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sC = (uchar)(*h).s0;
  ++l.x;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  ++l.x;
  (*g).s0 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*f).s8 = (*f).s9;
  (*f).s9 = (*f).sA;
  (*f).sA = (*f).sB;
  (*f).sB = (*f).sC;
  (*f).sC = (*f).sD;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  ++l.x;
  (*g).s1 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*f).s8 = (*f).s9;
  (*f).s9 = (*f).sA;
  (*f).sA = (*f).sB;
  (*f).sB = (*f).sC;
  (*f).sC = (*f).sD;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  ++l.x;
  (*g).s2 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*f).s8 = (*f).s9;
  (*f).s9 = (*f).sA;
  (*f).sA = (*f).sB;
  (*f).sB = (*f).sC;
  (*f).sC = (*f).sD;
  (*h) = read_imageui(a, Ge, l);
  (*f).sD = (uchar)(*h).s0;
  (*g).s3 = (mad24((int)(*f).s8, Gf[c.x][0], mad24((int)(*f).s9, Gf[c.x][1], mad24((int)(*f).sA, Gf[c.x][2], mad24((int)(*f).sB, Gf[c.x][3], mad24((int)(*f).sC, Gf[c.x][4], mad24((int)(*f).sD, Gf[c.x][5], 64)))))) / 128);
  (*e).sCDEF = convert_uchar4_sat((*g));
  (*f).s8 = (*f).s0;
  (*f).s9 = (*f).s4;
  (*f).sA = (*e).s0;
  (*f).sB = (*e).s4;
  (*f).sC = (*e).s8;
  (*f).sD = (*e).sC;
  (*d).sC = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s1;
  (*f).s9 = (*f).s5;
  (*f).sA = (*e).s1;
  (*f).sB = (*e).s5;
  (*f).sC = (*e).s9;
  (*f).sD = (*e).sD;
  (*d).sD = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s2;
  (*f).s9 = (*f).s6;
  (*f).sA = (*e).s2;
  (*f).sB = (*e).s6;
  (*f).sC = (*e).sA;
  (*f).sD = (*e).sE;
  (*d).sE = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);
  (*f).s8 = (*f).s3;
  (*f).s9 = (*f).s7;
  (*f).sA = (*e).s3;
  (*f).sB = (*e).s7;
  (*f).sC = (*e).sB;
  (*f).sD = (*e).sF;
  (*d).sF = (mad24((int)(*f).s8, Gf[c.y][0], mad24((int)(*f).s9, Gf[c.y][1], mad24((int)(*f).sA, Gf[c.y][2], mad24((int)(*f).sB, Gf[c.y][3], mad24((int)(*f).sC, Gf[c.y][4], mad24((int)(*f).sD, Gf[c.y][5], 64)))))) / 128);

  *d = convert_int16(convert_uchar16_sat(*d));

  return;
}

__constant int Gg[4] = {0, 0, 16, 16};
__constant int Gh[4] = {0, 16, 0, 16};
__constant int Gi[4] = {0, 8, 1, 9};
__kernel __attribute__((reqd_work_group_size(256, 1, 1))) void M(__global uchar4* const a, __read_only image2d_t b, __global vector_net* const c, __global vector_net* const d, __global int* const e, const int f, const int g) {
  __private int16 h;

  __private short8 i;
  __private short8 j;

  uchar16 k, l;
  int4 m;
  uint4 n;

  __private int o, p;
  __private const int q = get_global_id(0);
  if (q >= (f * g / 64))
    return;
  __private const short r = get_local_id(0);
  __private const short s = get_local_size(0);

  __local uchar4 t[16 * 256];
  __local uchar4 u[6 * 256];

  i.s4 = c[q].vector_x;
  i.s5 = c[q].vector_y;
  i.s4 *= 4;
  i.s5 *= 4;
  i.s6 = i.s4;
  i.s7 = i.s5;

  p = f / 8;
  j.s0 = (q % (p)) * 8;
  j.s1 = (q / (p)) * 8;

  p = (j.s1 * f + j.s0) / 4;
  o = f / 4;

  t[(int)r] = a[p];
  t[(int)s + (int)r] = a[p + 1];
  p += o;
  t[(int)(s * 2 + r)] = a[p];
  t[(int)(s * 3 + r)] = a[p + 1];
  p += o;
  t[(int)(s * 4 + r)] = a[p];
  t[(int)(s * 5 + r)] = a[p + 1];
  p += o;
  t[(int)(s * 6 + r)] = a[p];
  t[(int)(s * 7 + r)] = a[p + 1];
  p += o;
  t[(int)(s * 8 + r)] = a[p];
  t[(int)(s * 9 + r)] = a[p + 1];
  p += o;
  t[(int)(s * 10 + r)] = a[p];
  t[(int)(s * 11 + r)] = a[p + 1];
  p += o;
  t[(int)(s * 12 + r)] = a[p];
  t[(int)(s * 13 + r)] = a[p + 1];
  p += o;
  t[(int)(s * 14 + r)] = a[p];
  t[(int)(s * 15 + r)] = a[p + 1];

  o = 0x7fff;
  j.s0 *= 4;
  j.s1 *= 4;

  i.s4 = f * 4 - 32;
  i.s5 = g * 4 - 32;

  for (i.s0 = 0; i.s0 < 25; ++i.s0) {
    j.s2 = j.s0 + i.s6 + ((i.s0 % 5) - 2);
    j.s3 = j.s1 + i.s7 + ((i.s0 / 5) - 2);

    j.s6 = j.s2 % 4;
    j.s7 = j.s3 % 4;
    j.s6 *= 2;
    j.s7 *= 2;

    p = 0;
    for (i.s1 = 0; i.s1 < 4; i.s1 += 1) {
      j.s4 = (j.s2 + Gg[i.s1]) / 4;
      j.s5 = (j.s3 + Gh[i.s1]) / 4;

      if (Gh[i.s1] == 0)
        K(b, j.s45, j.s67, &h, &k, &l, &m, &n, u, r, s);
      else
        L(b, j.s45, j.s67, &h, &k, &l, &m, &n, u, r, s);
      h.s0123 = convert_int4(t[mad24((int)s, Gi[i.s1] + 0, (int)r)]) - h.s0123;
      h.s4567 = convert_int4(t[mad24((int)s, Gi[i.s1] + 2, (int)r)]) - h.s4567;
      h.s89AB = convert_int4(t[mad24((int)s, Gi[i.s1] + 4, (int)r)]) - h.s89AB;
      h.sCDEF = convert_int4(t[mad24((int)s, Gi[i.s1] + 6, (int)r)]) - h.sCDEF;
      B(&m, &h);
      p += m.s0;
    }

    p += (int)(abs(j.s2 - j.s0 - i.s6) + abs(j.s3 - j.s1 - i.s7)) * Gc;

    p |= (((j.s2 < 0)) ? (0x7fff) : (0));
    p |= (((j.s2 > (f * 4 - 32))) ? (0x7fff) : (0));
    p |= (((j.s3 < 0)) ? (0x7fff) : (0));
    p |= (((j.s3 > (g * 4 - 32))) ? (0x7fff) : (0));

    j.s6 = (p < o);

    i.s4 = j.s6 ? j.s2 : i.s4;
    i.s5 = j.s6 ? j.s3 : i.s5;

    o = j.s6 ? p : o;
  }

  i.s4 -= j.s0;
  i.s5 -= j.s1;
  o -= ((int)abs(i.s4 - i.s6) + (int)abs(i.s5 - i.s7)) * Gc;

  d[q].vector_x = i.s4;
  d[q].vector_y = i.s5;
  e[q] = o;

  return;
}

__kernel void N(__global vector_net* const a, __global vector_net* const b, __global vector_net* const c, __global int* const d, __global int* const e, __global int* const f, __global macroblock* const g, const int h, const int i, const int j) {
  __private int k, l, m, n, o, p, q, r, s, t, u, v, w, x, y;
  m = get_global_id(0);
  o = h / 16;
  p = o * 2;

  n = ((m / o) * 2) * (p) + ((m % o) * 2);

  k = d[n];
  k += d[n + 1];
  k += d[n + p];
  k += d[n + p + 1];

  l = 0x7fffffff;
  if (j == 1) {
    l = f[n];
    l += f[n + 1];
    l += f[n + p];
    l += f[n + p + 1];
  }
  q = ((k <= l) ? (LAST) : (ALTREF));
  k = ((k <= l) ? (k) : (l));

  l = 0x7fffffff;
  if (i == 1) {
    l = e[n];
    l += e[n + 1];
    l += e[n + p];
    l += e[n + p + 1];
  }
  q = ((k <= l) ? (q) : (GOLDEN));

  if (q == LAST) {
    r = a[n].vector_x;
    s = a[n].vector_y;
    t = a[n + 1].vector_x;
    u = a[n + 1].vector_y;
    v = a[n + p].vector_x;
    w = a[n + p].vector_y;
    x = a[n + p + 1].vector_x;
    y = a[n + p + 1].vector_y;
  }
  if (q == GOLDEN) {
    r = b[n].vector_x;
    s = b[n].vector_y;
    t = b[n + 1].vector_x;
    u = b[n + 1].vector_y;
    v = b[n + p].vector_x;
    w = b[n + p].vector_y;
    x = b[n + p + 1].vector_x;
    y = b[n + p + 1].vector_y;
  }
  if (q == ALTREF) {
    r = c[n].vector_x;
    s = c[n].vector_y;
    t = c[n + 1].vector_x;
    u = c[n + 1].vector_y;
    v = c[n + p].vector_x;
    w = c[n + p].vector_y;
    x = c[n + p + 1].vector_x;
    y = c[n + p + 1].vector_y;
  }

  g[m].reference_frame = q;
  g[m].vector_x[0] = r;
  g[m].vector_y[0] = s;
  g[m].vector_x[1] = t;
  g[m].vector_y[1] = u;
  g[m].vector_x[2] = v;
  g[m].vector_y[2] = w;
  g[m].vector_x[3] = x;
  g[m].vector_y[3] = y;

  return;
}

__kernel void O(__global uchar* const a, __read_only image2d_t b, __global uchar* const c, __global short* const d, __global macroblock* const e, const int f, const int g, const int h) {
  __private int i, j, k;
  __private int l;
  __private int4 m, n, o, p;
  __private uchar4 q, r, s, t;
  __private int2 u, v, w, x;
  __private int y = (g == 0) ? 16 : 8;

  i = get_global_id(0);
  x.x = (i % (f / 4)) * 4;
  x.y = (i / (f / 4)) * 4;
  j = (x.y / y) * (f / y) + (x.x / y);

  if (e[j].reference_frame != h)
    return;

  w = (x % y) / (y / 2);
  l = mad24(w.y, 2, w.x);
  w.x = e[j].vector_x[l];
  w.y = e[j].vector_y[l];

  k = (g == 0) ? 4 : 8;
  v = mad24(x, k, w) % k;

  v *= (g == 0) ? 2 : 1;
  u = mad24(x, k, w) / k;
  l = x.y * f + x.x;
  J(b, u, v, &m, &n, &o, &p);
  q = convert_uchar4_sat(m);
  r = convert_uchar4_sat(n);
  s = convert_uchar4_sat(o);
  t = convert_uchar4_sat(p);
  vstore4(q, 0, c + l);
  l += f;
  vstore4(r, 0, c + l);
  l += f;
  vstore4(s, 0, c + l);
  l += f;
  vstore4(t, 0, c + l);
  l -= 3 * f;
  q = vload4(0, a + l);
  l += f;
  r = vload4(0, a + l);
  l += f;
  s = vload4(0, a + l);
  l += f;
  t = vload4(0, a + l);
  l -= 3 * f;
  m = convert_int4(q) - m;
  n = convert_int4(r) - n;
  o = convert_int4(s) - o;
  p = convert_int4(t) - p;
  vstore4(convert_short4(m), 0, d + l);
  l += f;
  vstore4(convert_short4(n), 0, d + l);
  l += f;
  vstore4(convert_short4(o), 0, d + l);
  l += f;
  vstore4(convert_short4(p), 0, d + l);

  return;
}

__kernel void P(__global macroblock* const a) {
  __private int b, c, d, e, f, g;
  b = get_global_id(0);
  a[b].SSIM = -2.0f;
  a[b].parts = are8x8;
  c = a[b].vector_x[0];
  d = a[b].vector_y[0];
  e = a[b].vector_x[1];
  f = a[b].vector_y[1];
  g = ((c != e) || (d != f));
  if (g)
    return;
  e = a[b].vector_x[2];
  f = a[b].vector_y[2];
  g = ((c != e) || (d != f));
  if (g)
    return;
  e = a[b].vector_x[3];
  f = a[b].vector_y[3];
  g = ((c != e) || (d != f));
  if (g)
    return;
  a[b].parts = are16x16;
  return;
}

__kernel void Q(__global short2* const restrict a, __global macroblock* const restrict b, const int c, __constant segment_data* const d, const segment_ids e, const float f, const int g) {
  __private int h, i, j, k, l, m;
  __private int n;
  __private int16 o;
  __private int4 p;
  __private int2 q, r;
  __private int s = (g == 0) ? 16 : 8;

  h = get_global_id(0);
  q.x = (h % (c / 4)) * 4;
  q.y = (h / (c / 4)) * 4;
  i = (q.y / s) * (c / s) + (q.x / s);

  if (b[i].SSIM > f)
    return;

  b[i].segment_id = e;
  n = d[e].y_ac_i;

  k = d[0].y_dc_idelta;
  k += n;
  k = ((k < 0) ? (0) : ((int)k));
  k = ((k > 127) ? (127) : ((int)k));
  j = Gb[n];
  k = (b[i].parts == are16x16) ? 1 : Ga[k];
  l = d[0].uv_dc_idelta;
  l += n;
  m = d[0].uv_ac_idelta;
  m += n;
  l = ((l < 0) ? (0) : (l));
  l = ((l > 127) ? (127) : (l));
  m = ((m < 0) ? (0) : (m));
  m = ((m > 127) ? (127) : (m));
  l = Ga[l];
  m = Gb[m];
  l = ((l > 132) ? (132) : (l));
  k = ((g == 0) ? (k) : (l));
  j = ((g == 0) ? (j) : (m));

  n = q.y * c + q.x;
  n /= 2;
  o.s01 = convert_int2(a[n]);
  o.s23 = convert_int2(a[n + 1]);
  n += c / 2;
  o.s45 = convert_int2(a[n]);
  o.s67 = convert_int2(a[n + 1]);
  n += c / 2;
  o.s89 = convert_int2(a[n]);
  o.sAB = convert_int2(a[n + 1]);
  n += c / 2;
  o.sCD = convert_int2(a[n]);
  o.sEF = convert_int2(a[n + 1]);

  p = o.s0123;
  o.s0123 = ((o.s0123 + o.sCDEF) << 3);
  o.sCDEF = ((p - o.sCDEF) << 3);
  p = o.s4567;
  o.s4567 = ((o.s4567 + o.s89AB) << 3);
  o.s89AB = ((p - o.s89AB) << 3);

  p = o.s89AB;
  o.s89AB = o.s0123 - o.s4567;
  o.s0123 = o.s0123 + o.s4567;

  o.s4567 = (((p * 2217) + (o.sCDEF * 5352) + 14500) >> 12);

  o.sCDEF = (((o.sCDEF * 2217) - (p * 5352) + 7500) >> 12);

  (p).x = o.s0;
  (p).y = o.s4;
  (p).z = o.s8;
  (p).w = o.sC;

  o.s0 = o.s0 + o.s3;
  o.s4 = o.s4 + o.s7;
  o.s8 = o.s8 + o.sB;
  o.sC = o.sC + o.sF;

  o.s3 = (p).x - o.s3;
  o.s7 = (p).y - o.s7;
  o.sB = (p).z - o.sB;
  o.sF = (p).w - o.sF;
  (p).x = o.s1;
  (p).y = o.s5;
  (p).z = o.s9;
  (p).w = o.sD;

  o.s1 = o.s1 + o.s2;
  o.s5 = o.s5 + o.s6;
  o.s9 = o.s9 + o.sA;
  o.sD = o.sD + o.sE;

  o.s2 = (p).x - o.s2;
  o.s6 = (p).y - o.s6;
  o.sA = (p).z - o.sA;
  o.sE = (p).w - o.sE;

  (p).x = o.s2;
  (p).y = o.s6;
  (p).z = o.sA;
  (p).w = o.sE;

  o.s2 = ((o.s0 - o.s1 + 7) >> 4);
  o.s6 = ((o.s4 - o.s5 + 7) >> 4);
  o.sA = ((o.s8 - o.s9 + 7) >> 4);
  o.sE = ((o.sC - o.sD + 7) >> 4);

  o.s0 = ((o.s0 + o.s1 + 7) >> 4);
  o.s4 = ((o.s4 + o.s5 + 7) >> 4);
  o.s8 = ((o.s8 + o.s9 + 7) >> 4);
  o.sC = ((o.sC + o.sD + 7) >> 4);

  o.s1 = ((((p).x * 2217) + (o.s3 * 5352) + 12000) >> 16) + (o.s3 != 0);
  o.s5 = ((((p).y * 2217) + (o.s7 * 5352) + 12000) >> 16) + (o.s7 != 0);
  o.s9 = ((((p).z * 2217) + (o.sB * 5352) + 12000) >> 16) + (o.sB != 0);
  o.sD = ((((p).w * 2217) + (o.sF * 5352) + 12000) >> 16) + (o.sF != 0);

  o.s3 = (((o.s3 * 2217) - ((p).x * 5352) + 51000) >> 16);
  o.s7 = (((o.s7 * 2217) - ((p).y * 5352) + 51000) >> 16);
  o.sB = (((o.sB * 2217) - ((p).z * 5352) + 51000) >> 16);
  o.sF = (((o.sF * 2217) - ((p).w * 5352) + 51000) >> 16);

 o.s0123 /= (intj o.s4567 /= j;
 o.s89AB /= j;
 o.sCDEF /= j;


 r.x = (q.x%s)/4;
 r.y = (q.y%s)/4;
 h = r.y*(s/4) + r.x;
 h += (g == 1) ? 16 : 0;
 h += (g == 2) ? 20 : 0;
 const int t[16] = { 0, 1, 5, 6, 2, 4, 7, 12, 3, 8, 11, 13, 9, 10, 14, 15 };
 b[i].coeffs[h][t[0]]=(short)o.s0; b[i].coeffs[h][t[1]]=(short)o.s1; b[i].coeffs[h][t[2]]=(short)o.s2; b[i].coeffs[h][t[3]]=(short)o.s3;
 b[i].coeffs[h][t[4]]=(short)o.s4; b[i].coeffs[h][t[5]]=(short)o.s5; b[i].coeffs[h][t[6]]=(short)o.s6; b[i].coeffs[h][t[7]]=(short)o.s7;
 b[i].coeffs[h][t[8]]=(short)o.s8; b[i].coeffs[h][t[9]]=(short)o.s9; b[i].coeffs[h][t[10]]=(short)o.sA; b[i].coeffs[h][t[11]]=(short)o.sB;
 b[i].coeffs[h][t[12]]=(short)o.sC; b[i].coeffs[h][t[13]]=(short)o.sD; b[i].coeffs[h][t[14]]=(short)o.sE; b[i].coeffs[h][t[15]]=(short)o.sF;

 return;
}

__kernel void R(__global macroblock* const a, __constant segment_data* const b, const segment_ids c, const float d) {
  __private int e, f, g;
  __private int h;
  __private int4 i, j, k, l;

  e = get_global_id(0);

  if (a[e].SSIM > d)
    return;
  if (a[e].parts != are16x16)
    return;

  a[e].segment_id = c;
  h = b[c].y_ac_i;

  f = b[0].y2_dc_idelta;
  f += h;
  g = b[0].y2_ac_idelta;
  g += h;
  f = ((f < 0) ? (0) : ((int)f));
  f = ((f > 127) ? (127) : ((int)f));
  g = ((g < 0) ? (0) : ((int)g));
  g = ((g > 127) ? (127) : ((int)g));

  f = (Ga[f]) * 2;
  g = 31 * (Gb[g]) / 20;
  g = ((g < 8) ? (8) : ((int)g));

  const int m[16] = {0, 1, 5, 6, 2, 4, 7, 12, 3, 8, 11, 13, 9, 10, 14, 15};
  i.s0 = (int)a[e].coeffs[0][0];
  i.s1 = (int)a[e].coeffs[1][0];
  i.s2 = (int)a[e].coeffs[2][0];
  i.s3 = (int)a[e].coeffs[3][0];
  j.s0 = (int)a[e].coeffs[4][0];
  j.s1 = (int)a[e].coeffs[5][0];
  j.s2 = (int)a[e].coeffs[6][0];
  j.s3 = (int)a[e].coeffs[7][0];
  k.s0 = (int)a[e].coeffs[8][0];
  k.s1 = (int)a[e].coeffs[9][0];
  k.s2 = (int)a[e].coeffs[10][0];
  k.s3 = (int)a[e].coeffs[11][0];
  l.s0 = (int)a[e].coeffs[12][0];
  l.s1 = (int)a[e].coeffs[13][0];
  l.s2 = (int)a[e].coeffs[14][0];
  l.s3 = (int)a[e].coeffs[15][0];
  E(&i, &j, &k, &l, f, g);
  a[e].coeffs[24][m[0]] = (short)i.s0;
  a[e].coeffs[24][m[1]] = (short)i.s1;
  a[e].coeffs[24][m[2]] = (short)i.s2;
  a[e].coeffs[24][m[3]] = (short)i.s3;
  a[e].coeffs[24][m[4]] = (short)j.s0;
  a[e].coeffs[24][m[5]] = (short)j.s1;
  a[e].coeffs[24][m[6]] = (short)j.s2;
  a[e].coeffs[24][m[7]] = (short)j.s3;
  a[e].coeffs[24][m[8]] = (short)k.s0;
  a[e].coeffs[24][m[9]] = (short)k.s1;
  a[e].coeffs[24][m[10]] = (short)k.s2;
  a[e].coeffs[24][m[11]] = (short)k.s3;
  a[e].coeffs[24][m[12]] = (short)l.s0;
  a[e].coeffs[24][m[13]] = (short)l.s1;
  a[e].coeffs[24][m[14]] = (short)l.s2;
  a[e].coeffs[24][m[15]] = (short)l.s3;
  F(&i, &j, &k, &l, f, g);
  a[e].coeffs[0][0] = (short)i.s0;
  a[e].coeffs[1][0] = (short)i.s1;
  a[e].coeffs[2][0] = (short)i.s2;
  a[e].coeffs[3][0] = (short)i.s3;
  a[e].coeffs[4][0] = (short)j.s0;
  a[e].coeffs[5][0] = (short)j.s1;
  a[e].coeffs[6][0] = (short)j.s2;
  a[e].coeffs[7][0] = (short)j.s3;
  a[e].coeffs[8][0] = (short)k.s0;
  a[e].coeffs[9][0] = (short)k.s1;
  a[e].coeffs[10][0] = (short)k.s2;
  a[e].coeffs[11][0] = (short)k.s3;
  a[e].coeffs[12][0] = (short)l.s0;
  a[e].coeffs[13][0] = (short)l.s1;
  a[e].coeffs[14][0] = (short)l.s2;
  a[e].coeffs[15][0] = (short)l.s3;

  return;
}

__kernel void S(__global uchar4* const restrict a, __global uchar4* const restrict b, __global macroblock* const c, const int d, __constant segment_data* const e, const segment_ids f, const float g, const int h) {
  __private int i, j, k, l, m, n, o, p, q, r;
  __private int s;
  __private int4 t, u, v, w;
  __private int x = (h == 0) ? 16 : 8;

  i = get_global_id(0);
  m = (i % (d / 4)) * 4;
  n = (i / (d / 4)) * 4;
  j = (n / x) * (d / x) + (m / x);

  if (c[j].SSIM > g)
    return;

  c[j].segment_id = f;
  s = e[f].y_ac_i;

  p = e[0].y_dc_idelta;
  p += s;
  p = ((p < 0) ? (0) : ((int)p));
  p = ((p > 127) ? (127) : ((int)p));
  o = Gb[s];
  p = (c[j].parts == are16x16) ? 1 : Ga[p];
  q = e[0].uv_dc_idelta;
  q += s;
  r = e[0].uv_ac_idelta;
  r += s;
  q = ((q < 0) ? (0) : (q));
  q = ((q > 127) ? (127) : (q));
  r = ((r < 0) ? (0) : (r));
  r = ((r > 127) ? (127) : (r));
  q = Ga[q];
  r = Gb[r];
  q = ((q > 132) ? (132) : (q));
  p = ((h == 0) ? (p) : (q));
  o = ((h == 0) ? (o) : (r));

  k = (m % x) / 4;
  l = (n % x) / 4;
  i = l * (x / 4) + k;
  i += (h == 1) ? 16 : 0;
  i += (h == 2) ? 20 : 0;
  const int y[16] = {0, 1, 5, 6, 2, 4, 7, 12, 3, 8, 11, 13, 9, 10, 14, 15};
  t.s0 = c[j].coeffs[i][y[0]];
  t.s1 = c[j].coeffs[i][y[1]];
  t.s2 = c[j].coeffs[i][y[2]];
  t.s3 = c[j].coeffs[i][y[3]];
  u.s0 = c[j].coeffs[i][y[4]];
  u.s1 = c[j].coeffs[i][y[5]];
  u.s2 = c[j].coeffs[i][y[6]];
  u.s3 = c[j].coeffs[i][y[7]];
  v.s0 = c[j].coeffs[i][y[8]];
  v.s1 = c[j].coeffs[i][y[9]];
  v.s2 = c[j].coeffs[i][y[10]];
  v.s3 = c[j].coeffs[i][y[11]];
  w.s0 = c[j].coeffs[i][y[12]];
  w.s1 = c[j].coeffs[i][y[13]];
  w.s2 = c[j].coeffs[i][y[14]];
  w.s3 = c[j].coeffs[i][y[15]];
  D(&t, &u, &v, &w, p, o);
  s = n * d + m;
  s /= 4;
  t += convert_int4(b[s]);
  s += d / 4;
  u += convert_int4(b[s]);
  s += d / 4;
  v += convert_int4(b[s]);
  s += d / 4;
  w += convert_int4(b[s]);
  s -= 3 * d / 4;
  a[s] = convert_uchar4_sat(t);
  s += d / 4;
  a[s] = convert_uchar4_sat(u);
  s += d / 4;
  a[s] = convert_uchar4_sat(v);
  s += d / 4;
  a[s] = convert_uchar4_sat(w);

  return;
}

__kernel void T(__global uchar4* const a, __global uchar4* const b, __global macroblock* const c, __global float* const d, const int e, const int f) {
  __private int g, h;
  __private float4 i, j;
  __private float k, l, m, n;
  __private int o;
  g = get_global_id(0);
  if (c[g].segment_id != f)
    return;
  o = e / 16;
  h = ((g / (o)) * 16) * e + ((g % (o)) * 16);
  o = e / 4;
  h /= 4;

  i = convert_float4(a[h]);
  i += convert_float4(a[h + 1]);
  i += convert_float4(a[h + 2]);
  i += convert_float4(a[h + 3]);
  h += o;
  i += convert_float4(a[h]);
  i += convert_float4(a[h + 1]);
  i += convert_float4(a[h + 2]);
  i += convert_float4(a[h + 3]);
  h += o;
  i += convert_float4(a[h]);
  i += convert_float4(a[h + 1]);
  i += convert_float4(a[h + 2]);
  i += convert_float4(a[h + 3]);
  h += o;
  i += convert_float4(a[h]);
  i += convert_float4(a[h + 1]);
  i += convert_float4(a[h + 2]);
  i += convert_float4(a[h + 3]);
  h += o;
  i += convert_float4(a[h]);
  i += convert_float4(a[h + 1]);
  i += convert_float4(a[h + 2]);
  i += convert_float4(a[h + 3]);
  h += o;
  i += convert_float4(a[h]);
  i += convert_float4(a[h + 1]);
  i += convert_float4(a[h + 2]);
  i += convert_float4(a[h + 3]);
  h += o;
  i += convert_float4(a[h]);
  i += convert_float4(a[h + 1]);
  i += convert_float4(a[h + 2]);
  i += convert_float4(a[h + 3]);
  h += o;
  i += convert_float4(a[h]);
  i += convert_float4(a[h + 1]);
  i += convert_float4(a[h + 2]);
  i += convert_float4(a[h + 3]);
  h += o;
  i += convert_float4(a[h]);
  i += convert_float4(a[h + 1]);
  i += convert_float4(a[h + 2]);
  i += convert_float4(a[h + 3]);
  h += o;
  i += convert_float4(a[h]);
  i += convert_float4(a[h + 1]);
  i += convert_float4(a[h + 2]);
  i += convert_float4(a[h + 3]);
  h += o;
  i += convert_float4(a[h]);
  i += convert_float4(a[h + 1]);
  i += convert_float4(a[h + 2]);
  i += convert_float4(a[h + 3]);
  h += o;
  i += convert_float4(a[h]);
  i += convert_float4(a[h + 1]);
  i += convert_float4(a[h + 2]);
  i += convert_float4(a[h + 3]);
  h += o;
  i += convert_float4(a[h]);
  i += convert_float4(a[h + 1]);
  i += convert_float4(a[h + 2]);
  i += convert_float4(a[h + 3]);
  h += o;
  i += convert_float4(a[h]);
  i += convert_float4(a[h + 1]);
  i += convert_float4(a[h + 2]);
  i += convert_float4(a[h + 3]);
  h += o;
  i += convert_float4(a[h]);
  i += convert_float4(a[h + 1]);
  i += convert_float4(a[h + 2]);
  i += convert_float4(a[h + 3]);
  h += o;
  i += convert_float4(a[h]);
  i += convert_float4(a[h + 1]);
  i += convert_float4(a[h + 2]);
  i += convert_float4(a[h + 3]);
  h -= 15 * o;
  k = (i.s0 + i.s1 + i.s2 + i.s3) / 256;

  i = convert_float4(a[h]) - k;
  i *= i;
  j = convert_float4(a[h + 1]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 2]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 3]) - k;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(a[h]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 1]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 2]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 3]) - k;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(a[h]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 1]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 2]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 3]) - k;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(a[h]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 1]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 2]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 3]) - k;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(a[h]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 1]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 2]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 3]) - k;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(a[h]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 1]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 2]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 3]) - k;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(a[h]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 1]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 2]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 3]) - k;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(a[h]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 1]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 2]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 3]) - k;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(a[h]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 1]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 2]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 3]) - k;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(a[h]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 1]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 2]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 3]) - k;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(a[h]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 1]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 2]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 3]) - k;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(a[h]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 1]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 2]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 3]) - k;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(a[h]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 1]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 2]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 3]) - k;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(a[h]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 1]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 2]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 3]) - k;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(a[h]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 1]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 2]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 3]) - k;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(a[h]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 1]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 2]) - k;
  i = mad(j, j, i);
  j = convert_float4(a[h + 3]) - k;
  i = mad(j, j, i);
  h -= 15 * o;
  m = (i.s0 + i.s1 + i.s2 + i.s3) / 256;

  i = convert_float4(b[h]);
  i += convert_float4(b[h + 1]);
  i += convert_float4(b[h + 2]);
  i += convert_float4(b[h + 3]);
  h += o;
  i += convert_float4(b[h]);
  i += convert_float4(b[h + 1]);
  i += convert_float4(b[h + 2]);
  i += convert_float4(b[h + 3]);
  h += o;
  i += convert_float4(b[h]);
  i += convert_float4(b[h + 1]);
  i += convert_float4(b[h + 2]);
  i += convert_float4(b[h + 3]);
  h += o;
  i += convert_float4(b[h]);
  i += convert_float4(b[h + 1]);
  i += convert_float4(b[h + 2]);
  i += convert_float4(b[h + 3]);
  h += o;
  i += convert_float4(b[h]);
  i += convert_float4(b[h + 1]);
  i += convert_float4(b[h + 2]);
  i += convert_float4(b[h + 3]);
  h += o;
  i += convert_float4(b[h]);
  i += convert_float4(b[h + 1]);
  i += convert_float4(b[h + 2]);
  i += convert_float4(b[h + 3]);
  h += o;
  i += convert_float4(b[h]);
  i += convert_float4(b[h + 1]);
  i += convert_float4(b[h + 2]);
  i += convert_float4(b[h + 3]);
  h += o;
  i += convert_float4(b[h]);
  i += convert_float4(b[h + 1]);
  i += convert_float4(b[h + 2]);
  i += convert_float4(b[h + 3]);
  h += o;
  i += convert_float4(b[h]);
  i += convert_float4(b[h + 1]);
  i += convert_float4(b[h + 2]);
  i += convert_float4(b[h + 3]);
  h += o;
  i += convert_float4(b[h]);
  i += convert_float4(b[h + 1]);
  i += convert_float4(b[h + 2]);
  i += convert_float4(b[h + 3]);
  h += o;
  i += convert_float4(b[h]);
  i += convert_float4(b[h + 1]);
  i += convert_float4(b[h + 2]);
  i += convert_float4(b[h + 3]);
  h += o;
  i += convert_float4(b[h]);
  i += convert_float4(b[h + 1]);
  i += convert_float4(b[h + 2]);
  i += convert_float4(b[h + 3]);
  h += o;
  i += convert_float4(b[h]);
  i += convert_float4(b[h + 1]);
  i += convert_float4(b[h + 2]);
  i += convert_float4(b[h + 3]);
  h += o;
  i += convert_float4(b[h]);
  i += convert_float4(b[h + 1]);
  i += convert_float4(b[h + 2]);
  i += convert_float4(b[h + 3]);
  h += o;
  i += convert_float4(b[h]);
  i += convert_float4(b[h + 1]);
  i += convert_float4(b[h + 2]);
  i += convert_float4(b[h + 3]);
  h += o;
  i += convert_float4(b[h]);
  i += convert_float4(b[h + 1]);
  i += convert_float4(b[h + 2]);
  i += convert_float4(b[h + 3]);
  h -= 15 * o;
  l = (i.s0 + i.s1 + i.s2 + i.s3) / 256;

  i = convert_float4(b[h]) - l;
  i *= i;
  j = convert_float4(b[h + 1]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 2]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 3]) - l;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(b[h]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 1]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 2]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 3]) - l;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(b[h]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 1]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 2]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 3]) - l;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(b[h]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 1]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 2]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 3]) - l;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(b[h]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 1]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 2]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 3]) - l;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(b[h]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 1]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 2]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 3]) - l;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(b[h]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 1]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 2]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 3]) - l;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(b[h]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 1]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 2]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 3]) - l;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(b[h]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 1]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 2]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 3]) - l;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(b[h]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 1]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 2]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 3]) - l;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(b[h]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 1]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 2]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 3]) - l;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(b[h]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 1]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 2]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 3]) - l;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(b[h]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 1]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 2]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 3]) - l;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(b[h]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 1]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 2]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 3]) - l;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(b[h]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 1]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 2]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 3]) - l;
  i = mad(j, j, i);
  h += o;
  j = convert_float4(b[h]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 1]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 2]) - l;
  i = mad(j, j, i);
  j = convert_float4(b[h + 3]) - l;
  i = mad(j, j, i);
  h -= 15 * o;
  m += (i.s0 + i.s1 + i.s2 + i.s3) / 256;

  i = (convert_float4(a[h]) - k) * (convert_float4(b[h]) - l);
  i += (convert_float4(a[h + 1]) - k) * (convert_float4(b[h + 1]) - l);
  i += (convert_float4(a[h + 2]) - k) * (convert_float4(b[h + 2]) - l);
  i += (convert_float4(a[h + 3]) - k) * (convert_float4(b[h + 3]) - l);
  h += o;
  i += (convert_float4(a[h]) - k) * (convert_float4(b[h]) - l);
  i += (convert_float4(a[h + 1]) - k) * (convert_float4(b[h + 1]) - l);
  i += (convert_float4(a[h + 2]) - k) * (convert_float4(b[h + 2]) - l);
  i += (convert_float4(a[h + 3]) - k) * (convert_float4(b[h + 3]) - l);
  h += o;
  i += (convert_float4(a[h]) - k) * (convert_float4(b[h]) - l);
  i += (convert_float4(a[h + 1]) - k) * (convert_float4(b[h + 1]) - l);
  i += (convert_float4(a[h + 2]) - k) * (convert_float4(b[h + 2]) - l);
  i += (convert_float4(a[h + 3]) - k) * (convert_float4(b[h + 3]) - l);
  h += o;
  i += (convert_float4(a[h]) - k) * (convert_float4(b[h]) - l);
  i += (convert_float4(a[h + 1]) - k) * (convert_float4(b[h + 1]) - l);
  i += (convert_float4(a[h + 2]) - k) * (convert_float4(b[h + 2]) - l);
  i += (convert_float4(a[h + 3]) - k) * (convert_float4(b[h + 3]) - l);
  h += o;
  i += (convert_float4(a[h]) - k) * (convert_float4(b[h]) - l);
  i += (convert_float4(a[h + 1]) - k) * (convert_float4(b[h + 1]) - l);
  i += (convert_float4(a[h + 2]) - k) * (convert_float4(b[h + 2]) - l);
  i += (convert_float4(a[h + 3]) - k) * (convert_float4(b[h + 3]) - l);
  h += o;
  i += (convert_float4(a[h]) - k) * (convert_float4(b[h]) - l);
  i += (convert_float4(a[h + 1]) - k) * (convert_float4(b[h + 1]) - l);
  i += (convert_float4(a[h + 2]) - k) * (convert_float4(b[h + 2]) - l);
  i += (convert_float4(a[h + 3]) - k) * (convert_float4(b[h + 3]) - l);
  h += o;
  i += (convert_float4(a[h]) - k) * (convert_float4(b[h]) - l);
  i += (convert_float4(a[h + 1]) - k) * (convert_float4(b[h + 1]) - l);
  i += (convert_float4(a[h + 2]) - k) * (convert_float4(b[h + 2]) - l);
  i += (convert_float4(a[h + 3]) - k) * (convert_float4(b[h + 3]) - l);
  h += o;
  i += (convert_float4(a[h]) - k) * (convert_float4(b[h]) - l);
  i += (convert_float4(a[h + 1]) - k) * (convert_float4(b[h + 1]) - l);
  i += (convert_float4(a[h + 2]) - k) * (convert_float4(b[h + 2]) - l);
  i += (convert_float4(a[h + 3]) - k) * (convert_float4(b[h + 3]) - l);
  h += o;
  i += (convert_float4(a[h]) - k) * (convert_float4(b[h]) - l);
  i += (convert_float4(a[h + 1]) - k) * (convert_float4(b[h + 1]) - l);
  i += (convert_float4(a[h + 2]) - k) * (convert_float4(b[h + 2]) - l);
  i += (convert_float4(a[h + 3]) - k) * (convert_float4(b[h + 3]) - l);
  h += o;
  i += (convert_float4(a[h]) - k) * (convert_float4(b[h]) - l);
  i += (convert_float4(a[h + 1]) - k) * (convert_float4(b[h + 1]) - l);
  i += (convert_float4(a[h + 2]) - k) * (convert_float4(b[h + 2]) - l);
  i += (convert_float4(a[h + 3]) - k) * (convert_float4(b[h + 3]) - l);
  h += o;
  i += (convert_float4(a[h]) - k) * (convert_float4(b[h]) - l);
  i += (convert_float4(a[h + 1]) - k) * (convert_float4(b[h + 1]) - l);
  i += (convert_float4(a[h + 2]) - k) * (convert_float4(b[h + 2]) - l);
  i += (convert_float4(a[h + 3]) - k) * (convert_float4(b[h + 3]) - l);
  h += o;
  i += (convert_float4(a[h]) - k) * (convert_float4(b[h]) - l);
  i += (convert_float4(a[h + 1]) - k) * (convert_float4(b[h + 1]) - l);
  i += (convert_float4(a[h + 2]) - k) * (convert_float4(b[h + 2]) - l);
  i += (convert_float4(a[h + 3]) - k) * (convert_float4(b[h + 3]) - l);
  h += o;
  i += (convert_float4(a[h]) - k) * (convert_float4(b[h]) - l);
  i += (convert_float4(a[h + 1]) - k) * (convert_float4(b[h + 1]) - l);
  i += (convert_float4(a[h + 2]) - k) * (convert_float4(b[h + 2]) - l);
  i += (convert_float4(a[h + 3]) - k) * (convert_float4(b[h + 3]) - l);
  h += o;
  i += (convert_float4(a[h]) - k) * (convert_float4(b[h]) - l);
  i += (convert_float4(a[h + 1]) - k) * (convert_float4(b[h + 1]) - l);
  i += (convert_float4(a[h + 2]) - k) * (convert_float4(b[h + 2]) - l);
  i += (convert_float4(a[h + 3]) - k) * (convert_float4(b[h + 3]) - l);
  h += o;
  i += (convert_float4(a[h]) - k) * (convert_float4(b[h]) - l);
  i += (convert_float4(a[h + 1]) - k) * (convert_float4(b[h + 1]) - l);
  i += (convert_float4(a[h + 2]) - k) * (convert_float4(b[h + 2]) - l);
  i += (convert_float4(a[h + 3]) - k) * (convert_float4(b[h + 3]) - l);
  h += o;
  i += (convert_float4(a[h]) - k) * (convert_float4(b[h]) - l);
  i += (convert_float4(a[h + 1]) - k) * (convert_float4(b[h + 1]) - l);
  i += (convert_float4(a[h + 2]) - k) * (convert_float4(b[h + 2]) - l);
  i += (convert_float4(a[h + 3]) - k) * (convert_float4(b[h + 3]) - l);
  n = (i.s0 + i.s1 + i.s2 + i.s3) / 256;

  const float p = 0.01f * 0.01f * 255 * 255;
  const float q = 0.03f * 0.03f * 255 * 255;
  n = mad(k, l * 2, p) * mad(n, 2, q) / (mad(k, k, mad(l, l, p)) * (m + q));

  m = (k - l);
  m = ((m < 0) ? (-m) : (m));
  m = ((m > 4) ? (0.02f * m) : (0.0f));
  n -= m;

  d[g] = n;

  return;
}

__kernel void U(__global uchar4* const a, __global uchar4* const b, __global macroblock* const c, __global float* const d, const int e, const int f) {
  const float g = 0.01f * 0.01f * 255 * 255;
  const float h = 0.03f * 0.03f * 255 * 255;
  __private int i, j;
  __private float k, l, m, n;
  __private int o;
  i = get_global_id(0);
  if (c[i].segment_id != f)
    return;

  __private float4 p, q;

  o = e / 8;
  j = ((i / (o)) * 8) * e + ((i % (o)) * 8);
  o = e / 4;
  j /= 4;

  p = convert_float4(a[j]);
  p += convert_float4(a[j + 1]);
  j += o;
  p += convert_float4(a[j]);
  p += convert_float4(a[j + 1]);
  j += o;
  p += convert_float4(a[j]);
  p += convert_float4(a[j + 1]);
  j += o;
  p += convert_float4(a[j]);
  p += convert_float4(a[j + 1]);
  j += o;
  p += convert_float4(a[j]);
  p += convert_float4(a[j + 1]);
  j += o;
  p += convert_float4(a[j]);
  p += convert_float4(a[j + 1]);
  j += o;
  p += convert_float4(a[j]);
  p += convert_float4(a[j + 1]);
  j += o;
  p += convert_float4(a[j]);
  p += convert_float4(a[j + 1]);
  j -= 7 * o;
  k = (p.s0 + p.s1 + p.s2 + p.s3) / 64;

  p = convert_float4(a[j]) - k;
  p *= p;
  q = convert_float4(a[j + 1]) - k;
  p = mad(q, q, p);
  j += o;
  q = convert_float4(a[j]) - k;
  p = mad(q, q, p);
  q = convert_float4(a[j + 1]) - k;
  p = mad(q, q, p);
  j += o;
  q = convert_float4(a[j]) - k;
  p = mad(q, q, p);
  q = convert_float4(a[j + 1]) - k;
  p = mad(q, q, p);
  j += o;
  q = convert_float4(a[j]) - k;
  p = mad(q, q, p);
  q = convert_float4(a[j + 1]) - k;
  p = mad(q, q, p);
  j += o;
  q = convert_float4(a[j]) - k;
  p = mad(q, q, p);
  q = convert_float4(a[j + 1]) - k;
  p = mad(q, q, p);
  j += o;
  q = convert_float4(a[j]) - k;
  p = mad(q, q, p);
  q = convert_float4(a[j + 1]) - k;
  p = mad(q, q, p);
  j += o;
  q = convert_float4(a[j]) - k;
  p = mad(q, q, p);
  q = convert_float4(a[j + 1]) - k;
  p = mad(q, q, p);
  j += o;
  q = convert_float4(a[j]) - k;
  p = mad(q, q, p);
  q = convert_float4(a[j + 1]) - k;
  p = mad(q, q, p);
  j -= 7 * o;
  m = (p.s0 + p.s1 + p.s2 + p.s3) / 64;

  p = convert_float4(b[j]);
  p += convert_float4(b[j + 1]);
  j += o;
  p += convert_float4(b[j]);
  p += convert_float4(b[j + 1]);
  j += o;
  p += convert_float4(b[j]);
  p += convert_float4(b[j + 1]);
  j += o;
  p += convert_float4(b[j]);
  p += convert_float4(b[j + 1]);
  j += o;
  p += convert_float4(b[j]);
  p += convert_float4(b[j + 1]);
  j += o;
  p += convert_float4(b[j]);
  p += convert_float4(b[j + 1]);
  j += o;
  p += convert_float4(b[j]);
  p += convert_float4(b[j + 1]);
  j += o;
  p += convert_float4(b[j]);
  p += convert_float4(b[j + 1]);
  j -= 7 * o;
  l = (p.s0 + p.s1 + p.s2 + p.s3) / 64;

  p = convert_float4(b[j]) - l;
  p *= p;
  q = convert_float4(b[j + 1]) - l;
  p = mad(q, q, p);
  j += o;
  q = convert_float4(b[j]) - l;
  p = mad(q, q, p);
  q = convert_float4(b[j + 1]) - l;
  p = mad(q, q, p);
  j += o;
  q = convert_float4(b[j]) - l;
  p = mad(q, q, p);
  q = convert_float4(b[j + 1]) - l;
  p = mad(q, q, p);
  j += o;
  q = convert_float4(b[j]) - l;
  p = mad(q, q, p);
  q = convert_float4(b[j + 1]) - l;
  p = mad(q, q, p);
  j += o;
  q = convert_float4(b[j]) - l;
  p = mad(q, q, p);
  q = convert_float4(b[j + 1]) - l;
  p = mad(q, q, p);
  j += o;
  q = convert_float4(b[j]) - l;
  p = mad(q, q, p);
  q = convert_float4(b[j + 1]) - l;
  p = mad(q, q, p);
  j += o;
  q = convert_float4(b[j]) - l;
  p = mad(q, q, p);
  q = convert_float4(b[j + 1]) - l;
  p = mad(q, q, p);
  j += o;
  q = convert_float4(b[j]) - l;
  p = mad(q, q, p);
  q = convert_float4(b[j + 1]) - l;
  p = mad(q, q, p);
  j -= 7 * o;
  m += (p.s0 + p.s1 + p.s2 + p.s3) / 64;

  p = (convert_float4(a[j]) - k) * (convert_float4(b[j]) - l);
  p += (convert_float4(a[j + 1]) - k) * (convert_float4(b[j + 1]) - l);
  j += o;
  p += (convert_float4(a[j]) - k) * (convert_float4(b[j]) - l);
  p += (convert_float4(a[j + 1]) - k) * (convert_float4(b[j + 1]) - l);
  j += o;
  p += (convert_float4(a[j]) - k) * (convert_float4(b[j]) - l);
  p += (convert_float4(a[j + 1]) - k) * (convert_float4(b[j + 1]) - l);
  j += o;
  p += (convert_float4(a[j]) - k) * (convert_float4(b[j]) - l);
  p += (convert_float4(a[j + 1]) - k) * (convert_float4(b[j + 1]) - l);
  j += o;
  p += (convert_float4(a[j]) - k) * (convert_float4(b[j]) - l);
  p += (convert_float4(a[j + 1]) - k) * (convert_float4(b[j + 1]) - l);
  j += o;
  p += (convert_float4(a[j]) - k) * (convert_float4(b[j]) - l);
  p += (convert_float4(a[j + 1]) - k) * (convert_float4(b[j + 1]) - l);
  j += o;
  p += (convert_float4(a[j]) - k) * (convert_float4(b[j]) - l);
  p += (convert_float4(a[j + 1]) - k) * (convert_float4(b[j + 1]) - l);
  j += o;
  p += (convert_float4(a[j]) - k) * (convert_float4(b[j]) - l);
  p += (convert_float4(a[j + 1]) - k) * (convert_float4(b[j + 1]) - l);
  n = (p.s0 + p.s1 + p.s2 + p.s3) / 64;

  n = mad(k, l * 2, g) * mad(n, 2, h) / (mad(k, k, mad(l, l, g)) * (m + h));

  m = (k - l);
  m = ((m < 0) ? (-m) : (m));
  m = ((m > 4) ? (0.02f * m) : (0.0f));
  n -= m;

  d[i] = n;
  return;
}

void __kernel V(__global float* const a, __global float* const b, __global float* const c, __global macroblock* const d) {
  __private int e = get_global_id(0);
  d[e].SSIM = (a[e] + b[e] + c[e]) / 3;
  return;
}