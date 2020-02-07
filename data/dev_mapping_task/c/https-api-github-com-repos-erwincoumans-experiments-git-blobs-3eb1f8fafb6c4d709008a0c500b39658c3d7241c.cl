typedef unsigned int u32; typedef struct {
  int m_numChildShapes;
  int blaat2;
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
  union {
    float4 m_min;
    float m_minElems[4];
    int m_minIndices[4];
  };
  union {
    float4 m_max;
    float m_maxElems[4];
    int m_maxIndices[4];
  };
} btAabbCL;

typedef struct {
  float4 m_plane;
  int m_indexOffset;
  int m_numIndices;
} btGpuFace;

__inline float4 A(float4 a, float4 b) {
  return cross(a, b);
}

__inline float B(float4 a, float4 b) {
  float4 c = (float4)(a.xyz, 0.f);
  float4 d = (float4)(b.xyz, 0.f);
  return dot(c, d);
}

__inline float4 C(float4 a) {
  a = (float4)(a.xyz, 0.f);
  return fast_normalize(a);
}

typedef float4 Quaternion;

__inline Quaternion D(Quaternion a, Quaternion b);

__inline Quaternion E(Quaternion a);

__inline float4 F(Quaternion a, float4 b);

__inline Quaternion G(Quaternion a);

__inline Quaternion D(Quaternion a, Quaternion b) {
  Quaternion c;
  c = A(a, b);
  c += a.w * b + b.w * a;

  c.w = a.w * b.w - B(a, b);
  return c;
}

__inline Quaternion E(Quaternion a) {
  return C(a);
}
__inline float4 F(Quaternion a, float4 b) {
  Quaternion c = G(a);
  float4 d = b;
  d.w = 0.f;
  float4 e = D(D(a, d), c);
  return e;
}

__inline Quaternion G(Quaternion a) {
  return (Quaternion)(-a.xyz, a.w);
}

__inline float4 H(const Quaternion a, float4 b) {
  return F(G(a), b);
}

__inline float4 I(const float4* a, const float4* b, const Quaternion* c) {
  return F(*c, *a) + (*b);
}

__inline float4 J(const float4 a) {
  float4 b = (float4)(a.x, a.y, a.z, 0.f);
  return C(b);
}

inline void K(const ConvexPolyhedronCL* a, const float4 b, const float4 c, const float4* d, const float4* e, float* f, float* g) {
  f[0] = 0x1.fffffep127f;
  g[0] = -0x1.fffffep127f;
  int h = a->m_numVertices;

  const float4 i = H(c, *d);
  float j = dot(b, *d);
  for (int k = 0; k < h; k++) {
    float l = dot(e[a->m_vertexOffset + k], i);
    if (l < f[0])
      f[0] = l;
    if (l > g[0])
      g[0] = l;
  }
  if (f[0] > g[0]) {
    float m = f[0];
    f[0] = g[0];
    g[0] = m;
  }
  f[0] += j;
  g[0] += j;
}

inline void L(__global const ConvexPolyhedronCL* a, const float4 b, const float4 c, const float4* d, __global const float4* e, float* f, float* g) {
  f[0] = 0x1.fffffep127f;
  g[0] = -0x1.fffffep127f;
  int h = a->m_numVertices;

  const float4 i = H(c, *d);
  float j = dot(b, *d);
  for (int k = 0; k < h; k++) {
    float l = dot(e[a->m_vertexOffset + k], i);
    if (l < f[0])
      f[0] = l;
    if (l > g[0])
      g[0] = l;
  }
  if (f[0] > g[0]) {
    float m = f[0];
    f[0] = g[0];
    g[0] = m;
  }
  f[0] += j;
  g[0] += j;
}

inline bool M(const ConvexPolyhedronCL* a, __global const ConvexPolyhedronCL* b, const float4 c, const float4 d, const float4 e, const float4 f, float4* g, const float4* h, __global const float4* i, float* j) {
  float k, l;
  float m, n;
  K(a, c, d, g, h, &k, &l);
  L(b, e, f, g, i, &m, &n);

  if (l < m || n < k)
    return false;

  float o = l - m;
  float p = n - k;
  *j = o < p ? o : p;
  return true;
}

inline bool N(const float4 a) {
  if (__clc_fabs(a.x) > 1e-6f || __clc_fabs(a.y) > 1e-6f || __clc_fabs(a.z) > 1e-6f)
    return false;
  return true;
}

