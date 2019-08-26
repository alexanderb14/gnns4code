typedef struct { float4 row[4]; } sqmat4;

typedef struct {
  int node;
  sqmat4 tr;
  sqmat4 trInv;
} BVHRoot;

typedef struct {
  float3 ori;
  float3 dir;
  float3 invDir;
  float tMin;
  float tMax;
} Ray;

typedef struct {
  Ray ray;
  int pixel;
  float contribution;
} Sample;

typedef struct {
  float3 position;
  float3 normal;
  float4 tangent;
  float3 bitangent;
  float2 texCoord;
} Vertex;

typedef unsigned int tri_id;

typedef struct {
  float3 hi;
  float3 lo;
} BBox;

typedef struct {
  BBox bbox;
  union {
    unsigned int l_child;
    unsigned int start_index;
  };
  union {
    unsigned int r_child;
    unsigned int end_index;
  };
  unsigned int parent;
  char split_axis;
  char leaf;

} BVHNode;

typedef struct {
  bool hit;
  bool shadow_hit;
  bool inverse_n;
  bool reserved;
  float t;
  int id;
  float2 uv;
  float3 n;
  float3 hit_point;

} SampleTraceInfo;

typedef struct {
  int id;
  float t;
  float u;
  float v;
} RayHit;

float3 __attribute__((always_inline)) A(float3 a, sqmat4 b) {
  float4 c = (float4)(a, 0.f);
  float4 d;

  d.x = dot(b.row[0], c);
  d.y = dot(b.row[1], c);
  d.z = dot(b.row[2], c);
  d.w = dot(b.row[3], c);

  if (__clc_fabs(d.w) > 1e-26f)
    d = d / d.w;
  return d.xyz;
}

float3 __attribute__((always_inline)) B(float3 a, sqmat4 b) {
  float4 c = (float4)(a, 1.f);
  float4 d;

  d.x = dot(b.row[0], c);
  d.y = dot(b.row[1], c);
  d.z = dot(b.row[2], c);
  d.w = dot(b.row[3], c);

  if (__clc_fabs(d.w) > 1e-26f)
    d = d / d.w;
  return d.xyz;
}

Ray C(Ray a, sqmat4 b) {
  a.dir = A(a.dir, b);
  a.ori = B(a.ori, b);
  a.invDir = 1.f / a.dir;
  return a;
}

void __attribute__((always_inline)) D(const Ray a, const Ray b, RayHit* c, const sqmat4 d) {
  if (c->id >= 0) {
    float3 e = b.ori + b.dir * c->t;
    e = B(e, d);
    c->t = distance(e, a.ori);
  }
}

void __attribute__((always_inline)) E(const Ray a, const sqmat4 b, const RayHit c, global SampleTraceInfo* d, global Vertex* e, global int* f) {
  int g = get_global_id(0);
  d += g;

  SampleTraceInfo h;
  h.hit = true;
  h.t = c.t;
  h.id = c.id;
  h.hit_point = a.ori + a.dir * c.t;

  int i = 3 * c.id;

  global Vertex* j = &e[f[i]];
  global Vertex* k = &e[f[i + 1]];
  global Vertex* l = &e[f[i + 2]];

  float m = c.u;
  float n = c.v;
  float o = 1.f - (m + n);

  float3 p = normalize(j->normal);
  float3 q = normalize(k->normal);
  float3 r = normalize(l->normal);

  float2 s = j->texCoord;
  float2 t = k->texCoord;
  float2 u = l->texCoord;

  float3 v = normalize(o * p + n * r + m * q);

  h.n = A(v, b);

  if (dot(h.n, a.dir) > 0) {
    h.inverse_n = true;
    h.n *= -1.f;
  } else {
    h.inverse_n = false;
  }

  h.uv = o * s + n * u + m * t;
  *d = h;
}

void __attribute__((always_inline)) F(const Ray a, const RayHit b, global SampleTraceInfo* c, global Vertex* d, global int* e) {
  int f = get_global_id(0);
  c += f;

  if (b.id < 0) {
    c->hit = false;
    return;
  }

  SampleTraceInfo g;

  g.hit = true;
  g.t = b.t;
  g.id = b.id;
  g.hit_point = a.ori + a.dir * b.t;

  int h = 3 * b.id;

  global Vertex* i = &d[e[h]];
  global Vertex* j = &d[e[h + 1]];
  global Vertex* k = &d[e[h + 2]];

  float l = b.u;
  float m = b.v;
  float n = 1.f - (l + m);

  float3 o = normalize(i->normal);
  float3 p = normalize(j->normal);
  float3 q = normalize(k->normal);

  float2 r = i->texCoord;
  float2 s = j->texCoord;
  float2 t = k->texCoord;

  float3 u = normalize(n * o + m * q + l * p);

  if (dot(u, a.dir) > 0) {
    g.inverse_n = true;
    g.n = -u;
  } else {
    g.inverse_n = false;
    g.n = u;
  }

  g.uv = n * r + m * t + l * s;
  *c = g;
}

