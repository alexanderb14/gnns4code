typedef unsigned int u32; typedef struct {
  float4 m_worldPos[4];
  float4 m_worldNormal;

  u32 m_coeffs;
  u32 m_batchIdx;

  int m_bodyAPtrAndSignBit;
  int m_bodyBPtrAndSignBit;
} Contact4;

typedef struct {
  int m_numChildShapes;
  float m_radius;
  int m_shapeType;
  int m_shapeIndex;

} btCollidableGpu;

typedef struct {
  float4 m_childPosition;
  float4 m_childOrientation;
  int m_shapeIndex;
  int m_unused0;
  int m_unused1;
  int m_unused2;
} btGpuChildShape;

typedef struct {
  float4 m_pos;
  float4 m_quat;
  float4 m_linVel;
  float4 m_angVel;

  u32 m_collidableIdx;
  float m_invMass;
  float m_restituitionCoeff;
  float m_frictionCoeff;
} BodyData;

typedef struct {
  float4 m_localCenter;
  float4 m_extents;
  float4 mC;
  float4 mE;

  float m_radius;
  int m_faceOffset;
  int m_numFaces;
  int m_numVertices;

  int m_vertexOffset;
  int m_uniqueEdgesOffset;
  int m_numUniqueEdges;
  int m_unused;

} ConvexPolyhedronCL;

typedef struct {
  float4 m_plane;
  int m_indexOffset;
  int m_numIndices;
} btGpuFace;
__inline float A(float a, float b) {
  return ((a) / (b));
}

__inline float4 B(float4 a, float4 b) {
  return ((a) / (b));
}

__inline float4 C(float4 a, float4 b) {
  return cross(a, b);
}

__inline float D(float4 a, float4 b) {
  float4 c = (float4)(a.xyz, 0.f);
  float4 d = (float4)(b.xyz, 0.f);
  return dot(c, d);
}

__inline float4 E(float4 a) {
  return fast_normalize(a);
}

typedef float4 Quaternion;

__inline Quaternion F(Quaternion a, Quaternion b);

__inline Quaternion G(Quaternion a);

__inline float4 H(Quaternion a, float4 b);

__inline Quaternion I(Quaternion a);

__inline Quaternion F(Quaternion a, Quaternion b) {
  Quaternion c;
  c = C(a, b);
  c += a.w * b + b.w * a;

  c.w = a.w * b.w - D(a, b);
  return c;
}

__inline Quaternion G(Quaternion a) {
  return E(a);
}
__inline float4 H(Quaternion a, float4 b) {
  Quaternion c = I(a);
  float4 d = b;
  d.w = 0.f;
  float4 e = F(F(a, d), c);
  return e;
}

__inline Quaternion I(Quaternion a) {
  return (Quaternion)(-a.xyz, a.w);
}

__inline float4 J(const Quaternion a, float4 b) {
  return H(I(a), b);
}

__inline float4 K(const float4* a, const float4* b, const Quaternion* c) {
  return H(*c, *a) + (*b);
}

__inline float4 L(const float4 a) {
  float4 b = (float4)(a.x, a.y, a.z, 0.f);
  return E(b);
}

__inline float4 M(const float4 a, const float4 b, float c) {
  return (float4)(a.x + (b.x - a.x) * c, a.y + (b.y - a.y) * c, a.z + (b.z - a.z) * c, 0.f);
}

int N(__global const float4* a, int b, float4 c, float d, __global float4* e) {
  int f;
  float g, h;
  int i = 0;

  float4 j = a[b - 1];
  float4 k = a[0];

  g = D(c, j) + d;

  for (f = 0; f < b; f++) {
    k = a[f];
    h = D(c, k) + d;
    if (g < 0) {
      if (h < 0) {
        e[i++] = k;
      } else {
        e[i++] = M(j, k, (g * 1.f / (g - h)));
      }
    } else {
      if (h < 0) {
        e[i++] = M(j, k, (g * 1.f / (g - h)));
        e[i++] = k;
      }
    }
    j = k;
    g = h;
  }
  return i;
}

int O(const float4* a, int b, float4 c, float d, float4* e) {
  int f;
  float g, h;
  int i = 0;

  float4 j = a[b - 1];
  float4 k = a[0];

  g = D(c, j) + d;

  for (f = 0; f < b; f++) {
    k = a[f];

    h = D(c, k) + d;

    if (g < 0) {
      if (h < 0) {
        e[i++] = k;
      } else {
        e[i++] = M(j, k, (g * 1.f / (g - h)));
      }
    } else {
      if (h < 0) {
        e[i++] = M(j, k, (g * 1.f / (g - h)));
        e[i++] = k;
      }
    }
    j = k;
    g = h;
  }
  return i;
}

