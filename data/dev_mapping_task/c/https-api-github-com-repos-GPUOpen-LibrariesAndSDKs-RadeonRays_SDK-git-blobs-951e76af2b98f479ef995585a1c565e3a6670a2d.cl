int4 A(int a, int b, int c, int d) {
  int4 e;
  e.x = a;
  e.y = b;
  e.z = c;
  e.w = d;
  return e;
}
float4 B(float a, float b, float c, float d) {
  float4 e;
  e.x = a;
  e.y = b;
  e.z = c;
  e.w = d;
  return e;
}

int4 C(__global int4* a, uint b, uint c) {
  int4 d = A(0, 0, 0, 0);
  if (((b + 1) << 2) <= c)
    d = a[b];
  else {
    if ((b << 2) < c)
      d.x = a[b].x;
    if ((b << 2) + 1 < c)
      d.y = a[b].y;
    if ((b << 2) + 2 < c)
      d.z = a[b].z;
  }
  return d;
}
float4 D(__global float4* a, uint b, uint c) {
  float4 d = B(0, 0, 0, 0);
  if (((b + 1) << 2) <= c)
    d = a[b];
  else {
    if ((b << 2) < c)
      d.x = a[b].x;
    if ((b << 2) + 1 < c)
      d.y = a[b].y;
    if ((b << 2) + 2 < c)
      d.z = a[b].z;
  }
  return d;
}

void E(int4 a, __global int4* b, uint c, uint d) {
  if ((c + 1) * 4 <= d)
    b[c] = a;
  else {
    if (c * 4 < d)
      b[c].x = a.x;
    if (c * 4 + 1 < d)
      b[c].y = a.y;
    if (c * 4 + 2 < d)
      b[c].z = a.z;
  }
}
void F(float4 a, __global float4* b, uint c, uint d) {
  if ((c + 1) * 4 <= d)
    b[c] = a;
  else {
    if (c * 4 < d)
      b[c].x = a.x;
    if (c * 4 + 1 < d)
      b[c].y = a.y;
    if (c * 4 + 2 < d)
      b[c].z = a.z;
  }
}

void G(int a, int b, __local int* c) {
  for (int d = 1; d <= (b >> 1); d <<= 1) {
    if (a < b / (2 * d)) {
      c[2 * (a + 1) * d - 1] = c[2 * (a + 1) * d - 1] + c[(2 * a + 1) * d - 1];
    }
    barrier(1);
  }
  if (a == 0)
    c[b - 1] = 0;
  barrier(1);
  for (int d = (b >> 1); d > 0; d >>= 1) {
    if (a < b / (2 * d)) {
      int e = c[(2 * a + 1) * d - 1];
      c[(2 * a + 1) * d - 1] = c[2 * (a + 1) * d - 1];
      c[2 * (a + 1) * d - 1] = c[2 * (a + 1) * d - 1] + e;
    }
    barrier(1);
  }
}
void H(int a, int b, __local uint* c) {
  for (int d = 1; d <= (b >> 1); d <<= 1) {
    if (a < b / (2 * d)) {
      c[2 * (a + 1) * d - 1] = c[2 * (a + 1) * d - 1] + c[(2 * a + 1) * d - 1];
    }
    barrier(1);
  }
  if (a == 0)
    c[b - 1] = 0;
  barrier(1);
  for (int d = (b >> 1); d > 0; d >>= 1) {
    if (a < b / (2 * d)) {
      uint e = c[(2 * a + 1) * d - 1];
      c[(2 * a + 1) * d - 1] = c[2 * (a + 1) * d - 1];
      c[2 * (a + 1) * d - 1] = c[2 * (a + 1) * d - 1] + e;
    }
    barrier(1);
  }
}
void I(int a, int b, __local float* c) {
  for (int d = 1; d <= (b >> 1); d <<= 1) {
    if (a < b / (2 * d)) {
      c[2 * (a + 1) * d - 1] = c[2 * (a + 1) * d - 1] + c[(2 * a + 1) * d - 1];
    }
    barrier(1);
  }
  if (a == 0)
    c[b - 1] = 0;
  barrier(1);
  for (int d = (b >> 1); d > 0; d >>= 1) {
    if (a < b / (2 * d)) {
      float e = c[(2 * a + 1) * d - 1];
      c[(2 * a + 1) * d - 1] = c[2 * (a + 1) * d - 1];
      c[2 * (a + 1) * d - 1] = c[2 * (a + 1) * d - 1] + e;
    }
    barrier(1);
  }
}
void J(int a, int b, __local short* c) {
  for (int d = 1; d <= (b >> 1); d <<= 1) {
    if (a < b / (2 * d)) {
      c[2 * (a + 1) * d - 1] = c[2 * (a + 1) * d - 1] + c[(2 * a + 1) * d - 1];
    }
    barrier(1);
  }
  if (a == 0)
    c[b - 1] = 0;
  barrier(1);
  for (int d = (b >> 1); d > 0; d >>= 1) {
    if (a < b / (2 * d)) {
      short e = c[(2 * a + 1) * d - 1];
      c[(2 * a + 1) * d - 1] = c[2 * (a + 1) * d - 1];
      c[2 * (a + 1) * d - 1] = c[2 * (a + 1) * d - 1] + e;
    }
    barrier(1);
  }
}

