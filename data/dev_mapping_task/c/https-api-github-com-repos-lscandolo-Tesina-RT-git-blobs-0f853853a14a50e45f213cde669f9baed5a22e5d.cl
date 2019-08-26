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

typedef float3 Color;

typedef enum { SPOT_L = 0, DIR_L = 1 } light_type;

typedef struct {
  float3 dir;
  Color color;
} DirectionalLight;

typedef struct {
  float3 pos;
  float radius;
  float angle;
  float3 dir;
  Color color;
} SpotLight;

typedef struct {
  light_type type;
  union {
    DirectionalLight directional;
    SpotLight spot;
  };

} Light;

typedef struct {
  Color ambient;
  Light light;

} Lights;

float3 __attribute__((always_inline)) A(float3 a, sqmat4 b) {
  float4 c = (float4)(a, 0.f);
  float4 d;

  d.x = dot(b.row[0], c);
  d.y = dot(b.row[1], c);
  d.z = dot(b.row[2], c);
  d.w = dot(b.row[3], c);

  if (__clc_fabs(d.w) > 0.00001f)
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

  if (__clc_fabs(d.w) > 0.00001f)
    d = d / d.w;
  return d.xyz;
}

Ray C(Ray a, sqmat4 b) {
  a.dir = A(a.dir, b);
  a.ori = B(a.ori, b);
  a.invDir = 1.f / a.dir;
  return a;
}

SampleTraceInfo D(SampleTraceInfo a, sqmat4 b) {
  a.n = A(a.n, b);
  return a;
}

bool __attribute__((always_inline)) E(BBox a, Ray b) {
  float c = b.tMin;
  float d = b.tMax;

  float3 e, f;

  e = (a.lo - b.ori) * b.invDir;
  f = (a.hi - b.ori) * b.invDir;

  float3 g = max(e, f);
  float3 h = min(e, f);

  if (__clc_fabs(b.invDir.x) > 1e-6f) {
    c = max(c, h.x);
    d = min(d, g.x);
  }
  if (__clc_fabs(b.invDir.y) > 1e-6f) {
    c = max(c, h.y);
    d = min(d, g.y);
  }
  if (__clc_fabs(b.invDir.z) > 1e-6f) {
    c = max(c, h.z);
    d = min(d, g.z);
  }

  return (c <= d);
}

bool F(BVHNode a, global Vertex* b, global int* c, Ray d) {
  for (int e = a.start_index; e < a.end_index; ++e) {
    float3 f = d.ori.xyz;
    float3 g = d.dir.xyz;

    global Vertex* h = &b[c[3 * e]];
    global Vertex* i = &b[c[3 * e + 1]];
    global Vertex* j = &b[c[3 * e + 2]];

    float3 k = h->position;
    float3 l = i->position;
    float3 m = j->position;

    float3 n = l - k;
    float3 o = m - k;

    float3 p = cross(g, o);
    float q = dot(n, p);

    if (q > -1e-26f && q < 1e-26f)

      continue;

    float r = 1.f / q;
    float3 s = f - k;
    float t = r * dot(s, p);
    if (t < 0.f || t > 1.f)
      continue;

    float3 u = cross(s, n);
    float v = r * dot(g, u);
    if (v < 0.f || t + v > 1.f)
      continue;

    float w = r * dot(o, u);
    if (w < d.tMax && w > d.tMin)
      return true;
  }
  return false;
}

bool G(Ray a, global Vertex* b, global int* c, global BVHNode* d, int e) {
  unsigned int f[32];
  unsigned int g = 0;

  unsigned int h = e;

 private
  BVHNode i;

  unsigned int j, k;
  bool l = true;

  float3 m = a.dir;
  float3 n = __clc_fabs(m);
  float o = fmax(n.x, fmax(n.y, n.z)) - 0.00001f;
  n = fo while (true) {
    i = d[h];

    if (!E(i.bbox, a)) {
      if (g > 0 && g < 32) {
        g--;
        h = f[g];
        continue;
      } else {
        return false;
      }
    } else if (i.leaf) {
      if (F(i, b, c, a))
        return true;

      if (g > 0 && g < 32) {
        g--;
        h = f[g];
        continue;
      } else {
        return false;
      }
    } else {
      float3 p = d[i.l_child].bbox.lo;
      float3 q = d[i.r_child].bbox.lo;
      float3 r = dot(m, q - p);
      if (n.x > 0.f) {
        l = r.x > 0.f;
      } else if (n.y > 0.f) {
        l = r.y > 0.f;
      } else {
        l = r.z > 0.f;
      }

      if (l) {
        j = i.l_child;
        k = i.r_child;
      } else {
        j = i.r_child;
        k = i.l_child;
      }
    }

    f[g] = k;
    g++;
    h = j;
  }
  return false;
}

kernel void H(global SampleTraceInfo* a, global Sample* b, global Vertex* c, global int* d, global BVHNode* e, constant Lights* f, global BVHRoot* g, int h) {
  int i = get_global_id(0);

  Ray j = b[i].ray;

  SampleTraceInfo k = a[i];

  if (!k.hit) {
    return;
  }

  Ray l;
  l.ori = j.ori + j.dir * k.t;
  l.ori = k.hit_point;

  if (f->light.type == DIR_L) {
    l.dir = -f->light.directional.dir;
  } else if (f->light.type == SPOT_L) {
    l.dir = normalize(f->light.spot.pos - l.ori);
    if (dot(l.dir, f->light.spot.dir) < f->light.spot.angle) {
      a[i].shadow_hit = false;
      return;
    }

  } else {
    a[i].shadow_hit = false;
    return;
  }
  l.invDir = 1.f / l.dir;
  l.tMin = 0.01f;
  l.tMax = 1e37f;

  a[i].shadow_hit = false;
  for (int m = 0; m < h; ++m) {
    Ray n = C(l, g[m].trInv);
    bool o = G(n, c, d, e, g[m].node);

    if (o) {
      a[i].shadow_hit = true;
      return;
    }
  }
  return;
}

kernel void I(global SampleTraceInfo* a, global Sample* b, global Vertex* c, global int* d, global BVHNode* e, constant Lights* f) {
  int g = get_global_id(0);

  Ray h = b[g].ray;

  SampleTraceInfo i = a[g];

  if (!i.hit) {
    return;
  }

  Ray j;

  j.ori = i.hit_point;

  if (f->light.type == DIR_L) {
    j.dir = -f->light.directional.dir;
  } else if (f->light.type == SPOT_L) {
    j.dir = normalize(f->light.spot.pos - j.ori);
    if (dot(-j.dir, f->light.spot.dir) < f->light.spot.angle) {
      a[g].shadow_hit = true;
      return;
    }
  } else {
    a[g].shadow_hit = true;
    return;
  }

  j.invDir = 1.f / j.dir;
  j.tMin = 0.01f;
  j.tMax = 1e37f;

  a[g].shadow_hit = G(j, c, d, e, 0);
}