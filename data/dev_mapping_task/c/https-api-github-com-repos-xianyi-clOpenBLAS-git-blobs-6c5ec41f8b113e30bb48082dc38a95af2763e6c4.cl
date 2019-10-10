typedef union GPtr {
  __global float* f;
  __global double* d;
  __global float2* f2v;
  __global double2* d2v;
  __global float4* f4v;
  __global double4* d4v;
  __global float8* f8v;
  __global double8* d8v;
  __global float16* f16v;
  __global double16* d16v;
} GPtr;

typedef union LPtr {
  __local float* f;
  __local double* d;
  __local float2* f2v;
  __local double2* d2v;
  __local float4* f4v;
  __local double4* d4v;
  __local float8* f8v;
  __local double8* d8v;
  __local float16* f16v;
  __local double16* d16v;
} LPtr;

typedef union PPtr {
  float* f;
  double* d;
  float2* f2v;
  double2* d2v;
  float4* f4v;
  double4* d4v;
  float8* f8v;
  double8* d8v;
  float16* f16v;
  double16* d16v;
} PPtr;

__attribute__((reqd_work_group_size(8, 8, 1))) void __kernel A(const uint a, const uint b, const uint c, const float d, const __global float8* restrict e, const __global float8* restrict f, __global float8* g) {
  float8 h, i, j, k;
  float8 l, m, n, o;
  float8 p, q, r, s, t, u, v, w;

  uint4 x = 0u;

  uint y = a / 8;
  uint z = b / 8;
  uint aa = a;

  e += (uint)get_global_id(0);

  uint ab = (get_group_id(0) + get_group_id(1)) % get_num_groups(1);
  uint ac = ab * get_local_size(1) + get_local_id(1);

  uint ad = ((b % 512) != 0);

  ac = (ad * (uint)get_global_id(1)) + ((1 - ad) * ac);

  f += ac;

  x.y = 8u * (uint)get_global_id(0);
  x.x = 8u * (uint)ac;

  p = 0;
  q = 0;
  r = 0;
  s = 0;
  t = 0;
  u = 0;
  v = 0;
  w = 0;

  for (uint ae = 0; ae < c; ae += 4) {
    l = f[0];
    m = f[z];
    n = f[(z << 1)];
    o = f[mad24(3u, z, 0u)];

    h = e[0];
    i = e[y];
    j = e[(y << 1)];
    k = e[mad24(3u, y, 0u)];

    p = mad(h, l.s0, p);
    q = mad(h, l.s1, q);
    r = mad(h, l.s2, r);
    s = mad(h, l.s3, s);
    t = mad(h, l.s4, t);
    u = mad(h, l.s5, u);
    v = mad(h, l.s6, v);
    w = mad(h, l.s7, w);

    p = mad(i, m.s0, p);
    q = mad(i, m.s1, q);
    r = mad(i, m.s2, r);
    s = mad(i, m.s3, s);
    t = mad(i, m.s4, t);
    u = mad(i, m.s5, u);
    v = mad(i, m.s6, v);
    w = mad(i, m.s7, w);

    p = mad(j, n.s0, p);
    q = mad(j, n.s1, q);
    r = mad(j, n.s2, r);
    s = mad(j, n.s3, s);
    t = mad(j, n.s4, t);
    u = mad(j, n.s5, u);
    v = mad(j, n.s6, v);
    w = mad(j, n.s7, w);

    p = mad(k, o.s0, p);
    q = mad(k, o.s1, q);
    r = mad(k, o.s2, r);
    s = mad(k, o.s3, s);
    t = mad(k, o.s4, t);
    u = mad(k, o.s5, u);
    v = mad(k, o.s6, v);
    w = mad(k, o.s7, w);

    e += (y << 2);
    f += (z << 2);
  }

  GPtr af;

  af.f8v = g + (x.x * aa + x.y) / 8;

  uint ag = aa >> 3;

  __global float8* ah = af.f8v;

  ah[0] = mad(p, d, 0);
  ah[ag] = mad(q, d, 0);
  ah[(aa >> 2)] = mad(r, d, 0);
  ah[mad24(3u, ag, 0u)] = mad(s, d, 0);
  ah[(aa >> 1)] = mad(t, d, 0);
  ah[mad24(5u, ag, 0u)] = mad(u, d, 0);
  ah[mad24(6u, ag, 0u)] = mad(v, d, 0);
  ah[mad24(7u, ag, 0u)] = mad(w, d, 0);
}