bool G(BBox a, Ray b) {
  float c = b.tMin;
  float d = b.tMax;

  float3 e, f;

  e = (a.lo - b.ori) * b.invDir;
  f = (a.hi - b.ori) * b.invDir;

  float3 g = fmax(e, f);
  float3 h = fmin(e, f);

  if (__clc_fabs(b.invDir.x) > 1e-6f) {
    c = fmax(c, h.x);
    d = fmin(d, g.x);
  }
  if (__clc_fabs(b.invDir.y) > 1e-6f) {
    c = fmax(c, h.y);
    d = fmin(d, g.y);
  }
  if (__clc_fabs(b.invDir.z) > 1e-6f) {
    c = fmax(c, h.z);
    d = fmin(d, g.z);
  }

  return c <= d;
}

void H(RayHit* a, BVHNode b, global Vertex* c, global int* d, Ray e) {
  for (int f = b.start_index; f < b.end_index; ++f) {
    int g = f;

    float3 h = e.ori.xyz;
    float3 i = e.dir.xyz;

    global Vertex* j = &c[d[3 * g]];
    global Vertex* k = &c[d[3 * g + 1]];
    global Vertex* l = &c[d[3 * g + 2]];

    float3 m = j->position;
    float3 n = k->position;
    float3 o = l->position;

    float3 p = n - m;
    float3 q = o - m;

    float3 r = cross(i, q);
    float s = dot(p, r);

    if (s > -1e-26f && s < 1e-26f)

      continue;

    float t = 1.f / s;
    float3 u = h - m;
    float v = t * dot(u, r);
    if (v < 0.f || v > 1.f)
      continue;

    float3 w = cross(u, p);
    float x = t * dot(i, w);
    if (x < 0.f || v + x > 1.f)
      continue;

    float y = t * dot(q, w);
    bool z = (y <= a->t && y >= e.tMin);

    if (z) {
      a->t = y;
      a->id = g;
      a->u = v;
      a->v = x;
    }
  }
}

RayHit I(Ray a, global Vertex* b, global int* c, global BVHNode* d, int e) {
  RayHit f;
  f.id = -1;
  f.t = a.tMax;

  unsigned int g[32];
  unsigned int h = 0;

  unsigned int i = e;

 private
  BVHNode j;

  unsigned int k, l;
  bool m = true;

  float3 n = a.dir;
  float3 o = __clc_fabs(n);
  float p = fmax(o.x, fmax(o.y, o.z)) - 0.00001f;
  o = fp while (true) {
    j = d[i];

    if (!G(j.bbox, a)) {
      if (h > 0 && h < 32) {
        h--;
        i = g[h];
        continue;
      } else {
        return f;
      }
    }

    if (j.leaf) {
      H(&f, j, b, c, a);

      if (f.id >= 0)
        a.tMax = f.t;

      if (h > 0 && h < 32) {
        h--;
        i = g[h];
        continue;
      } else {
        return f;
      }
    } else {
      float3 q = d[j.l_child].bbox.lo;
      float3 r = d[j.r_child].bbox.lo;
      float3 s = dot(n, r - q);
      if (o.x > 0.f) {
        m = s.x > 0.f;
      } else if (o.y > 0.f) {
        m = s.y > 0.f;
      } else {
        m = s.z > 0.f;
      }

      if (m) {
        k = j.l_child;
        l = j.r_child;
      } else {
        k = j.r_child;
        l = j.l_child;
      }
    }

    g[h] = l;
    h++;
    i = k;
  }
  return f;
}

kernel void J(global SampleTraceInfo* a, global Sample* b, global Vertex* c, global int* d, global BVHNode* e, global BVHRoot* f, int g) {
  int h = get_global_id(0);
  Ray i = b[h].ray;

  RayHit j;
  j.id = -1;
  int k = -1;

  for (int l = 0; l < g; ++l) {
    Ray m = C(i, f[l].trInv);
    RayHit n = I(m, c, d, e, f[l].node);

    D(i, m, &n, f[l].tr);

    if (n.id >= 0 && (j.id < 0 || n.t < j.t)) {
      j = n;
      k = l;
    }
  }

  if (j.id >= 0)
    E(i, f[k].tr, j, a, c, d);
  else

    a[h].hit = false;
}

kernel void K(global SampleTraceInfo* a, global Sample* b, global Vertex* c, global int* d, global BVHNode* e) {
  int f = get_global_id(0);
  Ray g = b[f].ray;
  RayHit h;

  h = I(g, c, d, e, 0);

  F(g, h, a, c, d);
}