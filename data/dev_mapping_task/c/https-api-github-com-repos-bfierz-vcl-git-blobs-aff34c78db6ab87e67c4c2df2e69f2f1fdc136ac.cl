float A(__global const float* a, int b, int c, int d) {
  return a[b * d + c];
}
float B(__global const float* a, int b, int c, int d, int e) {
  return a[b * (e * 3 + d) + c];
}

void C(__global float* a, int b, int c, int d, float e) {
  a[b * d + c] = e;
}
void D(__global float* a, int b, int c, int d, float e) {
  a[b * d + c] = e;
}
void E(__global float* a, int b, int c, int d, int e, float f) {
  a[b * (e * 3 + d) + c] = f;
}

__kernel void F(int a, int b, __global const float* __restrict__ c, __global float* __restrict__ d, __global float* __restrict__ e, __global float* __restrict__ f) {
  int g = (int)get_global_id(0);
  if (g >= a)
    return;
  const float h = sqrt(8.0f) + 3.0f;
  const float i = 0.5f * sqrt(2.0f - sqrt(2.0f));
  const float j = 0.5f * sqrt(2.0f + sqrt(2.0f));

  union {
    float f;
    unsigned int ui;
  } k;
  union {
    float f;
    unsigned int ui;
  } l;
  union {
    float f;
    unsigned int ui;
  } m;
  union {
    float f;
    unsigned int ui;
  } n;
  union {
    float f;
    unsigned int ui;
  } o;
  union {
    float f;
    unsigned int ui;
  } p;
  union {
    float f;
    unsigned int ui;
  } q;

  k.f = h;
  l.f = i;
  m.f = j;
  n.f = 0.5f;
  o.f = 1.0f;
  p.f = 1.0e-20f;
  q.f = 1.0e-12f;

  union {
    float f;
    unsigned int ui;
  } r;
  union {
    float f;
    unsigned int ui;
  } s;
  union {
    float f;
    unsigned int ui;
  } t;
  union {
    float f;
    unsigned int ui;
  } u;
  union {
    float f;
    unsigned int ui;
  } v;
  union {
    float f;
    unsigned int ui;
  } w;
  union {
    float f;
    unsigned int ui;
  } x;
  union {
    float f;
    unsigned int ui;
  } y;
  union {
    float f;
    unsigned int ui;
  } z;

  union {
    float f;
    unsigned int ui;
  } aa;
  union {
    float f;
    unsigned int ui;
  } ab;
  union {
    float f;
    unsigned int ui;
  } ac;
  union {
    float f;
    unsigned int ui;
  } ad;
  union {
    float f;
    unsigned int ui;
  } ae;
  union {
    float f;
    unsigned int ui;
  } af;
  union {
    float f;
    unsigned int ui;
  } ag;
  union {
    float f;
    unsigned int ui;
  } ah;
  union {
    float f;
    unsigned int ui;
  } ai;
  union {
    float f;
    unsigned int ui;
  } aj;
  union {
    float f;
    unsigned int ui;
  } ak;
  union {
    float f;
    unsigned int ui;
  } al;
  union {
    float f;
    unsigned int ui;
  } am;
  union {
    float f;
    unsigned int ui;
  } an;
  union {
    float f;
    unsigned int ui;
  } ao;
  union {
    float f;
    unsigned int ui;
  } ap;
  union {
    float f;
    unsigned int ui;
  } aq;
  union {
    float f;
    unsigned int ui;
  } ar;
  union {
    float f;
    unsigned int ui;
  } as;
  union {
    float f;
    unsigned int ui;
  } at;
  union {
    float f;
    unsigned int ui;
  } au;
  union {
    float f;
    unsigned int ui;
  } av;
  union {
    float f;
    unsigned int ui;
  } aw;
  union {
    float f;
    unsigned int ui;
  } ax;
  union {
    float f;
    unsigned int ui;
  } ay;
  union {
    float f;
    unsigned int ui;
  } az;
  union {
    float f;
    unsigned int ui;
  } ba;

  r.f = B(c, b, g, 0, 0);
  s.f = B(c, b, g, 1, 0);
  t.f = B(c, b, g, 2, 0);
  u.f = B(c, b, g, 0, 1);
  v.f = B(c, b, g, 1, 1);
  w.f = B(c, b, g, 2, 1);
  x.f = B(c, b, g, 0, 2);
  y.f = B(c, b, g, 1, 2);
  z.f = B(c, b, g, 2, 2);
  {
    union {
      float f;
      unsigned int ui;
    } bb;
    union {
      float f;
      unsigned int ui;
    } bc;
    union {
      float f;
      unsigned int ui;
    } bd;
    union {
      float f;
      unsigned int ui;
    } be;

    {
      union {
        float f;
        unsigned int ui;
      } bf;
      union {
        float f;
        unsigned int ui;
      } bg;
      union {
        float f;
        unsigned int ui;
      } bh;
      union {
        float f;
        unsigned int ui;
      } bi;
      union {
        float f;
        unsigned int ui;
      } bj;
      union {
        float f;
        unsigned int ui;
      } bk;

      bb.f = 1.0f;
      bc.f = 0.0f;
      bd.f = 0.0f;
      be.f = 0.0f;

      bf.f = r.f * r.f;
      aw.f = s.f * s.f;
      bf.f = aw.f + bf.f;
      aw.f = t.f * t.f;
      bf.f = aw.f + bf.f;

      bg.f = u.f * r.f;
      aw.f = v.f * s.f;
      bg.f = aw.f + bg.f;
      aw.f = w.f * t.f;
      bg.f = aw.f + bg.f;

      bh.f = x.f * r.f;
      aw.f = y.f * s.f;
      bh.f = aw.f + bh.f;
      aw.f = z.f * t.f;
      bh.f = aw.f + bh.f;

      bi.f = u.f * u.f;
      aw.f = v.f * v.f;
      bi.f = aw.f + bi.f;
      aw.f = w.f * w.f;
      bi.f = aw.f + bi.f;

      bj.f = x.f * u.f;
      aw.f = y.f * v.f;
      bj.f = aw.f + bj.f;
      aw.f = z.f * w.f;
      bj.f = aw.f + bj.f;

      bk.f = x.f * x.f;
      aw.f = y.f * y.f;
      bk.f = aw.f + bk.f;
      aw.f = z.f * z.f;
      bk.f = aw.f + bk.f;

      for (int bl = 1; bl <= (int)4; bl++) {
        av.f = bg.f * n.f;
        ba.f = bf.f - bi.f;

        ax.f = av.f * av.f;
        aw.ui = (ax.f >= p.f) ? 0xffffffff : 0;
        av.ui = aw.ui & av.ui;
        au.ui = aw.ui & ba.ui;
        ax.ui = ~aw.ui & o.ui;
        au.ui = au.ui | ax.ui;

        aw.f = av.f * av.f;
        ax.f = au.f * au.f;
        ay.f = aw.f + ax.f;
        az.f = (1.f / sqrt(ay.f));
        av.f = az.f * av.f;
        au.f = az.f * au.f;

        aw.f = k.f * aw.f;
        aw.ui = (ax.f <= aw.f) ? 0xffffffff : 0;

        ax.ui = l.ui & aw.ui;
        av.ui = ~aw.ui & av.ui;
        av.ui = av.ui | ax.ui;
        ax.ui = m.ui & aw.ui;
        au.ui = ~aw.ui & au.ui;
        au.ui = au.ui | ax.ui;

        aw.f = av.f * av.f;
        ax.f = au.f * au.f;
        as.f = ax.f - aw.f;
        at.f = au.f * av.f;
        at.f = at.f + at.f;

        ay.f = aw.f + ax.f;
        bk.f = bk.f * ay.f;
        bh.f = bh.f * ay.f;
        bj.f = bj.f * ay.f;
        bk.f = bk.f * ay.f;

        aw.f = at.f * bh.f;
        ax.f = at.f * bj.f;
        bh.f = as.f * bh.f;
        bj.f = as.f * bj.f;
        bh.f = ax.f + bh.f;
        bj.f = bj.f - aw.f;

        ax.f = at.f * at.f;
        aw.f = bi.f * ax.f;
        ay.f = bf.f * ax.f;
        az.f = as.f * as.f;
        bf.f = bf.f * az.f;
        bi.f = bi.f * az.f;
        bf.f = bf.f + aw.f;
        bi.f = bi.f + ay.f;
        az.f = az.f - ax.f;
        ax.f = bg.f + bg.f;
        bg.f = bg.f * az.f;
        az.f = as.f * at.f;
        ax.f = ax.f * az.f;
        ba.f = ba.f * az.f;
        bf.f = bf.f + ax.f;
        bg.f = bg.f - ba.f;
        bi.f = bi.f - ax.f;

        aw.f = av.f * bc.f;
        ax.f = av.f * bd.f;
        ay.f = av.f * be.f;
        av.f = av.f * bb.f;

        bb.f = au.f * bb.f;
        bc.f = au.f * bc.f;
        bd.f = au.f * bd.f;
        be.f = au.f * be.f;

        be.f = be.f + av.f;
        bb.f = bb.f - ay.f;
        bc.f = bc.f + ax.f;
        bd.f = bd.f - aw.f;
      }
    }

    ax.f = bb.f * bb.f;
    aw.f = bc.f * bc.f;
    ax.f = aw.f + ax.f;
    aw.f = bd.f * bd.f;
    ax.f = aw.f + ax.f;
    aw.f = be.f * be.f;
    ax.f = aw.f + ax.f;

    aw.f = (1.f / sqrt(ax.f));
    az.f = aw.f * n.f;
    ay.f = aw.f * az.f;
    ay.f = aw.f * ay.f;
    ay.f = ax.f * ay.f;
    aw.f = aw.f + az.f;
    aw.f = aw.f - ay.f;

    bb.f = bb.f * aw.f;
    bc.f = bc.f * aw.f;
    bd.f = bd.f * aw.f;
    be.f = be.f * aw.f;
    {
      aw.f = bc.f * bc.f;
      ax.f = bd.f * bd.f;
      ay.f = be.f * be.f;
      aa.f = bb.f * bb.f;
      ae.f = aa.f - aw.f;
      ai.f = ae.f - ax.f;
      ai.f = ai.f + ay.f;
      ae.f = ae.f + ax.f;
      ae.f = ae.f - ay.f;
      aa.f = aa.f + aw.f;
      aa.f = aa.f - ax.f;
      aa.f = aa.f - ay.f;
      aw.f = bc.f + bc.f;
      ax.f = bd.f + bd.f;
      ay.f = be.f + be.f;
      af.f = bb.f * aw.f;
      ag.f = bb.f * ax.f;
      ab.f = bb.f * ay.f;
      aw.f = bd.f * aw.f;
      ax.f = be.f * ax.f;
      ay.f = bc.f * ay.f;
      ad.f = aw.f - ab.f;
      ah.f = ax.f - af.f;
      ac.f = ay.f - ag.f;
      ab.f = aw.f + ab.f;
      af.f = ax.f + af.f;
      ag.f = ay.f + ag.f;
      ax.f = u.f;
      ay.f = x.f;
      u.f = ad.f * r.f;
      x.f = ag.f * r.f;
      r.f = aa.f * r.f;
      aw.f = ab.f * ax.f;
      r.f = r.f + aw.f;
      aw.f = ac.f * ay.f;
      r.f = r.f + aw.f;
      aw.f = ae.f * ax.f;
      u.f = u.f + aw.f;
      aw.f = af.f * ay.f;
      u.f = u.f + aw.f;
      aw.f = ah.f * ax.f;
      x.f = x.f + aw.f;
      aw.f = ai.f * ay.f;
      x.f = x.f + aw.f;

      ax.f = v.f;
      ay.f = y.f;
      v.f = ad.f * s.f;
      y.f = ag.f * s.f;
      s.f = aa.f * s.f;
      aw.f = ab.f * ax.f;
      s.f = s.f + aw.f;
      aw.f = ac.f * ay.f;
      s.f = s.f + aw.f;
      aw.f = ae.f * ax.f;
      v.f = v.f + aw.f;
      aw.f = af.f * ay.f;
      v.f = v.f + aw.f;
      aw.f = ah.f * ax.f;
      y.f = y.f + aw.f;
      aw.f = ai.f * ay.f;
      y.f = y.f + aw.f;

      ax.f = w.f;
      ay.f = z.f;
      w.f = ad.f * t.f;
      z.f = ag.f * t.f;
      t.f = aa.f * t.f;
      aw.f = ab.f * ax.f;
      t.f = t.f + aw.f;
      aw.f = ac.f * ay.f;
      t.f = t.f + aw.f;
      aw.f = ae.f * ax.f;
      w.f = w.f + aw.f;
      aw.f = af.f * ay.f;
      w.f = w.f + aw.f;
      aw.f = ah.f * ax.f;
      z.f = z.f + aw.f;
      aw.f = ai.f * ay.f;
      z.f = z.f + aw.f;
    }
  }

  aw.f = r.f * r.f;
  az.f = s.f * s.f;
  aw.f = aw.f + az.f;
  az.f = t.f * t.f;
  aw.f = aw.f + az.f;

  ax.f = u.f * u.f;
  az.f = v.f * v.f;
  ax.f = ax.f + az.f;
  az.f = w.f * w.f;
  ax.f = ax.f + az.f;

  ay.f = x.f * x.f;
  az.f = y.f * y.f;
  ay.f = ay.f + az.f;
  az.f = z.f * z.f;
  ay.f = ay.f + az.f;

  az.ui = (aw.f < ax.f) ? 0xffffffff : 0;
  ba.ui = r.ui ^ u.ui;
  ba.ui = ba.ui & az.ui;
  r.ui = r.ui ^ ba.ui;
  u.ui = u.ui ^ ba.ui;

  ba.ui = s.ui ^ v.ui;
  ba.ui = ba.ui & az.ui;
  s.ui = s.ui ^ ba.ui;
  v.ui = v.ui ^ ba.ui;

  ba.ui = t.ui ^ w.ui;
  ba.ui = ba.ui & az.ui;
  t.ui = t.ui ^ ba.ui;
  w.ui = w.ui ^ ba.ui;

  ba.ui = aa.ui ^ ad.ui;
  ba.ui = ba.ui & az.ui;
  aa.ui = aa.ui ^ ba.ui;
  ad.ui = ad.ui ^ ba.ui;

  ba.ui = ab.ui ^ ae.ui;
  ba.ui = ba.ui & az.ui;
  ab.ui = ab.ui ^ ba.ui;
  ae.ui = ae.ui ^ ba.ui;

  ba.ui = ac.ui ^ af.ui;
  ba.ui = ba.ui & az.ui;
  ac.ui = ac.ui ^ ba.ui;
  af.ui = af.ui ^ ba.ui;

  ba.ui = aw.ui ^ ax.ui;
  ba.ui = ba.ui & az.ui;
  aw.ui = aw.ui ^ ba.ui;
  ax.ui = ax.ui ^ ba.ui;

  ba.f = -2.0f;
  ba.ui = ba.ui & az.ui;
  az.f = 1.0f;
  az.f = az.f + ba.f;

  u.f = u.f * az.f;
  v.f = v.f * az.f;
  w.f = w.f * az.f;

  ad.f = ad.f * az.f;
  ae.f = ae.f * az.f;
  af.f = af.f * az.f;
  az.ui = (aw.f < ay.f) ? 0xffffffff : 0;
  ba.ui = r.ui ^ x.ui;
  ba.ui = ba.ui & az.ui;
  r.ui = r.ui ^ ba.ui;
  x.ui = x.ui ^ ba.ui;

  ba.ui = s.ui ^ y.ui;
  ba.ui = ba.ui & az.ui;
  s.ui = s.ui ^ ba.ui;
  y.ui = y.ui ^ ba.ui;

  ba.ui = t.ui ^ z.ui;
  ba.ui = ba.ui & az.ui;
  t.ui = t.ui ^ ba.ui;
  z.ui = z.ui ^ ba.ui;

  ba.ui = aa.ui ^ ag.ui;
  ba.ui = ba.ui & az.ui;
  aa.ui = aa.ui ^ ba.ui;
  ag.ui = ag.ui ^ ba.ui;

  ba.ui = ab.ui ^ ah.ui;
  ba.ui = ba.ui & az.ui;
  ab.ui = ab.ui ^ ba.ui;
  ah.ui = ah.ui ^ ba.ui;

  ba.ui = ac.ui ^ ai.ui;
  ba.ui = ba.ui & az.ui;
  ac.ui = ac.ui ^ ba.ui;
  ai.ui = ai.ui ^ ba.ui;

  ba.ui = aw.ui ^ ay.ui;
  ba.ui = ba.ui & az.ui;
  aw.ui = aw.ui ^ ba.ui;
  ay.ui = ay.ui ^ ba.ui;

  ba.f = -2.0f;
  ba.ui = ba.ui & az.ui;
  az.f = 1.0f;
  az.f = az.f + ba.f;

  r.f = r.f * az.f;
  s.f = s.f * az.f;
  t.f = t.f * az.f;

  aa.f = aa.f * az.f;
  ab.f = ab.f * az.f;
  ac.f = ac.f * az.f;
  az.ui = (ax.f < ay.f) ? 0xffffffff : 0;
  ba.ui = u.ui ^ x.ui;
  ba.ui = ba.ui & az.ui;
  u.ui = u.ui ^ ba.ui;
  x.ui = x.ui ^ ba.ui;

  ba.ui = v.ui ^ y.ui;
  ba.ui = ba.ui & az.ui;
  v.ui = v.ui ^ ba.ui;
  y.ui = y.ui ^ ba.ui;

  ba.ui = w.ui ^ z.ui;
  ba.ui = ba.ui & az.ui;
  w.ui = w.ui ^ ba.ui;
  z.ui = z.ui ^ ba.ui;

  ba.ui = ad.ui ^ ag.ui;
  ba.ui = ba.ui & az.ui;
  ad.ui = ad.ui ^ ba.ui;
  ag.ui = ag.ui ^ ba.ui;

  ba.ui = ae.ui ^ ah.ui;
  ba.ui = ba.ui & az.ui;
  ae.ui = ae.ui ^ ba.ui;
  ah.ui = ah.ui ^ ba.ui;

  ba.ui = af.ui ^ ai.ui;
  ba.ui = ba.ui & az.ui;
  af.ui = af.ui ^ ba.ui;
  ai.ui = ai.ui ^ ba.ui;

  ba.ui = ax.ui ^ ay.ui;
  ba.ui = ba.ui & az.ui;
  ax.ui = ax.ui ^ ba.ui;
  ay.ui = ay.ui ^ ba.ui;

  ba.f = -2.0f;
  ba.ui = ba.ui & az.ui;
  az.f = 1.0f;
  az.f = az.f + ba.f;

  x.f = x.f * az.f;
  y.f = y.f * az.f;
  z.f = z.f * az.f;

  ag.f = ag.f * az.f;
  ah.f = ah.f * az.f;
  ai.f = ai.f * az.f;
  aj.f = 1.0f;
  ak.f = 0.0f;
  al.f = 0.0f;
  am.f = 0.0f;
  an.f = 1.0f;
  ao.f = 0.0f;
  ap.f = 0.0f;
  aq.f = 0.0f;
  ar.f = 1.0f;
  av.f = s.f * s.f;
  av.ui = (av.f >= q.f) ? 0xffffffff : 0;
  av.ui = av.ui & s.ui;

  ba.f = 0.0f;
  au.f = ba.f - r.f;
  au.f = fmax(au.f, r.f);
  au.f = fmax(au.f, q.f);
  ba.ui = (r.f >= ba.f) ? 0xffffffff : 0;

  aw.f = au.f * au.f;
  ax.f = av.f * av.f;
  ax.f = aw.f + ax.f;
  aw.f = (1.f / sqrt(ax.f));

  az.f = aw.f * n.f;
  ay.f = aw.f * az.f;
  ay.f = aw.f * ay.f;
  ay.f = ax.f * ay.f;
  aw.f = aw.f + az.f;
  aw.f = aw.f - ay.f;
  aw.f = aw.f * ax.f;

  au.f = au.f + aw.f;

  aw.ui = ~ba.ui & av.ui;
  ax.ui = ~ba.ui & au.ui;
  au.ui = ba.ui & au.ui;
  av.ui = ba.ui & av.ui;
  au.ui = au.ui | aw.ui;
  av.ui = av.ui | ax.ui;

  aw.f = au.f * au.f;
  ax.f = av.f * av.f;
  ax.f = aw.f + ax.f;
  aw.f = (1.f / sqrt(ax.f));

  az.f = aw.f * n.f;
  ay.f = aw.f * az.f;
  ay.f = aw.f * ay.f;
  ay.f = ax.f * ay.f;
  aw.f = aw.f + az.f;
  aw.f = aw.f - ay.f;

  au.f = au.f * aw.f;
  av.f = av.f * aw.f;

  as.f = au.f * au.f;
  at.f = av.f * av.f;
  as.f = as.f - at.f;
  at.f = av.f * au.f;
  at.f = at.f + at.f;

  aw.f = at.f * r.f;
  ax.f = at.f * s.f;
  r.f = as.f * r.f;
  s.f = as.f * s.f;
  r.f = r.f + ax.f;
  s.f = s.f - aw.f;

  aw.f = at.f * u.f;
  ax.f = at.f * v.f;
  u.f = as.f * u.f;
  v.f = as.f * v.f;
  u.f = u.f + ax.f;
  v.f = v.f - aw.f;

  aw.f = at.f * x.f;
  ax.f = at.f * y.f;
  x.f = as.f * x.f;
  y.f = as.f * y.f;
  x.f = x.f + ax.f;
  y.f = y.f - aw.f;

  aw.f = at.f * aj.f;
  ax.f = at.f * am.f;
  aj.f = as.f * aj.f;
  am.f = as.f * am.f;
  aj.f = aj.f + ax.f;
  am.f = am.f - aw.f;

  aw.f = at.f * ak.f;
  ax.f = at.f * an.f;
  ak.f = as.f * ak.f;
  an.f = as.f * an.f;
  ak.f = ak.f + ax.f;
  an.f = an.f - aw.f;

  aw.f = at.f * al.f;
  ax.f = at.f * ao.f;
  al.f = as.f * al.f;
  ao.f = as.f * ao.f;
  al.f = al.f + ax.f;
  ao.f = ao.f - aw.f;
  E(d, b, g, 0, 0, aj.f);
  E(d, b, g, 1, 0, ak.f);
  E(d, b, g, 2, 0, al.f);
  E(d, b, g, 0, 1, am.f);
  E(d, b, g, 1, 1, an.f);
  E(d, b, g, 2, 1, ao.f);
  E(d, b, g, 0, 2, ap.f);
  E(d, b, g, 1, 2, aq.f);
  E(d, b, g, 2, 2, ar.f);
  E(e, b, g, 0, 0, aa.f);
  E(e, b, g, 1, 0, ab.f);
  E(e, b, g, 2, 0, ac.f);
  E(e, b, g, 0, 1, ad.f);
  E(e, b, g, 1, 1, ae.f);
  E(e, b, g, 2, 1, af.f);
  E(e, b, g, 0, 2, ag.f);
  E(e, b, g, 1, 2, ah.f);
  E(e, b, g, 2, 2, ai.f);
  C(f, b, g, 0, r.f);
  C(f, b, g, 1, v.f);
  C(f, b, g, 2, z.f);
}