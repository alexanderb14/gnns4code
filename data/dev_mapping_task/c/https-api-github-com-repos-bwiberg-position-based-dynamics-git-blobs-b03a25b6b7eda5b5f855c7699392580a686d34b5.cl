typedef struct def_Vertex {
  float position[3];
  float normal[3];
  float texCoord[2];
  float color[4];
} Vertex;

typedef struct def_Edge {
  int triangles[2];
  int vertices[4];
} Edge;

typedef struct def_Triangle { uint vertices[3]; } Triangle;

typedef struct def_ClothVertexData {
  uint vertexID;
  float mass;
  float invmass;
} ClothVertexData;

typedef struct def_ClothEdge {
  uint edgeID;
  float initialDihedralAngle;
  float initialLength;
} ClothEdgeData;

typedef struct def_ClothTriangleData {
  uint triangleID;
  int neighbourIDs[3];
  float mass;
} ClothTriangleData;

typedef struct def_ClothSimParams {
  uint numSubSteps;
  float deltaTime;
  float k_stretch;
  float k_bend;
} ClothSimParams;

float A(const float3 a, const float3 b, const float3 c, const float3 d);

float3 B(float a, float b, float c);

float3 C(float3 a, float3 b);

void D(volatile __global float* a, float b);

void E(volatile __global float3* a, float3 b);
__kernel void F(__global const Vertex* a, volatile __global ClothVertexData* b, __global const Triangle* c, __global ClothTriangleData* d) {
  const Triangle e = c[get_global_id(0)];

  const Vertex f = a[e.vertices[0]];
  const Vertex g = a[e.vertices[1]];
  const Vertex h = a[e.vertices[2]];

  const float3 i = B(f.position[0], f.position[1], f.position[2]);
  const float3 j = B(g.position[0], g.position[1], g.position[2]);
  const float3 k = B(h.position[0], h.position[1], h.position[2]);

  const float3 l = j - i;
  const float3 m = k - i;

  const float n = 0.5f * length(C(l, m));

  ;

  d[get_global_id(0)].mass = n;

  D(&b[e.vertices[0]].mass, 0.33333f * n);

  D(&b[e.vertices[1]].mass, 0.33333f * n);

  D(&b[e.vertices[2]].mass, 0.33333f * n);
}

__kernel void G(__global ClothVertexData* a) {
  a[get_global_id(0)].invmass = 1.0f / a[get_global_id(0)].mass;
}

__kernel void H(__global const Vertex* a, __global const Triangle* b, __global Edge* c, __global ClothEdgeData* d, __global ClothTriangleData* e) {
  const Edge f = c[get_global_id(0)];

  const int g = f.vertices[0];
  const int h = f.vertices[1];

  const float3 i = B(a[g].position[0], a[g].position[1], a[g].position[2]);
  const float3 j = B(a[h].position[0], a[h].position[1], a[h].position[2]);

  d[get_global_id(0)].initialLength = length(i - j);

  if (f.triangles[1] == -1) {
    d[get_global_id(0)].initialDihedralAngle = 0.0f;
    return;
  };

  const int k = f.vertices[2];
  const int l = f.vertices[3];

  const float3 m = B(a[k].position[0], a[k].position[1], a[k].position[2]);
  const float3 n = B(a[l].position[0], a[l].position[1], a[l].position[2]);

  d[get_global_id(0)].initialDihedralAngle = A(i, j, m, n);
}
__kernel void I(__global float3* a) {
  const float3 b = a[get_global_id(0)];

  const float c = max(b.y, 0.02f);
  const float3 d = B(b.x, c, b.z);

  ;
  ;
  ;

  a[get_global_id(0)] = d;

  ;
}