void K(int a, int b, __local uint* c, uint* d) {
  for (int e = 1; e <= (b >> 1); e <<= 1) {
    if (a < b / (2 * e)) {
      c[2 * (a + 1) * e - 1] = c[2 * (a + 1) * e - 1] + c[(2 * a + 1) * e - 1];
    }
    barrier(1);
  }
  *d = c[b - 1];
  barrier(1);
  if (a == 0) {
    c[b - 1] = 0;
  }
  barrier(1);
  for (int e = (b >> 1); e > 0; e >>= 1) {
    if (a < b / (2 * e)) {
      uint f = c[(2 * a + 1) * e - 1];
      c[(2 * a + 1) * e - 1] = c[2 * (a + 1) * e - 1];
      c[2 * (a + 1) * e - 1] = c[2 * (a + 1) * e - 1] + f;
    }
    barrier(1);
  }
}

int L(int a, int b, __local int* c) {
  int d = 0;
  for (int e = 1; e <= (b >> 1); e <<= 1) {
    if (a < b / (2 * e)) {
      c[2 * (a + 1) * e - 1] = c[2 * (a + 1) * e - 1] + c[(2 * a + 1) * e - 1];
    }
    barrier(1);
  }
  if (a == 0) {
    d = c[b - 1];
    c[b - 1] = 0;
  }
  barrier(1);
  for (int e = (b >> 1); e > 0; e >>= 1) {
    if (a < b / (2 * e)) {
      int f = c[(2 * a + 1) * e - 1];
      c[(2 * a + 1) * e - 1] = c[2 * (a + 1) * e - 1];
      c[2 * (a + 1) * e - 1] = c[2 * (a + 1) * e - 1] + f;
    }
    barrier(1);
  }
  return d;
}
float M(int a, int b, __local float* c) {
  float d = 0;
  for (int e = 1; e <= (b >> 1); e <<= 1) {
    if (a < b / (2 * e)) {
      c[2 * (a + 1) * e - 1] = c[2 * (a + 1) * e - 1] + c[(2 * a + 1) * e - 1];
    }
    barrier(1);
  }
  if (a == 0) {
    d = c[b - 1];
    c[b - 1] = 0;
  }
  barrier(1);
  for (int e = (b >> 1); e > 0; e >>= 1) {
    if (a < b / (2 * e)) {
      float f = c[(2 * a + 1) * e - 1];
      c[(2 * a + 1) * e - 1] = c[2 * (a + 1) * e - 1];
      c[2 * (a + 1) * e - 1] = c[2 * (a + 1) * e - 1] + f;
    }
    barrier(1);
  }
  return d;
}

__kernel void N(__global int const* a, __global int* b, __local int* c) {
  int d = get_global_id(0);
  int e = get_local_id(0);
  int f = get_local_size(0);
  int g = get_group_id(0);
  c[e] = a[2 * d] + a[2 * d + 1];
  barrier(1);
  G(e, f, c);
  b[2 * d + 1] = c[e] + a[2 * d];
  b[2 * d] = c[e];
}
__kernel void O(__global float const* a, __global float* b, __local float* c) {
  int d = get_global_id(0);
  int e = get_local_id(0);
  int f = get_local_size(0);
  int g = get_group_id(0);
  c[e] = a[2 * d] + a[2 * d + 1];
  barrier(1);
  I(e, f, c);
  b[2 * d + 1] = c[e] + a[2 * d];
  b[2 * d] = c[e];
}

