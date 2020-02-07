typedef unsigned char JSAMPLE; typedef float DCT_FLOAT; __kernel void A(int a, int b, int c, int d, int e, __global JSAMPLE* f, __global JSAMPLE* g, int h) {
  int i = get_global_id(0);
  int j = get_global_id(1);
  int k = get_global_size(0);
  int l = get_global_size(1);

  float m = a * 1.0 / k;
  float n = b * 1.0 / l;
  float o, p;
  float q, r, s, t;
  int u, v, w, x;
  p = j * n;
  w = (int)p;
  x = (p + 1) > (b - 1) ? (b - 1) : (w + 1);
  o = i * m;
  u = (int)o;
  v = (o + 1) > (a - 1) ? (a - 1) : (u + 1);

  q = __clc_fabs(v - o);
  r = __clc_fabs(o - u);
  s = __clc_fabs(x - p);
  t = __clc_fabs(p - w);
  __global JSAMPLE* y;

  int z, aa;

  z = d * 8;
  aa = e * 8;

  y = g + j * z + i;

  __global JSAMPLE *ab, *ac, *ad, *ae;
  ab = f + w * c * 8 + u;
  ac = f + w * c * 8 + v;
  ad = f + x * c * 8 + u;
  ae = f + x * c * 8 + v;

  JSAMPLE af, ag, ah, ai;
  af = *ab;
  ag = *ac;
  ah = *ad;
  ai = *ae;
  JSAMPLE aj;
  aj = s * q * af + t * q * ag + s * r * ah + t * r * ai;

  aj = (aj == 0 ? af : aj);
  *y = 0;
  *y = aj;
  barrier(2);
  if (h) {
    int ak, al;
    ak = z - k;
    al = aa - l;
    if (i == (k - 1)) {
      if (ak) {
        int am;
        for (am = 1; am < ak + 1; am++) {
          *(y + am) = aj;
        }
      }
    }
    if (j >= (l - al)) {
      if (al) {
        *(y + z * al) = aj;
      }
    }
    barrier(2);
    if (j >= (l - al) && i >= (k - ak)) {
      if (al != 0 && ak != 0) {
        *(y + z * al + ak) = aj;
      }
    }
  }
}