__attribute__((reqd_work_group_size(8, 8, 1))) void __kernel B(uint a, uint b, uint c, const float2 d, const __global float8* restrict e, const __global float8* restrict f, __global float8* g) {
  float8 h, i, j, k;
  float8 l, m, n, o;
  float8 p, q, r, s;
  uint4 t = 0u;

  uint u = a / 4;
  uint v = b / 4;
  uint w = a;

  uint x;
  uint y;
  uint z;

  e += (uint)get_global_id(0);
  y = (get_group_id(0) + get_group_id(1)) % get_num_groups(1);
  z = y * get_local_size(1) + get_local_id(1);

  x = (b % 256 != 0);
  z = (x * (uint)get_global_id(1)) + ((1 - x) * z);

  f += z;
  t.y = 4u * (uint)get_global_id(0);
  t.x = 4u * (uint)z;

  p = 0;
  q = 0;
  r = 0;
  s = 0;

  for (uint aa = 0; aa < c; aa += 4) {
    l = f[0];
    m = f[v];
    n = f[(v << 1)];
    o = f[mad24(3u, v, 0u)];

    h = e[0];
    i = e[u];
    j = e[(u << 1)];
    k = e[mad24(3u, u, 0u)];

    p.s01 = mad(l.s01, h.s0, p.s01);
    p.s01 = mad(l.s10, (float2)(-hs1, hs1), p.s01);
    q.s01 = mad(l.s23, h.s0, q.s01);
    q.s01 = mad(l.s32, (float2)(-hs1, hs1), q.s01);
    r.s01 = mad(l.s45, h.s0, r.s01);
    r.s01 = mad(l.s54, (float2)(-hs1, hs1), r.s01);
    s.s01 = mad(l.s67, h.s0, s.s01);
    s.s01 = mad(l.s76, (float2)(-hs1, hs1), s.s01);
    p.s23 = mad(l.s01, h.s2, p.s23);
    p.s23 = mad(l.s10, (float2)(-hs3, hs3), p.s23);
    q.s23 = mad(l.s23, h.s2, q.s23);
    q.s23 = mad(l.s32, (float2)(-hs3, hs3), q.s23);
    r.s23 = mad(l.s45, h.s2, r.s23);
    r.s23 = mad(l.s54, (float2)(-hs3, hs3), r.s23);
    s.s23 = mad(l.s67, h.s2, s.s23);
    s.s23 = mad(l.s76, (float2)(-hs3, hs3), s.s23);
    p.s45 = mad(l.s01, h.s4, p.s45);
    p.s45 = mad(l.s10, (float2)(-hs5, hs5), p.s45);
    q.s45 = mad(l.s23, h.s4, q.s45);
    q.s45 = mad(l.s32, (float2)(-hs5, hs5), q.s45);
    r.s45 = mad(l.s45, h.s4, r.s45);
    r.s45 = mad(l.s54, (float2)(-hs5, hs5), r.s45);
    s.s45 = mad(l.s67, h.s4, s.s45);
    s.s45 = mad(l.s76, (float2)(-hs5, hs5), s.s45);
    p.s67 = mad(l.s01, h.s6, p.s67);
    p.s67 = mad(l.s10, (float2)(-hs7, hs7), p.s67);
    q.s67 = mad(l.s23, h.s6, q.s67);
    q.s67 = mad(l.s32, (float2)(-hs7, hs7), q.s67);
    r.s67 = mad(l.s45, h.s6, r.s67);
    r.s67 = mad(l.s54, (float2)(-hs7, hs7), r.s67);
    s.s67 = mad(l.s67, h.s6, s.s67);
    s.s67 = mad(l.s76, (float2)(-hs7, hs7), s.s67);

    p.s01 = mad(m.s01, i.s0, p.s01);
    p.s01 = mad(m.s10, (float2)(-is1, is1), p.s01);
    q.s01 = mad(m.s23, i.s0, q.s01);
    q.s01 = mad(m.s32, (float2)(-is1, is1), q.s01);
    r.s01 = mad(m.s45, i.s0, r.s01);
    r.s01 = mad(m.s54, (float2)(-is1, is1), r.s01);
    s.s01 = mad(m.s67, i.s0, s.s01);
    s.s01 = mad(m.s76, (float2)(-is1, is1), s.s01);
    p.s23 = mad(m.s01, i.s2, p.s23);
    p.s23 = mad(m.s10, (float2)(-is3, is3), p.s23);
    q.s23 = mad(m.s23, i.s2, q.s23);
    q.s23 = mad(m.s32, (float2)(-is3, is3), q.s23);
    r.s23 = mad(m.s45, i.s2, r.s23);
    r.s23 = mad(m.s54, (float2)(-is3, is3), r.s23);
    s.s23 = mad(m.s67, i.s2, s.s23);
    s.s23 = mad(m.s76, (float2)(-is3, is3), s.s23);
    p.s45 = mad(m.s01, i.s4, p.s45);
    p.s45 = mad(m.s10, (float2)(-is5, is5), p.s45);
    q.s45 = mad(m.s23, i.s4, q.s45);
    q.s45 = mad(m.s32, (float2)(-is5, is5), q.s45);
    r.s45 = mad(m.s45, i.s4, r.s45);
    r.s45 = mad(m.s54, (float2)(-is5, is5), r.s45);
    s.s45 = mad(m.s67, i.s4, s.s45);
    s.s45 = mad(m.s76, (float2)(-is5, is5), s.s45);
    p.s67 = mad(m.s01, i.s6, p.s67);
    p.s67 = mad(m.s10, (float2)(-is7, is7), p.s67);
    q.s67 = mad(m.s23, i.s6, q.s67);
    q.s67 = mad(m.s32, (float2)(-is7, is7), q.s67);
    r.s67 = mad(m.s45, i.s6, r.s67);
    r.s67 = mad(m.s54, (float2)(-is7, is7), r.s67);
    s.s67 = mad(m.s67, i.s6, s.s67);
    s.s67 = mad(m.s76, (float2)(-is7, is7), s.s67);

    p.s01 = mad(n.s01, j.s0, p.s01);
    p.s01 = mad(n.s10, (float2)(-js1, js1), p.s01);
    q.s01 = mad(n.s23, j.s0, q.s01);
    q.s01 = mad(n.s32, (float2)(-js1, js1), q.s01);
    r.s01 = mad(n.s45, j.s0, r.s01);
    r.s01 = mad(n.s54, (float2)(-js1, js1), r.s01);
    s.s01 = mad(n.s67, j.s0, s.s01);
    s.s01 = mad(n.s76, (float2)(-js1, js1), s.s01);
    p.s23 = mad(n.s01, j.s2, p.s23);
    p.s23 = mad(n.s10, (float2)(-js3, js3), p.s23);
    q.s23 = mad(n.s23, j.s2, q.s23);
    q.s23 = mad(n.s32, (float2)(-js3, js3), q.s23);
    r.s23 = mad(n.s45, j.s2, r.s23);
    r.s23 = mad(n.s54, (float2)(-js3, js3), r.s23);
    s.s23 = mad(n.s67, j.s2, s.s23);
    s.s23 = mad(n.s76, (float2)(-js3, js3), s.s23);
    p.s45 = mad(n.s01, j.s4, p.s45);
    p.s45 = mad(n.s10, (float2)(-js5, js5), p.s45);
    q.s45 = mad(n.s23, j.s4, q.s45);
    q.s45 = mad(n.s32, (float2)(-js5, js5), q.s45);
    r.s45 = mad(n.s45, j.s4, r.s45);
    r.s45 = mad(n.s54, (float2)(-js5, js5), r.s45);
    s.s45 = mad(n.s67, j.s4, s.s45);
    s.s45 = mad(n.s76, (float2)(-js5, js5), s.s45);
    p.s67 = mad(n.s01, j.s6, p.s67);
    p.s67 = mad(n.s10, (float2)(-js7, js7), p.s67);
    q.s67 = mad(n.s23, j.s6, q.s67);
    q.s67 = mad(n.s32, (float2)(-js7, js7), q.s67);
    r.s67 = mad(n.s45, j.s6, r.s67);
    r.s67 = mad(n.s54, (float2)(-js7, js7), r.s67);
    s.s67 = mad(n.s67, j.s6, s.s67);
    s.s67 = mad(n.s76, (float2)(-js7, js7), s.s67);

    p.s01 = mad(o.s01, k.s0, p.s01);
    p.s01 = mad(o.s10, (float2)(-ks1, ks1), p.s01);
    q.s01 = mad(o.s23, k.s0, q.s01);
    q.s01 = mad(o.s32, (float2)(-ks1, ks1), q.s01);
    r.s01 = mad(o.s45, k.s0, r.s01);
    r.s01 = mad(o.s54, (float2)(-ks1, ks1), r.s01);
    s.s01 = mad(o.s67, k.s0, s.s01);
    s.s01 = mad(o.s76, (float2)(-ks1, ks1), s.s01);
    p.s23 = mad(o.s01, k.s2, p.s23);
    p.s23 = mad(o.s10, (float2)(-ks3, ks3), p.s23);
    q.s23 = mad(o.s23, k.s2, q.s23);
    q.s23 = mad(o.s32, (float2)(-ks3, ks3), q.s23);
    r.s23 = mad(o.s45, k.s2, r.s23);
    r.s23 = mad(o.s54, (float2)(-ks3, ks3), r.s23);
    s.s23 = mad(o.s67, k.s2, s.s23);
    s.s23 = mad(o.s76, (float2)(-ks3, ks3), s.s23);
    p.s45 = mad(o.s01, k.s4, p.s45);
    p.s45 = mad(o.s10, (float2)(-ks5, ks5), p.s45);
    q.s45 = mad(o.s23, k.s4, q.s45);
    q.s45 = mad(o.s32, (float2)(-ks5, ks5), q.s45);
    r.s45 = mad(o.s45, k.s4, r.s45);
    r.s45 = mad(o.s54, (float2)(-ks5, ks5), r.s45);
    s.s45 = mad(o.s67, k.s4, s.s45);
    s.s45 = mad(o.s76, (float2)(-ks5, ks5), s.s45);
    p.s67 = mad(o.s01, k.s6, p.s67);
    p.s67 = mad(o.s10, (float2)(-ks7, ks7), p.s67);
    q.s67 = mad(o.s23, k.s6, q.s67);
    q.s67 = mad(o.s32, (float2)(-ks7, ks7), q.s67);
    r.s67 = mad(o.s45, k.s6, r.s67);
    r.s67 = mad(o.s54, (float2)(-ks7, ks7), r.s67);
    s.s67 = mad(o.s67, k.s6, s.s67);
    s.s67 = mad(o.s76, (float2)(-ks7, ks7), s.s67);

    e += (u << 2);
    f += (v << 2);
  }

  GPtr ab;

  ab.f2v = g + (t.x * w + t.y) / 4;

  __global float8* ac = ab.f8v;

  float8 ad, ae, af, ag;

  ad.s01 = d * p.s0 + d.s10 * (float2)(-ps1, ps1);
  ad.s23 = d * p.s2 + d.s10 * (float2)(-ps3, ps3);
  ad.s45 = d * p.s4 + d.s10 * (float2)(-ps5, ps5);
  ad.s67 = d * p.s6 + d.s10 * (float2)(-ps7, ps7);
  ae.s01 = d * q.s0 + d.s10 * (float2)(-qs1, qs1);
  ae.s23 = d * q.s2 + d.s10 * (float2)(-qs3, qs3);
  ae.s45 = d * q.s4 + d.s10 * (float2)(-qs5, qs5);
  ae.s67 = d * q.s6 + d.s10 * (float2)(-qs7, qs7);
  af.s01 = d * r.s0 + d.s10 * (float2)(-rs1, rs1);
  af.s23 = d * r.s2 + d.s10 * (float2)(-rs3, rs3);
  af.s45 = d * r.s4 + d.s10 * (float2)(-rs5, rs5);
  af.s67 = d * r.s6 + d.s10 * (float2)(-rs7, rs7);
  ag.s01 = d * s.s0 + d.s10 * (float2)(-ss1, ss1);
  ag.s23 = d * s.s2 + d.s10 * (float2)(-ss3, ss3);
  ag.s45 = d * s.s4 + d.s10 * (float2)(-ss5, ss5);
  ag.s67 = d * s.s6 + d.s10 * (float2)(-ss7, ss7);

  ac[0] = ad;
  ac[(w >> 2)] = ae;
  ac[(w >> 1)] = af;
  ac[mad24(3u, (w >> 2), 0u)] = ag;
}

