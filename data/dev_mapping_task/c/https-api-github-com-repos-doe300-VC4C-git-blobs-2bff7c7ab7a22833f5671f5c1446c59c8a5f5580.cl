typedef struct {
  float x;
  float y;
  float z;
} Float3;

typedef struct {
  uint x;
  uint y;
  uint z;
} Uint3;

typedef struct {
  int x;
  int y;
  int z;
} Int3;

typedef struct {
  Float3 colliderPos;
  float colliderRadius;

  Float3 gravity;
  float globalDamping;
  float particleRadius;

  Uint3 gridSize;
  uint numCells;
  Float3 worldOrigin;
  Float3 cellSize;

  uint numBodies;
  uint maxParticlesPerCell;

  float spring;
  float damping;
  float shear;
  float attraction;
  float boundaryDamping;
} simParams_t;

__kernel void A(__global float4* a, __global float4* b, __constant simParams_t* c, float d, uint e) {
  const uint f = get_global_id(0);
  if (f >= e)
    return;

  float4 g = a[f];
  float4 h = b[f];

  g.w = 1.0f;
  h.w = 0.0f;

  h += (float4)(cvity.x, cvity.y, cvity.z, 0) * d;
  h *= c->globalDamping;

  g += h * d;

  if (g.x < -1.0f + c->particleRadius) {
    g.x = -1.0f + c->particleRadius;
    h.x *= c->boundaryDamping;
  }
  if (g.x > 1.0f - c->particleRadius) {
    g.x = 1.0f - c->particleRadius;
    h.x *= c->boundaryDamping;
  }

  if (g.y < -1.0f + c->particleRadius) {
    g.y = -1.0f + c->particleRadius;
    h.y *= c->boundaryDamping;
  }
  if (g.y > 1.0f - c->particleRadius) {
    g.y = 1.0f - c->particleRadius;
    h.y *= c->boundaryDamping;
  }

  if (g.z < -1.0f + c->particleRadius) {
    g.z = -1.0f + c->particleRadius;
    h.z *= c->boundaryDamping;
  }
  if (g.z > 1.0f - c->particleRadius) {
    g.z = 1.0f - c->particleRadius;
    h.z *= c->boundaryDamping;
  }

  a[f] = g;
  b[f] = h;
}

int4 B(float4 a, __constant simParams_t* b) {
  int4 c;
  c.x = (int)__clc_floor((a.x - b->worldOrigin.x) / b->cellSize.x);
  c.y = (int)__clc_floor((a.y - b->worldOrigin.y) / b->cellSize.y);
  c.z = (int)__clc_floor((a.z - b->worldOrigin.z) / b->cellSize.z);
  c.w = 0;
  return c;
}

uint C(int4 a, __constant simParams_t* b) {
  a.x = a.x & (b->gridSize.x - 1);
  a.y = a.y & (b->gridSize.y - 1);
  a.z = a.z & (b->gridSize.z - 1);
  return ((((a.z) * (b->gridSize.y) + (a.y))) * (b->gridSize.x) + (a.x));
}

__kernel void D(__global uint* a, __global uint* b, __global const float4* c, __constant simParams_t* d, uint e) {
  const uint f = get_global_id(0);
  if (f >= e)
    return;

  float4 g = c[f];

  int4 h = B(g, d);
  uint i = C(h, d);

  a[f] = i;
  b[f] = f;
}

__kernel void E(__global uint* a, uint b, uint c) {
  if (get_global_id(0) < c)
    a[get_global_id(0)] = b;
}

__kernel void F(__global uint* a, __global uint* b, __global float4* c, __global float4* d,

                __global const uint* e, __global const uint* f, __global const float4* g, __global const float4* h, __local uint* i, uint j) {
  uint k;
  const uint l = get_global_id(0);

  if (l < j) {
    k = e[l];

    i[get_local_id(0) + 1] = k;

    if (l > 0 && get_local_id(0) == 0)
      i[0] = e[l - 1];
  }

  barrier(1);

  if (l < j) {
    if (l == 0)
      a[k] = 0;

    else {
      if (k != i[get_local_id(0)])
        b[i[get_local_id(0)]] = a[k] = l;
    };

    if (l == j - 1)
      b[k] = j;

    uint m = f[l];
    float4 n = g[m];
    float4 o = h[m];

    c[l] = n;
    d[l] = o;
  }
}

float4 G(float4 a, float4 b, float4 c, float4 d, float e, float f, float g, float h, float i, float j) {
  float4 k = (float4)(b - a b - a b - a 0);
  float l = sqrt(k.x * k.x + k.y * k.y + k.z * k.z);
  float m = e + f;

  float4 n = (float4)(0, 0, 0, 0);
  if (l < m) {
    float4 o = (float4)(kkkl);

    float4 p = (float4)(d - c d - c d - c 0);

    float q = p.x * o.x + p.y * o.y + p.z * o.z;
    floorofpq

        float s = -g * (m - l);
    n = (float4)(k k k 0);
  }

  return n;
}

__kernel void H(__global float4* a, __global const float4* b, __global const float4* c, __global const uint* d, __global const uint* e, __global const uint* f, __constant simParams_t* g, uint h) {
  uint i = get_global_id(0);
  if (i >= h)
    return;

  float4 j = b[i];
  float4 k = c[i];
  float4 l = (float4)(0, 0, 0, 0);

  int4 m = B(j, g);

  for (int n = -1; n <= 1; n++)
    for (int o = -1; o <= 1; o++)
      for (int p = -1; p <= 1; p++) {
        uint q = C(m + (int4)(p, o, n, 0), g);
        uint r = e[q];

        if (r == 0xFFFFFFFFU)
          continue;

        uint s = f[q];
        for (uint t = r; t < s; t++) {
          if (t == i)
            continue;

          float4 u = b[t];
          float4 v = c[t];

          l += G(j, u, k, v, g->particleRadius, g->particleRadius, g->spring, g->damping, g->shear, g->attraction);
        }
      }

  l += G(j, (float4)(gliderPos.x, gliderPos.y, gliderPos.z, 0), k, (float4)(0, 0, 0, 0), g->particleRadius, g->colliderRadius, g->spring, g->damping, g->shear, g->attraction);

  a[d[i]] = k + l;
}