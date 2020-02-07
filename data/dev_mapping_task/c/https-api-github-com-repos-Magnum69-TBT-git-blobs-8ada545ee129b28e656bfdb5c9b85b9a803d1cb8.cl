__kernel void A(__global uint const* restrict a, __global uint* restrict b, uint c, uint d) {
  size_t e = get_local_id(0);
  size_t f = get_group_id(0);

  __local uint g[256];

  c >>= 2;
  __global uint4* h = (__global uint4*)a;

  size_t i = c * f;
  size_t j = i + c;

  uint4 k = 0;
  for (size_t l = i; l < j; l += 256)
    k += h[l + e];

  g[e] = k.x + k.y + k.z + k.w;

  barrier(1);

  for (size_t m = 128; m >= 2; m >>= 1) {
    if (e < m)
      g[e] += g[e + m];
    barrier(1);
  }

  if (e == 0)
    b[f] = g[e] + g[e + 1];
}

__kernel __attribute__((reqd_work_group_size(16, 1, 1))) void B(__global uint* restrict a) {
  size_t b = get_local_id(0);

  __local uint c[16 + 16 / 2];
  __global uint4* d = (__global uint4*)a;

  if (b < 16 / 2)
    c[b] = 0;

  size_t e = b + 16 / 2;

  uint4 f = d[b];
  c[e] = f.x + f.y + f.z + f.w;

  c[e] += c[e - 1];
  c[e] += c[e - 2];
  c[e] += c[e - 4];
  c[e] += c[e - 8];

  uint g = c[e - 1];
  uint4 h;
  h.x = g;
  g += f.x;
  h.y = g;
  g += f.y;
  h.z = g;
  g += f.z;
  h.w = g;
  d[b] = h;
}

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void C(__global uint* restrict a) {
  __local uint b[32 + 64];
  __global uint4* c = (__global uint4*)a;

  size_t d = get_local_id(0);
  size_t e = d + 32;

  b[d] = 0;

  uint4 f = c[d];
  uint g = f.x + f.y, h = f.z + f.w;
  uint4 i = (uint4)(gh f + h h f);
  b[e] = i.x;

  b[e] += b[e - 1];
  b[e] += b[e - 2];
  b[e] += b[e - 4];
  b[e] += b[e - 8];
  b[e] += b[e - 16];

  uint j = b[e] + b[e - 32];
  c[d] = (uint4)(j)-i;
}

__kernel void D(__global uint* restrict a) {
  size_t b = get_local_id(0);
  size_t c = get_local_size(0);

  __local uint d[256 + 256 / 2];
  size_t e = c / 2;

  __global uint4* f = (__global uint4*)a;

  if (b < e)
    d[b] = 0;

  size_t g = b + e;

  uint4 h = f[b];

  uint i = h.x + h.y, j = h.z + h.w;
  uint4 k = (uint4)(ij h + j j h);
  d[g] = k.x;

  barrier(1);
  for (size_t l = 1; l < c; l <<= 1) {
    uint m = d[g - l];
    barrier(1);

    d[g] += m;
    barrier(1);
  }

  uint n = d[g];
  f[b] = (uint4)(n)-k;
}

__kernel void E(__global uint* restrict a, __global uint const* restrict b, uint c, uint d) {
  size_t e = get_local_id(0);
  size_t f = get_local_size(0);

  c >>= 2;
  __global uint4* g = (__global uint4*)a;
  __local uint h[256 + 256 / 2];

  size_t i = f / 2;
  size_t j = e + i;

  uint k = (e == 0) ? b[get_group_id(0)] : 0;

  for (size_t l = 0; l < c; l += f, g += f) {
    if (e < i)
      h[e] = 0;

    uint4 m = g[e];
    h[j] = k + m.x + m.y + m.z + m.w;

    barrier(1);

    for (size_t n = 1; n < f; n <<= 1) {
      h[j] += h[j - n];
      barrier(1);
    }

    uint o = (e == 0) ? k : h[j - 1];
    uint4 p;
    p.x = o;
    o += m.x;
    p.y = o;
    o += m.y;
    p.z = o;
    o += m.z;
    p.w = o;
    g[e] = p;

    k = (e == 0) ? h[f - 1] : 0;
  }
}

