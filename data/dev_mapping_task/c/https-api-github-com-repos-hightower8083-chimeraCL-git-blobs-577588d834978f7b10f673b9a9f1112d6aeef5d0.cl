__kernel void A(uint a, __global uint* b, __global double* c, __global double* d, __global double* e, __global double* f, __global uint* g, char h, __constant uint* i, __constant double* j, __constant double* k, __constant uint* l, __constant double* m, __constant double* n, __constant uint* o, __global double* p) {
  uint q = (uint)get_global_id(0);
  if (q < *o) {
    uint r = *i;
    uint s = r - 1;
    uint t = r / 2;

    uint u = *l - 1;

    uint v = q / t;
    uint w = q - v * t;

    w *= 2;
    v *= 2;

    if (a == 1) {
      w += 1;
    } else if (a == 2) {
      v += 1;
    } else if (a == 3) {
      w += 1;
      v += 1;
    }

    if (w > 0 && w < s - 1 && v < u - 1 && v >= 0) {
      uint x = w + v * s;
      uint y = w + v * r;

      uint z = g[x];
      uint aa = g[x + 1];

      if (z != aa) {
        double ab[2][2] = {{0., 0.}, {0., 0.}};
        double ac[2][2];

        double ad, ae, af, ag;

        double ah, ai, aj, ak, al;
        double am = *m;
        double an = *n;
        double ao = *j;
        double ap = *k;
        uint aq;

        for (uint ar = z; ar < aa; ar++) {
          aq = b[ar];
          ah = c[aq];
          ai = d[aq];
          aj = e[aq];
          ak = f[aq] * h;

          al = sqrt(ai * ai + aj * aj);

          ae = (ah - ao) * ap - w;
          ad = 1.0 - ae;
          ag = (al - am) * an - v;
          af = 1.0 - ag;

          ad *= ak;
          ae *= ak;

          ac[0][0] = af * ad;
          ac[0][1] = af * ae;
          ac[1][0] = ag * ad;
          ac[1][1] = ag * ae;

          for (int as = 0; as < 2; as++) {
            for (int at = 0; at < 2; at++) {
              ab[as][at] += ac[as][at];
            }
          }
        }

        for (int as = 0; as < 2; as++) {
          for (int at = 0; at < 2; at++) {
            int au = y + at + r * as;
            p[au] += ab[as][at];
          }
        }
      }
    }
  }
}
__kernel void B(uint a, __global uint* b, __global double* c, __global double* d, __global double* e, __global double* f, __global double* g, __global double* h, __global double* i, __global double* j, __global uint* k, char l, __constant uint* m, __constant double* n, __constant double* o, __constant uint* p, __constant double* q, __constant double* r, __constant uint* s, __global double* t, __global double* u, __global double* v) {
  uint w = (uint)get_global_id(0);
  if (w < *s) {
    uint x = *m;
    uint y = x - 1;
    uint z = x / 2;
    uint aa = *p - 1;

    uint ab = w / z;
    uint ac = w - ab * z;

    ac *= 2;
    ab *= 2;

    if (a == 1) {
      ac += 1;
    } else if (a == 2) {
      ab += 1;
    } else if (a == 3) {
      ac += 1;
      ab += 1;
    }

    if (ac > 0 && ac < y - 1 && ab < aa - 1 && ab >= 0) {
      uint ad = ac + ab * y;
      uint ae = ac + ab * x;

      uint af = k[ad];
      uint ag = k[ad + 1];

      if (af != ag) {
        double ah[3][2][2];

        for (int ai = 0; ai < 3; ai++) {
          for (int aj = 0; aj < 2; aj++) {
            for (int ak = 0; ak < 2; ak++) {
              ah[ai][aj][ak] = 0;
            }
          }
        }

        double al, am, an, ao;
        double ap[2][2];

        double aq, ar, as, at, au;
        double av[3];
        double aw = *q;
        double ax = *r;
        double ay = *n;
        double az = *o;
        uint ba;

        for (uint bb = af; bb < ag; bb++) {
          ba = b[bb];
          aq = c[ba];
          ar = d[ba];
          as = e[ba];
          av[0] = f[ba];
          av[1] = g[ba];
          av[2] = h[ba];
          at = j[ba] * i[ba] * l;

          au = sqrt(ar * ar + as * as);

          am = (aq - ay) * az - ac;
          al = 1.0 - am;
          ao = (au - aw) * ax - ab;
          an = 1.0 - ao;

          al *= at;
          am *= at;

          ap[0][0] = an * al;
          ap[0][1] = an * am;
          ap[1][0] = ao * al;
          ap[1][1] = ao * am;

          for (int ai = 0; ai < 3; ai++) {
            for (int aj = 0; aj < 2; aj++) {
              for (int ak = 0; ak < 2; ak++) {
                ah[ai][aj][ak] += ap[aj][ak] * av[ai];
              }
            }
          }
        }

        for (int aj = 0; aj < 2; aj++) {
          for (int ak = 0; ak < 2; ak++) {
            int bc = ae + ak + x * aj;
            t[bc] += ah[0][aj][ak];
            u[bc] += ah[1][aj][ak];
            v[bc] += ah[2][aj][ak];
          }
        }
      }
    }
  }
}

