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

__inline Matrix3x3 Z(Quaternion a);

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

__inline float4 AA(const Quaternion a, float4 b) {
  return X(Y(a), b);
}

__inline Matrix3x3 Z(Quaternion b) {
  float4 c = (float4)(bb bb bb 0.f);
  Matrix3x3 d;

  d.m_row[0].x = 1 - 2 * c.y - 2 * c.z;
  d.m_row[0].y = 2 * b.x * b.y - 2 * b.w * b.z;
  d.m_row[0].z = 2 * b.x * b.z + 2 * b.w * b.y;
  d.m_row[0].w = 0.f;

  d.m_row[1].x = 2 * b.x * b.y + 2 * b.w * b.z;
  d.m_row[1].y = 1 - 2 * c.x - 2 * c.z;
  d.m_row[1].z = 2 * b.y * b.z - 2 * b.w * b.x;
  d.m_row[1].w = 0.f;

  d.m_row[2].x = 2 * b.x * b.z - 2 * b.w * b.y;
  d.m_row[2].y = 2 * b.y * b.z + 2 * b.w * b.x;
  d.m_row[2].z = 1 - 2 * c.x - 2 * c.y;
  d.m_row[2].w = 0.f;

  return d;
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

void AB(float4 a, float4 b, float4 c, float4* d, float4* e, float4* f) {
  *d = -a;
  *e = -H(b, a);
  *f = H(c, a);
}

float AC(float4 a, float4 b, float4 c, float4 d, float4 e, float4 f, float4 g, float4 h) {
  return I(a, e) + I(c, f) + I(b, g) + I(d, h);
}

float AD(const float4 a, const float4 b, const float4 c, const float4 d, float e, const Matrix3x3* f, float g, const Matrix3x3* h) {
  float i = e;
  float j = I(U(c, *f), c);
  float k = g;
  float l = I(U(d, *h), d);
  return -1.f / (i + j + k + l);
}

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

typedef struct {
  int m_nContacts;
  int m_staticIdx;
  float m_scale;
  int m_nSplit;
} ConstBufferSSD;

void AE(float4 a, float4* b, float4* c);
void AE(float4 a, float4* b, float4* c) {
  if (__clc_fabs(a.z) > 0.70710678f) {
    float d = a.y * a.y + a.z * a.z;
    float e = 1.f / sqrt(d);
    b[0].x = 0;
    b[0].y = -a.z * e;
    b[0].z = a.y * e;

    c[0].x = d * e;
    c[0].y = -a.x * b[0].z;
    c[0].z = a.x * b[0].y;
  } else {
    float d = a.x * a.x + a.y * a.y;
    float e = 1.f / sqrt(d);
    b[0].x = -a.y * e;
    b[0].y = a.x * e;
    b[0].z = 0;

    c[0].x = -a.z * b[0].y;
    c[0].y = a.z * b[0].x;
    c[0].z = d * e;
  }
}

void AF(const float4 a, const float4 b, const float4 c, float d, const Matrix3x3 e, const float4 f, const float4 g, const float4 h, float i, const Matrix3x3 j, __global Contact4* k, float l, float m, float n, Constraint4* o) {
  o->m_bodyA = abs(k->m_bodyAPtrAndSignBit);
  o->m_bodyB = abs(k->m_bodyBPtrAndSignBit);

  float p = 1.f / l;
  for (int q = 0; q < 4; q++) {
    o->m_appliedRambdaDt[q] = 0.f;
  }
  o->m_fJacCoeffInv[0] = o->m_fJacCoeffInv[1] = 0.f;

  o->m_linear = -k->m_worldNormal;
  o->m_linear.w = 0.7f;
  for (int q = 0; q < 4; q++) {
    float4 r = k->m_worldPos[q] - a;
    float4 s = k->m_worldPos[q] - f;

    if (q >= k->m_worldNormal.w) {
      o->m_jacCoeffInv[q] = 0.f;
      continue;
    }

    float t;
    {
      float4 u, v, w;
      AB(k->m_worldNormal, r, s, &u, &v, &w);

      o->m_jacCoeffInv[q] = AD(u, -u, v, w, d, &e, i, &j);

      t = AC(u, -u, v, w, b, c, g, h);

      float x = 0.f;
      if (t * t < 0.004f)
        x = 0.f;

      o->m_b[q] = x * t;

      o->m_b[q] += (k->m_worldPos[q].w + m) * n * p;
      o->m_appliedRambdaDt[q] = 0.f;
    }
  }

  if (k->m_worldNormal.w > 0) {
    float4 y = (float4)(0.f);
    for (int z = 0; z < k->m_worldNormal.w; z++)
      y += k->m_worldPos[z];
    y /= (float)k->m_worldNormal.w;

    float4 aa[2];
    AE(k->m_worldNormal, &aa[0], &aa[1]);

    float4 ab[2];
    ab[0] = y - a;
    ab[1] = y - f;

    for (int z = 0; z < 2; z++) {
      float4 u, v, w;
      AB(aa[z], ab[0], ab[1], &u, &v, &w);

      o->m_fJacCoeffInv[z] = AD(u, -u, v, w, d, &e, i, &j);
      o->m_fAppliedRambdaDt[z] = 0.f;
    }
    o->m_center = y;
  }

  for (int z = 0; z < 4; z++) {
    if (z < k->m_worldNormal.w) {
      o->m_worldPos[z] = k->m_worldPos[z];
    } else {
      o->m_worldPos[z] = (float4)(0.f);
    }
  }
}

typedef struct {
  int m_nContacts;
  float m_dt;
  float m_positionDrift;
  float m_positionConstraintCoeff;
} ConstBufferCTC;

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void AG(__global Contact4* a, __global Body* b, __global Shape* c, __global Constraint4* d, int e, float f, float g, float h) {
  int i = get_global_id(0);

  if (i < e) {
    int j = abs(a[i].m_bodyAPtrAndSignBit);
    int k = abs(a[i].m_bodyBPtrAndSignBit);

    float4 l = b[j].m_pos;
    float4 m = b[j].m_linVel;
    float4 n = b[j].m_angVel;
    float o = b[j].m_invMass;
    Matrix3x3 p = c[j].m_invInertia;

    float4 q = b[k].m_pos;
    float4 r = b[k].m_linVel;
    float4 s = b[k].m_angVel;
    float t = b[k].m_invMass;
    Matrix3x3 u = c[k].m_invInertia;

    Constraint4 v;

    AF(l, m, n, o, p, q, r, s, t, u, &a[i], f, g, h, &v);

    v.m_batchIdx = a[i].m_batchIdx;

    d[i] = v;
  }
}