int P(const float4 a, __global const ConvexPolyhedronCL* b, const float4 c, const Quaternion d, float4* e, int f, float4* g, int h, const float i, float j, __global const float4* k, __global const btGpuFace* l, __global const int* m, float4* n, int o) {
  int p = 0;

  float4* q = e;
  float4* r = g;

  int s = f;
  int t = 0;

  int u = -1;
  {
    float v = 0x1.fffffep127f;
    for (int w = 0; w < b->m_numFaces; w++) {
      const float4 x = (float4)(bfaceOffset + w_plane.x, bfaceOffset + w_plane.y, bfaceOffset + w_plane.z, 0.f);
      const float4 y = H(d, x);

      float z = D(y, a);
      if (z < v) {
        v = z;
        u = w;
      }
    }
  }
  if (u < 0)
    return p;

  btGpuFace aa = l[b->m_faceOffset + u];

  int ab = aa.m_numIndices;
  for (int ac = 0; ac < ab; ac++) {
    const float4 ad = k[b->m_vertexOffset + m[aa.m_indexOffset + ac]];
    const float4 ae = k[b->m_vertexOffset + m[aa.m_indexOffset + ((ac + 1) % ab)]];
    const float4 af = ad - ae;
    const float4 ag = H(d, af);
    float4 ah = (float4)(aaplane.x, aaplane.y, aaplane.z, 0.f);
    float4 ai = H(d, ah);

    float4 aj = -C(ag, ai);
    float4 ak = K(&ad, &c, &d);
    float al = -D(ak, aj);

    float4 am = aj;
    float an = al;

    t = O(q, s, am, an, r);

    float4* ao = r;
    r = q;
    q = ao;
    s = t;
    t = 0;
  }

  {
    float4 ap = (float4)(aaplane.x, aaplane.y, aaplane.z, 0.f);
    float aq = aa.m_plane.w;
    float4 am = H(d, ap);
    float an = aq - D(am, c);
    for (int ar = 0; ar < s; ar++) {
      float as = D(am, q[ar]) + an;
      if (as <= i) {
        as = i;
      }

      if (as <= j) {
        float4 at = q[ar];

    n[pasat
      }
    }
  }

  return p;
}

int Q(const float4 a, const ConvexPolyhedronCL* b, const float4 c, const Quaternion d, float4* e, int f, float4* g, int h, const float i, float j, const float4* k, const btGpuFace* l, const int* m, __global const float4* n, __global const btGpuFace* o, __global const int* p, float4* q, int r) {
  int s = 0;

  float4* t = e;
  float4* u = g;

  int v = f;
  int w = 0;

  int x = -1;
  {
    float y = 0x1.fffffep127f;
    for (int z = 0; z < b->m_numFaces; z++) {
      const float4 aa = (float4)(bfaceOffset + z_plane.x, bfaceOffset + z_plane.y, bfaceOffset + z_plane.z, 0.f);
      const float4 ab = H(d, aa);

      float ac = D(ab, a);
      if (ac < y) {
        y = ac;
        x = z;
      }
    }
  }
  if (x < 0)
    return s;

  btGpuFace ad = l[b->m_faceOffset + x];

  int ae = ad.m_numIndices;
  for (int af = 0; af < ae; af++) {
    const float4 ag = k[b->m_vertexOffset + m[ad.m_indexOffset + af]];
    const float4 ah = k[b->m_vertexOffset + m[ad.m_indexOffset + ((af + 1) % ae)]];
    const float4 ai = ag - ah;
    const float4 aj = H(d, ai);
    float4 ak = (float4)(adplane.x, adplane.y, adplane.z, 0.f);
    float4 al = H(d, ak);

    float4 am = -C(aj, al);
    float4 an = K(&ag, &c, &d);
    float ao = -D(an, am);

    float4 ap = am;
    float aq = ao;

    w = O(t, v, ap, aq, u);

    float4* ar = u;
    u = t;
    t = ar;
    v = w;
    w = 0;
  }

  {
    float4 as = (float4)(adplane.x, adplane.y, adplane.z, 0.f);
    float at = ad.m_plane.w;
    float4 ap = H(d, as);
    float aq = at - D(ap, c);
    for (int au = 0; au < v; au++) {
      float av = D(ap, t[au]) + aq;
      if (av <= i) {
        av = i;
      }

      if (av <= j) {
        float4 aw = t[au];

    q[savaw
      }
    }
  }

  return s;
}

int R(const float4 a, __global const ConvexPolyhedronCL* b, __global const ConvexPolyhedronCL* c, const float4 d, const Quaternion e, const float4 f, const Quaternion g, float4* h, float4* i, int j, const float k, float l, __global const float4* m, __global const btGpuFace* n, __global const int* o, float4* p, int q) {
  int r = 0;
  int s = 0;

  int t = -1;
  float u = -0x1.fffffep127f;

  {
    for (int v = 0; v < c->m_numFaces; v++) {
      const float4 w = (float4cfaceOffset + v_plane.x, cfaceOffset + v_plane.ycfaceOffset + v_plane.z, 0.f);
      const float4 x = H(g, w);
      float y = D(x, a);
      if (y > u) {
        u = y;
        t = v;
      }
    }
  }

  {
    const btGpuFace z = n[c->m_faceOffset + t];
    const int aa = z.m_numIndices;
    for (int ab = 0; ab < aa; ab++) {
      const float4 ac = m[c->m_vertexOffset + o[z.m_indexOffset + ab]];
      h[s++] = K(&ac, &f, &g);
    }
  }

  if (t >= 0) {
    r = P(a, b, d, e, h, s, i, j, k, l, m, n, o, p, q);
  }

  return r;
}

int S(const float4 a, const ConvexPolyhedronCL* b, __global const ConvexPolyhedronCL* c, const float4 d, const Quaternion e, const float4 f, const Quaternion g, float4* h, float4* i, int j, const float k, float l, const float4* m, const btGpuFace* n, const int* o, __global const float4* p, __global const btGpuFace* q, __global const int* r, float4* s, int t) {
  int u = 0;
  int v = 0;

  int w = -1;
  float x = -0x1.fffffep127f;

  {
    for (int y = 0; y < c->m_numFaces; y++) {
      const float4 z = (floatcfaceOffset + y_plane.x, cfaceOffset + y_plane.cfaceOffset + y_plane.z, 0.f);
      const float4 aa = H(g, z);
      float ab = D(aa, a);
      if (ab > x) {
        x = ab;
        w = y;
      }
    }
  }

  {
    const btGpuFace ac = q[c->m_faceOffset + w];
    const int ad = ac.m_numIndices;
    for (int ae = 0; ae < ad; ae++) {
      const float4 af = p[c->m_vertexOffset + r[ac.m_indexOffset + ae]];
      h[v++] = K(&af, &f, &g);
    }
  }

  if (w >= 0) {
    u = Q(a, b, d, e, h, v, i, j, k, l, m, n, o, p, q, r, s, t);
  }

  return u;
}
int T(__global const float4* a, int b, float4 c, int4* d) {
  if (b == 0)
    return 0;

  if (b <= 4)
    return b;

  if (b > 64)
    b = 64;

  float4 e = (float4)(0.f);
  {
    for (int f = 0; f < b; f++)
      e += a[f];
    e /= (float)b;
  }

  float4 g = a[0] - e;
  float4 h = C(c, g);
  float4 i = C(c, h);
  h = L(h);
  i = L(i);

  float j = 0x1.fffffep127f;

  int k = -1;

  float4 l;
  l.x = 0x1.0p-126f;
  l.y = 0x1.0p-126f;
  l.z = 0x1.0p-126f;
  l.w = 0x1.0p-126f;

  for (int m = 0; m < b; m++) {
    if (a[m].w < j) {
      j = a[m].w;
      k = m;
    }
    float n;
    float4 o = a[m] - e;
    n = D(h, o);
    if (n < l.x) {
      l.x = n;
      d[0].x = m;
    }

    n = D(-h, o);
    if (n < l.y) {
      l.y = n;
      d[0].y = m;
    }

    n = D(i, o);
    if (n < l.z) {
      l.z = n;
      d[0].z = m;
    }

    n = D(-i, o);
    if (n < l.w) {
      l.w = n;
      d[0].w = m;
    }
  }

  if (d[0].x != k && d[0].y != k && d[0].z != k && d[0].w != k) {
    d[0].x = k;
  }

  return 4;
}

int U(__global const float4* a, int b, float4 c, int* d) {
  d[0] = 0;
  d[1] = 1;
  d[2] = 2;
  d[3] = 3;

  if (b == 0)
    return 0;

  b = min(b, 4);
  return b;
}

int V(const float4* a, int b, float4 c, int* d) {
  if (b == 0)
    return 0;

  b = min(b, 64);

  float4 e = (float4)(0.f);
  {
    float4 f[64];
    for (int g = 0; g < b; g++)
      f[g] = a[g];

    for (int h = 1; h < b; h++)
      f[0] += f[h];
    ;
    e = f[0] / (float)b;
  }

  {
    if (b < 4) {
      for (int g = 0; g < b; g++)
        d[g] = g;
      return b;
    }

    float4 i = a[0] - e;
    float4 j = C(c, i);
    float4 f = C(c, j);
    j = L(j);
    f = L(f);

    int k[4];

    float2 l = (float2)(0, 0x1.fffffep127f);
    {
      {{int4 m[64];
      for (int n = 0; n < b; n++) {
        float o;
        float4 p = a[n] - e;
        o = D(j, p);
        m[n].x = ((*(u32*)&o) & 0xffffff00) | (0xff & n);

        o = D(-j, p);
        m[n].y = ((*(u32*)&o) & 0xffffff00) | (0xff & n);

        o = D(f, p);
        m[n].z = ((*(u32*)&o) & 0xffffff00) | (0xff & n);

        o = D(-f, p);
        m[n].w = ((*(u32*)&o) & 0xffffff00) | (0xff & n);
      }

      for (int n = 0; n < b; n++) {
        m[0].x = (m[0].x > m[n].x) ? m[0].x : m[n].x;
        m[0].y = (m[0].y > m[n].y) ? m[0].y : m[n].y;
        m[0].z = (m[0].z > m[n].z) ? m[0].z : m[n].z;
        m[0].w = (m[0].w > m[n].w) ? m[0].w : m[n].w;
      }

      k[0] = (int)m[0].x & 0xff;
      k[1] = (int)m[0].y & 0xff;
      k[2] = (int)m[0].z & 0xff;
      k[3] = (int)m[0].w & 0xff;
    }
  }

  {
    float2 q[64];
    for (int n = 0; n < b; n++) {q[n] = (float2)((float)n a[n.w);
    };
    {
      int g = 0;
      for (int r = 0; r < b; r++)
        q[g] = (q[g].y < q[g + r].y) ? q[g] : q[g + r];
    };
    l = q[0];
  }
}

d[0] = k[0];
d[1] = k[1];
d[2] = k[2];
d[3] = k[3];

return 4;
}
}

__kernel void W(__global const int2* a, __global const BodyData* b, __global const float4* c, __global const float4* d, __global const int* e, __global const int* f, __global Contact4* restrict g, volatile __global int* h, int i, int j) {
  int k = get_global_id(0);

  if (k < i) {
    float4 l = d[k];
    int m = e[k];
    __global const float4* n = &c[f[k]];
    float4 o[64];
    for (int p = 0; p < m; p++) {
      o[p] = n[p];
    }

    int q[4];
    q[0] = -1;
    q[1] = -1;
    q[2] = -1;
    q[3] = -1;

    int r = V(o, m, l, q);

    int s;
    s = atomic_add(h, 1);

    {
      __global Contact4* t = g + s;
      t->m_worldNormal = l;
      t->m_coeffs = (u32)(0.f * 0xffff) | ((u32)(0.7f * 0xffff) << 16);
      t->m_batchIdx = k;
      int u = a[j].x;
      int v = a[j].y;
      t->m_bodyAPtrAndSignBit = b[u].m_invMass == 0 ? -u : u;
      t->m_bodyBPtrAndSignBit = b[v].m_invMass == 0 ? -v : v;
      for (int p = 0; p < r; p++) {
        t->m_worldPos[p] = o[q[p]];
      }
      (*t).m_worldNormal.w = r;
    }
  }
}

void X(float4 a, Quaternion b, float4* c, Quaternion* d) {
  *d = I(b);
  *c = H(*d, -a);
}

void Y(float4 a, Quaternion b, float4 c, Quaternion d, float4* e, Quaternion* f) {
  *f = F(b, d);
  *e = K(&c, &a, &b);
}

void Z(int a, int b, int c, int d, int e, __global const BodyData* f, __global const btCollidableGpu* g, __global const btGpuFace* h, __global Contact4* restrict i, volatile __global int* j, int k) {
  float4 l = h[g[d].m_shapeIndex].m_plane;
  float m = g[e].m_radius;
  float4 n = f[b].m_pos;
  float4 o = f[b].m_quat;
  float4 p = f[c].m_pos;
  float4 q = f[c].m_quat;

  bool r = false;
  float4 s = (floal);
  float t = l.w;
  float4 u;
  Quaternion v;
  {
    float4 w;
    Quaternion x;
    X(n, o, &w, &x);
    Y(w, x, p, q, &u, &v);
  }
  float4 y;
  Quaternion z;
  {
    float4 aa;
    Quaternion ab;
    X(p, q, &aa, &ab);
    Y(aa, ab, n, o, &y, &z);
  }
  float4 ac = H(z, -s) * m;
  float4 ad = K(&ac, &u, &v);
  float ae = D(s, ad) - t;
  r = ae < 0.f;
  if (r) {
    float4 af = ad - ae * s;
    float4 ag = K(&af, &n, &o);
    float4 ah = H(o, s);
    float4 ai = ag + ah * ae;
    ai.w = ae;

    int aj;
    aj = atomic_add(j, 1);

    if (aj < k) {
      __global Contact4* ak = &i[aj];
      ak->m_worldNormal = ah;
      ak->m_coeffs = (u32)(0.f * 0xffff) | ((u32)(0.7f * 0xffff) << 16);
      ak->m_batchIdx = a;
      ak->m_bodyAPtrAndSignBit = f[b].m_invMass == 0 ? -b : b;
      ak->m_bodyBPtrAndSignBit = f[c].m_invMass == 0 ? -c : c;
      ak->m_worldPos[0] = ai;
      (*ak).m_worldNormal.w = 1;
    }
  }
}

__kernel void AA(__global const int2* a, __global const BodyData* b, __global const btCollidableGpu* c, __global const ConvexPolyhedronCL* d, __global const float4* e, __global const float4* f, __global const btGpuFace* g, __global const int* h, __global const float4* i, __global const int* j, __global Contact4* restrict k, volatile __global int* l, int m) {
  int n = get_global_id(0);
  int o = n;

  float4 p[64];
  float4 q[64];
  int r = 64;

  float4 s[64];
  int t = 64;

  float u = -1e30f;
  float v = 0.02f;

  if (n < m) {
    int w = a[n].x;
    int x = a[n].y;

    int y = b[w].m_collidableIdx;
    int z = b[x].m_collidableIdx;

    if (c[y].m_shapeType == 7 && c[z].m_shapeType == 4) {
      Z(o, x, w, z, y, b, c, g, k, l, m);
      return;
    }

    if (c[y].m_shapeType == 4 && c[z].m_shapeType == 7) {
      Z(o, w, x, y, z, b, c, g, k, l, m);
      return;
    }

    if (c[y].m_shapeType == 7 && c[z].m_shapeType == 7) {
      float aa = c[y].m_radius;
      float ab = c[z].m_radius;
      float4 ac = b[w].m_pos;
      float4 ad = b[x].m_pos;

      float4 ae = ac - ad;
      float af = length(ae);

      if (af <= (aa + ab)) {
        float ag = af - (aa + ab);
        float4 ah = (float4)(1.f, 0.f, 0.f, 0.f);
        if (af > 0.00001) {
          ah = ae / af;
        }
        float4 ai = ad + ah * ab;
        ai.w = ag;

        int aj;
        aj = atomic_add(l, 1);

        if (aj < m) {
          __global Contact4* ak = &k[aj];
          ak->m_worldNormal = -ah;
          ak->m_coeffs = (u32)(0.f * 0xffff) | ((u32)(0.7f * 0xffff) << 16);
          ak->m_batchIdx = o;
          int al = a[o].x;
          int am = a[o].y;
          ak->m_bodyAPtrAndSignBit = b[al].m_invMass == 0 ? -al : al;
          ak->m_bodyBPtrAndSignBit = b[am].m_invMass == 0 ? -am : am;
          ak->m_worldPos[0] = ai;
          (*ak).m_worldNormal.w = 1;
        }
      }

      return;
    }

    if (j[n]) {
      int an = c[y].m_shapeIndex;
      int ao = c[z].m_shapeIndex;

      int ap = R(i[n], &d[an], &d[ao], b[w].m_pos, b[w].m_quat, b[x].m_pos, b[x].m_quat, p, q, r, u, v, e, g, h, s, t);

      if (ap > 0) {
        float4 aq = -i[n];
        int ar = ap;
        float4* as = s;
        int at[4];

        at[0] = -1;
        at[1] = -1;
        at[2] = -1;
        at[3] = -1;

        int au = V(as, ar, aq, at);

        int aj;
        aj = atomic_add(l, 1);

        {
          __global Contact4* ak = k + aj;
          ak->m_worldNormal = aq;
          ak->m_coeffs = (u32)(0.f * 0xffff) | ((u32)(0.7f * 0xffff) << 16);
          ak->m_batchIdx = o;
          int al = a[o].x;
          int am = a[o].y;
          ak->m_bodyAPtrAndSignBit = b[al].m_invMass == 0 ? -al : al;
          ak->m_bodyBPtrAndSignBit = b[am].m_invMass == 0 ? -am : am;

          for (int n = 0; n < au; n++) {
            ak->m_worldPos[n] = as[at[n]];
          }
          (*ak).m_worldNormal.w = au;
        }
      }
    }
  }
}

__kernel void AB(__global const int4* a, __global const BodyData* b, __global const btCollidableGpu* c, __global const ConvexPolyhedronCL* d, __global const float4* e, __global const float4* f, __global const btGpuFace* g, __global const int* h, __global const btGpuChildShape* i, __global const float4* j, __global const int* k, __global Contact4* restrict l, volatile __global int* m, int n) {
  int o = get_global_id(0);
  int p = o;

  float4 q[64];
  float4 r[64];
  int s = 64;

  float4 t[64];
  int u = 64;

  float v = -1e30f;
  float w = 0.02f;

  if (o < n) {
    if (k[o]) {
      int x = a[o].x;
      int y = a[o].y;

      int z = a[o].z;
      int aa = a[o].w;

      int ab = -1;
      int ac = -1;

      float4 ad = b[x].m_quat;
      float4 ae = b[x].m_pos;

      float4 af = b[y].m_quat;
      float4 ag = b[y].m_pos;

      if (z >= 0) {
        ab = i[z].m_shapeIndex;
        float4 ah = i[z].m_childPosition;
        float4 ai = i[z].m_childOrientation;
        float4 aj = H(ad, ah) + ae;
        float4 ak = F(ad, ai);
        ae = aj;
        ad = ak;
      } else {
        ab = b[x].m_collidableIdx;
      }

      if (aa >= 0) {
        ac = i[aa].m_shapeIndex;
        float4 al = i[aa].m_childPosition;
        float4 am = i[aa].m_childOrientation;
        float4 an = K(&al, &ag, &af);
        float4 ao = F(af, am);
        ag = an;
        af = ao;
      } else {
        ac = b[y].m_collidableIdx;
      }

      int ap = c[ab].m_shapeIndex;
      int aq = c[ac].m_shapeIndex;

      int ar = R(j[o], &d[ap], &d[aq], ae, ad, ag, af, q, r, s, v, w, e, g, h, t, u);

      if (ar > 0) {
        float4 as = -j[o];
        int at = ar;
        float4* au = t;
        int av[4];

        av[0] = -1;
        av[1] = -1;
        av[2] = -1;
        av[3] = -1;

        int aw = V(au, at, as, av);

        int ax;
        ax = atomic_add(m, 1);

        {
          __global Contact4* ay = l + ax;
          ay->m_worldNormal = as;
          ay->m_coeffs = (u32)(0.f * 0xffff) | ((u32)(0.7f * 0xffff) << 16);
          ay->m_batchIdx = p;
          int az = a[p].x;
          int ba = a[p].y;
          ay->m_bodyAPtrAndSignBit = b[az].m_invMass == 0 ? -az : az;
          ay->m_bodyBPtrAndSignBit = b[ba].m_invMass == 0 ? -ba : ba;

          for (int o = 0; o < aw; o++) {
            ay->m_worldPos[o] = au[av[o]];
          }
          (*ay).m_worldNormal.w = aw;
        }
      }
    }
  }
}

__kernel void AC(__global const int2* a, __global const BodyData* b, __global const btCollidableGpu* c, __global const float4* d, __global const int* e, __global Contact4* restrict f, volatile __global int* g, int h) {
  int i = get_global_id(0);
  int j = i;

  if (i < h) {
    int k = a[i].x;
    int l = a[i].y;

    int m = b[k].m_collidableIdx;
    int n = b[l].m_collidableIdx;

    if (c[m].m_shapeType == 7 && c[n].m_shapeType == 7) {
      float o = c[m].m_radius;
      float p = c[n].m_radius;
      float4 q = b[k].m_pos;
      float4 r = b[l].m_pos;

      float4 s = q - r;
      float t = length(s);

      if (t <= (o + p)) {
        float u = t - (o + p);
        float4 v = (float4)(1.f, 0.f, 0.f, 0.f);
        if (t > 0.00001) {
          v = s / t;
        }
        float4 w = r + v * p;
        w.w = u;

        int x;
        x = atomic_add(g, 1);

        if (x < h) {
          __global Contact4* y = &f[x];
          y->m_worldNormal = v;
          y->m_coeffs = (u32)(0.f * 0xffff) | ((u32)(0.7f * 0xffff) << 16);
          y->m_batchIdx = j;
          int z = a[j].x;
          int aa = a[j].y;
          y->m_bodyAPtrAndSignBit = b[z].m_invMass == 0 ? -z : z;
          y->m_bodyBPtrAndSignBit = b[aa].m_invMass == 0 ? -aa : aa;
          y->m_worldPos[0] = w;
          (*y).m_worldNormal.w = 1;
        }
      }
    }
  }
}

__kernel void AD(__global int4* a, __global const BodyData* b, __global const btCollidableGpu* c, __global const ConvexPolyhedronCL* d, __global const float4* e, __global const float4* f, __global const btGpuFace* g, __global const int* h, __global const float4* i, __global Contact4* restrict j, volatile __global int* k, int l) {
  int m = get_global_id(0);
  int n = m;

  float4 o[64];
  float4 p[64];
  int q = 64;

  float4 r[64];
  int s = 64;

  float t = -1e30f;
  float u = 0.02f;

  if (m < l) {
    int v = a[m].x;
    int w = a[m].y;
    int x = a[m].z;

    int y = b[v].m_collidableIdx;
    int z = b[w].m_collidableIdx;

    int aa = c[y].m_shapeIndex;
    int ab = c[z].m_shapeIndex;

    bool ac = false;

    ConvexPolyhedronCL ad;

    ad.m_numVertices = 3;
    ad.m_vertexOffset = 0;
    float4 ae = (float4)(0.f, 0.f, 0.f, 0.f);

    btGpuFace af = g[d[aa].m_faceOffset + x];

    float4 ag[3];
    for (int m = 0; m < 3; m++) {
      int ah = h[af.m_indexOffset + m];
      float4 ai = e[d[aa].m_vertexOffset + ah];
      ag[m] = ai;
      ae += ai;
    }

    float aj = 0x1.fffffep127f;

    int ak = 0;

    ad.m_numUniqueEdges = 3;
    ad.m_uniqueEdgesOffset = 0;
    float4 al[3];

    al[0] = (ag[1] - ag[0]);
    al[1] = (ag[2] - ag[1]);
    al[2] = (ag[0] - ag[2]);

    ad.m_faceOffset = 0;

    float4 am = (float4)(af_plane.x, af_plane.y, af_plane.z, 0.f);

    btGpuFace an[5];
    int ao[3 + 3 + 2 + 2 + 2];
    int ap = 0;
    int aq = 0;

    {
      an[aq].m_indexOffset = ap;
      ao[0] = 0;
      ao[1] = 1;
      ao[2] = 2;
      ap += 3;
      float ar = af.m_plane.w;
      an[aq].m_plane.x = am.x;
      an[aq].m_plane.y = am.y;
      an[aq].m_plane.z = am.z;
      an[aq].m_plane.w = ar;
      an[aq].m_numIndices = 3;
    }
    aq++;

    {
      an[aq].m_indexOffset = ap;
      ao[3] = 2;
      ao[4] = 1;
      ao[5] = 0;
      ap += 3;
      float ar = D(am, ag[0]);
      float as = -af.m_plane.w;
      an[aq].m_plane.x = -am.x;
      an[aq].m_plane.y = -am.y;
      an[aq].m_plane.z = -am.z;
      an[aq].m_plane.w = ar;
      an[aq].m_numIndices = 3;
    }
    aq++;

    bool at = true;
    if (at) {
      int au = 3;
      int av = au - 1;
      for (int m = 0; m < au; m++) {
        float4 aw = ag[m];
        float4 ax = ag[av];

        float4 ay = normalize(cross(am, ax - aw));
        float ar = -D(ay, aw);

        an[aq].m_numIndices = 2;
        an[aq].m_indexOffset = ap;
        ao[ap++] = m;
        ao[ap++] = av;

        an[aq].m_plane.x = ay.x;
        an[aq].m_plane.y = ay.y;
        an[aq].m_plane.z = ay.z;
        an[aq].m_plane.w = ar;
        aq++;
        av = m;
      }
    }
    ad.m_numFaces = 5;
    ad.m_localCenter = ae * (1.f / 3.f);

    float4 az = b[v].m_pos;
    az.w = 0.f;
    float4 ba = b[w].m_pos;
    ba.w = 0.f;
    float4 bb = ad.m_localCenter;
    float4 bc = b[v].m_quat;
    float4 bd = K(&bb, &az, &bc);
    float4 be = d[ab].m_localCenter;
    float4 bf = b[w].m_quat;
    float4 as = K(&be, &ba, &bf);
    const float4 bg = bd - as;

    float4 bh = i[m];

    int bi = S(bh, &ad, &d[ab], b[v].m_pos, b[v].m_quat, b[w].m_pos, b[w].m_quat, o, p, q, t, u, &ag, &an, &ao, e, g, h, r, s);

    if (bi > 0) {
      float4 am = -i[m];
      int bj = bi;
      float4* bk = r;
      int bl[4];

      bl[0] = -1;
      bl[1] = -1;
      bl[2] = -1;
      bl[3] = -1;

      int bm = V(bk, bj, am, bl);

      int bn;
      bn = atomic_add(k, 1);

      {
        __global Contact4* ar = j + bn;
        ar->m_worldNormal = am;
        ar->m_coeffs = (u32)(0.f * 0xffff) | ((u32)(0.7f * 0xffff) << 16);
        ar->m_batchIdx = n;
        int bo = a[n].x;
        int bp = a[n].y;
        ar->m_bodyAPtrAndSignBit = b[bo].m_invMass == 0 ? -bo : bo;
        ar->m_bodyBPtrAndSignBit = b[bp].m_invMass == 0 ? -bp : bp;

        for (int m = 0; m < bm; m++) {
          ar->m_worldPos[m] = bk[bl[m]];
        }
        (*ar).m_worldNormal.w = bm;
      }
    }
  }
}

int AE(const float4 a, __global const ConvexPolyhedronCL* b, __global const ConvexPolyhedronCL* c, const float4 d, const Quaternion e, const float4 f, const Quaternion g, __global float4* h, __global float4* i, __global float4* j, int k, const float l, float m, __global const float4* n, __global const btGpuFace* o, __global const int* p, __global int4* q, int r) {
  int s = 0;
  int t = 0;

  int u = -1;
  float v = -0x1.fffffep127f;

  {
    for (int w = 0; w < c->m_numFaces; w++) {
      const float4 x = (float4cfaceOffset + w_plane.x, cfaceOffset + w_plane.ycfaceOffset + w_plane.z, 0.f);
      const float4 y = H(g, x);
      float z = D(y, a);
      if (z > v) {
        v = z;
        u = w;
      }
    }
  }

  {
    const btGpuFace aa = o[c->m_faceOffset + u];
    const int ab = aa.m_numIndices;
    for (int ac = 0; ac < ab; ac++) {
      const float4 ad = n[c->m_vertexOffset + p[aa.m_indexOffset + ac]];
      j[r * k + t++] = K(&ad, &f, &g);
    }
  }

  int ae = -1;
  {
    float af = 0x1.fffffep127f;
    for (int w = 0; w < b->m_numFaces; w++) {
      const float4 x = (float4)(bfaceOffset + w_plane.x, bfaceOffset + w_plane.y, bfaceOffset + w_plane.z, 0.f);
      const float4 ag = H(e, x);

      float z = D(ag, a);
      if (z < af) {
        af = z;
        ae = w;
        i[r] = ag;
      }
    }
  }

  int ah = o[b->m_faceOffset + ae].m_numIndices;
  for (int ac = 0; ac < ah; ac++) {
    const float4 ai = n[b->m_vertexOffset + p[o[b->m_faceOffset + ae].m_indexOffset + ac]];
    h[r * k + ac] = K(&ai, &d, &e);
  }

  q[r].x = ae;
  q[r].y = u;
  q[r].z = ah;
  q[r].w = t;

  return s;
}

int AF(__global float4* a, __global float4* b, __global float4* c, __global float4* d, int e, const float f, float g, __global int4* h, int i) {
  int j = 0;

  int k = h[i].x;
  int l = h[i].y;
  int m = h[i].z;
  int n = h[i].w;

  int o = 0;

  if (k < 0)
    return j;

  __global float4* p = &c[i * e];
  __global float4* q = &d[i * e];

  for (int r = 0; r < m; r++) {
    const float4 s = a[i * e + r];
    const float4 t = a[i * e + ((r + 1) % m)];
    const float4 u = s - t;
    float4 v = b[i];
    float4 w = -C(u, v);
    float4 x = s;
    float y = -D(x, w);
    float4 z = w;
    float aa = y;
    o = N(p, n, z, aa, q);
    __global float4* ab = q;
    q = p;
    p = ab;
    n = o;
    o = 0;
  }
  float4 z = b[i];
  float aa = -D(z, a[i * e]);

  for (int ac = 0; ac < n; ac++) {
    float ad = D(z, p[ac]) + aa;
    if (ad <= f) {
      ad = f;
    }

    if (ad <= g) {
      float4 ae = p[ac];
            q[jadae
    }
  }

  h[i].w = j;

  return j;
}

__kernel void AG(__global const int2* a, __global const BodyData* b, __global const btCollidableGpu* c, __global const ConvexPolyhedronCL* d, __global const float4* e, __global const float4* f, __global const btGpuFace* g, __global const int* h, __global const float4* i, __global const int* j, __global int4* k, __global float4* l, __global float4* m, __global float4* n, int o, int p) {
  int q = get_global_id(0);
  int r = q;

  float s = -1e30f;
  float t = 0.02f;

  if (q < p) {
    if (j[q]) {
      int u = a[q].x;
      int v = a[q].y;

      int w = b[u].m_collidableIdx;
      int x = b[v].m_collidableIdx;

      int y = c[w].m_shapeIndex;
      int z = c[x].m_shapeIndex;

      int aa = AE(i[q], &d[y], &d[z], b[u].m_pos, b[u].m_quat, b[v].m_pos, b[v].m_quat, l, m, n, o, s, t, e, g, h, k, q);
    }
  }
}

__kernel void AH(__global const int2* a, __global const BodyData* b, __global const float4* c, __global const int* d, __global Contact4* e, __global int4* f, __global float4* g, __global float4* h, __global float4* i, __global float4* j, volatile __global int* k, int l, int m, int n) {
  int o = get_global_id(0);
  int p = o;

  float q = -1e30f;
  float r = 0.02f;

  if (o < m) {
    if (d[o]) {
      int s = a[o].x;
      int t = a[o].y;

      int u = 0;

      int v = l;

      __global float4* w = &i[p * v];
      __global float4* x = &j[p * v];

      {
        __global int4* y = f;

        int z = y[p].x;
        int aa = y[p].y;
        int ab = y[p].z;
        int ac = y[p].w;

        int ad = 0;

        if (z >= 0) {
          for (int ae = 0; ae < ab; ae++) {
            const float4 af = g[p * v + ae];
            const float4 ag = g[p * v + ((ae + 1) % ab)];
            const float4 ah = af - ag;
            float4 ai = h[p];
            float4 aj = -C(ah, ai);
            float4 ak = af;
            float al = -D(ak, aj);
            float4 am = aj;
            float an = al;
            ad = N(w, ac, am, an, x);
            __global float4* ao = x;
            x = w;
            w = ao;
            ac = ad;
            ad = 0;
          }

          float4 am = h[p];
          float an = -D(am, g[p * v]);

          for (int o = 0; o < ac; o++) {
            float ap = D(am, w[o]) + an;
            if (ap <= q) {
              ap = q;
            }

            if (ap <= r) {
              float4 aq = w[o];
                            x[uapaq
            }
          }
        }
        y[p].w = u;
      }

      for (int o = 0; o < u; o++)
        w[o] = x[o];
    }
  }
}

__kernel void AI(__global const int2* a, __global const BodyData* b, __global const float4* c, __global const int* d, __global Contact4* e, __global int4* f, __global float4* g, volatile __global int* h, int i, int j) {
  int k = get_global_id(0);
  int l = k;

  int4 m;
  m = (int4)(0, 1, 2, 3);

  if (k < j) {
    if (d[k]) {
      int n = f[l].w;

      if (n > 0) {
        __global float4* o = &g[l * i];
        float4 p = -c[k];

        int q = T(o, n, p, &m);

        int r;
        r = atomic_add(h, 1);

        if (r < j) {
          __global Contact4* s = &e[r];
          s->m_worldNormal = p;
          s->m_coeffs = (u32)(0.f * 0xffff) | ((u32)(0.7f * 0xffff) << 16);
          s->m_batchIdx = l;
          int t = a[l].x;
          int u = a[l].y;
          s->m_bodyAPtrAndSignBit = b[t].m_invMass == 0 ? -t : t;
          s->m_bodyBPtrAndSignBit = b[u].m_invMass == 0 ? -u : u;

          switch (q) {
            case 4:
              s->m_worldPos[3] = o[m.w];
            case 3:
              s->m_worldPos[2] = o[m.z];
            case 2:
              s->m_worldPos[1] = o[m.y];
            case 1:
              s->m_worldPos[0] = o[m.x];
            default: {}
          };

          (*s).m_worldNormal.w = q;
        }
      }
    }
  }
}