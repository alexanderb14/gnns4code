typedef unsigned int u32; typedef unsigned short u16; typedef unsigned char u8; __inline float A(float a, float b) {
  return ((a) / (b));
}

__inline float4 B(float4 a, float4 b) {
  return ((a) / (b));
}

__inline float C(float a) {
  return sqrt(a);
}

__inline float D(float a) {
  return native_rsqrt(a);
}

__inline float E(float4 a) {
  return fast_length(a);
}

__inline float4 F(float4 a) {
  return fast_normalize(a);
}

__inline float G(float a) {
  return sqrt(a);
}

__inline float4 H(float4 a, float4 b) {
  return cross(a, b);
}

__inline float I(float4 a, float4 b) {
  float4 c = (float4)(a.xyz, 0.f);
  float4 d = (float4)(b.xyz, 0.f);
  return dot(c, d);
}

__inline float J(const float4 a) {
  return G(I(a, a));
}

__inline float K(const float4 a, const float4 b) {
  return dot(a, b);
}

__inline float L(const float4 a, const float4 b) {
  return I(a, b) + b.w;
}

__inline float4 M(const float4 a) {
  float4 b = (float4)(a.x, a.y, a.z, 0.f);
  return F(b);
}

__inline float4 N(const float4 a) {
  float b = G(K(a, a));
  return 1.f / b * a;
}

__inline float4 O(const float4 a, const float4 b, const float4 c) {
  float4 d;
  float4 e = b - a;
  float4 f = c - a;
  d = M(H(e, f));
  d.w = -I(d, a);
  return d;
}

typedef struct { float4 m_row[3]; } Matrix3x3;

__inline Matrix3x3 P();

__inline Matrix3x3 Q();

__inline Matrix3x3 R(Matrix3x3 a);

__inline Matrix3x3 S(Matrix3x3 a, Matrix3x3 b);

__inline float4 T(Matrix3x3 a, float4 b);

__inline float4 U(float4 a, Matrix3x3 b);

__inline Matrix3x3 P() {
  Matrix3x3 a;
  a.m_row[0] = (float4)(0.f);
  a.m_row[1] = (float4)(0.f);
  a.m_row[2] = (float4)(0.f);
  return a;
}

__inline Matrix3x3 Q() {
  Matrix3x3 a;
  a.m_row[0] = (float4)(1, 0, 0, 0);
  a.m_row[1] = (float4)(0, 1, 0, 0);
  a.m_row[2] = (float4)(0, 0, 1, 0);
  return a;
}

__inline Matrix3x3 R(Matrix3x3 a) {
  Matrix3x3 b;
  b.m_row[0] = (float4)(a.m_row[0].x, a.m_row[1].x, a.m_row[2].x, 0.f);
  b.m_row[1] = (float4)(a.m_row[0].y, a.m_row[1].y, a.m_row[2].y, 0.f);
  b.m_row[2] = (float4)(a.m_row[0].z, a.m_row[1].z, a.m_row[2].z, 0.f);
  return b;
}

__inline Matrix3x3 S(Matrix3x3 a, Matrix3x3 b) {
  Matrix3x3 c;
  c = R(b);
  Matrix3x3 d;

  a.m_row[0].w = 0.f;
  a.m_row[1].w = 0.f;
  a.m_row[2].w = 0.f;
  for (int e = 0; e < 3; e++) {
    d.m_row[e].x = I(a.m_row[e], c.m_row[0]);
    d.m_row[e].y = I(a.m_row[e], c.m_row[1]);
    d.m_row[e].z = I(a.m_row[e], c.m_row[2]);
    d.m_row[e].w = 0.f;
  }
  return d;
}

__inline float4 T(Matrix3x3 a, float4 b) {
  float4 c;
  c.x = I(a.m_row[0], b);
  c.y = I(a.m_row[1], b);
  c.z = I(a.m_row[2], b);
  c.w = 0.f;
  return c;
}