__kernel void C(__global double* a, __global double* b, __global double* c, __global double* d, __global double* e, __global double* f, __global double* g, __global uint* h, __global uint* i, __constant double* j, uint k, uint l, __constant uint* m, __constant double* n, __constant double* o, __constant uint* p, __constant double* q, __constant double* r, __constant uint* s, __global double* t, __global double* u, __global double* v, __global double* w, __global double* x, __global double* y) {
  uint z = (uint)get_global_id(0);
  if (z < k) {
    uint aa = h[z];
    if (aa < l) {
      int ab = (int)*m;
      int ac = ab - 1;
      int ad = (int)*p - 1;

      double ae = a[aa];
      double af = b[aa];
      double ag = c[aa];
      double ah = sqrt(af * af + ag * ag);

      double ai = *n;
      double aj = *q;
      double ak = *r;
      double al = *o;

      int am = (int)__clc_floor((ae - ai) * al);
      int an = (int)__clc_floor((ah - aj) * ak);

      if (am > 0 && am < ac - 1 && an < ad - 1) {
        double ao[3] = { defaa double ap = 0.5 * (*j);
        double aq = 1. / ah;

        uint ar = am + an * ac;
        uint as = am + an * ab;

        double at = (ae - ai) * al - am;
        double au = 1.0 - at;
        double av = (ah - aj) * ak - an;
        double aw = 1.0 - av;

        double ax[2][2];

        ax[0][0] = aw * au;
        ax[0][1] = aw * at;
        ax[1][0] = av * au;
        ax[1][1] = av * at;

        uint ay, az, ba, bb;

        double bc[3][2][2];
        double bd[3][2][2];

        for (ay = 0; ay < 2; ay++) {
          for (az = 0; az < 2; az++) {
            bb = as + az + ab * ay;
            bc[0][ay][az] = t[bb];
            bc[1][ay][az] = u[bb];
            bc[2][ay][az] = v[bb];

            bd[0][ay][az] = w[bb];
            bd[1][ay][az] = x[bb];
            bd[2][ay][az] = y[bb];
          }
        }

        double be[3], bf[3];
        for (ba = 0; ba < 3; ba++) {
          be[ba] = 0;
          bf[ba] = 0;
        }

        for (ba = 0; ba < 3; ba++) {
          for (ay = 0; ay < 2; ay++) {
            for (az = 0; az < 2; az++) {
              be[ba] += ax[ay][az] * bc[ba][ay][az];
              bf[ba] += ax[ay][az] * bd[ba][ay][az];
            }
          }
        }

        double bg[3], bh[3], bi[3], bj[3], bk[3];

        for (ba = 0; ba < 3; ba++) {
          bg[ba] = ao[ba] + ap * be[ba];
        }

        double bl = 1. / sqrt(1. + bg[0] * bg[0] + bg[1] * bg[1] + bg[2] * bg[2]);

        for (ba = 0; ba < 3; ba++) {
          bj[ba] = ap * bf[ba] * bl;
        }

        double bm = 2. / (1. + bj[0] * bj[0] + bj[1] * bj[1] + bj[2] * bj[2]);

        for (ba = 0; ba < 3; ba++) {
          bk[ba] = bj[ba] * bm;
        }

        bi[0] = bg[0] + bg[1] * bj[2] - bg[2] * bj[1];
        bi[1] = bg[1] - bg[0] * bj[2] + bg[2] * bj[0];
        bi[2] = bg[2] + bg[0] * bj[1] - bg[1] * bj[0];

        bh[0] = bg[0] + bi[1] * bk[2] - bi[2] * bk[1];
        bh[1] = bg[1] - bi[0] * bk[2] + bi[2] * bk[0];
        bh[2] = bg[2] + bi[0] * bk[1] - bi[1] * bk[0];

        for (int ba = 0; ba < 3; ba++) {
          ao[ba] = bh[ba] + ap * be[ba];
        }

        bl = 1. / sqrt(1. + ao[0] * ao[0] + ao[1] * ao[1] + ao[2] * ao[2]);

        d[aa] = ao[0];
        e[aa] = ao[1];
        f[aa] = ao[2];
        g[aa] = bl;
      }
    }
  }
}