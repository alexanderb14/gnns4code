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
  TextureType_ColorConstant = 0,
  TextureType_ColorImageRGB8x3,
  TextureType_ColorImageRGBA8x4,
  TextureType_ColorImageRGBA16Fx4,
  TextureType_ColorProcedural,
  TextureType_GrayImage8,
  TextureType_FloatConstant,
  TextureType_FloatImage,
  TextureType_FloatProcedural,
} TextureType;

typedef enum {
  ColorProcedureType_CheckerBoard = 0,
  ColorProcedureType_CheckerBoardBump,
  ColorProcudureType_Random1,
} ColorProcedureType;

typedef enum {
  FloatProcedureType_CheckerBoard = 0,
} FloatProcedureType;

typedef enum {
  FresnelID_NoOp = 0,
  FresnelID_Conductor,
  FresnelID_Dielectric,
} FresnelID;

typedef struct __attribute__((aligned(16))) {
  uchar texType;
  float3 value __attribute__((aligned(16)));
} Float3ConstantTexture;

typedef struct __attribute__((aligned(4))) {
  uchar texType;
  float value __attribute__((aligned(4)));
} FloatConstantTexture;

typedef struct __attribute__((aligned(4))) {
  uchar texType;
  uint width __attribute__((aligned(4))), height;
  int offsetData;
} ImageTexture;

typedef struct __attribute__((aligned(4))) {
  uchar texType;
  uint width __attribute__((aligned(4))), height;
  int offsetData;
} NormalMapTexture;

typedef struct __attribute__((aligned(1))) {
  uchar texType;
  uchar procedureType;
} ProceduralTextureHead;

typedef struct __attribute__((aligned(16))) {
  ProceduralTextureHead head;
  float3 c[2] __attribute__((aligned(16)));
} Float3CheckerBoardTexture;

typedef struct __attribute__((aligned(4))) {
  ProceduralTextureHead head;
  float width __attribute__((aligned(4)));
  uchar reverse;
} Float3CheckerBoardBumpTexture;

typedef struct __attribute__((aligned(4))) { ProceduralTextureHead head; } Float3Random1Texture;

typedef struct __attribute__((aligned(4))) {
  ProceduralTextureHead head;
  float v[2] __attribute__((aligned(4)));
} FloatCheckerBoardTexture;

typedef struct __attribute__((aligned(1))) { uchar fresnelType; } FresnelHead;

typedef struct __attribute__((aligned(1))) { FresnelHead head; } FresnelNoOp;

typedef struct __attribute__((aligned(16))) {
  FresnelHead head;
  float3 eta __attribute__((aligned(16))), k;
} FresnelConductor;

typedef struct __attribute__((aligned(4))) {
  FresnelHead head;
  float etaExt __attribute__((aligned(4))), etaInt;
} FresnelDielectric;