__attribute__((reqd_work_group_size(64, 1, 1))) __kernel void P(__global int4 const* a, __global int4* b, uint c, __local int* d) {
  int e = get_global_id(0);
  int f = get_local_id(0);
  int g = get_local_size(0);
  int4 h = C(a, 2 * e, c);
  int4 i = C(a, 2 * e + 1, c);
  h.y += h.x;
  h.w += h.z;
  h.w += h.y;
  i.y += i.x;
  i.w += i.z;
  i.w += i.y;
  i.w += h.w;
  d[f] = i.w;
  barrier(1);
  G(f, g, d);
  i.w = d[f];
  int j = h.w;
  h.w = i.w;
  i.w += j;
  j = h.y;
  h.y = h.w;
  h.w += j;
  j = i.y;
  i.y = i.w;
  i.w += j;
  j = h.x;
  h.x = h.y;
  h.y += j;
  j = i.x;
  i.x = i.y;
  i.y += j;
  j = h.z;
  h.z = h.w;
  h.w += j;
  j = i.z;
  i.z = i.w;
  i.w += j;
  E(i, b, 2 * e + 1, c);
  E(h, b, 2 * e, c);
}
__attribute__((reqd_work_group_size(64, 1, 1))) __kernel void Q(__global float4 const* a, __global float4* b, uint c, __local float* d) {
  int e = get_global_id(0);
  int f = get_local_id(0);
  int g = get_local_size(0);
  float4 h = D(a, 2 * e, c);
  float4 i = D(a, 2 * e + 1, c);
  h.y += h.x;
  h.w += h.z;
  h.w += h.y;
  i.y += i.x;
  i.w += i.z;
  i.w += i.y;
  i.w += h.w;
  d[f] = i.w;
  barrier(1);
  I(f, g, d);
  i.w = d[f];
  float j = h.w;
  h.w = i.w;
  i.w += j;
  j = h.y;
  h.y = h.w;
  h.w += j;
  j = i.y;
  i.y = i.w;
  i.w += j;
  j = h.x;
  h.x = h.y;
  h.y += j;
  j = i.x;
  i.x = i.y;
  i.y += j;
  j = h.z;
  h.z = h.w;
  h.w += j;
  j = i.z;
  i.z = i.w;
  i.w += j;
  F(i, b, 2 * e + 1, c);
  F(h, b, 2 * e, c);
}

__attribute__((reqd_work_group_size(64, 1, 1))) __kernel void R(__global int4 const* a, __global int4* b, uint c, __global int* d, __local int* e) {
  int f = get_global_id(0);
  int g = get_local_id(0);
  int h = get_group_id(0);
  int i = get_local_size(0);
  int4 j = C(a, 2 * f, c);
  int4 k = C(a, 2 * f + 1, c);
  j.y += j.x;
  j.w += j.z;
  j.w += j.y;
  k.y += k.x;
  k.w += k.z;
  k.w += k.y;
  k.w += j.w;
  e[g] = k.w;
  barrier(1);
  int l = L(g, i, e);
  if (g == 0)
    d[h] = l;
  k.w = e[g];
  int m = j.w;
  j.w = k.w;
  k.w += m;
  m = j.y;
  j.y = j.w;
  j.w += m;
  m = k.y;
  k.y = k.w;
  k.w += m;
  m = j.x;
  j.x = j.y;
  j.y += m;
  m = k.x;
  k.x = k.y;
  k.y += m;
  m = j.z;
  j.z = j.w;
  j.w += m;
  m = k.z;
  k.z = k.w;
  k.w += m;
  E(k, b, 2 * f + 1, c);
  E(j, b, 2 * f, c);
}
__attribute__((reqd_work_group_size(64, 1, 1))) __kernel void S(__global float4 const* a, __global float4* b, uint c, __global float* d, __local float* e) {
  int f = get_global_id(0);
  int g = get_local_id(0);
  int h = get_group_id(0);
  int i = get_local_size(0);
  float4 j = D(a, 2 * f, c);
  float4 k = D(a, 2 * f + 1, c);
  j.y += j.x;
  j.w += j.z;
  j.w += j.y;
  k.y += k.x;
  k.w += k.z;
  k.w += k.y;
  k.w += j.w;
  e[g] = k.w;
  barrier(1);
  float l = M(g, i, e);
  if (g == 0)
    d[h] = l;
  k.w = e[g];
  float m = j.w;
  j.w = k.w;
  k.w += m;
  m = j.y;
  j.y = j.w;
  j.w += m;
  m = k.y;
  k.y = k.w;
  k.w += m;
  m = j.x;
  j.x = j.y;
  j.y += m;
  m = k.x;
  k.x = k.y;
  k.y += m;
  m = j.z;
  j.z = j.w;
  j.w += m;
  m = k.z;
  k.z = k.w;
  k.w += m;
  F(k, b, 2 * f + 1, c);
  F(j, b, 2 * f, c);
}

__kernel void T(__global int* a, __global int4* b, uint c) {
  int d = get_global_id(0);
  int e = get_group_id(0);
  int4 f = C(b, d, c);
  int g = a[e >> 1];
  f.xyzw += g;
  E(f, b, d, c);
}
__kernel void U(__global float* a, __global float4* b, uint c) {
  int d = get_global_id(0);
  int e = get_group_id(0);
  float4 f = D(b, d, c);
  float g = a[e >> 1];
  f.xyzw += g;
  F(f, b, d, c);
}

