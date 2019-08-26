typedef short JCOEF; typedef JCOEF JBLOCK[64]; typedef JBLOCK* JBLOCKROW; typedef JBLOCKROW* JBLOCKARRAY; typedef JBLOCKARRAY* JBLOCKIMAGE; typedef unsigned char JSAMPLE; typedef JSAMPLE* JSAMPROW; typedef JSAMPROW* JSAMPARRAY; typedef JSAMPARRAY* JSAMPIMAGE; typedef unsigned int JDIMENSION; typedef int INT32; typedef short INT16; typedef float FAST_FLOAT; typedef FAST_FLOAT FLOAT_MULT_TYPE; typedef float DCT_FLOAT; typedef int DCT_INT; struct ComponentInfo {
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

void A(__local JSAMPLE* a, __local DCT_FLOAT* b, short8* c, __local FAST_FLOAT* d) {
  FAST_FLOAT e, f, g, h, i, j, k, l;
  FAST_FLOAT m, n, o, p;
  FAST_FLOAT q, r, s, t, u, v, w;
  __local DCT_FLOAT* x;
  __local FAST_FLOAT* y;
  __local JSAMPLE* z;
  z = a;
  int aa = get_global_id(1);
  y = d;
  x = b;

  z += aa * 8;
  y += aa * 8;

  e = (FAST_FLOAT)(z[0] + z[7]);
  l = (FAST_FLOAT)(z[0] - z[7]);
  f = (FAST_FLOAT)(z[1] + z[6]);
  k = (FAST_FLOAT)(z[1] - z[6]);
  g = (FAST_FLOAT)(z[2] + z[5]);
  j = (FAST_FLOAT)(z[2] - z[5]);
  h = (FAST_FLOAT)(z[3] + z[4]);
  i = (FAST_FLOAT)(z[3] - z[4]);

  m = e + h;
  p = e - h;
  n = f + g;
  o = f - g;

  y[0] = m + n - 8 * 128;
  y[4] = m - n;

  q = (o + p) * ((FAST_FLOAT)0.707106781);
  y[2] = p + q;
  y[6] = p - q;

  m = i + j;
  n = j + k;
  o = k + l;

  u = (m - o) * ((FAST_FLOAT)0.382683433);
  r = ((FAST_FLOAT)0.541196100) * m + u;
  t = ((FAST_FLOAT)1.306562965) * o + u;
  s = n * ((FAST_FLOAT)0.707106781);

  v = l + s;
  w = l - s;

  y[5] = w + r;
  y[3] = w - r;
  y[1] = v + t;
  y[7] = v - t;

  barrier(1);

  y = d;
  y += aa;

  e = y[8 * 0] + y[8 * 7];
  l = y[8 * 0] - y[8 * 7];
  f = y[8 * 1] + y[8 * 6];
  k = y[8 * 1] - y[8 * 6];
  g = y[8 * 2] + y[8 * 5];
  j = y[8 * 2] - y[8 * 5];
  h = y[8 * 3] + y[8 * 4];
  i = y[8 * 3] - y[8 * 4];

  m = e + h;
  p = e - h;
  n = f + g;
  o = f - g;

  y[8 * 0] = m + n;
  y[8 * 4] = m - n;

  q = (o + p) * ((FAST_FLOAT)0.707106781);
  y[8 * 2] = p + q;
  y[8 * 6] = p - q;

  m = i + j;
  n = j + k;
  o = k + l;

  u = (m - o) * ((FAST_FLOAT)0.382683433);
  r = ((FAST_FLOAT)0.541196100) * m + u;
  t = ((FAST_FLOAT)1.306562965) * o + u;
  s = n * ((FAST_FLOAT)0.707106781);

  v = l + s;
  w = l - s;

  y[8 * 5] = w + r;
  y[8 * 3] = w - r;
  y[8 * 1] = v + t;
  y[8 * 7] = v - t;

  barrier(1);

  y = d;
  y += aa * 8;
  short8 ab;
  x += aa * 8;
    float8 ac = (float8)
       (y* x      y* x      y* x      y* x      y* x      y* x      y* x      y* x   ab = convert_short8_sat_rte(ac);
    *c = ab;
}

void B(__local JSAMPLE* a, __local DCT_INT* b, short8* c, __local DCT_INT* d) {
  int e = get_global_id(1);
  int f, g, h, i, j, k, l, m;
  int n, o, p, q, r, s, t, u;
  __local DCT_INT* v;
  __local DCT_INT* w;
  __local DCT_INT* x;
  __local JSAMPLE* y;
  v = b;

  y = a + e * 16;
  w = d + e * 8;
  int z;
  for (z = 0; z < 2; z++) {
    y += z * 16 * 8;
    w += z * 64;

    f = y[0] + y[15];
    g = y[1] + y[14];
    h = y[2] + y[13];
    i = y[3] + y[12];
    j = y[4] + y[11];
    k = y[5] + y[10];
    l = y[6] + y[9];
    m = y[7] + y[8];

    n = f + m;
    r = f - m;
    o = g + l;
    s = g - l;
    p = h + k;
    t = h - k;
    q = i + j;
    u = i - j;

    f = y[0] - y[15];
    g = y[1] - y[14];
    h = y[2] - y[13];
    i = y[3] - y[12];
    j = y[4] - y[11];
    k = y[5] - y[10];
    l = y[6] - y[9];
    m = y[7] - y[8];

    w[0] = (DCT_INT)((n + o + p + q - 16 * 128) << 2);
    w[4] = (DCT_INT)(((((n - q) * (((INT32)((1.306562965) * (((INT32)1) << 13) + 0.5)))) + ((o - p) * (((INT32)4433)))) + (((INT32)1) << ((13 - 2) - 1))) >> (13 - 2));

    n = ((u - s) * (((INT32)((0.275899379) * (((INT32)1) << 13) + 0.5)))) + ((r - t) * (((INT32)((1.387039845) * (((INT32)1) << 13) + 0.5))));

    w[2] = (DCT_INT)(((n + ((s) * (((INT32)((1.451774982) * (((INT32)1) << 13) + 0.5)))) + ((t) * (((INT32)((2.172734804) * (((INT32)1) << 13) + 0.5))))) + (((INT32)1) << ((13 - 2) - 1))) >> (13 - 2));

    w[6] = (DCT_INT)(((n - ((r) * (((INT32)((0.211164243) * (((INT32)1) << 13) + 0.5)))) - ((u) * (((INT32)((1.061594338) * (((INT32)1) << 13) + 0.5))))) + (((INT32)1) << ((13 - 2) - 1))) >> (13 - 2));

    o = ((f + g) * (((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5)))) + ((l - m) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
    p = ((f + h) * (((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5)))) + ((k + m) * (((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
    q = ((f + i) * (((INT32)((1.093201867) * (((INT32)1) << 13) + 0.5)))) + ((j - m) * (((INT32)((0.897167586) * (((INT32)1) << 13) + 0.5))));
    r = ((g + h) * (((INT32)((0.138617169) * (((INT32)1) << 13) + 0.5)))) + ((l - k) * (((INT32)((1.407403738) * (((INT32)1) << 13) + 0.5))));
    s = ((g + i) * (-((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5)))) + ((j + l) * (-((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
    t = ((h + i) * (-((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5)))) + ((k - j) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
    n = o + p + q - ((f) * (((INT32)((2.286341144) * (((INT32)1) << 13) + 0.5)))) + ((m) * (((INT32)((0.779653625) * (((INT32)1) << 13) + 0.5))));
    o += r + s + ((g) * (((INT32)((0.071888074) * (((INT32)1) << 13) + 0.5)))) - ((l) * (((INT32)((1.663905119) * (((INT32)1) << 13) + 0.5))));
    p += r + t - ((h) * (((INT32)((1.125726048) * (((INT32)1) << 13) + 0.5)))) + ((k) * (((INT32)((1.227391138) * (((INT32)1) << 13) + 0.5))));
    q += s + t + ((i) * (((INT32)((1.065388962) * (((INT32)1) << 13) + 0.5)))) + ((j) * (((INT32)((2.167985692) * (((INT32)1) << 13) + 0.5))));

    w[1] = (DCT_INT)(((n) + (((INT32)1) << ((13 - 2) - 1))) >> (13 - 2));
    w[3] = (DCT_INT)(((o) + (((INT32)1) << ((13 - 2) - 1))) >> (13 - 2));
    w[5] = (DCT_INT)(((p) + (((INT32)1) << ((13 - 2) - 1))) >> (13 - 2));
    w[7] = (DCT_INT)(((q) + (((INT32)1) << ((13 - 2) - 1))) >> (13 - 2));
  }
  barrier(1);

  x = d;
  x += e;
  w = d;
  w += 64 + e;

  f = x[8 * 0] + w[8 * 7];
  g = x[8 * 1] + w[8 * 6];
  h = x[8 * 2] + w[8 * 5];
  i = x[8 * 3] + w[8 * 4];
  j = x[8 * 4] + w[8 * 3];
  k = x[8 * 5] + w[8 * 2];
  l = x[8 * 6] + w[8 * 1];
  m = x[8 * 7] + w[8 * 0];

  n = f + m;
  r = f - m;
  o = g + l;
  s = g - l;
  p = h + k;
  t = h - k;
  q = i + j;
  u = i - j;

  f = x[8 * 0] - w[8 * 7];
  g = x[8 * 1] - w[8 * 6];
  h = x[8 * 2] - w[8 * 5];
  i = x[8 * 3] - w[8 * 4];
  j = x[8 * 4] - w[8 * 3];
  k = x[8 * 5] - w[8 * 2];
  l = x[8 * 6] - w[8 * 1];
  m = x[8 * 7] - w[8 * 0];

  x[8 * 0] = (DCT_INT)(((n + o + p + q) + (((INT32)1) << ((2 + 2) - 1))) >> (2 + 2));
  x[8 * 4] = (DCT_INT)(((((n - q) * (((INT32)((1.306562965) * (((INT32)1) << 13) + 0.5)))) + ((o - p) * (((INT32)4433)))) + (((INT32)1) << ((13 + 2 + 2) - 1))) >> (13 + 2 + 2));

  n = ((u - s) * (((INT32)((0.275899379) * (((INT32)1) << 13) + 0.5)))) + ((r - t) * (((INT32)((1.387039845) * (((INT32)1) << 13) + 0.5))));

  x[8 * 2] = (DCT_INT)(((n + ((s) * (((INT32)((1.451774982) * (((INT32)1) << 13) + 0.5)))) + ((t) * (((INT32)((2.172734804) * (((INT32)1) << 13) + 0.5))))) + (((INT32)1) << ((13 + 2 + 2) - 1))) >> (13 + 2 + 2));

  x[8 * 6] = (DCT_INT)(((n - ((r) * (((INT32)((0.211164243) * (((INT32)1) << 13) + 0.5)))) - ((u) * (((INT32)((1.061594338) * (((INT32)1) << 13) + 0.5))))) + (((INT32)1) << ((13 + 2 + 2) - 1))) >> (13 + 2 + 2));

  o = ((f + g) * (((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5)))) + ((l - m) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  p = ((f + h) * (((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5)))) + ((k + m) * (((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
  q = ((f + i) * (((INT32)((1.093201867) * (((INT32)1) << 13) + 0.5)))) + ((j - m) * (((INT32)((0.897167586) * (((INT32)1) << 13) + 0.5))));
  r = ((g + h) * (((INT32)((0.138617169) * (((INT32)1) << 13) + 0.5)))) + ((l - k) * (((INT32)((1.407403738) * (((INT32)1) << 13) + 0.5))));
  s = ((g + i) * (-((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5)))) + ((j + l) * (-((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
  t = ((h + i) * (-((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5)))) + ((k - j) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  n = o + p + q - ((f) * (((INT32)((2.286341144) * (((INT32)1) << 13) + 0.5)))) + ((m) * (((INT32)((0.779653625) * (((INT32)1) << 13) + 0.5))));
  o += r + s + ((g) * (((INT32)((0.071888074) * (((INT32)1) << 13) + 0.5)))) - ((l) * (((INT32)((1.663905119) * (((INT32)1) << 13) + 0.5))));
  p += r + t - ((h) * (((INT32)((1.125726048) * (((INT32)1) << 13) + 0.5)))) + ((k) * (((INT32)((1.227391138) * (((INT32)1) << 13) + 0.5))));
  q += s + t + ((i) * (((INT32)((1.065388962) * (((INT32)1) << 13) + 0.5)))) + ((j) * (((INT32)((2.167985692) * (((INT32)1) << 13) + 0.5))));

  x[8 * 1] = (DCT_INT)(((n) + (((INT32)1) << ((13 + 2 + 2) - 1))) >> (13 + 2 + 2));
  x[8 * 3] = (DCT_INT)(((o) + (((INT32)1) << ((13 + 2 + 2) - 1))) >> (13 + 2 + 2));
  x[8 * 5] = (DCT_INT)(((p) + (((INT32)1) << ((13 + 2 + 2) - 1))) >> (13 + 2 + 2));
  x[8 * 7] = (DCT_INT)(((q) + (((INT32)1) << ((13 + 2 + 2) - 1))) >> (13 + 2 + 2));

  barrier(1);

  w = d;
  w += e * 8;
  v += e * 8;
  float aa[8];
  int ab;
  for (ab = 0; ab < 8; ab++) {
    if (abs(w[ab]) < v[ab])
      aa[ab] = 0;
    else
      aa[ab] = w[ab] / v[ab];
  }
    float8 ac = (float8)
       (aa0], aa1], aa2], aa3], aa4], aa5], aa6], aa7]);
    *c = convert_short8_sat_rte(ac);
}

void C(__local JSAMPLE* a, __local DCT_INT* b, short8* c, __local DCT_INT* d) {
  DCT_INT e = get_global_id(1);
  DCT_INT f, g, h, i, j, k, l, m;
  DCT_INT n, o, p, q, r, s, t, u;
  DCT_INT v;
  __local DCT_INT* w;
  __local DCT_INT* x;
  __local JSAMPLE* y;
  w = b;
  y = a + e * 16;
  x = d + e * 8;

  f = y[0] + y[15];
  g = y[1] + y[14];
  h = y[2] + y[13];
  i = y[3] + y[12];
  j = y[4] + y[11];
  k = y[5] + y[10];
  l = y[6] + y[9];
  m = y[7] + y[8];

  n = f + m;
  r = f - m;
  o = g + l;
  s = g - l;
  p = h + k;
  t = h - k;
  q = i + j;
  u = i - j;

  f = y[0] - y[15];
  g = y[1] - y[14];
  h = y[2] - y[13];
  i = y[3] - y[12];
  j = y[4] - y[11];
  k = y[5] - y[10];
  l = y[6] - y[9];
  m = y[7] - y[8];

  x[0] = (DCT_INT)((n + o + p + q - 16 * 128) << 2);
  x[4] = (DCT_INT)(((((n - q) * (((INT32)((1.306562965) * (((INT32)1) << 13) + 0.5)))) + ((o - p) * (((INT32)4433)))) + (((INT32)1) << ((13 - 2) - 1))) >> (13 - 2));

  n = ((u - s) * (((INT32)((0.275899379) * (((INT32)1) << 13) + 0.5)))) + ((r - t) * (((INT32)((1.387039845) * (((INT32)1) << 13) + 0.5))));

  x[2] = (DCT_INT)(((n + ((s) * (((INT32)((1.451774982) * (((INT32)1) << 13) + 0.5)))) + ((t) * (((INT32)((2.172734804) * (((INT32)1) << 13) + 0.5))))) + (((INT32)1) << ((13 - 2) - 1))) >> (13 - 2));

  x[6] = (DCT_INT)(((n - ((r) * (((INT32)((0.211164243) * (((INT32)1) << 13) + 0.5)))) - ((u) * (((INT32)((1.061594338) * (((INT32)1) << 13) + 0.5))))) + (((INT32)1) << ((13 - 2) - 1))) >> (13 - 2));

  o = ((f + g) * (((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5)))) + ((l - m) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  p = ((f + h) * (((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5)))) + ((k + m) * (((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
  q = ((f + i) * (((INT32)((1.093201867) * (((INT32)1) << 13) + 0.5)))) + ((j - m) * (((INT32)((0.897167586) * (((INT32)1) << 13) + 0.5))));
  r = ((g + h) * (((INT32)((0.138617169) * (((INT32)1) << 13) + 0.5)))) + ((l - k) * (((INT32)((1.407403738) * (((INT32)1) << 13) + 0.5))));
  s = ((g + i) * (-((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5)))) + ((j + l) * (-((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
  t = ((h + i) * (-((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5)))) + ((k - j) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  n = o + p + q - ((f) * (((INT32)((2.286341144) * (((INT32)1) << 13) + 0.5)))) + ((m) * (((INT32)((0.779653625) * (((INT32)1) << 13) + 0.5))));
  o += r + s + ((g) * (((INT32)((0.071888074) * (((INT32)1) << 13) + 0.5)))) - ((l) * (((INT32)((1.663905119) * (((INT32)1) << 13) + 0.5))));
  p += r + t - ((h) * (((INT32)((1.125726048) * (((INT32)1) << 13) + 0.5)))) + ((k) * (((INT32)((1.227391138) * (((INT32)1) << 13) + 0.5))));
  q += s + t + ((i) * (((INT32)((1.065388962) * (((INT32)1) << 13) + 0.5)))) + ((j) * (((INT32)((2.167985692) * (((INT32)1) << 13) + 0.5))));

  x[1] = (DCT_INT)(((n) + (((INT32)1) << ((13 - 2) - 1))) >> (13 - 2));
  x[3] = (DCT_INT)(((o) + (((INT32)1) << ((13 - 2) - 1))) >> (13 - 2));
  x[5] = (DCT_INT)(((p) + (((INT32)1) << ((13 - 2) - 1))) >> (13 - 2));
  x[7] = (DCT_INT)(((q) + (((INT32)1) << ((13 - 2) - 1))) >> (13 - 2));

  barrier(1);
  x = d;
  x += e;

  f = x[8 * 0] + x[8 * 7];
  g = x[8 * 1] + x[8 * 6];
  h = x[8 * 2] + x[8 * 5];
  i = x[8 * 3] + x[8 * 4];

  n = f + i;
  p = f - i;
  o = g + h;
  q = g - h;

  f = x[8 * 0] - x[8 * 7];
  g = x[8 * 1] - x[8 * 6];
  h = x[8 * 2] - x[8 * 5];
  i = x[8 * 3] - x[8 * 4];

  x[8 * 0] = (DCT_INT)(((n + o) + (((INT32)1) << ((2 + 1) - 1))) >> (2 + 1));
  x[8 * 4] = (DCT_INT)(((n - o) + (((INT32)1) << ((2 + 1) - 1))) >> (2 + 1));

  v = ((p + q) * (((INT32)4433)));
  x[8 * 2] = (DCT_INT)(((v + ((p) * (((INT32)6270)))) + (((INT32)1) << ((13 + 2 + 1) - 1))) >> (13 + 2 + 1));

  x[8 * 6] = (DCT_INT)(((v - ((q) * (((INT32)15137)))) + (((INT32)1) << ((13 + 2 + 1) - 1))) >> (13 + 2 + 1));

  n = f + i;
  o = g + h;
  p = f + h;
  q = g + i;
  v = ((p + q) * (((INT32)9633)));

  f = ((f) * (((INT32)12299)));
  g = ((g) * (((INT32)25172)));
  h = ((h) * (((INT32)16819)));
  i = ((i) * (((INT32)2446)));
  n = ((n) * (-((INT32)7373)));
  o = ((o) * (-((INT32)20995)));
  p = ((p) * (-((INT32)3196)));
  q = ((q) * (-((INT32)16069)));

  p += v;
  q += v;

  x[8 * 1] = (DCT_INT)(((f + n + p) + (((INT32)1) << ((13 + 2 + 1) - 1))) >> (13 + 2 + 1));

  x[8 * 3] = (DCT_INT)(((g + o + q) + (((INT32)1) << ((13 + 2 + 1) - 1))) >> (13 + 2 + 1));

  x[8 * 5] = (DCT_INT)(((h + o + p) + (((INT32)1) << ((13 + 2 + 1) - 1))) >> (13 + 2 + 1));

  x[8 * 7] = (DCT_INT)(((i + n + q) + (((INT32)1) << ((13 + 2 + 1) - 1))) >> (13 + 2 + 1));

  barrier(1);
  x = d;
  x += e * 8;
  w += e * 8;

  float z[8];
  int aa;
  for (aa = 0; aa < 8; aa++) {
    if (abs(x[aa]) < w[aa])
      z[aa] = 0;
    else
      z[aa] = x[aa] / w[aa];
  }
    float8 ab = (float8)
       (z], z], z], z], z], z], z], z]);
    *c = convert_short8_sat_rte(ab);
}

void D(__local JSAMPLE* a, __local DCT_INT* b, short8* c, __local DCT_INT* d) {
  DCT_INT e = get_global_id(1);
  DCT_INT f, g, h, i, j, k, l, m;
  DCT_INT n, o, p, q, r, s, t, u;
  DCT_INT v;
  __local DCT_INT* w;
  __local DCT_INT* x;
  __local DCT_INT* y;
  __local JSAMPLE* z;
  w = b;

  z = a + e * 8;
  x = d + e * 8;
  int aa;
  for (aa = 0; aa < 2; aa++) {
    z += aa * 64;
    x += aa * 64;

    f = z[0] + z[7];
    g = z[1] + z[6];
    h = z[2] + z[5];
    i = z[3] + z[4];

    n = f + i;
    p = f - i;
    o = g + h;
    q = g - h;

    f = z[0] - z[7];
    g = z[1] - z[6];
    h = z[2] - z[5];
    i = z[3] - z[4];

    x[0] = (DCT_INT)((n + o - 8 * 128) << 2);
    x[4] = (DCT_INT)((n - o) << 2);

    v = ((p + q) * (((INT32)4433)));
    x[2] = (DCT_INT)(((v + ((p) * (((INT32)6270)))) + (((INT32)1) << ((13 - 2) - 1))) >> (13 - 2));

    x[6] = (DCT_INT)(((v - ((q) * (((INT32)15137)))) + (((INT32)1) << ((13 - 2) - 1))) >> (13 - 2));

    n = f + i;
    o = g + h;
    p = f + h;
    q = g + i;
    v = ((p + q) * (((INT32)9633)));

    f = ((f) * (((INT32)12299)));
    g = ((g) * (((INT32)25172)));
    h = ((h) * (((INT32)16819)));
    i = ((i) * (((INT32)2446)));
    n = ((n) * (-((INT32)7373)));
    o = ((o) * (-((INT32)20995)));
    p = ((p) * (-((INT32)3196)));
    q = ((q) * (-((INT32)16069)));

    p += v;
    q += v;

    x[1] = (DCT_INT)(((f + n + p) + (((INT32)1) << ((13 - 2) - 1))) >> (13 - 2));
    x[3] = (DCT_INT)(((g + o + q) + (((INT32)1) << ((13 - 2) - 1))) >> (13 - 2));
    x[5] = (DCT_INT)(((h + o + p) + (((INT32)1) << ((13 - 2) - 1))) >> (13 - 2));
    x[7] = (DCT_INT)(((i + n + q) + (((INT32)1) << ((13 - 2) - 1))) >> (13 - 2));
  }
  barrier(1);
  x = d + 64 + e;
  y = d + e;

  f = y[8 * 0] + x[8 * 7];
  g = y[8 * 1] + x[8 * 6];
  h = y[8 * 2] + x[8 * 5];
  i = y[8 * 3] + x[8 * 4];
  j = y[8 * 4] + x[8 * 3];
  k = y[8 * 5] + x[8 * 2];
  l = y[8 * 6] + x[8 * 1];
  m = y[8 * 7] + x[8 * 0];

  n = f + m;
  r = f - m;
  o = g + l;
  s = g - l;
  p = h + k;
  t = h - k;
  q = i + j;
  u = i - j;

  f = y[8 * 0] - x[8 * 7];
  g = y[8 * 1] - x[8 * 6];
  h = y[8 * 2] - x[8 * 5];
  i = y[8 * 3] - x[8 * 4];
  j = y[8 * 4] - x[8 * 3];
  k = y[8 * 5] - x[8 * 2];
  l = y[8 * 6] - x[8 * 1];
  m = y[8 * 7] - x[8 * 0];

  y[8 * 0] = (DCT_INT)(((n + o + p + q) + (((INT32)1) << ((2 + 1) - 1))) >> (2 + 1));
  y[8 * 4] = (DCT_INT)(((((n - q) * (((INT32)((1.306562965) * (((INT32)1) << 13) + 0.5)))) + ((o - p) * (((INT32)4433)))) + (((INT32)1) << ((13 + 2 + 1) - 1))) >> (13 + 2 + 1));

  n = ((u - s) * (((INT32)((0.275899379) * (((INT32)1) << 13) + 0.5)))) + ((r - t) * (((INT32)((1.387039845) * (((INT32)1) << 13) + 0.5))));

  y[8 * 2] = (DCT_INT)(((n + ((s) * (((INT32)((1.451774982) * (((INT32)1) << 13) + 0.5)))) + ((t) * (((INT32)((2.172734804) * (((INT32)1) << 13) + 0.5))))) + (((INT32)1) << ((13 + 2 + 1) - 1))) >> (13 + 2 + 1));

  y[8 * 6] = (DCT_INT)(((n - ((r) * (((INT32)((0.211164243) * (((INT32)1) << 13) + 0.5)))) - ((u) * (((INT32)((1.061594338) * (((INT32)1) << 13) + 0.5))))) + (((INT32)1) << ((13 + 2 + 1) - 1))) >> (13 + 2 + 1));

  o = ((f + g) * (((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5)))) + ((l - m) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  p = ((f + h) * (((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5)))) + ((k + m) * (((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
  q = ((f + i) * (((INT32)((1.093201867) * (((INT32)1) << 13) + 0.5)))) + ((j - m) * (((INT32)((0.897167586) * (((INT32)1) << 13) + 0.5))));
  r = ((g + h) * (((INT32)((0.138617169) * (((INT32)1) << 13) + 0.5)))) + ((l - k) * (((INT32)((1.407403738) * (((INT32)1) << 13) + 0.5))));
  s = ((g + i) * (-((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5)))) + ((j + l) * (-((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
  t = ((h + i) * (-((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5)))) + ((k - j) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  n = o + p + q - ((f) * (((INT32)((2.286341144) * (((INT32)1) << 13) + 0.5)))) + ((m) * (((INT32)((0.779653625) * (((INT32)1) << 13) + 0.5))));
  o += r + s + ((g) * (((INT32)((0.071888074) * (((INT32)1) << 13) + 0.5)))) - ((l) * (((INT32)((1.663905119) * (((INT32)1) << 13) + 0.5))));
  p += r + t - ((h) * (((INT32)((1.125726048) * (((INT32)1) << 13) + 0.5)))) + ((k) * (((INT32)((1.227391138) * (((INT32)1) << 13) + 0.5))));
  q += s + t + ((i) * (((INT32)((1.065388962) * (((INT32)1) << 13) + 0.5)))) + ((j) * (((INT32)((2.167985692) * (((INT32)1) << 13) + 0.5))));

  y[8 * 1] = (DCT_INT)(((n) + (((INT32)1) << ((13 + 2 + 1) - 1))) >> (13 + 2 + 1));
  y[8 * 3] = (DCT_INT)(((o) + (((INT32)1) << ((13 + 2 + 1) - 1))) >> (13 + 2 + 1));
  y[8 * 5] = (DCT_INT)(((p) + (((INT32)1) << ((13 + 2 + 1) - 1))) >> (13 + 2 + 1));
  y[8 * 7] = (DCT_INT)(((q) + (((INT32)1) << ((13 + 2 + 1) - 1))) >> (13 + 2 + 1));
  barrier(1);

  x = d;
  x += e * 8;
  w += e * 8;
  float ab[8];
  int ac;
  for (ac = 0; ac < 8; ac++) {
    if (abs(x[ac]) < w[ac])
      ab[ac] = 0;
    else
      ab[ac] = x[ac] / w[ac];
  }
    float8 ad = (float8)
       (ab0], ab1], ab2], ab3], ab4], ab5], ab6], ab7]);
    *c = convert_short8_sat_rte(ad);
}

__kernel void E(__global struct QuantiTable* a, __global JSAMPLE* b, __global JCOEF* c, int d, int e) {
  int f = get_global_id(0);
  int g = get_local_id(1);
  int h = get_local_id(0);

  __global DCT_INT* i;
  __local DCT_INT j[64];
  event_t k;
  i = a->fdct_table_i[d];
  k = async_work_group_copy(j, i, 64, (event_t)0);

  int l, m;

  float n = (float)f / (float)e;
  l = __clc_floor(n);
  m = f - l * e;

  __global JSAMPLE* o;
  __global JSAMPLE* p;
  o = b + l * e * 256 + g * e * 16 * 2 + m * 16;
  p = o + e * 16;

  __local JSAMPLE q[256 * 8];
  __local uchar16* r;
  __local uchar16* s;
  r = (__local uchar16*)(q + h * 256 + g * 16 * 2);
  s = (__local uchar16*)(q + h * 256 + g * 16 * 2 + 16);

  *r = vload16(0, o);
  *s = vload16(0, p);

  __local JSAMPLE* t;
  t = q + h * 256;

  __local DCT_INT u[64 * 2 * 8];
  __local DCT_INT* v;
  v = u + h * 64 * 2;

  __global JCOEF* w;
  w = c + f * 64 + g * 8;

  wait_group_events(1, &k);
  short8 x;
  B(t, j, &x, v);

  vstore8(x, 0, w);
}

__kernel void F(__global struct QuantiTable* a, __global JSAMPLE* b, __global JCOEF* c, int d, int e) {
  int f = get_global_id(0);
  int g = get_local_id(1);
  int h = get_local_id(0);

  __global DCT_FLOAT* i;
  __local DCT_FLOAT j[64];
  event_t k;
  i = a->fdct_table_f[d];
  k = async_work_group_copy(j, i, 64, (event_t)0);

  int l, m;

  float n = (float)f / (float)e;
  l = __clc_floor(n);
  m = f - l * e;

  __global JSAMPLE* o;
  o = b + l * e * 64 + g * e * 8 + m * 8;
  __local JSAMPLE p[64 * 8];
  __local uchar8* q;
  q = (__local uchar8*)(p + h * 64 + g * 8);
  *q = vload8(0, o);

  __local FAST_FLOAT r[64 * 8];
  __local FAST_FLOAT* s;
  s = r + h * 64;

  __global JCOEF* t;
  t = c + f * 64 + g * 8;

  wait_group_events(1, &k);
  short8 u;
  __local JSAMPLE* v;
  v = p + h * 64;
  A(v, j, &u, s);

  vstore8(u, 0, t);
}

__kernel void G(__global struct QuantiTable* a, __global JSAMPLE* b, __global JCOEF* c, int d, int e) {
  int f = get_global_id(0);
  int g = get_local_id(1);
  int h = get_local_id(0);

  __global DCT_INT* i;
  __local DCT_INT j[64];
  event_t k;
  i = a->fdct_table_i[d];
  k = async_work_group_copy(j, i, 64, (event_t)0);

  int l, m;

  float n = (float)f / (float)e;
  l = __clc_floor(n);
  m = f - l * e;

  __global JSAMPLE* o;
  o = b + l * e * 128 + g * e * 16 + m * 16;

  __local JSAMPLE p[128 * 8];
  __local uchar16* q;
  q = (__local uchar16*)(p + h * 128 + g * 16);

  *q = vload16(0, o);

  __local JSAMPLE* r;
  r = p + h * 128;

  __local DCT_INT s[64 * 8];
  __local DCT_INT* t;
  t = s + h * 64;

  __global JCOEF* u;
  u = c + f * 64 + g * 8;

  wait_group_events(1, &k);
  short8 v;
  C(r, j, &v, t);

  vstore8(v, 0, u);
}

__kernel void H(__global struct QuantiTable* a, __global JSAMPLE* b, __global JCOEF* c, int d, int e) {
  int f = get_global_id(0);
  int g = get_local_id(1);
  int h = get_local_id(0);

  __global DCT_INT* i;
  __local DCT_INT j[64];
  event_t k;
  i = a->fdct_table_i[d];
  k = async_work_group_copy(j, i, 64, (event_t)0);

  int l, m;

  float n = (float)f / (float)e;
  l = __clc_floor(n);
  m = f - l * e;

  __global JSAMPLE* o;
  __global JSAMPLE* p;
  o = b + l * e * 128 + g * e * 8 * 2 + m * 8;
  p = o + e * 8;

  __local JSAMPLE q[128 * 8];
  __local uchar8* r;
  __local uchar8* s;
  r = (__local uchar8*)(q + h * 128 + g * 8 * 2);
  s = (__local uchar8*)(q + h * 128 + g * 8 * 2 + 8);
  *r = vload8(0, o);
  *s = vload8(0, p);

  __local JSAMPLE* t;
  t = q + h * 128;

  __local DCT_INT u[64 * 2 * 8];
  __local DCT_INT* v;
  v = u + h * 64 * 2;

  __global JCOEF* w;
  w = c + f * 64 + g * 8;

  wait_group_events(1, &k);
  short8 x;
  D(t, j, &x, v);

  vstore8(x, 0, w);
}