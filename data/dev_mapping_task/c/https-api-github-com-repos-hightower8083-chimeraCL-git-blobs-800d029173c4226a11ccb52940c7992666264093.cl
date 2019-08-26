__kernel void A(uint a, __global uint* b, __global double* c, __global double* d, __global double* e, __global double* f, __global uint* g, char h, __constant uint* i, __constant double* j, __constant double* k, __constant uint* l, __constant double* m, __constant double* n, __constant uint* o, __global double* p, __global double2* q) {
  uint r = (uint)get_global_id(0);
  if (r < *o) {
    uint s = *i;
    uint t = s - 1;
    uint u = s / 2;
    uint v = *l - 1;

    uint w = r / u;
    uint x = r - w * u;

    x *= 2;
    w *= 2;

    if (a == 1) {
      x += 1;
    } else if (a == 2) {
      w += 1;
    } else if (a == 3) {
      x += 1;
      w += 1;
    }

    if (x > 0 && x < t - 1 && w < v - 1) {
      uint y = x + w * t;
      uint z = x + w * s;

      uint aa = g[y];
      uint ab = g[y + 1];

      if (aa != ab) {
        uint ac, ad, ae;

        double af[2][2];
        double ag[2][2][2];

        for (ac = 0; ac < 2; ac++) {
          for (ad = 0; ad < 2; ad++) {
            af[ac][ad] = 0;
            ag[ac][ad][0] = 0;
            ag[ac][ad][1] = 0;
          }
        }

        double ah, ai, aj, ak;
        double al[2][2];
        double am[2];

        double an, ao, ap, aq, ar, as;
        double at = *m;
        double au = *n;
        double av = *j;
        double aw = *k;
        uint ax;

        for (uint ay = aa; ay < ab; ay++) {
          ax = b[ay];
          an = c[ax];
          ao = d[ax];
          ap = e[ax];
          aq = f[ax] * h;

          ar = sqrt(ao * ao + ap * ap);

          as = 1. / ar;
          am[0] = ao * as;
          am[1] = ap * as;

          ai = (an - av) * aw - x;
          ah = 1.0 - ai;
          ak = (ar - at) * au - w;
          aj = 1.0 - ak;

          ah *= aq;
          ai *= aq;

          al[0][0] = aj * ah;
          al[0][1] = aj * ai;
          al[1][0] = ak * ah;
          al[1][1] = ak * ai;

          for (ac = 0; ac < 2; ac++) {
            for (ad = 0; ad < 2; ad++) {
              af[ac][ad] += al[ac][ad];
              ag[ac][ad][0] += al[ac][ad] * am[0];
              ag[ac][ad][1] += al[ac][ad] * am[1];
            }
          }
        }

        for (ac = 0; ac < 2; ac++) {
          for (ad = 0; ad < 2; ad++) {
            ae = z + ad + s * ac;

            p[ae] = p[ae] + af[ac][ad];

        q[ae] = q[ae] + (doubace2)ad{ag0],
                                             ac   ad ag1]};
          }
        }
      }
    }
  }
}
__kernel void B(uint a, __global uint* b, __global double* c, __global double* d, __global double* e, __global double* f, __global double* g, __global double* h, __global double* i, __global double* j, __global uint* k, char l, __constant uint* m, __constant double* n, __constant double* o, __constant uint* p, __constant double* q, __constant double* r, __constant uint* s, __global double* t, __global double* u, __global double* v, __global double2* w, __global double2* x, __global double2* y) {
  uint z = (uint)get_global_id(0);
  if (z < *s) {
    uint aa = *m;
    uint ab = aa - 1;
    uint ac = aa / 2;
    uint ad = *p - 1;

    uint ae = z / ac;
    uint af = z - ae * ac;

    af *= 2;
    ae *= 2;

    if (a == 1) {
      af += 1;
    } else if (a == 2) {
      ae += 1;
    } else if (a == 3) {
      af += 1;
      ae += 1;
    }

    if (af > 0 && af < ab - 1 && ae < ad - 1) {
      uint ag = af + ae * ab;
      uint ah = af + ae * aa;

      uint ai = k[ag];
      uint aj = k[ag + 1];

      if (ai != aj) {
        uint ak, al, am, an;

        double ao[3][2][2];
        double ap[3][2][2][2];

        for (am = 0; am < 3; am++) {
          for (ak = 0; ak < 2; ak++) {
            for (al = 0; al < 2; al++) {
              ao[am][ak][al] = 0.;
              ap[am][ak][al][0] = 0.;
              ap[am][ak][al][1] = 0.;
            }
          }
        }

        double aq, ar, as, at;
        double au[2][2];
        double av[2];

        double aw, ax, ay, az, ba, bb, bc;
        double bd[3];
        double be = *q;
        double bf = *r;
        double bg = *n;
        double bh = *o;
        uint bi;

        for (uint bj = ai; bj < aj; bj++) {
          bi = b[bj];
          aw = c[bi];
          ax = d[bi];
          ay = e[bi];
          bd[0] = f[bi];
          bd[1] = g[bi];
          bd[2] = h[bi];
          az = j[bi] * i[bi] * l;

          ba = sqrt(ax * ax + ay * ay);

          bb = 0;
          if (ba > 0) {
            bb = 1. / ba;
          }

          av[0] = ax * bb;
          av[1] = ay * bb;

          ar = (aw - bg) * bh - af;
          aq = 1.0 - ar;
          at = (ba - be) * bf - ae;
          as = 1.0 - at;

          aq *= az;
          ar *= az;

          au[0][0] = as * aq;
          au[0][1] = as * ar;
          au[1][0] = at * aq;
          au[1][1] = at * ar;

          for (am = 0; am < 3; am++) {
            for (ak = 0; ak < 2; ak++) {
              for (al = 0; al < 2; al++) {
                bc = au[ak][al] * bd[am];
                ao[am][ak][al] += au[ak][al] * bd[am];
                ap[am][ak][al][0] += bc * av[0];
                ap[am][ak][al][1] += bc * av[1];
              }
            }
          }
        }

        for (ak = 0; ak < 2; ak++) {
          for (al = 0; al < 2; al++) {
            an = ah + al + aa * ak;

            t[an] = t[an] + ao[0][ak][al];
            u[an] = u[an] + ao[1][ak][al];
            v[an] = v[an] + ao[2][ak][al];

        w[an] = w[an] + (double2ak {aall][0],
                                                    ak  aall][1]};
        x[an] = x[an] + (double2ak {aall][0],
                                                    ak  aall][1]};
        y[an] = y[an] + (double2ak {aall][0],
                                                    ak  aall][1]};
          }
        }
      }
    }
  }
}