void V(int a, int b, short4 c, short4 d, short4 e, short4 f, __local short* g, __local short* h, __local short* i, __local short* j, short4* k, short4* l, short4* m, short4* n, short4* o) {
  short4 p = c;
  p.y += p.x;
  p.w += p.z;
  p.w += p.y;
  g[a] = p.w;

  short4 q = d;
  q.y += q.x;
  q.w += q.z;
  q.w += q.y;
  h[a] = q.w;

  short4 r = e;
  r.y += r.x;
  r.w += r.z;
  r.w += r.y;
  i[a] = r.w;

  short4 s = f;
  s.y += s.x;
  s.w += s.z;
  s.w += s.y;
  j[a] = s.w;

  barrier(1);

  for (int t = 1; t <= (b >> 1); t <<= 1) {
    if (a < b / (2 * t)) {
      g[2 * (a + 1) * t - 1] = g[2 * (a + 1) * t - 1] + g[(2 * a + 1) * t - 1];
      h[2 * (a + 1) * t - 1] = h[2 * (a + 1) * t - 1] + h[(2 * a + 1) * t - 1];
      i[2 * (a + 1) * t - 1] = i[2 * (a + 1) * t - 1] + i[(2 * a + 1) * t - 1];
      j[2 * (a + 1) * t - 1] = j[2 * (a + 1) * t - 1] + j[(2 * a + 1) * t - 1];
    }
    barrier(1);
  }

  short4 u;
  u.s0 = g[b - 1];
  u.s1 = h[b - 1];
  u.s2 = i[b - 1];
  u.s3 = j[b - 1];

  barrier(1);

  if (a == 0) {
    g[b - 1] = 0;
    h[b - 1] = 0;
    i[b - 1] = 0;
    j[b - 1] = 0;
  }

  barrier(1);

  for (int t = (b >> 1); t > 0; t >>= 1) {
    if (a < b / (2 * t)) {
      int v = g[(2 * a + 1) * t - 1];
      g[(2 * a + 1) * t - 1] = g[2 * (a + 1) * t - 1];
      g[2 * (a + 1) * t - 1] = g[2 * (a + 1) * t - 1] + v;

      v = h[(2 * a + 1) * t - 1];
      h[(2 * a + 1) * t - 1] = h[2 * (a + 1) * t - 1];
      h[2 * (a + 1) * t - 1] = h[2 * (a + 1) * t - 1] + v;

      v = i[(2 * a + 1) * t - 1];
      i[(2 * a + 1) * t - 1] = i[2 * (a + 1) * t - 1];
      i[2 * (a + 1) * t - 1] = i[2 * (a + 1) * t - 1] + v;

      v = j[(2 * a + 1) * t - 1];
      j[(2 * a + 1) * t - 1] = j[2 * (a + 1) * t - 1];
      j[2 * (a + 1) * t - 1] = j[2 * (a + 1) * t - 1] + v;
    }

    barrier(1);
  }

  p.w = g[a];

  short w = p.y;
  p.y = p.w;
  p.w += w;
  w = p.x;
  p.x = p.y;
  p.y += w;
  w = p.z;
  p.z = p.w;
  p.w += w;
  *k = p;

  q.w = h[a];

  w = q.y;
  q.y = q.w;
  q.w += w;
  w = q.x;
  q.x = q.y;
  q.y += w;
  w = q.z;
  q.z = q.w;
  q.w += w;
  *l = q;

  r.w = i[a];

  w = r.y;
  r.y = r.w;
  r.w += w;
  w = r.x;
  r.x = r.y;
  r.y += w;
  w = r.z;
  r.z = r.w;
  r.w += w;
  *m = r;

  s.w = j[a];

  w = s.y;
  s.y = s.w;
  s.w += w;
  w = s.x;
  s.x = s.y;
  s.y += w;
  w = s.z;
  s.z = s.w;
  s.w += w;
  *n = s;

  barrier(1);

  *o = u;
}

short4 W(int a, uchar b, int4 c) {
  short4 d;
  d.x = ((c.x >> a) & 3) == b ? 1 : 0;
  d.y = ((c.y >> a) & 3) == b ? 1 : 0;
  d.z = ((c.z >> a) & 3) == b ? 1 : 0;
  d.w = ((c.w >> a) & 3) == b ? 1 : 0;
  return d;
}

short X(int a, int b, short c, short d, short e, short f, short4 g) {
  switch ((a >> b) & 3) {
    case 0:
      return c;
    case 1:
      return d + g.x;
    case 2:
      return e + g.x + g.y;
    case 3:
      return f + g.x + g.y + g.z;
  }

  return 0;
}

void Y(int a, int b, int c, int4 d, __local short* e, int4* f, short4* g) {
  __local short* h = e;
  __local short* i = h + b;
  __local short* j = i + b;
  __local short* k = j + b;

  short4 l = W(c, 0, d);
  short4 m = W(c, 1, d);
  short4 n = W(c, 2, d);
  short4 o = W(c, 3, d);

  short4 p;
  short4 q;
  short4 r;
  short4 s;

  V(a, b, l, m, n, o, h, i, j, k, &p, &q, &r, &s, g);

  (*f).x = X(d.x, c, p.x, q.x, r.x, s.x, *g);
  (*f).y = X(d.y, c, p.y, q.y, r.y, s.y, *g);
  (*f).z = X(d.z, c, p.z, q.z, r.z, s.z, *g);
  (*f).w = X(d.w, c, p.w, q.w, r.w, s.w, *g);
}

