typedef union {
  int i;
  float f;
} union_int_float_t;

__kernel void A(

    int a, int b, int c,

    int d, int e, int f, int g,

    double h, double i, double j, double k, double l,

    double m, double n, double o,

    __global int* p, __global int* q, __global int* r, __global double* s, __global double* t,

    double u, double v, double w, double x, double y,

    __read_only image2d_t z, __read_only image2d_t aa, __read_only image2d_t ab,

    __global double* ac, __global double* ad, __global double* ae, __global double* af

    ) {
  const sampler_t ag = 0x0000 | 0x0000 | 0x0000;

  int ah = get_global_id(0);

  if (ah < b) {
    int ai = ah + c;

    double aj = s[ai * 3 + 0];
    double ak = s[ai * 3 + 1];
    double al = s[ai * 3 + 2];
    double am = t[ai];

    int y = q[ah];

    int an = p[ah];

    double ao = 0.0;
    double ap = 0.0;
    double aq = 0.0;
    double ar = 0.0;
    double as = 0.0;
    double at = 0.0;
    double au = 0.0;
    double av = 0.0;
    double aw = 0.0;
    double ax = 0.0;
    double ay = 0.0;

    int az;
    for (az = 0; az < an; az++) {
      int ba = r[y + az];

      double bb;
      double bc;

      if (ba < d) {
        bb = 1.0;
        bc = 1.0;
      } else {
        int bd = ba / d;
        float4 be = read_imagef(z, ag, (int2)(0, bdd));
        bb = __builtin_astype(be.xy, double);
        be = read_imagef(aa, ag, (int2)(0, bdd));
        bc = __builtin_astype(be.xy, double);
        ba %= d;
      }

      double bf = aj - s[ba * 3 + 0];
      double bg = ak - s[ba * 3 + 1];
      double bh = al - s[ba * 3 + 2];
      double bi = bf * bf + bg * bg + bh * bh;

      if (bi < h) {
        double bj = 1.0 / bi;

        double bk;
        double bl;
        double bm;
        double bn;
        double bo;
        int bp;

        double bq;

        if (bi < i) {
          if (!e || bi <= j) {
            double br = sqrt(bi);
            double bs = m * br;
            double bt = exp(-bs * bs);
            double bu = 1.0 / (1.0 + 0.3275911 * bs);
            bn = bu * (0.254829592 + bu * (-0.284496736 + bu * (1.421413741 + bu * (-1.453152027 + bu * 1.061405429)))) * bt;
            bm = n * am * t[ba] / br;
            bk = bm * (bn + 1.12837917 * bs * bt);

            if (bb < 1.0) {
              bk -= (1.0 - bb) * bm;
            } else {
              union_int_float_t bv;
              bv.f = bi;
              bp = bv.i & f;
              bp >>= g;
       float4 be
        = read_imagef(ab,ag,(int2)(0,bp       double bw = __builtin_astype(be.xy, double);
       double bx = __builtin_astype(be.zw, double);
       bo = (bv.f - bw)*bx;
       be = read_imagef(ab,ag,(int2)(1,bp       double by = __builtin_astype(be.xy, double);
       double bz = __builtin_astype(be.zw, double);
       double ca = by + bo*bz;
       bk = am*t[ba] * ca;
       if (bb < 1.0) {
        be = read_imagef(
         ab,ag,(int2)(2,bp        double cb = __builtin_astype(be.xy, double);
        double cc = __builtin_astype(be.zw, double);
        ca = cb + bo*cc;
        bm = am*t[ba] * ca;
        bk -= (1.0-bb)*bm;
       }
            }
          }

        } else
          bk = 0.0;

        if (bi < k) {
          bq = bj * bj * bj;
          bl = bq * (u * bq - v);

          if (bi > l) {
            double cd = (k - bi) * (k - bi) * (k + 2.0 * bi - 3.0 * l) / o;
            double ce = 12.0 * bi * (k - bi) * (bi - l) / o;
            double cf = bq * (w * bq - x);
            bl = bl * cd + cf * ce;
          }

        } else
          bl = 0.0;

        double cg = (bk + bc * bl) * bj;

        ao += bf * cg;
        ap += bg * cg;
        aq += bh * cg;

        if (a == 1) {
          if (bi < i) {
            double ch;

            if (!e || bi <= j) {
              ch = bm * bn;

            } else {
       float4 be
        = read_imagef(ab,ag,(int2)(3,bp       double ci = __builtin_astype(be.xy, double);
       double cj = __builtin_astype(be.zw, double);
       double ca = ci + bo*cj;
       ch = am*t[ba] * ca;
            }
            ch = 0.0;

            if (bb < 1.0)
              ch -= (1.0 - bb) * bm;

            ar += ch;
          }

          if (bi < k) {
            double ck = bq * (w * bq - x);
            if (bi > l) {
              double cd = (k - bi) * (k - bi) * (k + 2.0 * bi - 3.0 * l) / o;
              ck *= cd;
            }
            ck *= bc;
            as += ck;
          }

          at += 0.5 * bf * bf * cg;
          au += 0.5 * bg * bg * cg;
          av += 0.5 * bh * bh * cg;
          aw += 0.5 * bf * bg * cg;
          ax += 0.5 * bf * bh * cg;
          ay += 0.5 * bg * bh * cg;
        }
      }
    }

    ac[ai * 3 + 0] = ao;
    ac[ai * 3 + 1] = ap;
    ac[ai * 3 + 2] = aq;

    if (a == 1) {
      ae[ai] = ar;
      ad[ai] = as;
      af[ai * 6 + 0] = at;
      af[ai * 6 + 1] = au;
      af[ai * 6 + 2] = av;
      af[ai * 6 + 3] = aw;
      af[ai * 6 + 4] = ax;
      af[ai * 6 + 5] = ay;
    }
  }
}