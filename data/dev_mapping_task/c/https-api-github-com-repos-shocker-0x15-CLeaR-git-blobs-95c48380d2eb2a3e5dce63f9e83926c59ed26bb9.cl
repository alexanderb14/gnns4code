void A(volatile global float* a, float b); void B(volatile local float* a, float b); void C(volatile local float* a, float b); void A(volatile global float* a, float b) {
  uint c, d, e;

  c = __builtin_astype(*a, uint);
  d = __builtin_astype(*a + b, uint);
  while ((e = atomic_cmpxchg((volatile global uint*)a, c, d)) != c) {
    c = e;
    d = __builtin_astype(__builtin_astype(c, float) + b, uint);
  }
}

void B(volatile local float* a, float b) {
  uint c, d, e;

  c = __builtin_astype(*a, uint);
  d = __builtin_astype(fmin(*a, b), uint);
  while ((e = atomic_cmpxchg((volatile local uint*)a, c, d)) != c) {
    c = e;
    d = __builtin_astype(fmin(__builtin_astype(c, float), b), uint);
  }
}

void C(volatile local float* a, float b) {
  uint c, d, e;

  c = __builtin_astype(*a, uint);
  d = __builtin_astype(fmax(*a, b), uint);
  while ((e = atomic_cmpxchg((volatile local uint*)a, c, d)) != c) {
    c = e;
    d = __builtin_astype(fmax(__builtin_astype(c, float), b), uint);
  }
}

typedef float3 point3;

typedef struct __attribute__((aligned(4))) {
  uint p0, p1, p2;
  uint vn0, vn1, vn2;
  uint vt0, vt1, vt2;
  uint uv0, uv1, uv2;
  uint alphaTexPtr;
  ushort matPtr, lightPtr;
} Face;

typedef struct __attribute__((aligned(16))) {
  point3 min;
  point3 max;
  point3 center;
} AABB;

typedef struct __attribute__((aligned(16))) {
  point3 min;
  point3 max;
  bool isChild[2];
  uint c[2];
} InternalNode;

typedef struct __attribute__((aligned(16))) {
  point3 min;
  point3 max;
  uint objIdx;
} LeafNode;

kernel void D(const global point3* a, const global uchar* b, uint c, global uchar* d);

kernel void E(const global uchar* a, uint b, global uchar* c);

kernel void F(const global uchar* a, uint b, point3 c, point3 d, uint e, global uint3* f, global uint* g);

ushort G(local ushort* a, const uint b);
uint H(local ushort* a, local ushort* b, const uint c, ushort d);
kernel void I(const global uint3* a, uint b, uchar c, global uint* d, global uchar* e);

kernel void J(const global uchar* a, uint b, uint c, global uint* d, global ushort* e);

kernel void K(const global uchar* a, uint b, const global uint* c, const global ushort* d, const global uint* e, global uint* f);

char L(const global uint3* a, const global uint* b, uint c, uint d, const uint3* e, int f, int g);
inline char M(char a);
kernel void N(const global uint3* a, uint b, const global uchar* c, const global uint* d, uint e, global uchar* f, global uchar* g, global uint* h, global uint* i);

kernel void O(global uchar* a, global uint* b, const global uchar* c, uint d, const global uint* e);

kernel void D(const global point3* a, const global uchar* b, uint c, global uchar* d) {
  const uint e = get_global_id(0);
  if (e >= c)
    return;

  const global Face* f = (const global Face*)b + e;
  point3 g = *(a + f->p0);
  point3 h = *(a + f->p1);
  point3 i = *(a + f->p2);
  AABB j;
  j.min = fmin(g, fmin(h, i));
  j.max = fmax(g, fmax(h, i));
  j.center = (j.min + j.max) * 0.5f;
  *((global AABB*)d + e) = j;
}
kernel void E(const global uchar* a, uint b, global uchar* d) {
  const global AABB* e = (const global AABB*)a;
  global AABB* f = (global AABB*)d;

  local point3 g[128];
  local point3 h[128];

  const uint i = get_local_id(0);
  const uint j = get_global_id(0);

  if (j < b) {
    g[i] = (e + j)->min;
    h[i] = (e + j)->max;
  } else {
    g[i] = (point3)(__builtin_inff(), __builtin_inff(), __builtin_inff());
    h[i] = -(point3)(__builtin_inff(), __builtin_inff(), __builtin_inff());
  }
  barrier(1);
  for (uint k = 128 >> 1; k > 0; k >>= 1) {
    if (i < k) {
      g[i] = fmin(g[i], g[i + k]);
      h[i] = fmax(h[i], h[i + k]);
    }
    barrier(1);
  }

  if (i == 0) {
    AABB l;
    l.min = g[0];
    l.max = h[0];
    l.center = (l.min + l.max) * 0.5f;
    f[get_group_id(0)] = l;
  }
}

