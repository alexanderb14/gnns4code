struct global_constants {
  float gam;
  float gm1;
  float cfl;
  float eps;
  float mach;
  float alpha;
  float qinf[4];
};

typedef enum { OP_READ, OP_WRITE, OP_RW, OP_INC, OP_MIN, OP_MAX } op_access;
inline void A(__local float* a, __local float* b, __local float* c, __local float* d, float* e, __global int* f, __constant struct global_constants* g) {
  float h, i, j, k, l, m, n, o, p;

  h = a[0] - b[0];
  i = a[1] - b[1];

  k = 1.0f / c[0];
  l = g->gm1 * (c[3] - 0.5f * k * (c[1] * c[1] + c[2] * c[2]));

  if (*f == 1) {
    e[1] += +l * i;
    e[2] += -l * h;
  } else {
    m = k * (c[1] * i - c[2] * h);

    k = 1.0f / g->qinf[0];
    n = g->gm1 * (g->qinf[3] - 0.5f * k * (g->qinf[1] * g->qinf[1] + g->qinf[2] * g->qinf[2]));
    o = k * (g->qinf[1] * i - g->qinf[2] * h);

    j = (*d) * g->eps;

    p = 0.5f * (m * c[0] + o * g->qinf[0]) + j * (c[0] - g->qinf[0]);
    e[0] += p;
    p = 0.5f * (m * c[1] + l * i + o * g->qinf[1] + n * i) + j * (c[1] - g->qinf[1]);
    e[1] += p;
    p = 0.5f * (m * c[2] - l * h + o * g->qinf[2] - n * h) + j * (c[2] - g->qinf[2]);
    e[2] += p;
    p = 0.5f * (m * (c[3] + l) + o * (g->qinf[3] + n)) + j * (c[3] - g->qinf[3]);
    e[3] += p;
  }
}
__kernel void B(__global float* a, __global int* b, __global float* c, __global int* d, __global float* e, __global int* f, __global float* g, __global int* h, __global short* i, __global short* j, __global short* k, __global short* l, __global short* m, __global int* n, __global int* o, __global int* p, int q, __global int* r, __global int* s, __global int* t, __global int* u, __global int* v, __local float* w, __constant struct global_constants* x) {
  float y[4];

  __global int *__local z, *__local aa, *__local ab, *__local ac;
  __local int ad, ae, af, ag;
  __local float* __local ah;
  __local float* __local ai;
  __local float* __local aj;
  __local float* __local ak;
  __local int al, am;
  __local int an, ao;

  if (get_local_id(0) == 0) {
    int ap = r[get_group_id(0) + q];

    an = t[ap];
    ao = s[ap];

    al = get_local_size(0) * (1 + (an - 1) / get_local_size(0));
    am = u[ap];

    ad = o[0 + ap * 4];
    ae = o[1 + ap * 4];
    af = o[2 + ap * 4];
    ag = o[3 + ap * 4];

    z = b + p[0 + ap * 4];
    aa = d + p[1 + ap * 4];
    ab = f + p[2 + ap * 4];
    ac = h + p[3 + ap * 4];

    int t = 0;
    ah = &w[t];
    t += (((ad * 2) + 15) & ~15);
    ai = &w[t];
    t += (((ae * 4) + 15) & ~15);
    aj = &w[t];
    t += (((af * 1) + 15) & ~15);
    ak = &w[t];
  }

  barrier(1);

  for (int aq = get_local_id(0); aq < ad * 2; aq += get_local_size(0))
    ah[aq] = a[aq % 2 + z[aq / 2] * 2];

  for (int aq = get_local_id(0); aq < ae * 4; aq += get_local_size(0))
    ai[aq] = c[aq % 4 + aa[aq / 4] * 4];

  for (int aq = get_local_id(0); aq < af * 1; aq += get_local_size(0))
    aj[aq] = e[aq % 1 + ab[aq / 1] * 1];

  for (int aq = get_local_id(0); aq < ag * 4; aq += get_local_size(0))
    ak[aq] = 0.0f;

  barrier(1);

  for (int aq = get_local_id(0); aq < al; aq += get_local_size(0)) {
    int ar = -1;

    if (aq < an) {
      for (int as = 0; as < 4; as++)
        y[as] = 0.0f;

      A(ah + i[aq + ao] * 2, ah + j[aq + ao] * 2, ai + k[aq + ao] * 4, aj + l[aq + ao] * 1, y, n + (aq + ao) * 1, x);

      ar = v[aq + ao];
    }

    int at = m[aq + ao];

    for (int au = 0; au < am; au++) {
      if (ar == au) {
        for (int as = 0; as < 4; as++)
          ak[as + at * 4] += y[as];
      }
      barrier(1);
    }
  }

  for (int aq = get_local_id(0); aq < ag * 4; aq += get_local_size(0))
    g[aq % 4 + ac[aq / 4] * 4] += ak[aq];
}

