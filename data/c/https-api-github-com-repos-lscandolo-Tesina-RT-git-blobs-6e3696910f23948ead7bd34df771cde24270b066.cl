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
} RayPlus;

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

} RayHitInfo;

float3 A(global Vertex* a, global int* b, int c, float2 d);
float2 B(global Vertex* a, global int* b, int c, float2 d);

float3 __attribute__((always_inline)) C(float3 a, sqmat4 b) {
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

float3 __attribute__((always_inline)) D(float3 a, sqmat4 b) {
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

Ray E(Ray a, sqmat4 b) {
  a.dir = C(a.dir, b);
  a.ori = D(a.ori, b);
  a.invDir = 1.f / a.dir;
  return a;
}

void __attribute__((always_inline)) F(Ray a, Ray b, RayHitInfo* c, sqmat4 d, global Vertex* e, global int* f) {
  if (c->hit) {
    c->hit_point = b.ori + b.dir * c->t;
    c->hit_point = D(c->hit_point, d);
    c->t = distance(c->hit_point, a.ori);
  }
}

void __attribute__((always_inline)) G(Ray a, sqmat4 b, RayHitInfo* c, global Vertex* d, global int* e) {
  c->n = A(d, e, c->id, c->uv);
  c->n = C(c->n, b);

  if (dot(c->n, a.dir) > 0) {
    c->inverse_n = true;
    c->n *= -1.f;
  }

  c->uv = B(d, e, c->id, c->uv);
}

void __attribute__((always_inline)) H(Ray a, RayHitInfo* b, global Vertex* c, global int* d) {
  b->hit_point = a.ori + a.dir * b->t;

  int e = 3 * b->id;

  global Vertex* f = &c[d[e]];
  global Vertex* g = &c[d[e + 1]];
  global Vertex* h = &c[d[e + 2]];

  float i = b->uv.s0;
  float j = b->uv.s1;
  float k = 1.f - (i + j);

  float3 l = normalize(f->normal);
  float3 m = normalize(g->normal);
  float3 n = normalize(h->normal);

  float2 o = f->texCoord;
  float2 p = g->texCoord;
  float2 q = h->texCoord;

  b->n = normalize(k * l + j * n + i * m);
  b->uv = k * o + j * q + i * p;

  if (dot(b->n, a.dir) > 0) {
    b->inverse_n = true;
    b->n *= -1.f;
  }
}

void __attribute__((always_inline)) I(RayHitInfo* a, RayHitInfo* b) {
  if (!a->hit || (b->hit && b->t < a->t)) {
    *a = *b;
  }
}

bool J(BBox a, Ray b) {
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

float3 A(global Vertex* a, global int* b, int c, float2 d) {
  global Vertex* e = &a[b[3 * c]];
  global Vertex* f = &a[b[3 * c + 1]];
  global Vertex* g = &a[b[3 * c + 2]];

  float3 h = normalize(e->normal);
  float3 i = normalize(f->normal);
  float3 j = normalize(g->normal);

  float k = d.s0;
  float l = d.s1;
  float m = 1.f - (k + l);

  return m * h + l * j + k * i;
}

float2 B(global Vertex* a, global int* b, int c, float2 d) {
  global Vertex* e = &a[b[3 * c]];
  global Vertex* f = &a[b[3 * c + 1]];
  global Vertex* g = &a[b[3 * c + 2]];

  float2 h = e->texCoord;
  float2 i = f->texCoord;
  float2 j = g->texCoord;

  float k = d.s0;
  float l = d.s1;
  float m = 1.f - (k + l);

  return m * h + l * j + k * i;
}
RayHitInfo K(BVHNode a, global Vertex* b, global int* c, Ray d) {
  RayHitInfo e;
  e.hit = false;
  e.t = d.tMax;

  for (int f = a.start_index; f < a.end_index; ++f) {
    int g = f;

    float3 h = d.ori.xyz;
    float3 i = d.dir.xyz;

    global Vertex* j = &b[c[3 * g]];
    global Vertex* k = &b[c[3 * g + 1]];
    global Vertex* l = &b[c[3 * g + 2]];

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
    bool z = (y <= e.t && y >= d.tMin);

    if (z) {
      e.t = y;
      e.hit = true;
      e.id = g;
      e.uv.s0 = v;
      e.uv.s1 = x;
    }
  }

  if (e.hit)
    d.tMax = e.t;

  return e;
}

RayHitInfo L(Ray a, global Vertex* b, global int* c, global BVHNode* d, int e) {
  RayHitInfo f;
  f.hit = false;
  f.shadow_hit = false;
  f.inverse_n = false;
  f.t = a.tMax;

  bool g = false;

  unsigned int h = e;
  unsigned int i = e;

  BVHNode j;

  unsigned int k, l;
  bool m = true;

  float3 n = a.dir;
  float3 o = __clc_fabs(n);
  float p = fmax(o.x, fmax(o.y, o.z)) - 0.00001f;
  o = fp while (true) {
    j = d[i];

    if (!j.leaf) {
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

    if (g) {
      if (h == e) {
        break;

      } else if (h == k) {
        h = i;
        i = l;
        g = false;

      } else {
        h = i;
        i = j.parent;
        g = true;
      }
    } else {
      if (J(j.bbox, a)) {
        if (j.leaf) {
          RayHitInfo t = K(j, b, c, a);
          I(&f, &t);
          if (f.hit)
            a.tMax = f.t;
          h = i;
          i = j.parent;
          g = true;

        } else {
          h = i;
          i = k;
          g = false;
        }

      } else {
        h = i;
        i = j.parent;
        g = true;
      }
    }
  }

  return f;
}

kernel void M(global RayHitInfo* a, global RayPlus* b, global Vertex* c, global int* d, global BVHNode* e, global BVHRoot* f, int g) {
  int h = get_global_id(0);
  Ray i = b[h].ray;

  RayHitInfo j;
  j.hit = false;
  int k = 0;

  for (int l = 0; l < g; ++l) {
    Ray m = E(i, f[l].trInv);
    RayHitInfo n = L(m, c, d, e, f[l].node);

    F(i, m, &n, f[l].tr, c, d);

    if (!j.hit || (n.hit && n.t < j.t)) {
      j = n;
      k = l;
    }
  }

  if (j.hit)
    G(i, f[k].tr, &j, c, d);

  a[h] = j;
}

kernel void N(global RayHitInfo* a, global RayPlus* b, global Vertex* c, global int* d, global BVHNode* e, global BVHRoot* f, int g) {
  int h = get_global_id(0);
  Ray i = b[h].ray;
  RayHitInfo j;

  j = L(i, c, d, e, 0);

  if (j.hit)
    H(i, &j, c, d);

  a[h] = j;
}