__kernel void J(__global const Vertex* a, __global const ClothVertexData* b, __global const Edge* c, __global const ClothEdgeData* d, __global const Triangle* e, __global const ClothTriangleData* f, __global const float3* g, volatile __global float3* h, const ClothSimParams i) {
  const Edge j = c[get_global_id(0)];
  const ClothEdgeData k = d[get_global_id(0)];

  const int l = j.vertices[0];
  const int m = j.vertices[1];

  const ClothVertexData n = b[l];
  const ClothVertexData o = b[m];

  float3 p = g[l];
  float3 q = g[m];

  const float3 r = p - q;
  const float s = length(r);

  const float t = s - k.initialLength;
  const float3 u = i.k_stretch * r / max(s, 0.1f);

  const float v = 1 / (n.invmass + o.invmass);

  float3 w = -(n.invmass * v) * t * u;
  float3 x = (o.invmass * v) * t * u;

  ;
  ;
  ;
  ;
  ;
  ;
  ;

  if (j.triangles[1] != -1) {
    const int y = j.vertices[2];
    const int z = j.vertices[3];

    const ClothVertexData aa = b[y];
    const ClothVertexData ab = b[z];

    q -= p;

    const float3 ac = g[y] - p;
    const float3 ad = g[z] - p;
    p = B(0.0f, 0.0f, 0.0f);

    const float3 ae = normalize(C(q, ac));
    const float3 af = normalize(C(q, ad));
    const float ag = dot(ae, af);

    const float3 ah = (C(q, af) + C(ae, q) * ag) / length(C(q, ac));
    const float3 ai = (C(q, ae) + C(af, q) * ag) / length(C(q, ad));
    const float3 aj = -(C(ac, af) + C(ae, ac) * ag) / length(C(q, ac)) - (C(ad, ae) + C(af, ad) * ag) / length(C(q, ad));
    const float3 ak = -aj - ah - ai;

    const float al = (n.invmass * __clc_pow(length(ak), 2) + o.invmass * __clc_pow(length(aj), 2) + aa.invmass * __clc_pow(length(ah), 2) + ab.invmass * __clc_pow(length(ai), 2));
    const float am = -sqrt(clamp(1 - __clc_pow(ag, 2), 0.0f, 1.0f)) * (acos(clamp(ag, -0.99999999f, 0.99999999f)) - k.initialDihedralAngle);
    const float an = am / max(al, 0.00001f);

    w += i.k_bend * n.invmass * an * ak;
    x += i.k_bend * o.invmass * an * aj;
    const float3 ao = i.k_bend * aa.invmass * an * ah;
    const float3 ap = i.k_bend * ab.invmass * an * ai;

    ;
    ;
    ;
    ;
    ;
    ;
    ;
    ;
    ;
    ;
    ;
    ;
    ;
    ;
    ;
    ;

    E(&(h[y]), ao);
    E(&(h[z]), ap);
  }

  E(&(h[l]), w);
  E(&(h[m]), x);
}

__kernel void K(__global float3* a, __global float3* b) {
  const float3 c = b[get_global_id(0)];
  float3 d = a[get_global_id(0)];
  if (isnan(d.x))
    d.x = 0.0f;
  if (isnan(d.y))
    d.y = 0.0f;
  if (isnan(d.z))
    d.z = 0.0f;

  const float3 e = c + e;

  b[get_global_id(0)] += d;

  ;
  ;
  ;

  a[get_global_id(0)] = B(0.0f, 0.0f, 0.0f);
}

float A(const float3 a, const float3 b, const float3 c, const float3 d) {
  const float3 e = normalize(C(b - a, c - a));
  const float3 f = normalize(C(b - a, d - a));
  return acos(clamp(dot(e, f), -0.99999999f, 0.99999999f));
}

float3 B(float a, float b, float c) {
  float3 d;
  d.x = a;
  d.y = b;
  d.z = c;
  return d;
}

float3 C(float3 a, float3 b) {
  float3 c;
  c.x = a.y * b.z - a.z * b.y;
  c.y = a.z * b.x - a.x * b.z;
  c.z = a.x * b.y - a.y * b.x;
  return c;
}

void D(volatile __global float* a, float b) {
  union {
    unsigned int u32;
    float f32;
  } c, d, e;
  e.f32 = *a;
  do {
    d.f32 = e.f32;
    c.f32 = d.f32 + b;
    e.u32 = atomic_cmpxchg((volatile __global unsigned int*)a, d.u32, c.u32);
  } while (e.u32 != d.u32);
}

void E(volatile __global float3* a, float3 b) {
  volatile __global float* c = (__global float*)a;

  D(&(c[0]), b.x);
  D(&(c[1]), b.y);
  D(&(c[2]), b.z);
}