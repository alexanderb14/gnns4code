typedef short JCOEF; typedef JCOEF JBLOCK[64]; typedef JBLOCK* JBLOCKROW; typedef JBLOCKROW* JBLOCKARRAY; typedef JBLOCKARRAY* JBLOCKIMAGE; typedef unsigned char JSAMPLE; typedef JSAMPLE* JSAMPROW; typedef JSAMPROW* JSAMPARRAY; typedef JSAMPARRAY* JSAMPIMAGE; typedef unsigned int JDIMENSION; typedef int INT32; typedef short INT16; typedef float FAST_FLOAT; typedef FAST_FLOAT FLOAT_MULT_TYPE; typedef float DCT_FLOAT; struct ComponentInfo {
  unsigned int src_width;
  unsigned int src_height;
  unsigned int resize_blks_in_row;
  unsigned int resize_blks_in_height;
  unsigned int resize_blks_out_row;
  unsigned int resize_blks_out_height;

  int idct_blks_in_row;

  unsigned int dst_blks_in_row;
  unsigned int dst_blks_in_height;
  float idct_table[64];
  float fdct_table[64];
  int idct_int_table[64];
  int fdct_int_table[64];
};

struct DecodeInfo {
  struct ComponentInfo compInfo[10];
};

struct QuantiTable {
  float idct_table_f[4][64];
  float fdct_table_f[4][64];
  int idct_table_i[4][64];
  int fdct_table_i[4][64];
};

void A(__local JCOEF* a, __local DCT_FLOAT* b, uchar8* c, __local FAST_FLOAT* d) {
  FAST_FLOAT e, f, g, h, i, j, k, l;
  FAST_FLOAT m, n, o, p;
  FAST_FLOAT q, r, s, t, u;
  __local DCT_FLOAT* v;
  __local FAST_FLOAT* w;
  __local JCOEF* x;
  x = a;
  int y = get_global_id(1);
  w = d;
  v = b;

  x += y;
  v += y;
  w += y;
  if (x[8 * 1] == 0 && x[8 * 2] == 0 && x[8 * 3] == 0 && x[8 * 4] == 0 && x[8 * 5] == 0 && x[8 * 6] == 0 && x[8 * 7] == 0) {
    FAST_FLOAT z = (((FAST_FLOAT)(x[8 * 0])) * (v[8 * 0]));

    w[8 * 0] = z;
    w[8 * 1] = z;
    w[8 * 2] = z;
    w[8 * 3] = z;
    w[8 * 4] = z;
    w[8 * 5] = z;
    w[8 * 6] = z;
    w[8 * 7] = z;
  } else {
    e = (((FAST_FLOAT)(x[8 * 0])) * (v[8 * 0]));
    f = (((FAST_FLOAT)(x[8 * 2])) * (v[8 * 2]));
    g = (((FAST_FLOAT)(x[8 * 4])) * (v[8 * 4]));
    h = (((FAST_FLOAT)(x[8 * 6])) * (v[8 * 6]));

    m = e + g;
    n = e - g;

    p = f + h;
    o = (f - h) * ((FAST_FLOAT)1.414213562) - p;

    e = m + p;
    h = m - p;
    f = n + o;
    g = n - o;

    i = (((FAST_FLOAT)(x[8 * 1])) * (v[8 * 1]));
    j = (((FAST_FLOAT)(x[8 * 3])) * (v[8 * 3]));
    k = (((FAST_FLOAT)(x[8 * 5])) * (v[8 * 5]));
    l = (((FAST_FLOAT)(x[8 * 7])) * (v[8 * 7]));

    u = k + j;
    r = k - j;
    s = i + l;
    t = i - l;

    l = s + u;
    n = (s - u) * ((FAST_FLOAT)1.414213562);

    q = (r + t) * ((FAST_FLOAT)1.847759065);
    m = ((FAST_FLOAT)1.082392200) * t - q;
    o = ((FAST_FLOAT)-2.613125930) * r + q;

    k = o - l;
    j = n - k;
    i = m + j;

    w[8 * 0] = e + l;
    w[8 * 7] = e - l;
    w[8 * 1] = f + k;
    w[8 * 6] = f - k;
    w[8 * 2] = g + j;
    w[8 * 5] = g - j;
    w[8 * 4] = h + i;
    w[8 * 3] = h - i;
  }
  barrier(1);

  w = d;
  w += 8 * y;

  m = w[0] + w[4];
  n = w[0] - w[4];
  p = w[2] + w[6];
  o = (w[2] - w[6]) * ((FAST_FLOAT)1.414213562) - p;

  e = m + p;
  h = m - p;
  f = n + o;
  g = n - o;

  u = w[5] + w[3];
  r = w[5] - w[3];
  s = w[1] + w[7];
  t = w[1] - w[7];

  l = s + u;
  n = (s - u) * ((FAST_FLOAT)1.414213562);

  q = (r + t) * ((FAST_FLOAT)1.847759065);
  m = ((FAST_FLOAT)1.082392200) * t - q;
  o = ((FAST_FLOAT)-2.613125930) * r + q;

  k = o - l;
  j = n - k;
  i = m + j;

  uchar8 aa;

  aa.s0 = clamp((int)((((int)(e + l)) + (((INT32)1) << ((3) - 1))) >> (3)) + 128, 0, 255);
  aa.s7 = clamp((int)((((int)(e - l)) + (((INT32)1) << ((3) - 1))) >> (3)) + 128, 0, 255);
  aa.s1 = clamp((int)((((int)(f + k)) + (((INT32)1) << ((3) - 1))) >> (3)) + 128, 0, 255);
  aa.s6 = clamp((int)((((int)(f - k)) + (((INT32)1) << ((3) - 1))) >> (3)) + 128, 0, 255);
  aa.s2 = clamp((int)((((int)(g + j)) + (((INT32)1) << ((3) - 1))) >> (3)) + 128, 0, 255);
  aa.s5 = clamp((int)((((int)(g - j)) + (((INT32)1) << ((3) - 1))) >> (3)) + 128, 0, 255);
  aa.s4 = clamp((int)((((int)(h + i)) + (((INT32)1) << ((3) - 1))) >> (3)) + 128, 0, 255);
  aa.s3 = clamp((int)((((int)(h - i)) + (((INT32)1) << ((3) - 1))) >> (3)) + 128, 0, 255);
  *c = aa;
}