__kernel void F(__global uint* restrict a) {
  size_t b = get_local_id(0);
  size_t c = get_local_size(0);

  __local uint d[256];

  __global uint4* e = (__global uint4*)a;

  uint4 f = e[b];
  d[b] = f.x + f.y + f.z + f.w;

  barrier(1);

  uint g;
  uint h = c >> 1;
  for (uint i = 1; i < h; i = g) {
    g = 2 * i;
    if ((b + 1) % g == 0) {
      d[b] += d[b - i];
    }
    barrier(1);
  }

  if (b == c - 1) {
    uint j = b - h;

    d[b] = d[j];
    d[j] = 0;
  }

  barrier(1);

  for (uint i = h; i >= 2; i = g) {
    g = i / 2;
    if ((b + 1) % i == 0) {
      uint j = b - g;

      uint k = d[j];
      d[j] = d[b];
      d[b] += k;
    }
    barrier(1);
  }

  uint l = d[b];
  uint4 m;
  m.x = l;
  l += f.x;
  m.y = l;
  l += f.y;
  m.z = l;
  l += f.z;
  m.w = l;
  e[b] = m;
}

__kernel __attribute__((reqd_work_group_size(256, 1, 1))) void G(__global uint const* restrict a, __global uint* restrict b, uint c, uint d) {
  size_t e = get_local_id(0);
  size_t f = get_group_id(0);

  __local uint g[256];

  c >>= 2;
  __global uint4* h = (__global uint4*)a;

  size_t i = c * f;
  size_t j = i + c;

  uint4 k = 0;
  for (size_t l = i; l < j; l += 256)
    k += h[l + e];

  g[e] = k.x + k.y + k.z + k.w;

  barrier(1);

  if (e == 0) {
    uint m = 0;
    for (size_t l = 0; l < 256; l++)
      m += g[l];
    b[f] = m;
  }
}
__kernel void H(__global uint const* restrict a, __global uint* restrict b, uint c, uint d) {
  size_t e = get_global_id(0);

  int f = e * c;
  int g = min(f + c, d);

  uint h = 0;
  for (int i = f; i < g; i++)
    h += a[i];

  b[e] = h;
}

