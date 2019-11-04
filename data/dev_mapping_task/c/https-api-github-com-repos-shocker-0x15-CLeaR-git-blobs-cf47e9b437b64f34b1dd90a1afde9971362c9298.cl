typedef float2 point2; typedef float3 vector3; typedef float3 point3; typedef float3 color; typedef float4 vector4; typedef float4 point4; typedef float16 mat4x4; typedef enum { DDFType_BSDF = 0, DDFType_EDF, DDFType_EnvEDF, DDFType_PerspectiveIDF } DDFType;

typedef struct __attribute__((aligned(16))) {
  point3 org;
  vector3 dir;
  uint depth;
} Ray;

typedef struct __attribute__((aligned(1))) { uchar _type; } DDFHead;

typedef struct __attribute__((aligned(16))) {
  point3 p;
  vector3 gNormal;
  float2 param;
  float2 uv;
  uint faceID;
} Intersection;

typedef struct __attribute__((aligned(16))) {
  point3 p;
  vector3 gNormal;
  vector3 sNormal;
  vector3 sTangent;
  vector3 uDir;
  float2 uv;
  uint faceID;
  bool hasTangent;
} SurfacePoint;

typedef struct __attribute__((aligned(16))) {
  point3 p;
  vector3 gNormal;
  vector3 sNormal;
  vector3 sTangent;
  vector3 uDir;
  float2 uv;
  uint faceID;
  bool hasTangent;
  bool atInfinity;
} LightPoint;

typedef struct __attribute__((aligned(16))) {
  point3 p;
  vector3 dir;
  float2 uv;
} LensPoint;

inline void A(uchar* a, const global uchar* b, uint c);
inline void B(uchar** a, uintptr_t b);
inline void C(const global uchar** a, uintptr_t b);
const uchar* D(const uchar** a, uintptr_t b);
const global uchar* E(const global uchar** a, uintptr_t b);
inline bool F(const float3* a);
inline float G(const float3* a);
inline float H(const color* a);
void I(const vector3* a, vector3* b);
inline vector3 J(const vector3* a, const vector3* b, const vector3* c, const vector3* d);
inline vector3 K(const vector3* a, const vector3* b, const vector3* c, const vector3* d);
inline void L(const vector3* a, float* b, float* c);
inline float M(const point3* a, const point3* b);
inline void N(const SurfacePoint* a, LightPoint* b);

inline void A(uchar* a, const global uchar* b, uint c) {
  for (uint d = 0; d < c; ++d)
    *(a++) = *(b++);
}

inline void B(uchar** a, uintptr_t b) {
  *a = (uchar*)(((uintptr_t)*a + (b - 1)) & ~(b - 1));
}

inline void C(const global uchar** a, uintptr_t b) {
  *a = (const global uchar*)(((uintptr_t)*a + (b - 1)) & ~(b - 1));
}

const uchar* D(const uchar** a, uintptr_t b) {
  const uchar* c = (const uchar*)(((uintptr_t)*a + (b - 1)) & ~(b - 1));
  *a = c + b;
  return c;
}

const global uchar* E(const global uchar** a, uintptr_t b) {
  const global uchar* c = (const global uchar*)(((uintptr_t)*a + (b - 1)) & ~(b - 1));
  *a = c + b;
  return c;
}

inline bool F(const float3* a) {
  return a->x == 0.0f && a->y == 0.0f && a->z == 0.0f;
}

inline float G(const float3* a) {
  return fmax(a->x, fmax(a->y, a->z));
}

inline float H(const color* a) {
  return 0.2126f * a->s0 + 0.7152f * a->s1 + 0.0722f * a->s2;
}