__attribute__((reqd_work_group_size(8, 8, 1))) void __kernel C(const uint a, const uint b, const uint c, const double d, const __global double4* restrict e, const __global double4* restrict f, __global double4* g) {
  double4 h, i, j, k;
  double4 l, m, n, o;
  double4 p, q, r, s;

  uint4 t = 0u;

  uint u = a / 4;
  uint v = b / 4;
  uint w = a;

  e += (uint)get_global_id(0);

  uint x = (get_group_id(0) + get_group_id(1)) % get_num_groups(1);
  uint y = x * get_local_size(1) + get_local_id(1);

  uint z = ((b % 256) != 0);

  y = (z * (uint)get_global_id(1)) + ((1 - z) * y);

  f += y;

  t.y = 4u * (uint)get_global_id(0);
  t.x = 4u * (uint)y;

  p = 0;
  q = 0;
  r = 0;
  s = 0;

  for (uint aa = 0; aa < c; aa += 4) {
    l = f[0];
    m = f[v];
    n = f[(v << 1)];
    o = f[mad24(3u, v, 0u)];

    h = e[0];
    i = e[u];
    j = e[(u << 1)];
    k = e[mad24(3u, u, 0u)];

    p = mad(h, l.s0, p);
    q = mad(h, l.s1, q);
    r = mad(h, l.s2, r);
    s = mad(h, l.s3, s);

    p = mad(i, m.s0, p);
    q = mad(i, m.s1, q);
    r = mad(i, m.s2, r);
    s = mad(i, m.s3, s);

    p = mad(j, n.s0, p);
    q = mad(j, n.s1, q);
    r = mad(j, n.s2, r);
    s = mad(j, n.s3, s);

    p = mad(k, o.s0, p);
    q = mad(k, o.s1, q);
    r = mad(k, o.s2, r);
    s = mad(k, o.s3, s);

    e += (u << 2);
    f += (v << 2);
  }

  GPtr ab;

  ab.d4v = g + (t.x * w + t.y) / 4;

  __global double4* ac = ab.d4v;

  ac[0] = mad(p, d, 0);
  ac[(w >> 2)] = mad(q, d, 0);
  ac[(w >> 1)] = mad(r, d, 0);
  ac[mad24(3u, (w >> 2), 0u)] = mad(s, d, 0);
}

