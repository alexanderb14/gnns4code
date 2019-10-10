void A(__global float* a, __global const float* b, __global const float* c, unsigned int d, __global float* e); void B(__global const short* a, __global const float* b, __global const float* c, __global const float* d, __global float* e, unsigned int f, unsigned int g, unsigned int h); __kernel void C(__global const float* a, const unsigned int b, const unsigned int c, const unsigned int d, const float e, const float f, __global unsigned char* g) {
  const unsigned int h = get_global_id(0);
  unsigned int i;
  float j = f - e;
  float k;
  unsigned char l;

  if (h < b) {
    for (int i = 0; i < c; i++) {
      k = (a[h * c * 2 + i] - e) / j * 255.0f;
      l = (unsigned char)k;
      if (k > 255.0f)
        l = 255;
      if (k < 0.0f)
        l = 0;

      g[(h * 3) + i * d] = l;
      g[(h * 3) + i * d + 1] = l;
      g[(h * 3) + i * d + 2] = l;
    }
  }
}

__kernel void D(__global const float* a,

                __global const float* b, const unsigned int c, const unsigned int d, const unsigned int e, const unsigned int f, const unsigned int g, __global float* h, __global float* i, __global float* j, __global float* k, __global float* l) {
  float m;
  float n;
  float o = 0.0f;
  int p, q;
  int r = 15;
  const unsigned int s = get_global_id(0);

  const unsigned int t = s * c;

  for (p = 0; p < c; p++) {
    m = a[2 * (t + p)] * a[2 * (t + p)];
    n = a[2 * (t + p) + 1] * a[2 * (t + p) + 1];
    h[t + p] = m + n;
    i[t + p] = 20.0f * (float)log10(h[t + p]);
  }

  q = 0;
  for (p = r; p < c / 8; p++) {
    o += h[t + p];
    q++;
  }

  j[s] = o / (float)q;
}

__kernel void E(__global float* a, const unsigned int b, const unsigned int c, const unsigned int d, const unsigned int e, const unsigned int f, const unsigned int g, const unsigned int h, const unsigned int i, const unsigned int j, const unsigned int k, const unsigned int l, __global float* m)

{
  const int n = get_global_id(0);

  int o = b * d;

  int p = b * e;
  int q = o * e * f;
  int r = q * c;
  int s = c * f;
  int t = d * e;
  int u;
  int v;
  int w;

  int x;
  int y;
  int z;
  int aa;
  int ab;
  int ac;
  int ad;
  int ae;
  int af;
  int ag = 0;
  int ah = 0;
  int ai = 0;
  int aj;

  int ak = (int)__clc_floor((float)g / 2.0f);
  int al = (int)__clc_floor((float)h / 2.0f);
  int am = (int)__clc_floor((float)i / 2.0f);

  float an = 0.0f;
  float ao = 0.0f;
  float ap = 0.0f;
  float aq = 0.0f;

  float ar = 0.0f;
  float as = 0.0f;
  float at = 0.0f;
  float au = 0.0f;
  float av = 0.0f;

  v = (int)__clc_floor((float)n / (float)o);
  u = (int)__clc_floor((float)(n - v * o) / (float)b);
  w = n - v * o - u * b;

  if ((v - al >= 0) && (v - al + h + k - 1 < s)) {
    for (y = 0; y < h; y++) {
      ab = v - al + y;
      ae = ab + k;

      for (x = 0; x < g; x++) {
        aa = u - ak + x;
        ad = aa + j;

        for (z = 0; z < i; z++) {
          ac = w - am + z;
          af = ac + l;
          ag = ab * o + aa * b + ac;
          ah = ae * o + ad * b + af;

          if (((0 <= ac) && (af < b)) && ((0 <= ab) && (ae < s)) && ((0 <= aa) && (ad < t)) && ((0 <= ag) && (ag < r)) && ((0 <= ah) && (ah < r))) {
            ao += a[ag];
            ap += a[ah];
            ai++;
          }
        }
      }
    }
    ao = ao / (float)ai;
    ap = ap / (float)ai;

    for (y = 0; y < h; y++) {
      ab = v - al + y;
      ae = ab + k;

      for (x = 0; x < g; x++) {
        aa = u - ak + x;
        ad = aa + j;

        for (z = 0; z < i; z++) {
          ac = w - am + z;
          af = ac + l;
          ag = ab * o + aa * b + ac;
          ah = ae * o + ad * b + af;

          if (((0 <= ac) && (af < b)) && ((0 <= ab) && (ae < s)) && ((0 <= aa) && (ad < t)) && ((0 <= ag) && (ag < r)) && ((0 <= ah) && (ah < r))) {
            ar = a[ag] - ao;
            as = a[ah] - ap;

            at += ar * as;
            au += ar * ar;
            av += as * as;
          }
        }
      }
    }

    an = at / (sqrt(au) * sqrt(av));

    m[n] = an;

  } else {
    m[n] = -2.0;
  }
}
__kernel void F(__global const short* a, __global const float* b, __global const float* c, __global const float* d, const unsigned int e, const unsigned int f, const unsigned int g, const unsigned int h, const unsigned int i, const unsigned int j, const unsigned int k, __global float* l)