bool O(const ConvexPolyhedronCL* a, __global const ConvexPolyhedronCL* b, const float4 c, const float4 d, const float4 e, const float4 f, const float4 g,

       const float4* h, const float4* i, const btGpuFace* j, const int* k,

       __global const float4* l, __global const float4* m, __global const btGpuFace* n, __global const int* o, float4* p, float* q) {
  int r = get_global_id(0);

  float4 s = c;
  s.w = 0.f;
  float4 t = e;
  t.w = 0.f;
  int u = 0;
  {
    int v = a->m_numFaces;

    for (int r = 0; r < v; r++) {
      const float4 w = j[a->m_faceOffset + r].m_plane;
      float4 x = F(d, w);
      if (B(g, x) < 0)
        x *= -1.f;
      u++;
      float y;
      if (!M(a, b, s, d, t, f, &x, h, l, &y))
        return false;
      if (y < *q) {
        *q = y;
        *p = x;
      }
    }
  }
  if ((B(-g, *p)) > 0.0f) {
    *p = -(*p);
  }
  return true;
}

bool P(__global const ConvexPolyhedronCL* a, const ConvexPolyhedronCL* b, const float4 c, const float4 d, const float4 e, const float4 f, const float4 g, __global const float4* h, __global const float4* i, __global const btGpuFace* j, __global const int* k, const float4* l, const float4* m, const btGpuFace* n, const int* o, float4* p, float* q) {
  int r = get_global_id(0);

  float4 s = c;
  s.w = 0.f;
  float4 t = e;
  t.w = 0.f;
  int u = 0;
  {
    int v = a->m_numFaces;

    for (int r = 0; r < v; r++) {
      const float4 w = j[a->m_faceOffset + r].m_plane;
      float4 x = F(d, w);
      if (B(g, x) < 0)
        x *= -1.f;
      u++;
      float y;
      if (!M(b, a, t, f, s, d, &x, l, h, &y))
        return false;
      if (y < *q) {
        *q = y;
        *p = x;
      }
    }
  }
  if ((B(-g, *p)) > 0.0f) {
    *p = -(*p);
  }
  return true;
}

bool Q(const ConvexPolyhedronCL* a, __global const ConvexPolyhedronCL* b, const float4 c, const float4 d, const float4 e, const float4 f, const float4 g, const float4* h, const float4* i, const btGpuFace* j, const int* k, __global const float4* l, __global const float4* m, __global const btGpuFace* n, __global const int* o, float4* p, float* q) {
  int r = get_global_id(0);

  float4 s = c;
  s.w = 0.f;
  float4 t = e;
  t.w = 0.f;

  int u = 0;

  int v = 0;

  for (int w = 0; w < a->m_numUniqueEdges; w++) {
    const float4 x = i[a->m_uniqueEdgesOffset + w];
    float4 y = F(d, x);

    for (int z = 0; z < b->m_numUniqueEdges; z++) {
      const float4 aa = m[b->m_uniqueEdgesOffset + z];
      float4 ab = F(f, aa);

      float4 ac = A(y, ab);

      v++;
      if (!N(ac)) {
        ac = J(ac);
        if (B(g, ac) < 0)
          ac *= -1.f;

        float ad;
        bool ae = true;
        {
          float af, ag;
          float ah, ai;
          K(a, s, d, &ac, h, &af, &ag);
          L(b, t, f, &ac, l, &ah, &ai);

          if (ag < ah || ai < af)
            ae = false;

          float aj = ag - ah;
          float ak = ai - af;
          ad = aj < ak ? aj : ak;
          ae = true;
        }

        if (ad < *q) {
          *q = ad;
          *p = ac;
        }
      }
    }
  }

  if ((B(-g, *p)) > 0.0f) {
    *p = -(*p);
  }
  return true;
}

inline bool R(__global const ConvexPolyhedronCL* a, __global const ConvexPolyhedronCL* b, const float4 c, const float4 d, const float4 e, const float4 f, float4* g, __global const float4* h, float* i) {
  float j, k;
  float l, m;
  L(a, c, d, g, h, &j, &k);
  L(b, e, f, g, h, &l, &m);

  if (k < l || m < j)
    return false;

  float n = k - l;
  float o = m - j;
  *i = n < o ? n : o;
  return true;
}