__attribute__((reqd_work_group_size(8, 8, 1))) void __kernel D(uint a, uint b, uint c, const double2 d, const __global double4* restrict e, const __global double4* restrict f, __global double4* g) {
  double4 h, i, j, k;
  double4 l, m, n, o;
  double4 p, q;
  uint4 r = 0u;

  uint s = a / 2;
  uint t = b / 2;
  uint u = a;

  uint v;
  uint w;
  uint x;
  e += (uint)get_global_id(0);
  w = (get_group_id(0) + get_group_id(1)) % get_num_groups(1);
  x = w * get_local_size(1) + get_local_id(1);
  v = (b % 128 != 0);
  x = (v * (uint)get_global_id(1)) + ((1 - v) * x);
  f += x;
  r.y = 2u * (uint)get_global_id(0);
  r.x = 2u * (uint)x;
  p = 0;
  q = 0;

  for (uint y = 0; y < c; y += 4) {
    l = f[0];
    m = f[t];
    n = f[(t << 1)];
    o = f[mad24(3u, t, 0u)];

    h = e[0];
    i = e[s];
    j = e[(s << 1)];
    k = e[mad24(3u, s, 0u)];

    p.s01 = mad(l.s01, h.s0, p.s01);
    p.s01 = mad(l.s10, (double2)(-hs1, hs1), p.s01);
    q.s01 = mad(l.s23, h.s0, q.s01);
    q.s01 = mad(l.s32, (double2)(-hs1, hs1), q.s01);
    p.s23 = mad(l.s01, h.s2, p.s23);
    p.s23 = mad(l.s10, (double2)(-hs3, hs3), p.s23);
    q.s23 = mad(l.s23, h.s2, q.s23);
    q.s23 = mad(l.s32, (double2)(-hs3, hs3), q.s23);

    p.s01 = mad(m.s01, i.s0, p.s01);
    p.s01 = mad(m.s10, (double2)(-is1, is1), p.s01);
    q.s01 = mad(m.s23, i.s0, q.s01);
    q.s01 = mad(m.s32, (double2)(-is1, is1), q.s01);
    p.s23 = mad(m.s01, i.s2, p.s23);
    p.s23 = mad(m.s10, (double2)(-is3, is3), p.s23);
    q.s23 = mad(m.s23, i.s2, q.s23);
    q.s23 = mad(m.s32, (double2)(-is3, is3), q.s23);

    p.s01 = mad(n.s01, j.s0, p.s01);
    p.s01 = mad(n.s10, (double2)(-js1, js1), p.s01);
    q.s01 = mad(n.s23, j.s0, q.s01);
    q.s01 = mad(n.s32, (double2)(-js1, js1), q.s01);
    p.s23 = mad(n.s01, j.s2, p.s23);
    p.s23 = mad(n.s10, (double2)(-js3, js3), p.s23);
    q.s23 = mad(n.s23, j.s2, q.s23);
    q.s23 = mad(n.s32, (double2)(-js3, js3), q.s23);

    p.s01 = mad(o.s01, k.s0, p.s01);
    p.s01 = mad(o.s10, (double2)(-ks1, ks1), p.s01);
    q.s01 = mad(o.s23, k.s0, q.s01);
    q.s01 = mad(o.s32, (double2)(-ks1, ks1), q.s01);
    p.s23 = mad(o.s01, k.s2, p.s23);
    p.s23 = mad(o.s10, (double2)(-ks3, ks3), p.s23);
    q.s23 = mad(o.s23, k.s2, q.s23);
    q.s23 = mad(o.s32, (double2)(-ks3, ks3), q.s23);

    e += (s << 2);
    f += (t << 2);
  }

  GPtr z;

  z.d2v = g + (r.x * u + r.y) / 2;

  __global double4* aa = z.d4v;

  double4 ab, ac;

  ab.s01 = d * p.s0 + d.s10 * (double2)(-ps1, ps1);
  ab.s23 = d * p.s2 + d.s10 * (double2)(-ps3, ps3);
  ac.s01 = d * q.s0 + d.s10 * (double2)(-qs1, qs1);
  ac.s23 = d * q.s2 + d.s10 * (double2)(-qs3, qs3);
  aa[0] = ab;
  aa[(u >> 1)] = ac;
}