int4 Z(__global int4* a, uint b, uint c) {
  int4 d = A(2147483647, 2147483647, 2147483647, 2147483647);
  if (((b + 1) << 2) <= c)
    d = a[b];
  else {
    if ((b << 2) < c)
      d.x = a[b].x;
    if ((b << 2) + 1 < c)
      d.y = a[b].y;
    if ((b << 2) + 2 < c)
      d.z = a[b].z;
  }
  return d;
}

void AA(int a, __global int* b, uint c, uint d) {
  if (c < d)
    b[c] = a;
}

__kernel void AB(int a, __global int4* b, uint c, __global int* d, __global int4* e, __global int* f, __global int4* g, __local short* h) {
  int i = get_global_id(0);
  int j = get_local_id(0);
  int k = get_local_size(0);
  int l = get_group_id(0);
  int m = get_global_size(0) / k;

  int4 n = Z(b, i, c);

  int4 o;
  short4 p;
  Y(j, k, a, n, h, &o, &p);

  barrier(1);

  __local int* q = (__local int*)h;
  __local int4* r = (__local int4*)h;

  q[o.x] = n.x;
  q[o.y] = n.y;
  q[o.z] = n.z;
  q[o.w] = n.w;

  barrier(1);

  if (((i + 1) << 2) <= c) {
    e[i] = r[j];
    g[i] = o;
  } else {
    if ((i << 2) < c)
      e[i].x = r[j].x;
    if ((i << 2) + 1 < c)
      e[i].y = r[j].y;
    if ((i << 2) + 2 < c)
      e[i].z = r[j].z;
  }

  if (j == 0) {
    d[l] = p.x;
    d[l + m] = p.y;
    d[l + 2 * m] = p.z;
    d[l + 3 * m] = p.w;

    f[l] = 0;
    f[l + m] = p.x;
    f[l + 2 * m] = p.x + p.y;
    f[l + 3 * m] = p.x + p.y + p.z;
  }
}

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void AC(

    int a,

    __global int const* restrict b,

    uint c,

    __global int* restrict d) {
  __local int e[16 * 64];

  int f = get_global_id(0);
  int g = get_local_id(0);
  int h = get_local_size(0);
  int i = get_group_id(0);
  int j = get_global_size(0) / h;

  for (int k = 0; k < 16; ++k) {
    e[k * 64 + g] = 0;
  }

  barrier(1);

  const int l = 8;
  const int m = l * 64;

  int n = (c + 64 * 4 - 1) / (64 * 4);
  int o = n - i * l;

  int p = i * m + g;
  for (int q = 0; q < min(l, o); ++q, p += 64) {
    int4 r = Z(b, p, c);

    int4 s = ((r >> a) & 0xF);

    atom_inc(&e[s.x * 64 + g]);

    atom_inc(&e[s.y * 64 + g]);

    atom_inc(&e[s.z * 64 + g]);

    atom_inc(&e[s.w * 64 + g]);
  }

  barrier(1);

  int t = 0;
  if (g < 16) {
    for (int k = 0; k < 64; ++k) {
      t += e[g * 64 + k];
    }

    d[j * g + i] = t;
  }
}

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void AD(int a,

                                                                 __global int4 const* restrict b,

                                                                 uint c,

                                                                 __global int const* restrict d,

                                                                 __global int* restrict e) {
  __local int f[64 * 4];
  __local int g[16];

  int h = get_global_id(0);
  int i = get_local_id(0);
  int j = get_local_size(0);
  int k = get_group_id(0);
  int l = get_global_size(0) / j;

  __local uint* m = (__local uint*)f;

  int n = 8;
  int o = n * 64;
  int p = (c + 64 * 4 - 1) / (64 * 4);
  int q = p - k * n;

  if (i < 16) {
    g[i] = d[k + i * l];
  }

  barrier(1);

  int r = k * o + i;
  for (int s = 0; s < min(n, q); ++s, r += 64) {
    int4 t = Z(b, r, c);

    m[i] = 0;

    barrier(1);

    for (int u = 0; u <= 2; u += 2) {
      int4 v = ((t >> a) >> u) & 0x3;

      int4 w;
      w.x = 1 << (8 * v.x);
      w.y = 1 << (8 * v.y);
      w.z = 1 << (8 * v.z);
      w.w = 1 << (8 * v.w);

      uint x = (uint)(w.x + w.y + w.z + w.w);

      m[i] = x;

      barrier(1);

      uint y = 0;
      K(i, 64, m, &y);

      x = m[i];

      barrier(1);

      y = (y << 8) + (y << 16) + (y << 24);
      uint z = y + x;

      int4 aa;

      int ab = w.y + w.x;
      w.w = w.z + ab;
      w.z = ab;
      w.y = w.x;
      w.x = 0;

      w += (int)z;
      aa = (w >> (v * 8)) & 0xFF;

      f[aa.x] = t.x;
      f[aa.y] = t.y;
      f[aa.z] = t.z;
      f[aa.w] = t.w;

      barrier(1);

      t.x = f[i << 2];
      t.y = f[(i << 2) + 1];
      t.z = f[(i << 2) + 2];
      t.w = f[(i << 2) + 3];

      barrier(1);
    }

    m[i] = 0;

    barrier(1);

    int4 ac = (t >> a) & 0xF;
    atom_inc(&m[ac.x]);
    atom_inc(&m[ac.y]);
    atom_inc(&m[ac.z]);
    atom_inc(&m[ac.w]);

    barrier(1);

    int ad = 0;
    if (i < 16) {
      ad = m[i];
    }

    barrier(1);

    H(i, 16, m);

    int z = g[ac.x] + (i << 2) - m[ac.x];
    if (z < c) {
      e[z] = t.x;
    }

    z = g[ac.y] + (i << 2) + 1 - m[ac.y];
    if (z < c) {
      e[z] = t.y;
    }

    z = g[ac.z] + (i << 2) + 2 - m[ac.z];
    if (z < c) {
      e[z] = t.z;
    }

    z = g[ac.w] + (i << 2) + 3 - m[ac.w];
    if (z < c) {
      e[z] = t.w;
    }

    barrier(1);

    if (i < 16) {
      g[i] += ad;
    }
  }
}

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void AE(int a,

                                                                 __global int4 const* restrict b,

                                                                 __global int4 const* restrict c,

                                                                 uint d,

                                                                 __global int const* restrict e,

                                                                 __global int* restrict f,

                                                                 __global int* restrict g) {
  __local int h[64 * 4];
  __local int i[16];

  int j = get_global_id(0);
  int k = get_local_id(0);
  int l = get_local_size(0);
  int m = get_group_id(0);
  int n = get_global_size(0) / l;

  __local uint* o = (__local uint*)h;

  int p = 8;
  int q = p * 64;
  int r = (d + 64 * 4 - 1) / (64 * 4);
  int s = r - m * p;

  if (k < 16) {
    i[k] = e[m + k * n];
  }

  barrier(1);

  int t = m * q + k;
  for (int u = 0; u < min(p, s); ++u, t += 64) {
    int4 v = Z(b, t, d);
    int4 w = Z(c, t, d);

    o[k] = 0;

    barrier(1);

    for (int x = 0; x <= 2; x += 2) {
      int4 y = ((v >> a) >> x) & 0x3;

      int4 z;
      z.x = 1 << (8 * y.x);
      z.y = 1 << (8 * y.y);
      z.z = 1 << (8 * y.z);
      z.w = 1 << (8 * y.w);

      uint aa = (uint)(z.x + z.y + z.z + z.w);

      o[k] = aa;

      barrier(1);

      uint ab = 0;
      K(k, 64, o, &ab);

      aa = o[k];

      barrier(1);

      ab = (ab << 8) + (ab << 16) + (ab << 24);
      uint ac = ab + aa;

      int4 ad;

      int ae = z.y + z.x;
      z.w = z.z + ae;
      z.z = ae;
      z.y = z.x;
      z.x = 0;

      z += (int)ac;
      ad = (z >> (y * 8)) & 0xFF;

      h[ad.x] = v.x;
      h[ad.y] = v.y;
      h[ad.z] = v.z;
      h[ad.w] = v.w;

      barrier(1);

      v.x = h[k << 2];
      v.y = h[(k << 2) + 1];
      v.z = h[(k << 2) + 2];
      v.w = h[(k << 2) + 3];

      barrier(1);

      h[ad.x] = w.x;
      h[ad.y] = w.y;
      h[ad.z] = w.z;
      h[ad.w] = w.w;

      barrier(1);

      w.x = h[k << 2];
      w.y = h[(k << 2) + 1];
      w.z = h[(k << 2) + 2];
      w.w = h[(k << 2) + 3];

      barrier(1);
    }

    o[k] = 0;

    barrier(1);

    int4 af = (v >> a) & 0xF;
    atom_inc(&o[af.x]);
    atom_inc(&o[af.y]);
    atom_inc(&o[af.z]);
    atom_inc(&o[af.w]);

    barrier(1);

    int ag = 0;
    if (k < 16) {
      ag = o[k];
    }

    barrier(1);

    H(k, 16, o);

    int ac = i[af.x] + (k << 2) - o[af.x];
    if (ac < d) {
      f[ac] = v.x;
      g[ac] = w.x;
    }

    ac = i[af.y] + (k << 2) + 1 - o[af.y];
    if (ac < d) {
      f[ac] = v.y;
      g[ac] = w.y;
    }

    ac = i[af.z] + (k << 2) + 2 - o[af.z];
    if (ac < d) {
      f[ac] = v.z;
      g[ac] = w.z;
    }

    ac = i[af.w] + (k << 2) + 3 - o[af.w];
    if (ac < d) {
      f[ac] = v.w;
      g[ac] = w.w;
    }

    barrier(1);

    i[k] += ag;
  }
}