inline void C(__global volatile float* a, float b, int c, __local float* d) {
  int e = get_local_id(0);
  int f = get_local_size(0) >> 1;

  barrier(1);

  d[e] = b;

  size_t g = 4;

  for (; f > g; f >>= 1) {
    barrier(1);
    if (e < f) {
      switch (c) {
        case OP_INC:
          d[e] = d[e] + d[e + f];
          break;
        case OP_MIN:
          if (d[e + f] < d[e])
            d[e] = d[e + f];
          break;
        case OP_MAX:
          if (d[e + f] > d[e])
            d[e] = d[e + f];
          break;
      }
    }
  }

  barrier(1);

  __local volatile float* h = d;

  if (e < g) {
    for (; f > 0; f >>= 1) {
      if (e < f) {
        switch (c) {
          case OP_INC:
            h[e] = h[e] + h[e + f];
            break;
          case OP_MIN:
            if (h[e + f] < h[e])
              h[e] = h[e + f];
            break;
          case OP_MAX:
            if (h[e + f] > h[e])
              h[e] = h[e + f];
            break;
        }
      }
    }
  }

  if (e == 0) {
    switch (c) {
      case OP_INC:
        *a = *a + h[0];
        break;
      case OP_MIN:
        if (d[0] < *a)
          *a = h[0];
        break;
      case OP_MAX:
        if (d[0] > *a)
          *a = h[0];
        break;
    }
  }
}

inline void D(float* a, float* b, float* c, __global float* d, float* e) {
  float f, g;

  g = 1.0f / (*d);

  for (int h = 0; h < 4; h++) {
    f = g * c[h];
    b[h] = a[h] - f;
    c[h] = 0.0f;
    *e += f * f;
  }
}

__kernel void E(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, int f, int g, int h, __local float* i) {
  e = e + f / sizeof(float);

  float j[4];
  float k[4];
  float l[4];
  float m[1];
  for (int n = 0; n < 1; n++)
    m[n] = 0.0f;

  int o = get_local_id(0) % 4;

  __local float* p = i + g * (get_local_id(0) / 4) / sizeof(float);

  for (int q = get_global_id(0); q < h; q += get_global_size(0)) {
    int r = q - o;
    int s = ((4 < h - r) ? (4) : (h - r));

    for (int t = 0; t < 4; t++)
      p[o + t * s] = a[o + t * s + r * 4];

    for (int t = 0; t < 4; t++)
      j[t] = p[t + o * 4];

    for (int t = 0; t < 4; t++)
      p[o + t * s] = c[o + t * s + r * 4];

    for (int t = 0; t < 4; t++)
      l[t] = p[t + o * 4];

    D(j, k, l, d + q, m);

    for (int t = 0; t < 4; t++)
      p[t + o * 4] = k[t];

    for (int t = 0; t < 4; t++)
      b[o + t * s + r * 4] = p[o + t * s];

    for (int t = 0; t < 4; t++)
      p[t + o * 4] = l[t];

    for (int t = 0; t < 4; t++)
      c[o + t * s + r * 4] = p[o + t * s];
  }

  __local float u[1600];

  for (int n = 0; n < 1; n++)
    C(&e[n + get_group_id(0) * 1], m[n], OP_INC, u);
}

inline void F(float* a, float* b, float* c, float* d, float* e, float* f, __constant struct global_constants* g) {
  float h, i, j, k, l, m;

  j = 1.0f / e[0];
  k = j * e[1];
  l = j * e[2];
  m = sqrt(g->gam * g->gm1 * (j * e[3] - 0.5f * (k * k + l * l)));

  h = b[0] - a[0];
  i = b[1] - a[1];
  *f = __clc_fabs(k * i - l * h) + m * sqrt(h * h + i * i);

  h = c[0] - b[0];
  i = c[1] - b[1];
  *f += __clc_fabs(k * i - l * h) + m * sqrt(h * h + i * i);

  h = d[0] - c[0];
  i = d[1] - c[1];
  *f += __clc_fabs(k * i - l * h) + m * sqrt(h * h + i * i);

  h = a[0] - d[0];
  i = a[1] - d[1];
  *f += __clc_fabs(k * i - l * h) + m * sqrt(h * h + i * i);

  *f = (*f) / g->cfl;
}

