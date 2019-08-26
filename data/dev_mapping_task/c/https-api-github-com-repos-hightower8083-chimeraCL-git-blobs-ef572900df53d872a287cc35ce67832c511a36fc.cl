__kernel void A(__global double2* a, __global double* b, uint c, uint d, uint e) {
  uint f = (uint)get_global_id(0);
  if (f < c) {
    uint g = f / d;
    uint h = f - g * d;
    if (h < e) {
      a[f].s0 *= b[h];
      a[f].s1 *= b[h];
    }

    if (h > d - e) {
      a[f].s0 *= b[d - h];
      a[f].s1 *= b[d - h];
    }
  }
}

__kernel void B(__global double* a, __global double* b, uint c, uint d, uint e) {
  uint f = (uint)get_global_id(0);
  if (f < c) {
    uint g = f / d;
    uint h = f - g * d;
    if (h < e) {
      a[f] *= b[h];
    }

    if (h > d - e) {
      a[f] *= b[d - h];
    }
  }
}

__kernel void C(
  __constant uint *a,
  __constant double *b,
  __global double *c,
  __global double *d,
  __global double *e,
  __global double2 *f,
  __global double2 *g,
  __global double2 *h,
  __global double2 *i,
  __global double2 *j,
  __global double2 *k,
  __global double2 *l,
  __global double2 *m,
  __global double2 *n,
  __global double2 *o,
  __global double2 *p,
  __global double2 *q,
  __global double2 *r,
  __u doublett u       t  double aa = c[u];
    double ab = d[u];
    double ac = e[u];

    double ad = *b;
    double ae[3][2], af[3][2];

    double ag = 2 * 3.14;

    for (int ah=0;ah<3;ah++){
  for (int ai = 0; ai < 2; ai++) {
    x[ah][ai] *= ag;
    y[ah][ai] *= ag;
    z[ah][ai] *= ag;
  }
    }


    for (int ah=0;ah<3;ah++){
  for (int ai = 0; ai < 2; ai++) {
    ae[ah][ai] = aa * v[ah][ai] + ab * ac * (w[ah][ai] - x[ah][ai]) + ac * (aa * y[ah][ai] - z[ah][ai] - (y[ah][ai] - z[ah][ai]) * ad * ab * ac);

    af[ah][ai] = -ab * v[ah][ai] + aa * (w[ah][ai] - x[ah][ai]) + x[ah][ai] + ac * (ad * (1. - aa) * (y[ah][ai] - z[ah][ai]) - ab * y[ah][ai]);
  }
    }
    f[u] = (double2) {ae[0][0], ae[0][1]};
    g[u] = (double2) {ae[1][0], ae[1][1]};
    h[u] = (double2) {ae[2][0], ae[2][1]};

    i[u] = (double2) {af[0][0], af[0][1]};
    j[u] = (double2) {af[1][0], af[1][1]};
    k[u] = (double2) {af[2][0], af[2][1]};
}
}