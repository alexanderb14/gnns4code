typedef unsigned int u32; typedef unsigned short u16; typedef unsigned char u8; __inline float4 A(float4 a) {
  return fast_normalize(a);
}

__inline float4 B(float4 a, float4 b) {
  return cross(a, b);
}

__inline float C(float4 a, float4 b) {
  float4 c = (float4)(a.xyz, 0.f);
  float4 d = (float4)(b.xyz, 0.f);
  return dot(c, d);
}

__inline float4 D(const float4 a) {
  float4 b = (float4)(a.x, a.y, a.z, 0.f);
  return A(b);
}
typedef struct { float4 m_row[3]; } Matrix3x3;

__inline float4 E(Matrix3x3 a, float4 b);

__inline float4 F(float4 a, Matrix3x3 b);

__inline float4 E(Matrix3x3 a, float4 b) {
  float4 c;
  c.x = C(a.m_row[0], b);
  c.y = C(a.m_row[1], b);
  c.z = C(a.m_row[2], b);
  c.w = 0.f;
  return c;
}

__inline float4 F(float4 a, Matrix3x3 b) {
  float4 c = (float4)(b.m_row[0].x, b.m_row[1].x, b.m_row[2].x, 0);
  float4 d = (float4)(b.m_row[0].y, b.m_row[1].y, b.m_row[2].y, 0);
  float4 e = (float4)(b.m_row[0].z, b.m_row[1].z, b.m_row[2].z, 0);

  float4 f;
  f.x = C(a, c);
  f.y = C(a, d);
  f.z = C(a, e);
  return f;
}

typedef float4 Quaternion;
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

void G(float4 a, float4 b, float4 c, float4* d, float4* e, float4* f);

void G(float4 a, float4 b, float4 c, float4* d, float4* e, float4* f) {
  *d = (float4)(-a.xyz, 0.f);
  *e = -B(b, a);
  *f = B(c, a);
}

float H(float4 a, float4 b, float4 c, float4 d, float4 e, float4 f, float4 g, float4 h);

float H(float4 a, float4 b, float4 c, float4 d, float4 e, float4 f, float4 g, float4 h) {
  return C(a, e) + C(c, f) + C(b, g) + C(d, h);
}

float I(const float4 a, const float4 b, const float4 c, const float4 d, float e, const Matrix3x3* f, float g, const Matrix3x3* h);

float I(const float4 a, const float4 b, const float4 c, const float4 d, float e, const Matrix3x3* f, float g, const Matrix3x3* h) {
  float i = e;
  float j = C(F(c, *f), c);
  float k = g;
  float l = C(F(d, *h), d);
  return -1.f / (i + j + k + l);
}

void J(__global Constraint4* a, float4 b, float4* c, float4* d, float e, Matrix3x3 f, float4 g, float4* h, float4* i, float j, Matrix3x3 k);

void J(__global Constraint4* a, float4 b, float4* c, float4* d, float e, Matrix3x3 f, float4 g, float4* h, float4* i, float j, Matrix3x3 k) {
  float l = 0;
  float m = 0x1.fffffep127f;

  for (int n = 0; n < 4; n++) {
    if (a->m_jacCoeffInv[n] == 0.f)
      continue;

    float4 o, p, q;
    float4 r = a->m_worldPos[n] - b;
    float4 s = a->m_worldPos[n] - g;
    G(-a->m_linear, r, s, &q, &o, &p);

    float t = H(a->m_linear, -a->m_linear, o, p, *c, *d, *h, *i) + a->m_b[n];
    t *= a->m_jacCoeffInv[n];

    {
      float u = a->m_appliedRambdaDt[n];
      float v = u;
      v += t;
      v = max(v, l);
      v = min(v, m);
      t = v - u;
      a->m_appliedRambdaDt[n] = v;
    }

    float4 w = e * q * t;
    float4 x = j * (-q) * t;
    float4 y = E(f, o) * t;
    float4 z = E(k, p) * t;

    *c += w;
    *d += y;
    *h += x;
    *i += z;
  }
}

void K(const float4* a, float4* b, float4* c);
void K(const float4* a, float4* b, float4* c) {
  if (__clc_fabs(a[0].z) > 0.70710678f) {
    float d = a[0].y * a[0].y + a[0].z * a[0].z;
    float e = 1.f / sqrt(d);
    b[0].x = 0;
    b[0].y = -a[0].z * e;
    b[0].z = a[0].y * e;

    c[0].x = d * e;
    c[0].y = -a[0].x * b[0].z;
    c[0].z = a[0].x * b[0].y;
  } else {
    float d = a[0].x * a[0].x + a[0].y * a[0].y;
    float e = 1.f / sqrt(d);
    b[0].x = -a[0].y * e;
    b[0].y = a[0].x * e;
    b[0].z = 0;

    c[0].x = -a[0].z * b[0].y;
    c[0].y = a[0].z * b[0].x;
    c[0].z = d * e;
  }
}

void L(__global Body* a, __global Shape* b, __global Constraint4* c);
void L(__global Body* a, __global Shape* b, __global Constraint4* c) {
  int d = c[0].m_bodyA;
  int e = c[0].m_bodyB;

  float4 f = a[d].m_pos;
  float4 g = a[d].m_linVel;
  float4 h = a[d].m_angVel;
  float i = a[d].m_invMass;
  Matrix3x3 j = b[d].m_invInertia;

  float4 k = a[e].m_pos;
  float4 l = a[e].m_linVel;
  float4 m = a[e].m_angVel;
  float n = a[e].m_invMass;
  Matrix3x3 o = b[e].m_invInertia;

  J(c, f, &g, &h, i, j, k, &l, &m, n, o);

  if (a[d].m_invMass) {
    a[d].m_linVel = g;
    a[d].m_angVel = h;
  } else {
    a[d].m_linVel = (float4)(0, 0, 0, 0);
    a[d].m_angVel = (float4)(0, 0, 0, 0);
  }
  if (a[e].m_invMass) {
    a[e].m_linVel = l;
    a[e].m_angVel = m;
  } else {
    a[e].m_linVel = (float4)(0, 0, 0, 0);
    a[e].m_angVel = (float4)(0, 0, 0, 0);
  }
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

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void M(__global Body* a, __global Shape* b, __global Constraint4* c, __global int* d, __global int* e, __global int* f, int g, int h, int4 i) {
  __local int j;
  __local int k;
  __local int l;

  int m = get_local_id(0);
  int n = get_group_id(0);
  int o = (n / ((i.x * i.y) / 4)) * 2 + ((h & 4) >> 2);
  int p = (n % ((i.x * i.y) / 4));
  int q = (p / (i.x / 2)) * 2 + ((h & 2) >> 1);
  int r = (p % (i.x / 2)) * 2 + (h & 1);
  int s = r + q * i.x + o * (i.x * i.y);

  if (d[s] == 0)
    return;

  int t = f[s];

  const int u = e[s];
  const int v = u + d[s];

  if (m == 0) {
    j = 0;
    k = 0;
    l = u;
  }

  barrier(1);

  int w = l + m;
  while (j < t) {
    for (; w < v;) {
      if (c[w].m_batchIdx == j) {
        L(a, b, &c[w]);

        w += 64;
      } else {
        break;
      }
    }
    barrier(1);

    if (m == 0) {
      j++;
    }
    barrier(1);
  }
}

__kernel void N(__global Body* a, __global Shape* b, __global Constraint4* c, int d, int e, int f) {
  int g = get_global_id(0);
  if (g < f) {
    int h = e + g;
    L(a, b, &c[h]);
  }
}