__kernel

    void
    G(__global float* a, __global int* b, __global short* c, __global short* d, __global short* e, __global short* f, __global float* g, __global float* h, __global int* i, __global int* j, int k, __global int* l, __global int* m, __global int* n, __global int* o, __global int* p, __local float* q, __constant struct global_constants* r) {
  __global int* __local s;
  __local int t;
  __local float* __local u;
  __local int v, w;

  float x[2];
  float y[2];
  float z[2];
  float aa[2];
  float ab[4];
  float ac[1];

  if (get_local_id(0) == 0) {
    int ad = l[get_group_id(0) + k];

    v = n[ad];
    w = m[ad];

    t = i[0 + ad * 1];

    s = b + j[0 + ad * 1];

    int ae = 0;
    u = q + ae / sizeof(float);
  }

  barrier(1);

  for (int af = get_local_id(0); af < t * 2; af += get_local_size(0))
    u[af] = a[af % 2 + s[af / 2] * 2];

  barrier(1);

  for (int af = get_local_id(0) * 1; af < v; af += get_local_size(0) * 1) {
    for (int ag = 0; ag < 2; ag++) {
      x[ag] = u[c[af + w] * 2 + ag];
    }

    for (int ag = 0; ag < 2; ag++) {
      y[ag] = u[d[af + w] * 2 + ag];
    }

    for (int ag = 0; ag < 2; ag++) {
      z[ag] = u[e[af + w] * 2 + ag];
    }

    for (int ag = 0; ag < 2; ag++) {
      aa[ag] = u[f[af + w] * 2 + ag];
    }

    for (int ag = 0; ag < 4; ag++) {
      ab[ag] = g[(af + w) * 4 + ag];
    }

    F(x, y, z, aa, ab, ac, r);

    for (int ag = 0; ag < 1; ag++) {
      h[(af + w) * 1 + ag] = ac[ag];
    }
  }
}

inline void H(float* a, float* b) {
  for (int c = 0; c < 4; c++)
    b[c] = a[c];
}

__kernel void I(__global float* a, __global float* b, int c, int d, __local float* e) {
  float f[4];
  float g[4];

  int h = get_local_id(0) % 4;

  __local float* i = e + c * (get_local_id(0) / 4) / sizeof(float);

  for (int j = get_global_id(0); j < d / 1; j += get_global_size(0)) {
    int k = j - h;
    int l = ((4 < d - k) ? (4) : (d - k));

    for (int m = 0; m < 4; m++) {
      i[h + m * l] = a[k * 4 + h + m * l];

      for (int m = 0; m < 4; m++)
        f[m] = i[h * 4 + m];
      H(f, g);
      for (int m = 0; m < 4; m++)
        i[m + h * 4] = g[m];

      for (int m = 0; m < 4; m++) {
        b[h + m * l + k * 4] = i[h + m * l];
      }
    }
  }
}

inline void J(float* a, float* b, float* c, float* d, float* e, float* f, float* g, float* h, __constant struct global_constants* i) {
  float j, k, l, m, n, o, p, q, r;
  j = a[0] - b[0];
  k = a[1] - b[1];
  m = 1.0f / c[0];
  n = i->gm1 * (c[3] - 0.5f * m * (c[1] * c[1] + c[2] * c[2]));
  o = m * (c[1] * k - c[2] * j);

  m = 1.0f / d[0];
  p = i->gm1 * (d[3] - 0.5f * m * (d[1] * d[1] + d[2] * d[2]));
  q = m * (d[1] * k - d[2] * j);

  l = 0.5f * ((*e) + (*f)) * i->eps;

  r = 0.5f * (o * c[0] + q * d[0]) + l * (c[0] - d[0]);
  g[0] += r;
  h[0] -= r;
  r = 0.5f * (o * c[1] + n * k + q * d[1] + p * k) + l * (c[1] - d[1]);
  g[1] += r;
  h[1] -= r;
  r = 0.5f * (o * c[2] - n * j + q * d[2] - p * j) + l * (c[2] - d[2]);
  g[2] += r;
  h[2] -= r;
  r = 0.5f * (o * (c[3] + n) + q * (d[3] + p)) + l * (c[3] - d[3]);
  g[3] += r;
  h[3] -= r;
}