void I(const vector3* a, vector3* b) {
  if (__clc_fabs(a->x) > __clc_fabs(a->y)) {
    float c = 1.0f / sqrt(a->x * a->x + a->z * a->z);
        *b = (vector3)(-a->z * cf, a->x * c
  } else {
    float c = 1.0f / sqrt(a->y * a->y + a->z * a->z);
        *b = (vector3)(0.0f, a->z *ac>y * c
  }
}

inline vector3 J(const vector3* a, const vector3* b, const vector3* c, const vector3* d) {
  return (vector3)(dot(*a, *d), dot(*b, *d), dot(*c, *d));
}

inline vector3 K(const vector3* a, const vector3* b, const vector3* c, const vector3* d) {
  return (vector3)(a->x * d->x + b->x * d->y + c->x * d->z, a->y * d->x + b->y * d->y + c->y * d->z, a->z * d->x + b->z * d->y + c->z * d->z);
}

inline void L(const vector3* a, float* b, float* c) {
  *b = acos(clamp(a->y, -1.0f, 1.0f));
  *c = fmod(atan2(-a->x, a->z) + 2.0f * 0x1.921fb6p+1f, 2 * 0x1.921fb6p+1f);
}

inline float M(const point3* a, const point3* b) {
  return (b->x - a->x) * (b->x - a->x) + (b->y - a->y) * (b->y - a->y) + (b->z - a->z) * (b->z - a->z);
}

inline void N(const SurfacePoint* a, LightPoint* b) {
  b->p = a->p;
  b->gNormal = a->gNormal;
  b->sNormal = a->sNormal;
  b->sTangent = a->sTangent;
  b->uDir = a->uDir;
  b->uv = a->uv;
  b->faceID = a->faceID;
  b->hasTangent = a->hasTangent;
  b->atInfinity = false;
}
typedef enum {
  DistributionType_Discrete1D = 0,
  DistributionType_ContinuousConsts1D,
  DistributionType_ContinuousConsts2D_H,
} DistributionType;

typedef struct __attribute__((aligned(1))) { uchar _type; } DistributionHead;

typedef struct __attribute__((aligned(4))) {
  DistributionHead head;
  uint numItems __attribute__((aligned(4)));
  int offsetPMF;
  int offsetCDF;
} Discrete1D;

typedef struct __attribute__((aligned(4))) {
  DistributionHead head;
  uint numValues __attribute__((aligned(4)));
  float startDomain, endDomain;
  float widthStratum;
  int offsetPDF;
  int offsetCDF;
} ContinuousConsts1D;

typedef struct __attribute__((aligned(4))) {
  DistributionHead head;
  int offsetChildren __attribute__((aligned(4)));
  ContinuousConsts1D distParent;
} ContinuousConsts2D_H;

uint O(const global Discrete1D* a, float b, float* c);
inline float P(const global Discrete1D* a, uint b);
float Q(const global ContinuousConsts1D* a, float b, float* c);
inline float R(const global ContinuousConsts1D* a, float b);
float2 S(const global ContinuousConsts2D_H* a, float b, float c, float* d);
float T(const global ContinuousConsts2D_H* a, const float2* b);

uint O(const global Discrete1D* a, float b, float* c) {
  const global float* d = (const global float*)((const global uchar*)a + (a->offsetCDF));
  uint e = 0;
  uint f = a->numItems + 1;
  uint g = f / 2;
  while (true) {
    if (*(d + g) > b)
      f = g;
    else
      e = g;

    if (f - e == 1) {
      *c = *((const global float*)((const global uchar*)a + (a->offsetPMF)) + e);
      return e;
    }

    g = (f - e) / 2 + e;
  }
  *c = 0.0f;
  return 0xffffffff;
}

inline float P(const global Discrete1D* a, uint b) {
  return *((const global float*)((const global uchar*)a + (a->offsetPMF)) + b);
}

float Q(const global ContinuousConsts1D* a, float b, float* c) {
  const global float* d = (const global float*)((const global uchar*)a + (a->offsetCDF));
  uint e = 0;
  uint f = a->numValues + 1;
  uint g = f / 2;
  while (true) {
    if (*(d + g) > b)
      f = g;
    else
      e = g;

    if (f - e == 1) {
      float h = (b - *(d + e)) / (*(d + f) - *(d + e));
      *c = *((const global float*)((const global uchar*)a + (a->offsetPDF)) + e);
      return a->startDomain + (e + h) * a->widthStratum;
    }

    g = (f - e) / 2 + e;
  }
  *c = 0.0f;
  return 0.0f;
}

inline float R(const global ContinuousConsts1D* a, float b) {
  return *((const global float*)((const global uchar*)a + (a->offsetPDF)) + (uint)((b - a->startDomain) / a->widthStratum));
}

float2 S(const global ContinuousConsts2D_H* a, float b, float c, float* d) {
  float2 e;
  float f;
  e.s1 = Q(&a->distParent, c, &f);
  uint g = (uint)((e.s1 - a->distParent.startDomain) / a->distParent.widthStratum);
  e.s0 = Q((const global ContinuousConsts1D*)((const global uchar*)a + (a->offsetChildren)) + g, b, d);
  *d *= f;
  return e;
}

float T(const global ContinuousConsts2D_H* a, const float2* b) {
  float c;
  c = R(&a->distParent, b->s1);
  uint d = (uint)((b->s1 - a->distParent.startDomain) / a->distParent.widthStratum);
  c *= R((const global ContinuousConsts1D*)((const global uchar*)a + (a->offsetChildren)) + d, b->s0);
  return c;
}

typedef struct BBox BBox;

typedef struct BVHNode BVHNode;

typedef struct __attribute__((aligned(4))) {
  uint p0, p1, p2;
  uint vn0, vn1, vn2;
  uint vt0, vt1, vt2;
  uint uv0, uv1, uv2;
  uint alphaTexPtr;
  ushort matPtr, lightPtr;
} Face;

typedef struct __attribute__((aligned(4))) {
  uchar atInfinity;
  uint reference __attribute__((aligned(4)));
} LightInfo;

typedef struct __attribute__((aligned(64))) {
  uint width, height;
  mat4x4 localToWorld;
} CameraHead;

typedef struct __attribute__((aligned(4))) { uint idx_envLightProperty; } EnvironmentHead;

typedef struct {
  global point3* vertices;
  global vector3* normals;
  global vector3* tangents;
  global float2* uvs;
  global Face* faces;
  global LightInfo* lights;
  global uchar* materialsData;
  global uchar* texturesData;
  global uchar* otherResourcesData;

  global BVHNode* BVHNodes;

  global CameraHead* camera;
  global EnvironmentHead* environment;
  global Discrete1D* lightPowerDistribution;
} Scene;
uint U(global uint* a);
inline float V(global uint* a);
inline uint W(float a, uint b);
void X(float a, float b, float* c, float* d);
vector3 Y(float a, float b);
void Z(float a, float b, float* c, float* d);

uint U(global uint* a) {
  uint b = a[0] ^ (a[0] << 11);
  a[0] = a[1];
  a[1] = a[2];
  a[2] = a[3];
  return a[3] = (a[3] ^ (a[3] >> 19)) ^ (b ^ (b >> 8));
}

inline float V(global uint* a) {
  return __builtin_astype((U(a) >> 9) | 0x3f800000, float) - 1.0f;
}

inline uint W(float a, uint b) {
  return min((uint)(b * a), b - 1);
}

void X(float a, float b, float* c, float* d) {
  float e, f;
  float g = 2 * a - 1;
  float h = 2 * b - 1;

  if (g == 0.0f && h == 0.0f) {
    *c = 0.0f;
    *d = 0.0f;
    return;
  }
  if (g >= -h) {
    if (g > h) {
      e = g;
      f = h / g;
    } else {
      e = h;
      f = 2.0f - g / h;
    }
  } else {
    if (g > h) {
      e = -h;
      f = 6.0f + g / h;
    } else {
      e = -g;
      f = 4.0f + h / g;
    }
  }
  f *= 0x1.921fb6p-1f;
  *c = e * cos(f);
  *d = e * sin(f);
}

vector3 Y(float a, float b) {
  float c, d;
  X(a, b, &c, &d);
  return (float3)(c, d, sqrt(max(0.0f, 1.0f - c * c - d * d)));
}

void Z(float a, float b, float* c, float* d) {
  float e = sqrt(a);
  *c = 1.0f - e;
  *d = b * e;
}
inline void AA(const mat4x4* a, const point4* b, point4* c);
inline void AB(const global mat4x4* a, const point4* b, point4* c);
void AC(const global mat4x4* a, const point3* b, point3* c);
inline void AD(const mat4x4* a, const vector4* b, vector4* c);
inline void AE(const global mat4x4* a, const vector4* b, vector4* c);
inline void AF(const global mat4x4* a, const vector3* b, vector3* c);

inline void AA(const mat4x4* a, const point4* b, point4* c) {
  c->x = dot(a->s048c, *b);
  c->y = dot(a->s159d, *b);
  c->z = dot(a->s26ae, *b);
  c->w = dot(a->s37bf, *b);
  if (c->w != 1.0f)
    *c /= c->w;
}

inline void AB(const global mat4x4* a, const point4* b, point4* c) {
  c->x = dot(a->s048c, *b);
  c->y = dot(a->s159d, *b);
  c->z = dot(a->s26ae, *b);
  c->w = dot(a->s37bf, *b);
  if (c->w != 1.0f)
    *c /= c->w;
}

void AC(const global mat4x4* a, const point3* b, point3* c) {
  point4 d = (point4)(*b, 1.0f);
  c->x = dot(a->s048c, d);
  c->y = dot(a->s159d, d);
  c->z = dot(a->s26ae, d);
  float e = dot(a->s37bf, d);
  if (e != 1.0f)
    *c /= e;
}

inline void AD(const mat4x4* a, const vector4* b, vector4* c) {
  c->x = dot(a->s048, b->xyz);
  c->y = dot(a->s159, b->xyz);
  c->z = dot(a->s26a, b->xyz);
}

inline void AE(const global mat4x4* a, const vector4* b, vector4* c) {
  c->x = dot(a->s048, b->xyz);
  c->y = dot(a->s159, b->xyz);
  c->z = dot(a->s26a, b->xyz);
}

inline void AF(const global mat4x4* a, const vector3* b, vector3* c) {
  c->x = dot(a->s048, *b);
  c->y = dot(a->s159, *b);
  c->z = dot(a->s26a, *b);
}

typedef struct __attribute__((aligned(4))) { float uLens[2]; } CameraSample;

typedef struct __attribute__((aligned(4))) { float uDir[2]; } IDFSample;

typedef struct __attribute__((aligned(64))) {
  CameraHead head;
  uchar id;
  float virtualPlaneArea __attribute__((aligned(4)));
  float lensRadius;
  float objPDistance;
  mat4x4 rasterToCamera __attribute__((aligned(64)));
} PerspectiveInfo;

typedef struct __attribute__((aligned(16))) {
  point3 localOrigin;
  const global PerspectiveInfo* info;
} PerspectiveIDF;

typedef struct __attribute__((aligned(16))) {
  DDFHead ddfHead;
  vector3 dir __attribute__((aligned(16)));
} IDFHead;

void AG(const Scene* a, const CameraSample* b, LensPoint* c, uchar* d, float* e);

void AH(const Scene* a, const LensPoint* b, uchar* c);

color AI(const uchar* a, const IDFSample* b, vector3* c, float* d);
inline float AJ(const uchar* a, const vector3* b);

void AG(const Scene* a, const CameraSample* b, LensPoint* c, uchar* d, float* e) {
  const global CameraHead* f = (const global CameraHead*)a->camera;

  float g, h;
  X(b->uLens[0], b->uLens[1], &g, &h);

  vector3 i = (vector3)(0.0f, 0.0f, 1.0f);
  AF(&f->localToWorld, &i, &c->dir);

  const global PerspectiveInfo* j = (const global PerspectiveInfo*)f;

  point3 k = (point3)(g * jensRadius, h * jensRadius, 0.0f);
  AC(&f->localToWorld, &k, &c->p);

  *e = 1.0f / (0x1.921fb6p+1f * j->lensRadius * j->lensRadius);
  c->uv = k.xy;

  AH(a, c, d);
}

void AH(const Scene* a, const LensPoint* b, uchar* c) {
  IDFHead* d = (IDFHead*)c;
  d->ddfHead._type = DDFType_PerspectiveIDF;

  d->dir = b->dir;

  PerspectiveIDF* e = (PerspectiveIDF*)(c + sizeof(IDFHead));
  e->localOrigin = (point3)(bv, 0.0f);
  e->info = (const global PerspectiveInfo*)a->camera;
}

color AI(const uchar* a, const IDFSample* b, vector3* c, float* d) {
  const IDFHead* e = (const IDFHead*)a;

  const PerspectiveIDF* f = (const PerspectiveIDF*)(e + 1);
  const global PerspectiveInfo* g = f->info;

  point4 h = (point4)(br[0], br[1], 0, 1);
  point4 i;
  AB(&g->rasterToCamera, &h, &i);
  vector3 j = normalize(i.xyz);

  if (g->lensRadius > 0.0f) {
    float k = -g->objPDistance / j.z;
    point3 l = (point3)(0, 0, 0) + k * j;

    j = normalize(l - f->localOrigin);
  }

  AF(&g->head.localToWorld, &j, c);
  *d = 1.0f / (__clc_pow(-j.z, 3) * g->virtualPlaneArea);

  return (color)(1.0f, 1.0f, 1.0f);
}

inline float AJ(const uchar* a, const vector3* b) {
  return __clc_fabs(dot(((IDFHead*)a)->dir, *b));
}