{
  const unsigned int m = get_global_id(0);

  const unsigned int n = m * e;
  const unsigned int o = m * f;
  int unsigned p = 0;
  int unsigned q = 0;

  B(&a[n], b, c, d, &l[2 * o], e, f, k);
}

void A(__global float* f, __global const float* b, __global const float* c, unsigned int d, __global float* e) {
  int g, h, i;
  int j;
  int k;
  int l;
  int m = 2;
  int n = (m + 1) * (m + 1);
  float o[3];
  float p[3];
  float q;
  float r;
  float s;
  float t;
  float u;
  float v;
  float w;
  float x;

  for (j = 0; j < d; j++) {
    q = b[j];

    s = (float)__clc_floor(q);
    t = (float)__clc_ceil(q);
    r = t + 1.0f;

    if ((int)s < 0)
      u = (float)f[0];
    else if ((int)t > d - 1)
      u = (float)f[2 * (d - 1)];
    else if (__clc_fabs(t - s) < 0.5)
      u = (float)f[2 * (int)r];
    else {
      v = (float)f[2 * (int)s];
      w = (float)f[2 * (int)t];
      x = (float)f[2 * (int)r];
      p[0] = v;
      p[1] = w;
      p[2] = x;

      l = j * n;

      g = 0;
      for (h = 0; h <= m; h++) {
        o[h] = 0.0f;
        for (i = 0; i <= m; i++) {
          o[h] += c[l + g] * p[i];
          g++;
        }
      }

      u = o[0] + o[1] * q + o[2] * q * q;
    }
    e[2 * j] = u;
  }
}

void B(__global const short* a, __global const float* b, __global const float* c, __global const float* d, __global float* e, unsigned int f, unsigned int g, unsigned int h) {
  unsigned int i;
  float j = (float)f;
  float k;
  float l;
  float m;
  float n;

  for (i = 0; i < f; i++) {
    e[2 * i + 1] = 0.0f;

    if (d != 0) {
      if (d[i] > 0.001) {
        e[2 * i] = (float)a[i] / d[i] - 1.0f;
      } else {
        e[2 * i] = 0.0f;
      }
    } else {
      e[2 * i] = (float)a[i];
    }
  }

  if (h == 1) {
    for (i = 0; i < f; i++) {
      e[2 * i] *= 0.5f * (1 - cos(2 * 0x1.921fb6p+1f * i / (f - 1)));
    }
  } else if (h == 2) {
    k = 0.355768;
    l = 0.487396;
    m = 0.144232;
    n = 0.012604;
    for (i = 0; i < f; i++) {
      e[2 * i] *= k - l * cos(2 * 0x1.921fb6p+1f * i / (j - 1.0f)) + m * cos(4 * 0x1.921fb6p+1f * i / (j - 1.0f)) - n * cos(6 * 0x1.921fb6p+1f * i / (j - 1.0f));
    }

  } else if (h == 3) {
    k = j / 2.0f;
    l = j / 4.0f;
    m = l * l;
    for (i = 0; i < f; i++) {
      n = (float)i - k;
      e[2 * i] *= exp(-(n * n) / m);
    }
  }

  for (i = 0; i < f; i++) {
    e[2 * i + 1] = e[2 * i];
  }

  if (b != 0) {
    A(&e[1], b, c, f, e);
  }

  for (i = 0; i < f; i++) {
    e[2 * i + 1] = 0.0f;
  }

  if (g > f) {
    for (i = f - 1; i < g; i++) {
      e[2 * i] = 0.0f;
      e[2 * i + 1] = 0.0f;
    }
  }
}