__kernel void K(__global float* a, __global int* b, __global float* c, __global int* d, __global float* e, __global int* f, __global float* g, __global int* h, __global short* i, __global short* j, __global short* k, __global short* l, __global short* m, __global short* n, __global short* o, __global short* p, __global int* q, __global int* r, int s, __global int* t, __global int* u, __global int* v, __global int* w, __global int* x, __local float* y, __constant struct global_constants* z) {
  float aa[2];
  float ab[2];
  float ac[4];
  float ad[4];
  float ae[1];
  float af[1];
  float ag[4];
  float ah[4];

  __global int *__local ai, *__local aj, *__local ak, *__local al;
  __local int am, an, ao, ap;
  __local float* __local aq;
  __local float* __local ar;
  __local float* __local as;
  __local float* __local at;
  __local int au, av;
  __local int aw, ax;

  if (get_local_id(0) == 0) {
    int ay = t[get_group_id(0) + s];

    aw = v[ay];
    ax = u[ay];

    au = get_local_size(0) * (1 + (aw - 1) / get_local_size(0));
    av = w[ay];

    am = q[0 + ay * 4];
    an = q[1 + ay * 4];
    ao = q[2 + ay * 4];
    ap = q[3 + ay * 4];

    ai = b + r[0 + ay * 4];
    aj = d + r[1 + ay * 4];
    ak = f + r[2 + ay * 4];
    al = h + r[3 + ay * 4];

    int az = 0;
    aq = y + az / sizeof(float);
    az += (((am * sizeof(float) * 2) + 15) & ~15);
    ar = y + az / sizeof(float);
    az += (((an * sizeof(float) * 4) + 15) & ~15);
    as = y + az / sizeof(float);
    az += (((ao * sizeof(float) * 1) + 15) & ~15);
    at = y + az / sizeof(float);
  }
  barrier(1);

  for (int ba = get_local_id(0); ba < am * 2; ba += get_local_size(0))
    aq[ba] = a[ba % 2 + ai[ba / 2] * 2];
  for (int ba = get_local_id(0); ba < an * 4; ba += get_local_size(0))
    ar[ba] = c[ba % 4 + aj[ba / 4] * 4];
  for (int ba = get_local_id(0); ba < ao * 1; ba += get_local_size(0))
    as[ba] = e[ba % 1 + ak[ba / 1] * 1];
  for (int ba = get_local_id(0); ba < ap * 4; ba += get_local_size(0))
    at[ba] = 0.0f;
  barrier(1);

  for (int ba = get_local_id(0) * 1; ba < au; ba += get_local_size(0) * 1) {
    int bb = -1;
    if (ba < aw) {
      for (int bc = 0; bc < 2; bc++) {
        aa[bc] = aq[i[ba + ax] * 2 + bc];
      }

      for (int bc = 0; bc < 2; bc++) {
        ab[bc] = aq[j[ba + ax] * 2 + bc];
      }

      for (int bc = 0; bc < 4; bc++) {
        ac[bc] = aq[k[ba + ax] * 4 + bc];
      }

      for (int bc = 0; bc < 4; bc++) {
        ad[bc] = aq[l[ba + ax] * 4 + bc];
      }

      for (int bc = 0; bc < 1; bc++) {
        ae[bc] = aq[m[ba + ax] * 1 + bc];
      }

      for (int bc = 0; bc < 1; bc++) {
        af[bc] = aq[n[ba + ax] * 1 + bc];
      }

      for (int bd = 0; bd < 4; bd++)
        ag[bd] = 0.0f;
      for (int bd = 0; bd < 4; bd++)
        ah[bd] = 0.0f;

      J(aa, ab, ac, ad, ae, af, ag, ah, z);
      bb = x[ba + ax];
    }

    for (int be = 0; be < av; be++) {
      if (bb == be) {
        for (int bd = 0; bd < 4; bd++) {
          at[o[ba + ax] * 4 + bd] += ag[bd];
        }
        for (int bd = 0; bd < 4; bd++) {
          at[p[ba + ax] * 4 + bd] += ah[bd];
        }
      }
      barrier(1);
    }
  }

  for (int ba = get_local_id(0); ba < ap * 4; ba += get_local_size(0))
    g[ba % 4 + al[ba / 4] * 4] += at[ba];
}