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