bool S(__global const ConvexPolyhedronCL* a, __global const ConvexPolyhedronCL* b, const float4 c, const float4 d, const float4 e, const float4 f, const float4 g, __global const float4* h, __global const float4* i, __global const btGpuFace* j, __global const int* k, float4* l, float* m) {
  int n = get_global_id(0);

  float4 o = c;
  o.w = 0.f;
  float4 p = e;
  p.w = 0.f;

  int q = 0;

  {
    int r = a->m_numFaces;

    for (int n = 0; n < r; n++) {
      const float4 s = j[a->m_faceOffset + n].m_plane;
      float4 t = F(d, s);

      if (B(g, t) < 0)
        t *= -1.f;

      q++;

      float u;
      if (!R(a, b, o, d, p, f, &t, h, &u))
        return false;

      if (u < *m) {
        *m = u;
        *l = t;
      }
    }
  }

  if ((B(-g, *l)) > 0.0f) {
    *l = -(*l);
  }

  return true;
}

bool T(__global const ConvexPolyhedronCL* a, __global const ConvexPolyhedronCL* b, const float4 c, const float4 d, const float4 e, const float4 f, const float4 g, __global const float4* h, __global const float4* i, __global const btGpuFace* j, __global const int* k, float4* l, float* m) {
  int n = get_global_id(0);

  float4 o = c;
  o.w = 0.f;
  float4 p = e;
  p.w = 0.f;

  int q = 0;

  int r = 0;

  for (int s = 0; s < a->m_numUniqueEdges; s++) {
    const float4 t = i[a->m_uniqueEdgesOffset + s];
    float4 u = F(d, t);

    for (int v = 0; v < b->m_numUniqueEdges; v++) {
      const float4 w = i[b->m_uniqueEdgesOffset + v];
      float4 x = F(f, w);

      float4 y = A(u, x);

      r++;
      if (!N(y)) {
        y = J(y);
        if (B(g, y) < 0)
          y *= -1.f;

        float z;
        bool aa = true;
        {
          float ab, ac;
          float ad, ae;
          L(a, o, d, &y, h, &ab, &ac);
          L(b, p, f, &y, h, &ad, &ae);

          if (ac < ad || ae < ab)
            aa = false;

          float af = ac - ad;
          float ag = ae - ab;
          z = af < ag ? af : ag;
          aa = true;
        }

        if (z < *m) {
          *m = z;
          *l = y;
        }
      }
    }
  }

  if ((B(-g, *l)) > 0.0f) {
    *l = -(*l);
  }
  return true;
}

__kernel void U(__global const int4* a, __global const BodyData* b, __global const btCollidableGpu* c, __global const ConvexPolyhedronCL* d, __global const float4* e, __global const float4* f, __global const btGpuFace* g, __global const int* h, __global btAabbCL* i, __global const btGpuChildShape* j, __global volatile float4* k, __global volatile int* l, int m) {
  int n = get_global_id(0);
  if (n < m) {
    int o = a[n].x;
    int p = a[n].y;

    int q = a[n].z;
    int r = a[n].w;

    int s = -1;
    int t = -1;

    float4 u = b[o].m_quat;
    float4 v = b[o].m_pos;

    float4 w = b[p].m_quat;
    float4 x = b[p].m_pos;

    if (q >= 0) {
      s = j[q].m_shapeIndex;
      float4 y = j[q].m_childPosition;
      float4 z = j[q].m_childOrientation;
      float4 aa = F(u, y) + v;
      float4 ab = D(u, z);
      v = aa;
      u = ab;
    } else {
      s = b[o].m_collidableIdx;
    }

    if (r >= 0) {
      t = j[r].m_shapeIndex;
      float4 ac = j[r].m_childPosition;
      float4 ad = j[r].m_childOrientation;
      float4 ae = I(&ac, &x, &w);
      float4 af = D(w, ad);
      x = ae;
      w = af;
    } else {
      t = b[p].m_collidableIdx;
    }

    l[n] = 0;

    int ag = c[s].m_shapeIndex;
    int ah = c[t].m_shapeIndex;

    int ai = 5;

    int aj = d[ag].m_numFaces;
    float ak = 0x1.fffffep127f;
    v.w = 0.f;
    x.w = 0.f;
    float4 al = d[ag].m_localCenter;
    float4 am = I(&al, &v, &u);
    float4 an = d[ah].m_localCenter;
    float4 ao = I(&an, &x, &w);
    const float4 ap = am - ao;
    float4 aq = (float4)(1, 0, 0, 0);
    bool ar = S(&d[ag], &d[ah], v, u, x, w, ap, e, f, g, h, &aq, &ak);
    ai = 4;
    if (!ar) {
      ai = 0;
    } else {
      bool as = S(&d[ah], &d[ag], x, w, v, u, ap, e, f, g, h, &aq, &ak);

      if (!as) {
        ai = 0;
      } else {
        bool at = T(&d[ag], &d[ah], v, u, x, w, ap, e, f, g, h, &aq, &ak);
        if (at) {
          k[n] = aq;
          l[n] = 1;
        }
      }
    }
  }
}