void B(__global JCOEF* a, __local int* b, uchar16* c, uchar16* d, __local int* e)

{
  INT32 f, g, h, i, j, k, l, m;
  INT32 n, o, p, q, r, s, t, u;
  INT32 v, w, x, y;
  __local int* z;
  __local int* aa;
  __global JCOEF* ab;
  ab = a;
  int ac = get_global_id(1);
  aa = e;
  z = b;

  ab += ac;
  z += ac;
  aa += ac;

  f = (((int)(ab[8 * 0])) * (z[8 * 0]));
  f <<= 13;
  f += 1 << (13 - 2 - 1);

  v = (((int)(ab[8 * 4])) * (z[8 * 4]));
  g = ((v) * (((INT32)((1.306562965) * (((INT32)1) << 13) + 0.5))));
  h = ((v) * (((INT32)4433)));

  j = f + g;
  k = f - g;
  l = f + h;
  m = f - h;

  v = (((int)(ab[8 * 2])) * (z[8 * 2]));
  w = (((int)(ab[8 * 6])) * (z[8 * 6]));
  x = v - w;
  y = ((x) * (((INT32)((0.275899379) * (((INT32)1) << 13) + 0.5))));
  x = ((x) * (((INT32)((1.387039845) * (((INT32)1) << 13) + 0.5))));

  f = x + ((w) * (((INT32)20995)));
  g = y + ((v) * (((INT32)7373)));
  h = x - ((v) * (((INT32)((0.601344887) * (((INT32)1) << 13) + 0.5))));
  i = y - ((w) * (((INT32)((0.509795579) * (((INT32)1) << 13) + 0.5))));

  n = j + f;
  u = j - f;
  o = l + g;
  t = l - g;
  p = m + h;
  s = m - h;
  q = k + i;
  r = k - i;

  v = (((int)(ab[8 * 1])) * (z[8 * 1]));
  w = (((int)(ab[8 * 3])) * (z[8 * 3]));
  x = (((int)(ab[8 * 5])) * (z[8 * 5]));
  y = (((int)(ab[8 * 7])) * (z[8 * 7]));

  k = v + x;

  g = ((v + w) * (((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5))));
  h = ((k) * (((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
  i = ((v + y) * (((INT32)((1.093201867) * (((INT32)1) << 13) + 0.5))));
  j = ((v - y) * (((INT32)((0.897167586) * (((INT32)1) << 13) + 0.5))));
  k = ((k) * (((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
  l = ((v - w) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  f = g + h + i - ((v) * (((INT32)((2.286341144) * (((INT32)1) << 13) + 0.5))));
  m = j + k + l - ((v) * (((INT32)((1.835730603) * (((INT32)1) << 13) + 0.5))));
  v = ((w + x) * (((INT32)((0.138617169) * (((INT32)1) << 13) + 0.5))));
  g += v + ((w) * (((INT32)((0.071888074) * (((INT32)1) << 13) + 0.5))));
  h += v - ((x) * (((INT32)((1.125726048) * (((INT32)1) << 13) + 0.5))));
  v = ((x - w) * (((INT32)((1.407403738) * (((INT32)1) << 13) + 0.5))));
  k += v - ((x) * (((INT32)((0.766367282) * (((INT32)1) << 13) + 0.5))));
  l += v + ((w) * (((INT32)((1.971951411) * (((INT32)1) << 13) + 0.5))));
  w += y;
  v = ((w) * (-((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
  g += v;
  i += v + ((y) * (((INT32)((1.065388962) * (((INT32)1) << 13) + 0.5))));
  w = ((w) * (-((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
  j += w + ((y) * (((INT32)((3.141271809) * (((INT32)1) << 13) + 0.5))));
  l += w;
  w = ((x + y) * (-((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5))));
  h += w;
  i += w;
  w = ((y - x) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  j += w;
  k += w;

  aa[8 * 0] = (int)((n + f) >> (13 - 2));
  aa[8 * 15] = (int)((n - f) >> (13 - 2));
  aa[8 * 1] = (int)((o + g) >> (13 - 2));
  aa[8 * 14] = (int)((o - g) >> (13 - 2));
  aa[8 * 2] = (int)((p + h) >> (13 - 2));
  aa[8 * 13] = (int)((p - h) >> (13 - 2));
  aa[8 * 3] = (int)((q + i) >> (13 - 2));
  aa[8 * 12] = (int)((q - i) >> (13 - 2));
  aa[8 * 4] = (int)((r + j) >> (13 - 2));
  aa[8 * 11] = (int)((r - j) >> (13 - 2));
  aa[8 * 5] = (int)((s + k) >> (13 - 2));
  aa[8 * 10] = (int)((s - k) >> (13 - 2));
  aa[8 * 6] = (int)((t + l) >> (13 - 2));
  aa[8 * 9] = (int)((t - l) >> (13 - 2));
  aa[8 * 7] = (int)((u + m) >> (13 - 2));
  aa[8 * 8] = (int)((u - m) >> (13 - 2));

  barrier(1);

  aa = e;
  aa += 8 * 2 * ac;
  __local int* ad;
  ad = e;
  ad += 8 * (2 * ac + 1);

  f = (INT32)aa[0] + (((INT32)1) << (2 + 2));
  f <<= 13;

  v = (INT32)aa[4];
  g = ((v) * (((INT32)((1.306562965) * (((INT32)1) << 13) + 0.5))));
  h = ((v) * (((INT32)4433)));

  j = f + g;
  k = f - g;
  l = f + h;
  m = f - h;

  v = (INT32)aa[2];
  w = (INT32)aa[6];
  x = v - w;
  y = ((x) * (((INT32)((0.275899379) * (((INT32)1) << 13) + 0.5))));
  x = ((x) * (((INT32)((1.387039845) * (((INT32)1) << 13) + 0.5))));

  f = x + ((w) * (((INT32)20995)));
  g = y + ((v) * (((INT32)7373)));
  h = x - ((v) * (((INT32)((0.601344887) * (((INT32)1) << 13) + 0.5))));
  i = y - ((w) * (((INT32)((0.509795579) * (((INT32)1) << 13) + 0.5))));

  n = j + f;
  u = j - f;
  o = l + g;
  t = l - g;
  p = m + h;
  s = m - h;
  q = k + i;
  r = k - i;

  v = (INT32)aa[1];
  w = (INT32)aa[3];
  x = (INT32)aa[5];
  y = (INT32)aa[7];

  k = v + x;

  g = ((v + w) * (((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5))));
  h = ((k) * (((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
  i = ((v + y) * (((INT32)((1.093201867) * (((INT32)1) << 13) + 0.5))));
  j = ((v - y) * (((INT32)((0.897167586) * (((INT32)1) << 13) + 0.5))));
  k = ((k) * (((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
  l = ((v - w) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  f = g + h + i - ((v) * (((INT32)((2.286341144) * (((INT32)1) << 13) + 0.5))));
  m = j + k + l - ((v) * (((INT32)((1.835730603) * (((INT32)1) << 13) + 0.5))));
  v = ((w + x) * (((INT32)((0.138617169) * (((INT32)1) << 13) + 0.5))));
  g += v + ((w) * (((INT32)((0.071888074) * (((INT32)1) << 13) + 0.5))));
  h += v - ((x) * (((INT32)((1.125726048) * (((INT32)1) << 13) + 0.5))));
  v = ((x - w) * (((INT32)((1.407403738) * (((INT32)1) << 13) + 0.5))));
  k += v - ((x) * (((INT32)((0.766367282) * (((INT32)1) << 13) + 0.5))));
  l += v + ((w) * (((INT32)((1.971951411) * (((INT32)1) << 13) + 0.5))));
  w += y;
  v = ((w) * (-((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
  g += v;
  i += v + ((y) * (((INT32)((1.065388962) * (((INT32)1) << 13) + 0.5))));
  w = ((w) * (-((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
  j += w + ((y) * (((INT32)((3.141271809) * (((INT32)1) << 13) + 0.5))));
  l += w;
  w = ((x + y) * (-((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5))));
  h += w;
  i += w;
  w = ((y - x) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  j += w;
  k += w;

  uchar16 ae;
  ae.s0 = clamp((int)((n + f) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.sF = clamp((int)((n - f) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.s1 = clamp((int)((o + g) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.sE = clamp((int)((o - g) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.s2 = clamp((int)((p + h) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.sD = clamp((int)((p - h) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.s3 = clamp((int)((q + i) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.sC = clamp((int)((q - i) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.s4 = clamp((int)((r + j) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.sB = clamp((int)((r - j) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.s5 = clamp((int)((s + k) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.sA = clamp((int)((s - k) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.s6 = clamp((int)((t + l) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.s9 = clamp((int)((t - l) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.s7 = clamp((int)((u + m) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.s8 = clamp((int)((u - m) >> (13 + 2 + 3)) + 128, 0, 255);

  f = (INT32)ad[0] + (((INT32)1) << (2 + 2));
  f <<= 13;

  v = (INT32)ad[4];
  g = ((v) * (((INT32)((1.306562965) * (((INT32)1) << 13) + 0.5))));
  h = ((v) * (((INT32)4433)));

  j = f + g;
  k = f - g;
  l = f + h;
  m = f - h;

  v = (INT32)ad[2];
  w = (INT32)ad[6];
  x = v - w;
  y = ((x) * (((INT32)((0.275899379) * (((INT32)1) << 13) + 0.5))));
  x = ((x) * (((INT32)((1.387039845) * (((INT32)1) << 13) + 0.5))));

  f = x + ((w) * (((INT32)20995)));
  g = y + ((v) * (((INT32)7373)));
  h = x - ((v) * (((INT32)((0.601344887) * (((INT32)1) << 13) + 0.5))));
  i = y - ((w) * (((INT32)((0.509795579) * (((INT32)1) << 13) + 0.5))));

  n = j + f;
  u = j - f;
  o = l + g;
  t = l - g;
  p = m + h;
  s = m - h;
  q = k + i;
  r = k - i;

  v = (INT32)ad[1];
  w = (INT32)ad[3];
  x = (INT32)ad[5];
  y = (INT32)ad[7];

  k = v + x;

  g = ((v + w) * (((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5))));
  h = ((k) * (((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
  i = ((v + y) * (((INT32)((1.093201867) * (((INT32)1) << 13) + 0.5))));
  j = ((v - y) * (((INT32)((0.897167586) * (((INT32)1) << 13) + 0.5))));
  k = ((k) * (((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
  l = ((v - w) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  f = g + h + i - ((v) * (((INT32)((2.286341144) * (((INT32)1) << 13) + 0.5))));
  m = j + k + l - ((v) * (((INT32)((1.835730603) * (((INT32)1) << 13) + 0.5))));
  v = ((w + x) * (((INT32)((0.138617169) * (((INT32)1) << 13) + 0.5))));
  g += v + ((w) * (((INT32)((0.071888074) * (((INT32)1) << 13) + 0.5))));
  h += v - ((x) * (((INT32)((1.125726048) * (((INT32)1) << 13) + 0.5))));
  v = ((x - w) * (((INT32)((1.407403738) * (((INT32)1) << 13) + 0.5))));
  k += v - ((x) * (((INT32)((0.766367282) * (((INT32)1) << 13) + 0.5))));
  l += v + ((w) * (((INT32)((1.971951411) * (((INT32)1) << 13) + 0.5))));
  w += y;
  v = ((w) * (-((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
  g += v;
  i += v + ((y) * (((INT32)((1.065388962) * (((INT32)1) << 13) + 0.5))));
  w = ((w) * (-((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
  j += w + ((y) * (((INT32)((3.141271809) * (((INT32)1) << 13) + 0.5))));
  l += w;
  w = ((x + y) * (-((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5))));
  h += w;
  i += w;
  w = ((y - x) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  j += w;
  k += w;

  uchar16 af;
  af.s0 = clamp((int)((n + f) >> (13 + 2 + 3)) + 128, 0, 255);
  af.sF = clamp((int)((n - f) >> (13 + 2 + 3)) + 128, 0, 255);
  af.s1 = clamp((int)((o + g) >> (13 + 2 + 3)) + 128, 0, 255);
  af.sE = clamp((int)((o - g) >> (13 + 2 + 3)) + 128, 0, 255);
  af.s2 = clamp((int)((p + h) >> (13 + 2 + 3)) + 128, 0, 255);
  af.sD = clamp((int)((p - h) >> (13 + 2 + 3)) + 128, 0, 255);
  af.s3 = clamp((int)((q + i) >> (13 + 2 + 3)) + 128, 0, 255);
  af.sC = clamp((int)((q - i) >> (13 + 2 + 3)) + 128, 0, 255);
  af.s4 = clamp((int)((r + j) >> (13 + 2 + 3)) + 128, 0, 255);
  af.sB = clamp((int)((r - j) >> (13 + 2 + 3)) + 128, 0, 255);
  af.s5 = clamp((int)((s + k) >> (13 + 2 + 3)) + 128, 0, 255);
  af.sA = clamp((int)((s - k) >> (13 + 2 + 3)) + 128, 0, 255);
  af.s6 = clamp((int)((t + l) >> (13 + 2 + 3)) + 128, 0, 255);
  af.s9 = clamp((int)((t - l) >> (13 + 2 + 3)) + 128, 0, 255);
  af.s7 = clamp((int)((u + m) >> (13 + 2 + 3)) + 128, 0, 255);
  af.s8 = clamp((int)((u - m) >> (13 + 2 + 3)) + 128, 0, 255);

  *c = ae;
  *d = af;
}

void C(__global JCOEF* a, __local int* b, uchar16* c, __local int* d) {
  __local int* e;
  __local int* f;
  __global JCOEF* g;
  g = a;
  int h = get_global_id(1);
  f = d;
  e = b;

  g += h;
  e += h;
  f += h;

  INT32 i, j, k, l, m, n, o, p;
  INT32 q, r, s, t, u, v, w, x;
  INT32 y, z, aa, ab;

  if (g[8 * 1] == 0 && g[8 * 2] == 0 && g[8 * 3] == 0 && g[8 * 4] == 0 && g[8 * 5] == 0 && g[8 * 6] == 0 && g[8 * 7] == 0) {
    int ac = (((int)(g[8 * 0])) * (e[8 * 0])) << 2;

    f[8 * 0] = ac;
    f[8 * 1] = ac;
    f[8 * 2] = ac;
    f[8 * 3] = ac;
    f[8 * 4] = ac;
    f[8 * 5] = ac;
    f[8 * 6] = ac;
    f[8 * 7] = ac;
  } else {
    z = (((int)(g[8 * 2])) * (e[8 * 2]));
    aa = (((int)(g[8 * 6])) * (e[8 * 6]));

    y = ((z + aa) * (((INT32)4433)));
    k = y + ((z) * (((INT32)6270)));
    l = y - ((aa) * (((INT32)15137)));

    z = (((int)(g[8 * 0])) * (e[8 * 0]));
    aa = (((int)(g[8 * 4])) * (e[8 * 4]));
    z <<= 13;
    aa <<= 13;

    z += ((INT32)1) << (13 - 2 - 1);

    i = z + aa;
    j = z - aa;

    m = i + k;
    p = i - k;
    n = j + l;
    o = j - l;

    i = (((int)(g[8 * 7])) * (e[8 * 7]));
    j = (((int)(g[8 * 5])) * (e[8 * 5]));
    k = (((int)(g[8 * 3])) * (e[8 * 3]));
    l = (((int)(g[8 * 1])) * (e[8 * 1]));

    z = i + k;
    aa = j + l;

    y = ((z + aa) * (((INT32)9633)));
    z = ((z) * (-((INT32)16069)));
    aa = ((aa) * (-((INT32)3196)));
    z += y;
    aa += y;

    y = ((i + l) * (-((INT32)7373)));
    i = ((i) * (((INT32)2446)));
    l = ((l) * (((INT32)12299)));
    i += y + z;
    l += y + aa;

    y = ((j + k) * (-((INT32)20995)));
    j = ((j) * (((INT32)16819)));
    k = ((k) * (((INT32)25172)));
    j += y + aa;
    k += y + z;

    f[8 * 0] = (int)((m + l) >> (13 - 2));
    f[8 * 7] = (int)((m - l) >> (13 - 2));
    f[8 * 1] = (int)((n + k) >> (13 - 2));
    f[8 * 6] = (int)((n - k) >> (13 - 2));
    f[8 * 2] = (int)((o + j) >> (13 - 2));
    f[8 * 5] = (int)((o - j) >> (13 - 2));
    f[8 * 3] = (int)((p + i) >> (13 - 2));
    f[8 * 4] = (int)((p - i) >> (13 - 2));
  }
  barrier(1);
  f = d;
  f += 8 * h;

  i = (INT32)f[0] + (((INT32)1) << (2 + 2));
  i <<= 13;

  y = (INT32)f[4];
  j = ((y) * (((INT32)((1.306562965) * (((INT32)1) << 13) + 0.5))));
  k = ((y) * (((INT32)4433)));

  m = i + j;
  n = i - j;
  o = i + k;
  p = i - k;

  y = (INT32)f[2];
  z = (INT32)f[6];
  aa = y - z;
  ab = ((aa) * (((INT32)((0.275899379) * (((INT32)1) << 13) + 0.5))));
  aa = ((aa) * (((INT32)((1.387039845) * (((INT32)1) << 13) + 0.5))));

  i = aa + ((z) * (((INT32)20995)));
  j = ab + ((y) * (((INT32)7373)));
  k = aa - ((y) * (((INT32)((0.601344887) * (((INT32)1) << 13) + 0.5))));
  l = ab - ((z) * (((INT32)((0.509795579) * (((INT32)1) << 13) + 0.5))));

  q = m + i;
  x = m - i;
  r = o + j;
  w = o - j;
  s = p + k;
  v = p - k;
  t = n + l;
  u = n - l;

  y = (INT32)f[1];
  z = (INT32)f[3];
  aa = (INT32)f[5];
  ab = (INT32)f[7];

  n = y + aa;

  j = ((y + z) * (((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5))));
  k = ((n) * (((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
  l = ((y + ab) * (((INT32)((1.093201867) * (((INT32)1) << 13) + 0.5))));
  m = ((y - ab) * (((INT32)((0.897167586) * (((INT32)1) << 13) + 0.5))));
  n = ((n) * (((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
  o = ((y - z) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  i = j + k + l - ((y) * (((INT32)((2.286341144) * (((INT32)1) << 13) + 0.5))));
  p = m + n + o - ((y) * (((INT32)((1.835730603) * (((INT32)1) << 13) + 0.5))));
  y = ((z + aa) * (((INT32)((0.138617169) * (((INT32)1) << 13) + 0.5))));
  j += y + ((z) * (((INT32)((0.071888074) * (((INT32)1) << 13) + 0.5))));
  k += y - ((aa) * (((INT32)((1.125726048) * (((INT32)1) << 13) + 0.5))));
  y = ((aa - z) * (((INT32)((1.407403738) * (((INT32)1) << 13) + 0.5))));
  n += y - ((aa) * (((INT32)((0.766367282) * (((INT32)1) << 13) + 0.5))));
  o += y + ((z) * (((INT32)((1.971951411) * (((INT32)1) << 13) + 0.5))));
  z += ab;
  y = ((z) * (-((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
  j += y;
  l += y + ((ab) * (((INT32)((1.065388962) * (((INT32)1) << 13) + 0.5))));
  z = ((z) * (-((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
  m += z + ((ab) * (((INT32)((3.141271809) * (((INT32)1) << 13) + 0.5))));
  o += z;
  z = ((aa + ab) * (-((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5))));
  k += z;
  l += z;
  z = ((ab - aa) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  m += z;
  n += z;

  uchar16 ad;
  ad.s0 = clamp((int)((q + i) >> (13 + 2 + 3)) + 128, 0, 255);
  ad.sF = clamp((int)((q - i) >> (13 + 2 + 3)) + 128, 0, 255);
  ad.s1 = clamp((int)((r + j) >> (13 + 2 + 3)) + 128, 0, 255);
  ad.sE = clamp((int)((r - j) >> (13 + 2 + 3)) + 128, 0, 255);
  ad.s2 = clamp((int)((s + k) >> (13 + 2 + 3)) + 128, 0, 255);
  ad.sD = clamp((int)((s - k) >> (13 + 2 + 3)) + 128, 0, 255);
  ad.s3 = clamp((int)((t + l) >> (13 + 2 + 3)) + 128, 0, 255);
  ad.sC = clamp((int)((t - l) >> (13 + 2 + 3)) + 128, 0, 255);
  ad.s4 = clamp((int)((u + m) >> (13 + 2 + 3)) + 128, 0, 255);
  ad.sB = clamp((int)((u - m) >> (13 + 2 + 3)) + 128, 0, 255);
  ad.s5 = clamp((int)((v + n) >> (13 + 2 + 3)) + 128, 0, 255);
  ad.sA = clamp((int)((v - n) >> (13 + 2 + 3)) + 128, 0, 255);
  ad.s6 = clamp((int)((w + o) >> (13 + 2 + 3)) + 128, 0, 255);
  ad.s9 = clamp((int)((w - o) >> (13 + 2 + 3)) + 128, 0, 255);
  ad.s7 = clamp((int)((x + p) >> (13 + 2 + 3)) + 128, 0, 255);
  ad.s8 = clamp((int)((x - p) >> (13 + 2 + 3)) + 128, 0, 255);

  *c = ad;
}

void D(__global JCOEF* a, __local int* b, uchar8* c, uchar8* d, __local int* e) {
  __local int* f;
  __local int* g;
  __global JCOEF* h;
  h = a;
  int i = get_global_id(1);
  g = e;
  f = b;

  h += i;
  f += i;
  g += i;

  INT32 j, k, l, m, n, o, p, q;
  INT32 r, s, t, u, v, w, x, y;
  INT32 z, aa, ab, ac;

  j = (((int)(h[8 * 0])) * (f[8 * 0]));
  j <<= 13;

  j += ((INT32)1) << (13 - 2 - 1);

  z = (((int)(h[8 * 4])) * (f[8 * 4]));
  k = ((z) * (((INT32)((1.306562965) * (((INT32)1) << 13) + 0.5))));
  l = ((z) * (((INT32)4433)));

  n = j + k;
  o = j - k;
  p = j + l;
  q = j - l;

  z = (((int)(h[8 * 2])) * (f[8 * 2]));
  aa = (((int)(h[8 * 6])) * (f[8 * 6]));
  ab = z - aa;
  ac = ((ab) * (((INT32)((0.275899379) * (((INT32)1) << 13) + 0.5))));
  ab = ((ab) * (((INT32)((1.387039845) * (((INT32)1) << 13) + 0.5))));

  j = ab + ((aa) * (((INT32)20995)));
  k = ac + ((z) * (((INT32)7373)));
  l = ab - ((z) * (((INT32)((0.601344887) * (((INT32)1) << 13) + 0.5))));
  m = ac - ((aa) * (((INT32)((0.509795579) * (((INT32)1) << 13) + 0.5))));

  r = n + j;
  y = n - j;
  s = p + k;
  x = p - k;
  t = q + l;
  w = q - l;
  u = o + m;
  v = o - m;

  z = (((int)(h[8 * 1])) * (f[8 * 1]));
  aa = (((int)(h[8 * 3])) * (f[8 * 3]));
  ab = (((int)(h[8 * 5])) * (f[8 * 5]));
  ac = (((int)(h[8 * 7])) * (f[8 * 7]));

  o = z + ab;

  k = ((z + aa) * (((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5))));
  l = ((o) * (((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
  m = ((z + ac) * (((INT32)((1.093201867) * (((INT32)1) << 13) + 0.5))));
  n = ((z - ac) * (((INT32)((0.897167586) * (((INT32)1) << 13) + 0.5))));
  o = ((o) * (((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
  p = ((z - aa) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  j = k + l + m - ((z) * (((INT32)((2.286341144) * (((INT32)1) << 13) + 0.5))));
  q = n + o + p - ((z) * (((INT32)((1.835730603) * (((INT32)1) << 13) + 0.5))));
  z = ((aa + ab) * (((INT32)((0.138617169) * (((INT32)1) << 13) + 0.5))));
  k += z + ((aa) * (((INT32)((0.071888074) * (((INT32)1) << 13) + 0.5))));
  l += z - ((ab) * (((INT32)((1.125726048) * (((INT32)1) << 13) + 0.5))));
  z = ((ab - aa) * (((INT32)((1.407403738) * (((INT32)1) << 13) + 0.5))));
  o += z - ((ab) * (((INT32)((0.766367282) * (((INT32)1) << 13) + 0.5))));
  p += z + ((aa) * (((INT32)((1.971951411) * (((INT32)1) << 13) + 0.5))));
  aa += ac;
  z = ((aa) * (-((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
  k += z;
  m += z + ((ac) * (((INT32)((1.065388962) * (((INT32)1) << 13) + 0.5))));
  aa = ((aa) * (-((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
  n += aa + ((ac) * (((INT32)((3.141271809) * (((INT32)1) << 13) + 0.5))));
  p += aa;
  aa = ((ab + ac) * (-((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5))));
  l += aa;
  m += aa;
  aa = ((ac - ab) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  n += aa;
  o += aa;

  g[8 * 0] = (int)((r + j) >> (13 - 2));
  g[8 * 15] = (int)((r - j) >> (13 - 2));
  g[8 * 1] = (int)((s + k) >> (13 - 2));
  g[8 * 14] = (int)((s - k) >> (13 - 2));
  g[8 * 2] = (int)((t + l) >> (13 - 2));
  g[8 * 13] = (int)((t - l) >> (13 - 2));
  g[8 * 3] = (int)((u + m) >> (13 - 2));
  g[8 * 12] = (int)((u - m) >> (13 - 2));
  g[8 * 4] = (int)((v + n) >> (13 - 2));
  g[8 * 11] = (int)((v - n) >> (13 - 2));
  g[8 * 5] = (int)((w + o) >> (13 - 2));
  g[8 * 10] = (int)((w - o) >> (13 - 2));
  g[8 * 6] = (int)((x + p) >> (13 - 2));
  g[8 * 9] = (int)((x - p) >> (13 - 2));
  g[8 * 7] = (int)((y + q) >> (13 - 2));
  g[8 * 8] = (int)((y - q) >> (13 - 2));

  barrier(1);
  g = e;
  g += 8 * 2 * i;
  __local int* ad;
  ad = e;
  ad += 8 * (2 * i + 1);

  aa = (INT32)g[2];
  ab = (INT32)g[6];

  z = ((aa + ab) * (((INT32)4433)));
  l = z + ((aa) * (((INT32)6270)));
  m = z - ((ab) * (((INT32)15137)));

  aa = (INT32)g[0] + (((INT32)1) << (2 + 2));
  ab = (INT32)g[4];

  j = (aa + ab) << 13;
  k = (aa - ab) << 13;

  n = j + l;
  q = j - l;
  o = k + m;
  p = k - m;

  j = (INT32)g[7];
  k = (INT32)g[5];
  l = (INT32)g[3];
  m = (INT32)g[1];

  aa = j + l;
  ab = k + m;

  z = ((aa + ab) * (((INT32)9633)));
  aa = ((aa) * (-((INT32)16069)));
  ab = ((ab) * (-((INT32)3196)));
  aa += z;
  ab += z;

  z = ((j + m) * (-((INT32)7373)));
  j = ((j) * (((INT32)2446)));
  m = ((m) * (((INT32)12299)));
  j += z + aa;
  m += z + ab;

  z = ((k + l) * (-((INT32)20995)));
  k = ((k) * (((INT32)16819)));
  l = ((l) * (((INT32)25172)));
  k += z + ab;
  l += z + aa;

  uchar8 ae;
  ae.s0 = clamp((int)((n + m) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.s7 = clamp((int)((n - m) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.s1 = clamp((int)((o + l) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.s6 = clamp((int)((o - l) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.s2 = clamp((int)((p + k) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.s5 = clamp((int)((p - k) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.s3 = clamp((int)((q + j) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.s4 = clamp((int)((q - j) >> (13 + 2 + 3)) + 128, 0, 255);
  *c = ae;

  aa = (INT32)ad[2];
  ab = (INT32)ad[6];

  z = ((aa + ab) * (((INT32)4433)));
  l = z + ((aa) * (((INT32)6270)));
  m = z - ((ab) * (((INT32)15137)));

  aa = (INT32)ad[0] + (((INT32)1) << (2 + 2));
  ab = (INT32)ad[4];

  j = (aa + ab) << 13;
  k = (aa - ab) << 13;

  n = j + l;
  q = j - l;
  o = k + m;
  p = k - m;

  j = (INT32)ad[7];
  k = (INT32)ad[5];
  l = (INT32)ad[3];
  m = (INT32)ad[1];

  aa = j + l;
  ab = k + m;

  z = ((aa + ab) * (((INT32)9633)));
  aa = ((aa) * (-((INT32)16069)));
  ab = ((ab) * (-((INT32)3196)));
  aa += z;
  ab += z;

  z = ((j + m) * (-((INT32)7373)));
  j = ((j) * (((INT32)2446)));
  m = ((m) * (((INT32)12299)));
  j += z + aa;
  m += z + ab;

  z = ((k + l) * (-((INT32)20995)));
  k = ((k) * (((INT32)16819)));
  l = ((l) * (((INT32)25172)));
  k += z + ab;
  l += z + aa;

  ae.s0 = clamp((int)((n + m) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.s7 = clamp((int)((n - m) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.s1 = clamp((int)((o + l) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.s6 = clamp((int)((o - l) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.s2 = clamp((int)((p + k) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.s5 = clamp((int)((p - k) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.s3 = clamp((int)((q + j) >> (13 + 2 + 3)) + 128, 0, 255);
  ae.s4 = clamp((int)((q - j) >> (13 + 2 + 3)) + 128, 0, 255);
  *d = ae;
}
void E(__local JCOEF* a, int b) {
  __local JCOEF* c = a + b;
  __local JCOEF* d = c + b;
  __local JCOEF* e = d + b;
  __local JCOEF* f = e + b;
  __local JCOEF* g = f + b;
  __local JCOEF* h = g + b;
  __local JCOEF* i = h + b;

  float j = ((*a) + (*f)) * 1.0;
  float k = 1.306562964876377f * (*d) + 0.541196100146197f * (*h);

  float l = j + k;
  float m = j - k;
  float n = 0.275899379282943f * (*i) + 1.387039845322148f * (*c) + 1.175875602419359f * (*e) + 0.785694958387102f * (*g);
  float o = 1.387039845322148f * (*i) - 0.275899379282943f * (*c) + 0.785694958387102f * (*e) - 1.175875602419359f * (*g);

  float p = (*a) - (*f);
  float q = 0.541196100146197f * (*d) - 1.306562964876377f * (*h);

  float r = p + q;
  float s = p - q;
  float t = 1.175875602419359f * (*c) - 0.785694958387102f * (*i) - 0.275899379282943f * (*e) - 1.387039845322148f * (*g);
  float u = 0.785694958387102f * (*c) + 1.175875602419359f * (*i) - 1.387039845322148f * (*e) + 0.275899379282943f * (*g);

  (*a) = 0.3535533905932737f * (l + n);
  (*i) = 0.3535533905932737f * (l - n);
  (*f) = 0.3535533905932737f * (m + o);
  (*e) = 0.3535533905932737f * (m - o);

  (*c) = 0.3535533905932737f * (r + t);
  (*g) = 0.3535533905932737f * (s - u);
  (*d) = 0.3535533905932737f * (s + u);
  (*h) = 0.3535533905932737f * (r - t);
}

__kernel void F(__global struct QuantiTable* a, __global JCOEF* b, __global JSAMPLE* c, int d, int e, int f) {
  int g = get_global_id(0);
  int h = get_local_id(0);
  int i = get_local_id(1);

  int j;
  int k;

  __global JCOEF* l;
  l = b + f * 64 + g * 64;

  __local FAST_FLOAT m[64 * 8];
  __local FAST_FLOAT* n;
  n = m + h * 64;

  __global DCT_FLOAT* o;
  o = a->idct_table_f[d];

  __local DCT_FLOAT p[64];
  event_t q;
  q = async_work_group_copy(p, o, 64, (event_t)0);

  float r = (float)(g) / (float)e;
  j = __clc_floor(r);
  k = (g)-j * e;

  __global JSAMPLE* s;
  s = c + f * 64 + j * e * 64 + i * e * 8 + k * 8;

  wait_group_events(1, &q);

  __local JCOEF t[64 * 8];
  __local JCOEF* u;
  u = (t + h * 64 + i * 8);
  *(__local short8*)u = vload8(0, l + i * 8);
  u = t + h * 64;

  uchar8 v;
  A(u, p, &v, n);
  vstore8(v, 0, s);
}

__kernel void G(__global struct QuantiTable* a, __global JCOEF* b, __global JSAMPLE* c, int d, int e, int f) {
  int g = get_global_id(0);
  int h = get_local_id(0);
  int i = get_local_id(1);

  int j;
  int k;

  __global JCOEF* l;
  l = b + f * 64 + g * 64;

  __local int m[8 * 16 * 8];
  __local int* n;
  n = m + h * 8 * 16;

  __global int* o;

  __local int p[64];
  event_t q;
  o = a->idct_table_i[d];
  q = async_work_group_copy(p, o, 64, (event_t)0);

  float r = (float)(g) / (float)e;
  j = __clc_floor(r);
  k = (g)-j * e;

  __global JSAMPLE* s;
  __global JSAMPLE* t;

  s = c + f * 64 * 4 + j * e * 64 * 4 + i * e * 8 * 4 + k * 8 * 2;
  t = s + e * 8 * 2;

  wait_group_events(1, &q);
  uchar16 u, v;
  B((__global JCOEF*)l, p, &u, &v, n);
  vstore16(u, 0, s);
  vstore16(v, 0, t);
}

__kernel void H(__global struct QuantiTable* a, __global JCOEF* b, __global JSAMPLE* c, int d, int e, int f) {
  int g = get_global_id(0);
  int h = get_local_id(0);
  int i = get_local_id(1);

  int j;
  int k;

  __global JCOEF* l;
  l = b + f * 64 + g * 64;

  __local int m[64 * 8];
  __local int* n;
  n = m + h * 64;

  __global int* o;

  __local int p[64];
  event_t q;
  o = a->idct_table_i[d];
  q = async_work_group_copy(p, o, 64, (event_t)0);

  float r = (float)(g) / (float)e;
  j = __clc_floor(r);
  k = (g)-j * e;

  __global JSAMPLE* s;

  s = c + f * 128 + j * e * 128 + i * e * 16 + k * 16;
  wait_group_events(1, &q);
  uchar16 t;
  C((__global JCOEF*)l, p, &t, n);
  vstore16(t, 0, s);
}

__kernel void I(__global struct QuantiTable* a, __global JCOEF* b, __global JSAMPLE* c, int d, int e, int f) {
  int g = get_global_id(0);
  int h = get_local_id(0);
  int i = get_local_id(1);

  int j;
  int k;

  __global JCOEF* l;
  l = b + f * 64 + g * 64;

  __local int m[128 * 8];
  __local int* n;
  n = m + h * 128;

  __global int* o;

  __local int p[64];
  event_t q;
  o = a->idct_table_i[d];
  q = async_work_group_copy(p, o, 64, (event_t)0);

  float r = (float)(g) / (float)e;
  j = __clc_floor(r);
  k = (g)-j * e;

  __global JSAMPLE* s;
  __global JSAMPLE* t;

  s = c + f * 128 + j * e * 128 + i * e * 8 * 2 + k * 8;
  t = s + e * 8;
  wait_group_events(1, &q);
  uchar8 u;
  uchar8 v;
  D((__global JCOEF*)l, p, &u, &v, n);
  vstore8(u, 0, s);
  vstore8(v, 0, t);
}