kernel void F(const global uchar* a, uint b, point3 c, point3 d, uint h, global uint3* f, global uint* g) {
  const uint i = get_global_id(0);
  if (i >= b)
    return;

  AABB j = *((const global AABB*)a + i);

  point3 k = (j.center - c) / d;
  f[i] = min(convert_uint3_rtz(k * h), h - 1);
  g[i] = i;
}

ushort G(local ushort* c, const uint b) {
  for (uint d = 2; d <= 64; d <<= 1) {
    uint e = (b + 1) * d - 1;
    if (e < 64)
      c[e] += c[e - (d >> 1)];
    barrier(1);
  }

  if (b == 0)
    c[64 - 1] = 0;
  barrier(1);
  for (uint d = 64; d >= 2; d >>= 1) {
    uint f = (b + 1) * d - 1;
    if (f < 64) {
      uint g = f - (d >> 1);
      ushort h = c[g];
      c[g] = c[f];
      c[f] += h;
    }
    barrier(1);
  }

  return c[b];
}

uint H(local ushort* e, local ushort* b, const uint c, ushort d) {
  ushort f = G(e, c);

  if (c == 64 - 1)
    *b = 64 - (f + d);
  barrier(1);

  if (d)
    return f + *b;
  else
    return c - f;
}

kernel void I(const global uint3* a, uint b, uchar c, global uint* d, global uchar* e) {
  const uint f = get_local_id(0);
  const uint g = get_global_id(0);

  local uchar h[64];
  local uint i[64];
  local ushort j[64];
  local ushort k;

  if (g < b) {
    uint l = d[g];
    i[f] = l;
    uchar3 m = convert_uchar3((a[l] >> c) & 0x01);
    h[f] = m.x + (m.y << 1) + (m.z << 2);
  } else {
    h[f] = 0x07;
  }
  barrier(1);

  for (uint n = 0; n < 3; ++n) {
    uchar o = h[f];
    uint p = i[f];
    uchar q = (o >> n) & 0x01;
    j[f] = q;
    barrier(1);

    uint r = H(j, &k, f, q);
    i[r] = p;
    h[r] = o;
    barrier(1);
  }

  if (g < b) {
    d[g] = i[f];
    e[g] = h[f];
  }
}

kernel void J(const global uchar* a, uint b, uint c, global uint* d, global ushort* e) {
  const uint f = get_global_id(0);
  if (f >= c)
    return;

  ushort g[8] = {0, 0, 0, 0, 0, 0, 0, 0};
  uint h = min(64 * (f + 1), b);
  for (uint i = 64 * f; i < h; ++i)
    ++g[a[i]];

  ushort j = 0;
  ushort k = 0;
  for (uint i = 0; i < 8; ++i) {
    j += k;
    e[8 * f + i] = j;
    k = g[i];
    d[c * i + f] = k;
  }
}

kernel void K(const global uchar* a, uint b, const global uint* g, const global ushort* d, const global uint* e, global uint* f) {
  const uint h = get_local_id(0);
  const uint i = get_global_id(0);
  if (i >= b)
    return;

  uint j = e[i];
  uchar k = a[i];
  uint l = g[get_num_groups(0) * k + get_group_id(0)];
  uint m = d[8 * get_group_id(0) + k];
  f[l + (h - m)] = j;
}