__inline float4 U(float4 a, Matrix3x3 b) {
  float4 c = (float4)(b.m_row[0].x, b.m_row[1].x, b.m_row[2].x, 0);
  float4 d = (float4)(b.m_row[0].y, b.m_row[1].y, b.m_row[2].y, 0);
  float4 e = (float4)(b.m_row[0].z, b.m_row[1].z, b.m_row[2].z, 0);

  float4 f;
  f.x = I(a, c);
  f.y = I(a, d);
  f.z = I(a, e);
  return f;
}

typedef float4 Quaternion;

__inline Quaternion V(Quaternion a, Quaternion b);

__inline Quaternion W(Quaternion a);

__inline float4 X(Quaternion a, float4 b);

__inline Quaternion Y(Quaternion a);

__inline Quaternion V(Quaternion a, Quaternion b) {
  Quaternion c;
  c = H(a, b);
  c += a.w * b + b.w * a;

  c.w = a.w * b.w - I(a, b);
  return c;
}

__inline Quaternion W(Quaternion a) {
  return F(a);
}
__inline float4 X(Quaternion a, float4 b) {
  Quaternion c = Y(a);
  float4 d = b;
  d.w = 0.f;
  float4 e = V(V(a, d), c);
  return e;
}

__inline Quaternion Y(Quaternion a) {
  return (Quaternion)(-a.xyz, a.w);
}

__inline float4 Z(const Quaternion a, float4 b) {
  return X(Y(a), b);
}

typedef struct {
  float4 m_pos;
  Quaternion m_quat;
  float4 m_linVel;
  float4 m_angVel;

  u32 m_shapeIdx;
  float m_invMass;
  float m_restituitionCoeff;
  float m_frictionCoeff;
} Body;

typedef struct {
  Matrix3x3 m_invInertia;
  Matrix3x3 m_initInvInertia;
} Shape;

typedef struct {
  float4 m_linear;
  float4 m_worldPos[4];
  float4 m_center;
  float m_jacCoeffInv[4];
  float m_b[4];
  float m_appliedRambdaDt[4];

  float m_fJacCoeffInv[2];
  float m_fAppliedRambdaDt[2];

  u32 m_bodyA;
  u32 m_bodyB;

  int m_batchIdx;
  u32 m_paddings[1];
} Constraint4;

typedef struct {
  float4 m_worldPos[4];
  float4 m_worldNormal;
  u32 m_coeffs;
  int m_batchIdx;

  int m_bodyAPtrAndSignBit;
  int m_bodyBPtrAndSignBit;
} Contact4;

typedef struct {
  int m_nConstraints;
  int m_start;
  int m_batchIdx;
  int m_nSplit;

} ConstBuffer;

typedef struct {
  int m_solveFriction;
  int m_maxBatch;
  int m_batchIdx;
  int m_nSplit;

} ConstBufferBatchSolve;

typedef struct {
  int m_valInt0;
  int m_valInt1;
  int m_valInt2;
  int m_valInt3;

  float m_val0;
  float m_val1;
  float m_val2;
  float m_val3;
} SolverDebugInfo;

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void AA(__global Contact4* a, __global Contact4* b, __global int2* c, int4 d) {
  int e = d.x;
  int f = get_global_id(0);

  if (f < e) {
    int g = c[f].y;
    b[f] = a[g];
  }
}

typedef struct {
  int m_nContacts;
  int m_staticIdx;
  float m_scale;
  int m_nSplit;
} ConstBufferSSD;

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void AB(__global Contact4* a, __global Body* b, __global int2* c, int d, float e, int f)

{
  int g = get_global_id(0);

  if (g < d) {
    int h = abs(a[g].m_bodyAPtrAndSignBit);
    int i = abs(a[g].m_bodyBPtrAndSignBit);

    int j = (a[g].m_bodyAPtrAndSignBit < 0) ? i : h;
    float4 k = b[j].m_pos;
    int l = (int)((k.x - ((k.x < 0.f) ? 1.f : 0.f)) * e) & (f - 1);
    int m = (int)((k.z - ((k.z < 0.f) ? 1.f : 0.f)) * e) & (f - 1);

    c[g].x = (l + m * f);
    c[g].y = g;
  } else {
    c[g].x = 0xffffffff;
  }
}

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void AC(__global Contact4* a, __global Contact4* b, int4 c) {
  int d = get_global_id(0);
  if (d < c.x) {
    b[d] = a[d];
  }
}