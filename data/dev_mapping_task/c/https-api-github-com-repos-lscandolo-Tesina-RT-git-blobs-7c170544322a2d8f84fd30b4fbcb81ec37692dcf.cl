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
  float4 hi;
  float4 lo;
} BBox;

typedef struct {
  bool leaf;
  char split_axis;
  float split_coord;
  union {
    unsigned int tris_start;
    unsigned int l_child;
  };
  union {
    unsigned int tris_end;
    unsigned int r_child;
  };

} KDTNode;

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
  float t_min, t_max;
  unsigned int next_node;
} kdt_level;

void __attribute__((always_inline)) A(Ray a, SampleTraceInfo* b, global Vertex* c, global int* d) {
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

kdt_level B(BBox a, Ray b) {
  float c = b.tMin;
  float d = b.tMax;

  float3 e, f;

  e = (a.lo.xyz - b.ori) * b.invDir;
  f = (a.hi.xyz - b.ori) * b.invDir;

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

  kdt_level i;
  i.t_min = c;
  i.t_max = d;
  return i;
}

SampleTraceInfo C(KDTNode a, global unsigned int* b, global Vertex* c, global int* d, Ray e, float f, float g) {
  SampleTraceInfo h;
  h.hit = false;
  h.inverse_n = false;
  f *= 0.9999f;
  g *= 1.0001f;
  h.t = g;

  for (unsigned int i = a.tris_start; i < a.tris_end; ++i) {
    unsigned int j = b[i];

    float3 k = e.ori.xyz;
    float3 l = e.dir.xyz;

    global Vertex* m = &c[d[3 * j]];
    global Vertex* n = &c[d[3 * j + 1]];
    global Vertex* o = &c[d[3 * j + 2]];

    float3 p = m->position;
    float3 q = n->position;
    float3 r = o->position;

    float3 s = q - p;
    float3 t = r - p;

    float3 u = cross(l, t);
    float v = dot(s, u);

    if (v > -1e-26f && v < 1e-26f)

      continue;

    float w = 1.f / v;
    float3 x = k - p;
    float y = w * dot(x, u);
    if (y < 0.f || y > 1.f)
      continue;

    float3 z = cross(x, s);
    float aa = w * dot(l, z);
    if (aa < 0.f || y + aa > 1.f)
      continue;

    float ab = w * dot(t, z);

    bool ac = (ab <= g && ab >= f && ab <= h.t);

    if (ac) {
      h.hit = true;
      h.t = ab;
      h.id = j;
      h.uv.s0 = y;
      h.uv.s1 = aa;
    }
  }
  return h;
}

float D(KDTNode a, Ray b) {
  float3 c = (float3)(alit_coord, alit_coord, alit_coord);
  c = (c - b.ori) * b.invDir;
  if (a.split_axis == 0) {
    return c.x;
  } else if (a.split_axis == 1) {
    return c.y;
  } else {
    return c.z;
  }
}

bool E(Ray a, KDTNode b, float c) {
  if (b.split_axis == 0) {
    return (a.ori.x < b.split_coord || (a.ori.x == b.split_coord && a.dir.x >= 0));

  } else if (b.split_axis == 1) {
    return (a.ori.y < b.split_coord || (a.ori.y == b.split_coord && a.dir.y >= 0));

  } else {
    return (a.ori.z < b.split_coord || (a.ori.z == b.split_coord && a.dir.z >= 0));
  }
}

SampleTraceInfo F(Ray a, global Vertex* b, global int* c, global KDTNode* d, global unsigned int* e, BBox f) {
  SampleTraceInfo g;
  g.hit = false;
  g.shadow_hit = false;
  g.inverse_n = false;
  g.t = a.tMax;

  kdt_level h[64];
  unsigned int i = 0;

  unsigned int j = 0;
  KDTNode k;
  unsigned int l, m;

  float n, o;
  kdt_level p = B(f, a);
  n = p.t_min;
  o = p.t_max;
  if (o < n || n < a.tMin)
    return g;
  n *= 0.999f;
  o *= 1.001f;
  n = fmax(a.tMin, n);

  while (1) {
    k = d[j];

    if (k.leaf) {
      if (k.tris_end > k.tris_start) {
        g = C(k, e, b, c, a, n, o);
        if (g.hit)
          return g;
      }

      if (i > 0 && i < 64) {
        i--;
        j = h[i].next_node;
        n = h[i].t_min;
        o = h[i].t_max;
        continue;
      } else {
        return g;
      }
    }

    float q = D(k, a);
    bool r = E(a, k, q);
    if (r) {
      l = k.l_child;
      m = k.r_child;
    } else {
      l = k.r_child;
      m = k.l_child;
    }

    if (q > o || q < 0) {
      j = l;
    } else if (q < n) {
      j = m;
    } else {
      h[i].next_node = m;
      h[i].t_min = q;
      h[i].t_max = o;
      i++;

      j = l;
      o = q;
    }
  }
}

kernel void G(global SampleTraceInfo* a, global Sample* b, global Vertex* c, global int* d, global KDTNode* e, global unsigned int* f, BBox g) {
  int h = get_global_id(0);
  Ray i = b[h].ray;
  SampleTraceInfo j = F(i, c, d, e, f, g);

  if (j.hit)
    A(i, &j, c, d);

  a[h] = j;
}