__kernel void AF(__global int* a, __global int* b, __global int* c, uint d, __global int* e) {
  int f = get_global_id(0);
  int g = get_group_id(0);

  if (f < d) {
    if (a[f]) {
      e[b[f]] = c[f];
    }
  }
}

__kernel void AG(__global int* a, __global int* b, __global int* c, uint d, __global int* e, __global int* f) {
  int g = get_global_id(0);
  int h = get_group_id(0);

  if (g < d) {
    if (a[g]) {
      e[b[g]] = c[g];
    }
  }

  if (g == 0) {
    *f = b[d - 1] + a[d - 1];
  }
}

__kernel void AH(__global int4* a, uint b, __global int4* c) {
  int d = get_global_id(0);
  int4 e = C(a, d, b);
  E(e, c, d, b);
}

void AI(int a, int b, __local int* c, __local char* d) {
  for (int e = 1; e <= (b >> 1); e <<= 1) {
    if (a < b / (2 * e)) {
      if ((d[(2 * (a + 1) * e - 1)] & 0x1) == 0) {
        c[2 * (a + 1) * e - 1] = c[2 * (a + 1) * e - 1] + c[(2 * a + 1) * e - 1];
      }

      (d[(2 * (a + 1) * e - 1)]) = (d[(2 * (a + 1) * e - 1)]) | (d[((2 * a + 1) * e - 1)] & 0x1);
    }

    barrier(1);
  }

  if (a == 0)
    c[b - 1] = 0;

  barrier(1);

  for (int e = (b >> 1); e > 0; e >>= 1) {
    if (a < b / (2 * e)) {
      int f = c[(2 * a + 1) * e - 1];
      c[(2 * a + 1) * e - 1] = c[2 * (a + 1) * e - 1];

      if (((d[((2 * a + 1) * e)] >> 1) & 0x1) == 1) {
        c[2 * (a + 1) * e - 1] = 0;
      } else if ((d[((2 * a + 1) * e - 1)] & 0x1) == 1) {
        c[2 * (a + 1) * e - 1] = f;
      } else {
        c[2 * (a + 1) * e - 1] = c[2 * (a + 1) * e - 1] + f;
      }

      (d[((2 * a + 1) * e - 1)]) = (d[((2 * a + 1) * e - 1)]) & 2;
    }

    barrier(1);
  }
}

