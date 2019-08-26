__kernel void A(__global const float* a, __global float* b, const int c, const float d, const int e, const int f, const int g, const int h, __global float* i, __global float* j, __global float* k, __global float* l, __global float* m) {
  int n = get_global_id(0);
  int o = get_global_id(1);

  int p = c * 2 + 1;
  int q = p * p;

  if (n < e && o < f) {
    n += c;
    o += c;

    int r = e + 2 * c;
    int s = f + 2 * c;

    float t[3] = {};
    float u[3] = {};
    float v[3] = {};
    float w[3][3] = {{0, 0, 0}, {0, 0, 0}, {0, 0, 0}};

    float x = 0;
    float y = 0;
    float z = 0;

    float aa[3] = {};
    float ab[3] = {};
    float ac[3] = {};

    float ad = 0;
    float ae = 0;
    float af = 0;
    float ag = 0;
    float ah = 0;
    float ai = 0;

    float aj[3][3] = {};
    float ak[3] = {};

    for (int al = 0; al < g; ++al) {
      for (int am = -c; am <= c; am++) {
        for (int l = -c; l <= c; l++) {
          t[al] += m[(o + am) * r + (n + l) + al * r * s];

          u[al] += m[(o + am) * r + (n + l) + al * r * s] * m[(o + am) * r + (n + l) + al * r * s];
          v[al] += a[(o + am) * r + (n + l) + al * r * s];

          w[al][0] += m[(o + am) * r + (n + l) + 0 * r * s] * a[(o + am) * r + (n + l) + al * r * s];
          w[al][1] += m[(o + am) * r + (n + l) + 1 * r * s] * a[(o + am) * r + (n + l) + al * r * s];
          w[al][2] += m[(o + am) * r + (n + l) + 2 * r * s] * a[(o + am) * r + (n + l) + al * r * s];

          if (al == 0) {
            x += m[(o + am) * r + (n + l) + 0 * r * s] * m[(o + am) * r + (n + l) + 1 * r * s];
            y += m[(o + am) * r + (n + l) + 0 * r * s] * m[(o + am) * r + (n + l) + 2 * r * s];
            z += m[(o + am) * r + (n + l) + 1 * r * s] * m[(o + am) * r + (n + l) + 2 * r * s];
          }
        }
      }

      aa[al] = t[al] / q;
      ab[al] = u[al] / q;
      ac[al] = v[al] / q;
    }

    x /= q;
    y /= q;
    z /= q;

    ad = ab[0] - aa[0] * aa[0];
    ae = x - aa[0] * aa[1];
    af = y - aa[0] * aa[2];
    ag = ab[1] - aa[1] * aa[1];
    ah = z - aa[1] * aa[2];
    ai = ab[2] - aa[2] * aa[2];

    float an[3][3];
    an[0][0] = ad + d;
    an[0][1] = ae;
    an[0][2] = af;
    an[1][0] = ae;
    an[1][1] = ag + d;
    an[1][2] = ah;
    an[2][0] = af;
    an[2][1] = ah;
    an[2][2] = ai + d;

    float ao = an[0][0] * (an[1][1] * an[2][2] - an[2][1] * an[1][2]) - an[0][1] * (an[1][0] * an[2][2] - an[1][2] * an[2][0]) + an[0][2] * (an[1][0] * an[2][1] - an[1][1] * an[2][0]);

    float ap = 1 / ao;

    float aq[3][3];
    aq[0][0] = (an[1][1] * an[2][2] - an[2][1] * an[1][2]) * ap;
    aq[0][1] = (an[0][2] * an[2][1] - an[0][1] * an[2][2]) * ap;
    aq[0][2] = (an[0][1] * an[1][2] - an[0][2] * an[1][1]) * ap;
    aq[1][0] = (an[1][2] * an[2][0] - an[1][0] * an[2][2]) * ap;
    aq[1][1] = (an[0][0] * an[2][2] - an[0][2] * an[2][0]) * ap;
    aq[1][2] = (an[1][0] * an[0][2] - an[0][0] * an[1][2]) * ap;
    aq[2][0] = (an[1][0] * an[2][1] - an[2][0] * an[1][1]) * ap;
    aq[2][1] = (an[2][0] * an[0][1] - an[0][0] * an[2][1]) * ap;
    aq[2][2] = (an[0][0] * an[1][1] - an[1][0] * an[0][1]) * ap;

    for (int al = 0; al < g; ++al) {
      aj[al][0] = aq[0][0] * (w[al][0] - q * aa[0] * ac[al]) + aq[0][1] * (w[al][0] - q * aa[0] * ac[al]) + aq[0][2] * (w[al][0] - q * aa[0] * ac[al]);
      aj[al][1] = aq[1][0] * (w[al][1] - q * aa[1] * ac[al]) + aq[1][1] * (w[al][1] - q * aa[1] * ac[al]) + aq[1][2] * (w[al][1] - q * aa[1] * ac[al]);
      aj[al][2] = aq[2][0] * (w[al][2] - q * aa[2] * ac[al]) + aq[2][1] * (w[al][2] - q * aa[2] * ac[al]) + aq[2][2] * (w[al][2] - q * aa[2] * ac[al]);

      aj[al][0] /= q;
      aj[al][1] /= q;
      aj[al][2] /= q;
    }

    float ar = 0;

    for (int al = 0; al < g; ++al) {
      ar = 0;
      ar += aj[al][0] * aa[0] + aj[al][1] * aa[1] + aj[al][2] * aa[2];
      ak[al] = ac[al] - ar;
    }

    for (int al = 0; al < g; ++al) {
      i[o * r + n + al * r * s] = aj[al][0];
      j[o * r + n + al * r * s] = aj[al][1];
      k[o * r + n + al * r * s] = aj[al][2];

      l[o * r + n + al * r * s] = ak[al];
    }
  }
}