char L(const global uint3* a, const global uint* b, uint c, uint d, const uint3* e, int f, int g) {
  if (g < 0 || g >= (int)c)
    return -1;
  uint h = b[g];
  uint3 i = clz(*e ^ a[h]) - (32 - d);
  char j = min(i.z * 3 + 0, min(i.y * 3 + 1, i.x * 3 + 2));
  if ((uint)j != d * 3)
    return j;
  return j + clz(f ^ g);
}

inline char M(char a) {
  return a > 0 ? 1 : (a < 0 ? -1 : 0);
}

kernel void N(const global uint3* a, uint b, const global uchar* c, const global uint* d, uint e, global uchar* f, global uchar* g, global uint* h, global uint* i) {
  const uint j = get_global_id(0);
  if (j >= e)
    return;

  global LeafNode* k = (global LeafNode*)g + j;
  uint l = d[j];
  const global AABB* m = (const global AABB*)c + l;
  k->min = m->min;
  k->max = m->max;
  k->objIdx = l;

  if (j >= e - 1)
    return;
  i[j] = 0;

  uint3 n = a[l];

  char o = L(a, d, e, b, &n, j, (int)j + 1);
  char p = L(a, d, e, b, &n, j, (int)j - 1);
  char q = M(o - p);

  char r = q > 0 ? p : o;
  uint s = 2;
  while (L(a, d, e, b, &n, j, (int)j + s * q) > r)
    s <<= 1;

  uint t = 0;
  for (uint u = s >> 1; u >= 1; u >>= 1)
    if (L(a, d, e, b, &n, j, (int)j + (t + u) * q) > r)
      t += u;
  uint v = j + t * q;

  char w = L(a, d, e, b, &n, j, v);
  uint x = 0;
  float y = 0.5f;
  while (true) {
    uint u = (uint)__clc_ceil(t * y);
    if (L(a, d, e, b, &n, j, (int)j + (x + u) * q) > w)
      x += u;
    if (u <= 1)
      break;
    y *= 0.5f;
  }
  x = j + x * q + min(q, (char)0);

  global InternalNode* z = (global InternalNode*)f + j;
  bool aa = min(j, v) == x;
  z->isChild[0] = aa;
  z->c[0] = x;
  if (aa)
    *(h + x) = j;
  else
    *(h + e + x) = j;
  bool ab = max(j, v) == x + 1;
  z->isChild[1] = ab;
  z->c[1] = x + 1;
  if (ab)
    *(h + x + 1) = j;
  else
    *(h + e + x + 1) = j;
}

kernel void O(global uchar* a, global uint* b, const global uchar* c, uint d, const global uint* e) {
  const uint f = get_global_id(0);
  global InternalNode* g = (global InternalNode*)a;
  const global LeafNode* h = (const global LeafNode*)c;

  if (f >= d)
    return;

  const global LeafNode* i = h + f;
  uint j = f;
  point3 k = i->min;
  point3 l = i->max;

  uint m = *(e + f);

  if (atomic_add(b + m, 1) == 0)
    return;

  global InternalNode* n = g + m;
  bool o = n->isChild[0];
  bool p = n->isChild[1];
  uint q = n->c[0];
  uint r = n->c[1];
  if (q == j && o) {
    k = fmin(k, p ? (h + r)->min : (g + r)->min);
    l = fmax(l, p ? (h + r)->max : (g + r)->max);
  } else {
    k = fmin(o ? (h + q)->min : (g + q)->min, k);
    l = fmax(o ? (h + q)->max : (g + q)->max, l);
  }
  n->min = k;
  n->max = l;

  if (m == 0)
    return;

  j = m;
  m = *(e + d + m);

  e += d;

  while (true) {
    if (atomic_add(b + m, 1) == 0)
      return;

    global InternalNode* n = g + m;
    bool o = n->isChild[0];
    bool p = n->isChild[1];
    uint q = n->c[0];
    uint r = n->c[1];
    if (q == j) {
      k = fmin(k, p ? (h + r)->min : (g + r)->min);
      l = fmax(l, p ? (h + r)->max : (g + r)->max);
    } else {
      k = fmin(o ? (h + q)->min : (g + q)->min, k);
      l = fmax(o ? (h + q)->max : (g + q)->max, l);
    }
    n->min = k;
    n->max = l;

    if (m == 0)
      return;

    j = m;
    m = *(e + m);
  }
}