void AJ(int a, int b, __local int* c, __local char* d) {
  for (int e = 1; e <= (b >> 1); e <<= 1) {
    if (a < b / (2 * e)) {
      if ((d[(2 * (a + 1) * e - 1)] & 0x1) == 0) {
        c[2 * (a + 1) * e - 1] = c[2 * (a + 1) * e - 1] + c[(2 * a + 1) * e - 1];
      }

      (d[(2 * (a + 1) * e - 1)]) = (d[(2 * (a + 1) * e - 1)]) | (d[((2 * a + 1) * e - 1)] & 0x1);
    }

    barrier(1);
  }

  if (a == 0)
    c[b - 1] = 0;

  barrier(1);

  for (int e = (b >> 1); e > 0; e >>= 1) {
    if (a < b / (2 * e)) {
      int f = c[(2 * a + 1) * e - 1];
      c[(2 * a + 1) * e - 1] = c[2 * (a + 1) * e - 1];

      if ((d[((2 * a + 1) * e - 1)] & 0x1) == 1) {
        c[2 * (a + 1) * e - 1] = f;
      } else {
        c[2 * (a + 1) * e - 1] = c[2 * (a + 1) * e - 1] + f;
      }

      (d[((2 * a + 1) * e - 1)]) = (d[((2 * a + 1) * e - 1)]) & 2;
    }

    barrier(1);
  }
}

void AK(int a, int b, int c, __local int* d, __local char* e, __global int* f, __global int* g) {
  for (int h = 1; h <= (c >> 1); h <<= 1) {
    if (a < c / (2 * h)) {
      if ((e[(2 * (a + 1) * h - 1)] & 0x1) == 0) {
        d[2 * (a + 1) * h - 1] = d[2 * (a + 1) * h - 1] + d[(2 * a + 1) * h - 1];
      }

      (e[(2 * (a + 1) * h - 1)]) = (e[(2 * (a + 1) * h - 1)]) | (e[((2 * a + 1) * h - 1)] & 0x1);
    }

    barrier(1);
  }

  if (a == 0) {
    f[b] = d[c - 1];
    g[b] = (e[(c - 1)] & 0x1);
    d[c - 1] = 0;
  }

  barrier(1);

  for (int h = (c >> 1); h > 0; h >>= 1) {
    if (a < c / (2 * h)) {
      int i = d[(2 * a + 1) * h - 1];
      d[(2 * a + 1) * h - 1] = d[2 * (a + 1) * h - 1];

      if (((e[((2 * a + 1) * h)] >> 1) & 0x1) == 1) {
        d[2 * (a + 1) * h - 1] = 0;
      } else if ((e[((2 * a + 1) * h - 1)] & 0x1) == 1) {
        d[2 * (a + 1) * h - 1] = i;
      } else {
        d[2 * (a + 1) * h - 1] = d[2 * (a + 1) * h - 1] + i;
      }

      (e[((2 * a + 1) * h - 1)]) = (e[((2 * a + 1) * h - 1)]) & 2;
    }

    barrier(1);
  }
}