__kernel void C(__global double* a, __global double* b, __global double* c, __global double* d, __global double* e, __global double* f, __global double* g, __global uint* h, __global uint* i, __constant double* j, uint k, uint l, __constant uint* m, __constant double* n, __constant double* o, __constant uint* p, __constant double* q, __constant double* r, __constant uint* s, __global double* t, __global double* u, __global double* v, __global double* w, __global double* x, __global double* y,
                __global double2* z, __global double2* aa, __global double2* ab, __global double2* ac, __global double2* ad, __global double2* ae) {
  uint af = (uint)get_global_id(0);
  if (af < k) {
    uint ag = h[af];
    if (ag < l) {
      int ah = (int)*m;
      int ai = ah - 1;
      int aj = (int)*p - 1;

      double ak = *n;
      double al = *q;
      double am = *r;
      double an = *o;

      double ao = a[ag];
      double ap = b[ag];
      double aq = c[ag];
      double ar = sqrt(ap * ap + aq * aq);

      int as = (int)__clc_floor((ao - ak) * an);
      int at = (int)__clc_floor((ar - al) * am);

      if (as > 0 && as < ai - 1 && at < aj - 1) {
        uint au = as + at * ai;
        uint av = as + at * ah;

        double aw[3] = { defag double ax = 0.5 * (*j);
        double ay = 1. / ar;

        double az = (ao - ak) * an - as;
        double ba = 1.0 - az;
        double bb = (ar - al) * am - at;
        double bc = 1.0 - bb;

        double bd[2][2];
        double be[2];

        be[0] = ap * ay;
        be[1] = -aq * ay;

        bd[0][0] = bc * ba;
        bd[0][1] = bc * az;
        bd[1][0] = bb * ba;
        bd[1][1] = bb * az;

        uint bf, bg, bh, bi;

        double bj[3][2][2];
        double bk[3][2][2];
        double bl[3][2][2][2];
        double bm[3][2][2][2];

        for (bf = 0; bf < 2; bf++) {
          for (bg = 0; bg < 2; bg++) {
            bi = av + bg + ah * bf;
            bj[0][bf][bg] = t[bi];
            bj[1][bf][bg] = u[bi];
            bj[2][bf][bg] = v[bi];

            bk[0][bf][bg] = w[bi];
            bk[1][bf][bg] = x[bi];
            bk[2][bf][bg] = y[bi];

            bl[0][bf][bg][0] = 2 * ((double)z[bi].s0);
            bl[0][bf][bg][1] = 2 * ((double)z[bi].s1);

            bl[1][bf][bg][0] = 2 * ((double)aa[bi].s0);
            bl[1][bf][bg][1] = 2 * ((double)aa[bi].s1);

            bl[2][bf][bg][0] = 2 * ((double)ab[bi].s0);
            bl[2][bf][bg][1] = 2 * ((double)ab[bi].s1);

            bm[0][bf][bg][0] = 2 * ((double)ac[bi].s0);
            bm[0][bf][bg][1] = 2 * ((double)ac[bi].s1);

            bm[1][bf][bg][0] = 2 * ((double)ad[bi].s0);
            bm[1][bf][bg][1] = 2 * ((double)ad[bi].s1);

            bm[2][bf][bg][0] = 2 * ((double)ae[bi].s0);
            bm[2][bf][bg][1] = 2 * ((double)ae[bi].s1);
          }
        }

        double bn[3], bo[3];
        for (bh = 0; bh < 3; bh++) {
          bn[bh] = 0;
          bo[bh] = 0;
        }

        for (bh = 0; bh < 3; bh++) {
          for (bf = 0; bf < 2; bf++) {
            for (bg = 0; bg < 2; bg++) {
              bn[bh] += bd[bf][bg] * bj[bh][bf][bg];
              bo[bh] += bd[bf][bg] * bk[bh][bf][bg];

              bn[bh] += bd[bf][bg] * bl[bh][bf][bg][0] * be[0];
              bn[bh] -= bd[bf][bg] * bl[bh][bf][bg][1] * be[1];
              bo[bh] += bd[bf][bg] * bm[bh][bf][bg][0] * be[0];
              bo[bh] -= bd[bf][bg] * bm[bh][bf][bg][1] * be[1];
            }
          }
        }

        double bp[3], bq[3], br[3], bs[3], bt[3];

        for (bh = 0; bh < 3; bh++) {
          bp[bh] = aw[bh] + ax * bn[bh];
        }

        double bu = 1. / sqrt(1. + bp[0] * bp[0] + bp[1] * bp[1] + bp[2] * bp[2]);

        for (bh = 0; bh < 3; bh++) {
          bs[bh] = ax * bo[bh] * bu;
        }

        double bv = 2. / (1. + bs[0] * bs[0] + bs[1] * bs[1] + bs[2] * bs[2]);

        for (bh = 0; bh < 3; bh++) {
          bt[bh] = bs[bh] * bv;
        }

        br[0] = bp[0] + bp[1] * bs[2] - bp[2] * bs[1];
        br[1] = bp[1] - bp[0] * bs[2] + bp[2] * bs[0];
        br[2] = bp[2] + bp[0] * bs[1] - bp[1] * bs[0];

        bq[0] = bp[0] + br[1] * bt[2] - br[2] * bt[1];
        bq[1] = bp[1] - br[0] * bt[2] + br[2] * bt[0];
        bq[2] = bp[2] + br[0] * bt[1] - br[1] * bt[0];

        for (int bh = 0; bh < 3; bh++) {
          aw[bh] = bq[bh] + ax * bn[bh];
        }

        bu = 1. / sqrt(1. + aw[0] * aw[0] + aw[1] * aw[1] + aw[2] * aw[2]);

        d[ag] = aw[0];
        e[ag] = aw[1];
        f[ag] = aw[2];
        g[ag] = bu;
      }
    }
  }
}