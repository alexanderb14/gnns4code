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

typedef float3 Color;

typedef struct {
  float3 dir;
  Color color;
} DirectionalLight;

typedef struct {
  Color ambient;
  DirectionalLight directional;

} Lights;

typedef struct {
  float t_min, t_max;
  unsigned int next_node;
} kdt_level;

kdt_level A(BBox a, Ray b) {
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

bool B(KDTNode a, global unsigned int* b, global Vertex* c, global int* d, Ray e) {
  for (int f = a.tris_start; f < a.tris_end; ++f) {
    unsigned int g = b[f];

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
    if (y > e.tMin)
      return true;
  }
  return false;
}

float C(KDTNode a, Ray b) {
  if (a.split_axis == 0) {
    return (a.split_coord - b.ori.x) * b.invDir.x;
  } else if (a.split_axis == 1) {
    return (a.split_coord - b.ori.y) * b.invDir.y;
  } else {
    return (a.split_coord - b.ori.z) * b.invDir.z;
  }
}

bool D(Ray a, KDTNode b, float c) {
  if (b.split_axis == 0) {
    return (a.ori.x < b.split_coord || (a.ori.x == b.split_coord && a.dir.x >= 0));

  } else if (b.split_axis == 1) {
    return (a.ori.y < b.split_coord || (a.ori.y == b.split_coord && a.dir.y >= 0));

  } else {
    return (a.ori.z < b.split_coord || (a.ori.z == b.split_coord && a.dir.z >= 0));
  }
}

bool E(Ray a, global Vertex* b, global int* c, global KDTNode* d, global unsigned int* e, BBox f) {
  kdt_level g[64];
  unsigned int h = 0;

  unsigned int i = 0;
  KDTNode j;
  unsigned int k, l;

  float m, n;
  kdt_level o = A(f, a);
  m = o.t_min;
  n = o.t_max;
  if (n < m || m < a.tMin)
    return false;
  m *= 0.999f;
  n *= 1.001f;
  m = fmax(a.tMin, m);

  while (1) {
    j = d[i];

    if (j.leaf) {
      if (j.tris_end > j.tris_start) {
        if (B(j, e, b, c, a))
          return true;
      }
      if (h > 0 && h < 64) {
        h--;
        i = g[h].next_node;
        m = g[h].t_min;
        n = g[h].t_max;
        continue;
      } else {
        return false;
      }
    }

    float p = C(j, a);
    bool q = D(a, j, p);
    if (q) {
      k = j.l_child;
      l = j.r_child;
    } else {
      k = j.r_child;
      l = j.l_child;
    }

    if (p > n || p <= 0) {
      i = k;
    } else if (p < m) {
      i = l;
    } else {
      g[h].next_node = l;
      g[h].t_min = p;
      g[h].t_max = n;
      h++;

      i = k;
      n = p;
    }
  }
}

kernel void F(global SampleTraceInfo* a, global Sample* b, global Vertex* c, global int* d, global KDTNode* e, global unsigned int* f, BBox g, global Lights* h) {
  int i = get_global_id(0);
  SampleTraceInfo j = a[i];

  if (!j.hit)
    return;

  Ray k;
  k.dir = -h->directional.dir;
  k.invDir = 1.f / k.dir;
  k.ori = j.hit_point;
  k.tMin = 0.01f;
  k.tMax = 1e37f;

  bool l = E(k, c, d, e, f, g);
  a[i].shadow_hit = l;
}