void AL(int a, int b, int c, __local int* d, __local char* e, __global int* f, __global int* g) {
  for (int h = 1; h <= (c >> 1); h <<= 1) {
    if (a < c / (2 * h)) {
      if ((e[(2 * (a + 1) * h - 1)] & 0x1) == 0) {
        d[2 * (a + 1) * h - 1] = d[2 * (a + 1) * h - 1] + d[(2 * a + 1) * h - 1];
      }

      (e[(2 * (a + 1) * h - 1)]) = (e[(2 * (a + 1) * h - 1)]) | (e[((2 * a + 1) * h - 1)] & 0x1);
    }

    barrier(1);
  }

  if (a == 0) {
    f[b] = d[c - 1];
    g[b] = (e[(c - 1)] & 0x1);
    d[c - 1] = 0;
  }

  barrier(1);

  for (int h = (c >> 1); h > 0; h >>= 1) {
    if (a < c / (2 * h)) {
      int i = d[(2 * a + 1) * h - 1];
      d[(2 * a + 1) * h - 1] = d[2 * (a + 1) * h - 1];

      if ((e[((2 * a + 1) * h - 1)] & 0x1) == 1) {
        d[2 * (a + 1) * h - 1] = i;
      } else {
        d[2 * (a + 1) * h - 1] = d[2 * (a + 1) * h - 1] + i;
      }

      (e[((2 * a + 1) * h - 1)]) = (e[((2 * a + 1) * h - 1)]) & 2;
    }

    barrier(1);
  }
}

__kernel void AM(__global int const* a, __global int const* b, int c, __global int* d, __local int* e) {
  int f = get_global_id(0);
  int g = get_local_id(0);
  int h = get_local_size(0);
  int i = get_group_id(0);

  __local int* j = e;
  __local char* k = (__local char*)(j + h);

  j[g] = f < c ? a[f] : 0;
  k[g] = f < c ? (b[f] ? 3 : 0) : 0;

  barrier(1);

  AJ(g, h, j, k);

  d[f] = j[g];
}

__kernel void AN(__global int const* a, __global int const* b, int c, __global int* d, __local int* e) {
  int f = get_global_id(0);
  int g = get_local_id(0);
  int h = get_local_size(0);
  int i = get_group_id(0);

  __local int* j = e;
  __local char* k = (__local char*)(j + h);

  j[g] = f < c ? a[f] : 0;
  k[g] = f < c ? (b[f] ? 3 : 0) : 0;

  barrier(1);

  AI(g, h, j, k);

  d[f] = j[g];
}

__kernel void AO(__global int const* a, __global int const* b, int c, __global int* d, __global int* e, __global int* f, __local int* g) {
  int h = get_global_id(0);
  int i = get_local_id(0);
  int j = get_local_size(0);
  int k = get_group_id(0);

  __local int* l = g;
  __local char* m = (__local char*)(l + j);

  l[i] = h < c ? a[h] : 0;
  m[i] = h < c ? (b[h] ? 3 : 0) : 0;

  barrier(1);

  AK(i, k, j, l, m, e, f);

  d[h] = l[i];
}

__kernel void AP(__global int const* a, __global int const* b, int c, __global int* d, __global int* e, __global int* f, __local int* g) {
  int h = get_global_id(0);
  int i = get_local_id(0);
  int j = get_local_size(0);
  int k = get_group_id(0);

  __local int* l = g;
  __local char* m = (__local char*)(l + j);

  l[i] = h < c ? a[h] : 0;
  m[i] = h < c ? (b[h] ? 3 : 0) : 0;

  barrier(1);

  AL(i, k, j, l, m, e, f);

  d[h] = l[i];
}

__kernel void AQ(__global int* a, __global int* b, int c, __global int* d) {
  int e = get_global_id(0);
  int f = get_local_id(0);
  int g = get_local_size(0);
  int h = get_group_id(0);

  int i = d[h];

  if (f == 0) {
    for (int j = 0; b[e + j] == 0 && j < g; ++j) {
      if (e + j < c) {
        a[e + j] += i;
      }
    }
  }
}

__kernel void AR(__global int* a, __global int* b, int c, __global int* d) {
  int e = get_global_id(0);
  int f = get_local_id(0);
  int g = get_local_size(0);
  int h = get_group_id(0);

  int i = d[h];
  bool j = false;

  if (f == 0) {
    for (int k = 0; k < g; ++k) {
      if (e + k < c) {
        if (b[e + k] == 0) {
          a[e + k] += i;
        } else {
          if (j) {
            break;
          } else {
            a[e + k] += i;
            j = true;
          }
        }
      }
    }
  }
}