__kernel void I(__global uint const* restrict a, __global uint* restrict b, uint c, uint d) {
  size_t e = get_global_id(0);
  c >>= 2;

  __global uint4* f = (__global uint4*)a;

  int g = e * c;
  int h = min(g + c, d / 4);

  uint4 i = 0;
  for (int j = g; j < h; j++)
    i += f[j];

  b[e] = i.x + i.y + i.z + i.w;
}
__kernel void J(__global uint* restrict a, __global uint const* restrict b, uint c, uint d) {
  size_t e = get_global_id(0);

  int f = e * c;
  int g = min(f + c, d);

  uint h = b[e];
  for (int i = f; i < g; i++) {
    uint j = a[i];
    a[i] = h;
    h += j;
  }
}
__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void K(__global uint* restrict a) {
  uint b = (uint)get_local_id(0);

  __local uint c[64];
  __global uint4* d = (__global uint4*)a;

  uint4 e = d[b];
  uint f = e.s0;
  uint g = e.s1;
  uint h = e.s2;
  uint i = e.s3;

  g += f;
  c[b] = g + h + i;

  barrier(1);

  uint j;
  for (uint k = 1; k < 64 / 2; k = j) {
    j = 2 * k;
    if ((b + 1) % j == 0) {
      c[b] += c[b - k];
    }
    barrier(1);
  }

  if (b == 64 - 1) {
    uint l = b - 64 / 2;

    c[b] = c[l];
    c[l] = 0;
  }

  barrier(1);

  for (uint k = 64 / 2; k >= 2; k = j) {
    j = k / 2;
    if ((b + 1) % k == 0) {
      uint l = b - j;

      uint m = c[l];
      c[l] = c[b];
      c[b] += m;
    }
    barrier(1);
  }

  uint n = c[b];
  uint m = n + g;
 uint4 o = (uint4)(n, n + fm, m + h

 d[b] = o;
}
__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void L(__global uint* restrict a, __global uint* restrict b) {
  uint c = (uint)get_local_id(0);
  size_t d = get_global_id(0);
  size_t e = get_group_id(0);

  __local uint f[64];
  __global uint4* g = (__global uint4*)a;

  uint4 h = g[d];
  h.s1 += h.s0;
  f[c] = h.s1 + h.s2 + h.s3;

  barrier(1);

  uint i;
  for (uint j = 1; j < 64; j = i) {
    i = 2 * j;
    if ((c + 1) % i == 0) {
      f[c] += f[c - j];
    }
    barrier(1);
  }

  h.s3 = f[c];
  g[d] = h;

  if (c == 64 - 1)
    b[e] = h.s3;
}
__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void M(__global uint* restrict a, __global uint const* restrict b) {
  uint c = (uint)get_local_id(0);
  size_t d = get_global_id(0);
  size_t e = get_group_id(0);

  __local uint f[64];
  __global uint4* g = (__global uint4*)a;

  uint4 h = g[d];
  f[c] = (c == 64 - 1) ? b[e] : h.s3;

  barrier(1);

  uint i;
  for (uint j = 64; j >= 2; j = i) {
    i = j / 2;
    if ((c + 1) % j == 0) {
      uint k = c - i;

      uint l = f[k];
      f[k] = f[c];
      f[c] += l;
    }
    barrier(1);
  }

  uint m = f[c];
  uint l = m + h.s1;
 g[d] = (uint4)(m, m + hl, l + h
}
__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void N(__global uint const* restrict a, __global uint* restrict b, uint c) {
  size_t d = get_local_id(0);
  size_t e = get_global_id(0);
  size_t f = get_group_id(0);
  size_t g = get_num_groups(0);

  __local uint h[(1 << 8) * 16];

  __global uint4* i = (__global uint4*)(a + f * (16 * 64));
  __local uint4* j = (__local uint4*)h;

  for (size_t k = 0; k < ((1 << 8) * 16 / 4); k += ((1 << 8) / 4))
    j[k + d] = 0;

  barrier(1);

  if (d < 16) {
    __local uint* l = h + d * (1 << 8);
    uint4 m = (uint4)(0xffu, 0xffu, 0xffu, 0xffu);

    for (size_t k = 0; k < ((16 * 64) / 4); k += 16) {
      uint4 n = (i[k + d] >> c) & m;

      l[n.x]++;
      l[n.y]++;
      l[n.z]++;
      l[n.w]++;
    }
  }

  barrier(1);

  uint4 o = j[d];
  for (size_t k = ((1 << 8) / 4); k < ((1 << 8) * 16 / 4); k += ((1 << 8) / 4))
    o += j[k + d];

  b[(4 * d) * g + f] = o.x;
  b[(4 * d + 1) * g + f] = o.y;
  b[(4 * d + 2) * g + f] = o.z;
  b[(4 * d + 3) * g + f] = o.w;
}
__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void O(__global uint const* restrict a, __global uint* restrict b, __global uint const* restrict c, uint d) {
  size_t e = get_local_id(0);
  size_t f = get_global_id(0);
  size_t g = get_group_id(0);
  size_t h = get_num_groups(0);

  __local uint i[16 * (1 << 8)];
  __local uint4* j = (__local uint4*)i;

  for (size_t k = 0; k < ((1 << 8) * 16 / 4); k += ((1 << 8) / 4))
    j[k + e] = 0;

  barrier(1);

  __local uint* l = i + e * (1 << 8);
  uint4 m = (uint4)(0xffu, 0xffu, 0xffu, 0xffu);

  uint4 n, o, p, q, r, s, t, u;
  uint4 v, w, x, y, z, aa, ab, ac;
  uint4 ad, ae, af, ag, ah, ai, aj, ak;
  uint4 al, am, an, ao, ap, aq, ar, as;

  if (e < 16) {
    __global uint4* at = (__global uint4*)(a + g * (16 * 64) + e * 64);

    n = at[0];
    ad = (n >> d) & m;
    l[ad.x]++;
    l[ad.y]++;
    l[ad.z]++;
    l[ad.w]++;

    o = at[1];
    ae = (o >> d) & m;
    l[ae.x]++;
    l[ae.y]++;
    l[ae.z]++;
    l[ae.w]++;

    p = at[2];
    af = (p >> d) & m;
    l[af.x]++;
    l[af.y]++;
    l[af.z]++;
    l[af.w]++;

    q = at[3];
    ag = (q >> d) & m;
    l[ag.x]++;
    l[ag.y]++;
    l[ag.z]++;
    l[ag.w]++;

    r = at[4];
    ah = (r >> d) & m;
    l[ah.x]++;
    l[ah.y]++;
    l[ah.z]++;
    l[ah.w]++;

    s = at[5];
    ai = (s >> d) & m;
    l[ai.x]++;
    l[ai.y]++;
    l[ai.z]++;
    l[ai.w]++;

    t = at[6];
    aj = (t >> d) & m;
    l[aj.x]++;
    l[aj.y]++;
    l[aj.z]++;
    l[aj.w]++;

    u = at[7];
    ak = (u >> d) & m;
    l[ak.x]++;
    l[ak.y]++;
    l[ak.z]++;
    l[ak.w]++;

    v = at[8];
    al = (v >> d) & m;
    l[al.x]++;
    l[al.y]++;
    l[al.z]++;
    l[al.w]++;

    w = at[9];
    am = (w >> d) & m;
    l[am.x]++;
    l[am.y]++;
    l[am.z]++;
    l[am.w]++;

    x = at[10];
    an = (x >> d) & m;
    l[an.x]++;
    l[an.y]++;
    l[an.z]++;
    l[an.w]++;

    y = at[11];
    ao = (y >> d) & m;
    l[ao.x]++;
    l[ao.y]++;
    l[ao.z]++;
    l[ao.w]++;

    z = at[12];
    ap = (z >> d) & m;
    l[ap.x]++;
    l[ap.y]++;
    l[ap.z]++;
    l[ap.w]++;

    aa = at[13];
    aq = (aa >> d) & m;
    l[aq.x]++;
    l[aq.y]++;
    l[aq.z]++;
    l[aq.w]++;

    ab = at[14];
    ar = (ab >> d) & m;
    l[ar.x]++;
    l[ar.y]++;
    l[ar.z]++;
    l[ar.w]++;

    ac = at[15];
    as = (ac >> d) & m;
    l[as.x]++;
    l[as.y]++;
    l[as.z]++;
    l[as.w]++;
  }

  uint4 au;
  au.x = c[(4 * e) * h + g];
  au.y = c[(4 * e + 1) * h + g];
  au.z = c[(4 * e + 2) * h + g];
  au.w = c[(4 * e + 3) * h + g];

  barrier(1);

  for (size_t k = 0; k < ((1 << 8) * 16 / 4); k += ((1 << 8) / 4)) {
    uint4 av = j[k + e];
    j[k + e] = au;
    au += av;
  }

  barrier(1);

  if (e < 16) {
    b[l[ad.x]++] = n.x;
    b[l[ad.y]++] = n.y;
    b[l[ad.z]++] = n.z;
    b[l[ad.w]++] = n.w;

    b[l[ae.x]++] = o.x;
    b[l[ae.y]++] = o.y;
    b[l[ae.z]++] = o.z;
    b[l[ae.w]++] = o.w;

    b[l[af.x]++] = p.x;
    b[l[af.y]++] = p.y;
    b[l[af.z]++] = p.z;
    b[l[af.w]++] = p.w;

    b[l[ag.x]++] = q.x;
    b[l[ag.y]++] = q.y;
    b[l[ag.z]++] = q.z;
    b[l[ag.w]++] = q.w;

    b[l[ah.x]++] = r.x;
    b[l[ah.y]++] = r.y;
    b[l[ah.z]++] = r.z;
    b[l[ah.w]++] = r.w;

    b[l[ai.x]++] = s.x;
    b[l[ai.y]++] = s.y;
    b[l[ai.z]++] = s.z;
    b[l[ai.w]++] = s.w;

    b[l[aj.x]++] = t.x;
    b[l[aj.y]++] = t.y;
    b[l[aj.z]++] = t.z;
    b[l[aj.w]++] = t.w;

    b[l[ak.x]++] = u.x;
    b[l[ak.y]++] = u.y;
    b[l[ak.z]++] = u.z;
    b[l[ak.w]++] = u.w;

    b[l[al.x]++] = v.x;
    b[l[al.y]++] = v.y;
    b[l[al.z]++] = v.z;
    b[l[al.w]++] = v.w;

    b[l[am.x]++] = w.x;
    b[l[am.y]++] = w.y;
    b[l[am.z]++] = w.z;
    b[l[am.w]++] = w.w;

    b[l[an.x]++] = x.x;
    b[l[an.y]++] = x.y;
    b[l[an.z]++] = x.z;
    b[l[an.w]++] = x.w;

    b[l[ao.x]++] = y.x;
    b[l[ao.y]++] = y.y;
    b[l[ao.z]++] = y.z;
    b[l[ao.w]++] = y.w;

    b[l[ap.x]++] = z.x;
    b[l[ap.y]++] = z.y;
    b[l[ap.z]++] = z.z;
    b[l[ap.w]++] = z.w;

    b[l[aq.x]++] = aa.x;
    b[l[aq.y]++] = aa.y;
    b[l[aq.z]++] = aa.z;
    b[l[aq.w]++] = aa.w;

    b[l[ar.x]++] = ab.x;
    b[l[ar.y]++] = ab.y;
    b[l[ar.z]++] = ab.z;
    b[l[ar.w]++] = ab.w;

    b[l[as.x]++] = ac.x;
    b[l[as.y]++] = ac.y;
    b[l[as.z]++] = ac.z;
    b[l[as.w]++] = ac.w;
  }
}