__kernel void V(__global const int2* a, __global const BodyData* b, __global const btCollidableGpu* c, __global const ConvexPolyhedronCL* d, __global const float4* e, __global const float4* f, __global const btGpuFace* g, __global const int* h, __global btAabbCL* i, __global const btGpuChildShape* j, __global volatile int4* k, __global volatile int* l, int m, int n) {
  int o = get_global_id(0);

  if (o < m) {
    int p = a[o].x;
    int q = a[o].y;

    int r = b[p].m_collidableIdx;
    int s = b[q].m_collidableIdx;

    int t = c[r].m_shapeIndex;
    int u = c[s].m_shapeIndex;

    if ((b[p].m_invMass == 0) && (b[q].m_invMass == 0)) {
      return;
    }

    if ((c[r].m_shapeType == 6) || (c[s].m_shapeType == 6)) {
      if (c[r].m_shapeType == 6) {
        int v = c[r].m_numChildShapes;
        for (int w = 0; w < v; w++) {
          int x = c[r].m_shapeIndex + w;
          int y = j[x].m_shapeIndex;

          float4 z = b[p].m_pos;
          float4 aa = b[p].m_quat;
          float4 ab = j[x].m_childPosition;
          float4 ac = j[x].m_childOrientation;
          float4 ad = F(aa, ab) + z;
          float4 ae = D(aa, ac);

          int t = c[y].m_shapeIndex;

          if (c[s].m_shapeType == 6) {
            int af = c[s].m_numChildShapes;
            for (int ag = 0; ag < af; ag++) {
              int ah = c[s].m_shapeIndex + ag;
              int ai = j[ah].m_shapeIndex;
              float4 aj = b[q].m_quat;
              float4 ak = b[q].m_pos;
              float4 al = j[ah].m_childPosition;
              float4 am = j[ah].m_childOrientation;
              float4 an = I(&al, &ak, &aj);
              float4 ao = D(aj, am);

              int u = c[ai].m_shapeIndex;

              if (1) {
                int ap = d[t].m_numFaces;
                float aq = 0x1.fffffep127f;
                float4 z = ad;
                z.w = 0.f;
                float4 ak = an;
                ak.w = 0.f;
                float4 ar = d[t].m_localCenter;
                float4 aa = ae;
                float4 as = I(&ar, &z, &aa);
                float4 at = d[u].m_localCenter;
                float4 aj = ao;
                float4 au = I(&at, &ak, &aj);
                const float4 av = as - au;

                {
                  int aw = atomic_add(l, 1);
                  if (aw < n)
                    ah
                }
              }
            }
          } else {
            if (1) {
              int ap = d[t].m_numFaces;
              float aq = 0x1.fffffep127f;
              float4 z = ad;
              z.w = 0.f;
              float4 ak = b[q].m_pos;
              ak.w = 0.f;
              float4 ar = d[t].m_localCenter;
              float4 aa = ae;
              float4 as = I(&ar, &z, &aa);
              float4 at = d[u].m_localCenter;
              float4 aj = b[q].m_quat;
              float4 au = I(&at, &ak, &aj);
              const float4 av = as - au;

              {
                int aw = atomic_add(l, 1);
                if (aw < n) {
                  kx
                }
              }
            }
          }
          return;
        }
        if (c[s].m_shapeType == 6) {
          int af = c[s].m_numChildShapes;
          for (int ag = 0; ag < af; ag++) {
            int ah = c[s].m_shapeIndex + ag;
            int ai = j[ah].m_shapeIndex;
            float4 aj = b[q].m_quat;
            float4 ak = b[q].m_pos;
            float4 al = j[ah].m_childPosition;
            float4 am = j[ah].m_childOrientation;
            float4 an = F(aj, al) + ak;
            float4 ao = D(aj, am);

            int u = c[ai].m_shapeIndex;

            if (1) {
              int ap = d[t].m_numFaces;
              float aq = 0x1.fffffep127f;
              float4 z = b[p].m_pos;
              z.w = 0.f;
              float4 ak = an;
              ak.w = 0.f;
              float4 ar = d[t].m_localCenter;
              float4 aa = b[p].m_quat;
              float4 as = I(&ar, &z, &aa);
              float4 at = d[u].m_localCenter;
              float4 aj = ao;
              float4 au = I(&at, &ak, &aj);
              const float4 av = as - au;
              {
                int aw = atomic_add(l, 1);
                if (aw < n) {
        k[awah
                }
              }
            }
            return;
          }
          return;
        }
      }
    }

    __kernel void W(__global const int2* a, __global const BodyData* b, __global const btCollidableGpu* c, __global const ConvexPolyhedronCL* d, __global const float4* e, __global const float4* f, __global const btGpuFace* g, __global const int* h, __global btAabbCL* i, __global volatile float4* j, __global volatile int* k, __global int4* l, __global float4* m, __global volatile int* n, int o, int p) {
      int q = get_global_id(0);

      if (q < o) {
        int r = a[q].x;
        int s = a[q].y;

        int t = b[r].m_collidableIdx;
        int u = b[s].m_collidableIdx;

        int v = c[t].m_shapeIndex;
        int w = c[u].m_shapeIndex;

        if ((b[r].m_invMass == 0) && (b[s].m_invMass == 0)) {
          k[q] = 0;
          return;
        }

        if ((c[t].m_shapeType == 5)) {
          int x = d[v].m_numFaces;
          int y = 0;

          for (int z = 0; z < x; z++) {
            bool aa = false;

            ConvexPolyhedronCL ab;

            ab.m_numVertices = 3;
            ab.m_vertexOffset = 0;
            float4 ac = (float4)(0.f, 0.f, 0.f, 0.f);

            btGpuFace ad = g[d[v].m_faceOffset + z];
            float4 ae, af;
            btAabbCL ag;
            ag.m_min = (float4)(1e30f, 1e30f, 1e30f, 0.f);
            ag.m_max = (float4)(-1e30f, -1e30f, -1e30f, 0.f);

            float4 ah[3];
            for (int q = 0; q < 3; q++) {
              int ai = h[ad.m_indexOffset + q];
              float4 aj = e[d[v].m_vertexOffset + ai];
              ah[q] = aj;
              ac += aj;
              ag.m_min = min(ag.m_min, aj);
              ag.m_max = max(ag.m_max, aj);
            }

            aa = true;
            aa = (ag.m_min.x > i[s].m_max.x || ag.m_max.x < i[s].m_min.x) ? false : aa;
            aa = (ag.m_min.z > i[s].m_max.z || ag.m_max.z < i[s].m_min.z) ? false : aa;
            aa = (ag.m_min.y > i[s].m_max.y || ag.m_max.y < i[s].m_min.y) ? false : aa;

            if (aa) {
              float ak = 0x1.fffffep127f;
              int k = 5;
              float4 al = (float4)(1, 2, 3, 4);

              int am = 0;
              y++;

              ab.m_numUniqueEdges = 3;
              ab.m_uniqueEdgesOffset = 0;
              float4 an[3];

              an[0] = (ah[1] - ah[0]);
              an[1] = (ah[2] - ah[1]);
              an[2] = (ah[0] - ah[2]);

              ab.m_faceOffset = 0;

              float4 ao = (float4)(ad_plane.x, ad_plane.y, ad_plane.z, 0.f);

              btGpuFace ap[5];
              int aq[3 + 3 + 2 + 2 + 2];
              int ar = 0;
              int as = 0;

              {
                ap[as].m_indexOffset = ar;
                aq[0] = 0;
                aq[1] = 1;
                aq[2] = 2;
                ar += 3;
                float at = ad.m_plane.w;
                ap[as].m_plane.x = ao.x;
                ap[as].m_plane.y = ao.y;
                ap[as].m_plane.z = ao.z;
                ap[as].m_plane.w = at;
                ap[as].m_numIndices = 3;
              }
              as++;

              {
                ap[as].m_indexOffset = ar;
                aq[3] = 2;
                aq[4] = 1;
                aq[5] = 0;
                ar += 3;
                float at = dot(ao, ah[0]);
                float au = -ad.m_plane.w;
                ap[as].m_plane.x = -ao.x;
                ap[as].m_plane.y = -ao.y;
                ap[as].m_plane.z = -ao.z;
                ap[as].m_plane.w = at;
                ap[as].m_numIndices = 3;
              }
              as++;

              bool av = true;
              if (av) {
                int aw = 3;
                int ax = aw - 1;
                for (int q = 0; q < aw; q++) {
                  float4 ay = ah[q];
                  float4 az = ah[ax];

                  float4 ba = normalize(cross(ao, az - ay));
                  float at = -dot(ba, ay);

                  ap[as].m_numIndices = 2;
                  ap[as].m_indexOffset = ar;
                  aq[ar++] = q;
                  aq[ar++] = ax;

                  ap[as].m_plane.x = ba.x;
                  ap[as].m_plane.y = ba.y;
                  ap[as].m_plane.z = ba.z;
                  ap[as].m_plane.w = at;
                  as++;
                  ax = q;
                }
              }
              ab.m_numFaces = 5;
              ab.m_localCenter = ac * (1.f / 3.f);

              float4 bb = b[r].m_pos;
              bb.w = 0.f;
              float4 bc = b[s].m_pos;
              bc.w = 0.f;
              float4 bd = ab.m_localCenter;
              float4 be = b[r].m_quat;
              float4 bf = I(&bd, &bb, &be);
              float4 bg = d[w].m_localCenter;
              float4 bh = b[s].m_quat;
              float4 au = I(&bg, &bc, &bh);
              const float4 bi = bf - au;

              bool bj = O(&ab, &d[w], b[r].m_pos, b[r].m_quat, b[s].m_pos, b[s].m_quat, bi, ah, an, ap, aq, e, f, g, h, &al, &ak);
              k = 4;
              if (!bj) {
                k = 0;
              } else {
                bool bk = P(&d[w], &ab, b[s].m_pos, b[s].m_quat, b[r].m_pos, b[r].m_quat, bi, e, f, g, h, ah, an, ap, aq, &al, &ak);

                if (!bk) {
                  k = 0;
                } else {
                  bool bl = Q(&ab, &d[w], b[r].m_pos, b[r].m_quat, b[s].m_pos, b[s].m_quat, bi, ah, an, ap, aq, e, f, g, h, &al, &ak);

                  if (!bl) {
                    k = 0;
                  } else {
                    k = 1;
                  }
                }
              }

              if (k) {
                int bm = atomic_add(n, 1);
                if (bm < p) {
                  l[bm].x = r;
                  l[bm].y = s;
                  l[bm].z = z;
                  l[bm].w = 3;
                  al.w = ak;
                  m[bm] = al;
                }
              }
            }
          }

          k[q] = 0;
          return;
        }

        if ((c[t].m_shapeType != 3) || (c[u].m_shapeType != 3)) {
          k[q] = 0;
          return;
        }

        int x = d[v].m_numFaces;

        float ak = 0x1.fffffep127f;

        float4 bb = b[r].m_pos;
        bb.w = 0.f;
        float4 bc = b[s].m_pos;
        bc.w = 0.f;
        float4 bd = d[v].m_localCenter;
        float4 be = b[r].m_quat;
        float4 bf = I(&bd, &bb, &be);
        float4 bg = d[w].m_localCenter;
        float4 bh = b[s].m_quat;
        float4 au = I(&bg, &bc, &bh);
        const float4 bi = bf - au;
        float4 bn;

        bool bj = S(&d[v], &d[w], bb, be, bc, bh, bi, e, f, g, h, &bn, &ak);
        k[q] = 4;
        if (!bj) {
          k[q] = 0;
        } else {
          bool bk = S(&d[w], &d[v], bc, bh, bb, be, bi, e, f, g, h, &bn, &ak);

          if (!bk) {
            k[q] = 0;
          } else {
            bool bl = T(&d[v], &d[w], bb, be, bc, bh, bi, e, f, g, h, &bn, &ak);
            if (!bl) {
              k[q] = 0;
            } else {
              k[q] = 1;
              j[q] = bn;
            }
          }
        }
      }
    }