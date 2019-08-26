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

void G(float4 a, float4 b, float4 c, float4* d, float4* e, float4* f);

void G(float4 a, float4 b, float4 c, float4* d, float4* e, float4* f) {
  *d = -a;
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
void J(const float4* a, float4* b, float4* c);
void J(const float4* a, float4* b, float4* c) {
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

void K(__global Body* a, __global Shape* b, __global Constraint4* c);
void K(__global Body* a, __global Shape* b, __global Constraint4* c) {
  float d = c[0].m_linear.w;
  int e = c[0].m_bodyA;
  int f = c[0].m_bodyB;

  float4 g = a[e].m_pos;
  float4 h = a[e].m_linVel;
  float4 i = a[e].m_angVel;
  float j = a[e].m_invMass;
  Matrix3x3 k = b[e].m_invInertia;

  float4 l = a[f].m_pos;
  float4 m = a[f].m_linVel;
  float4 n = a[f].m_angVel;
  float o = a[f].m_invMass;
  Matrix3x3 p = b[f].m_invInertia;

  {
    float q[4] = {0x1.fffffep127f, 0x1.fffffep127f, 0x1.fffffep127f, 0x1.fffffep127f};
    float r[4] = {0.f, 0.f, 0.f, 0.f};

    float s = 0;
    for (int t = 0; t < 4; t++) {
      s += c[0].m_appliedRambdaDt[t];
    }
    d = 0.7f;
    for (int t = 0; t < 4; t++) {
      q[t] = d * s;
      r[t] = -q[t];
    }

    {
      __global Constraint4* u = c;

      if (u->m_fJacCoeffInv[0] == 0 && u->m_fJacCoeffInv[0] == 0)
        return;
      const float4 v = u->m_center;

      float4 w = -u->m_linear;

      float4 x[2];
      J(&w, &x[0], &x[1]);
      float4 y, z, aa;
      float4 ab = v - g;
      float4 ac = v - l;
      for (int ad = 0; ad < 2; ad++) {
        G(x[ad], ab, ac, &aa, &y, &z);
        float ae = H(aa, -aa, y, z, h, i, m, n);
        ae *= u->m_fJacCoeffInv[ad];

        {
          float af = u->m_fAppliedRambdaDt[ad];
          float ag = af;
          ag += ae;
          ag = max(ag, r[ad]);
          ag = min(ag, q[ad]);
          ae = ag - af;
          u->m_fAppliedRambdaDt[ad] = ag;
        }

        float4 ah = j * aa * ae;
        float4 ai = o * (-aa) * ae;
        float4 aj = E(k, y) * ae;
        float4 ak = E(p, z) * ae;

        h += ah;
        i += aj;
        m += ai;
        n += ak;
      }
      {
        float4 al = D(l - g);
        float4 am = D(v - g);
        if (C(al, am) > 0.95f || (j == 0.f || o == 0.f)) {
          float an = C(w, i);
          float ao = C(w, n);

          i -= (an * 0.1f) * w;
          n -= (ao * 0.1f) * w;
        }
      }
    }
  }

  if (a[e].m_invMass) {
    a[e].m_linVel = h;
    a[e].m_angVel = i;
  } else {
    a[e].m_linVel = (float4)(0, 0, 0, 0);
    a[e].m_angVel = (float4)(0, 0, 0, 0);
  }
  if (a[f].m_invMass) {
    a[f].m_linVel = m;
    a[f].m_angVel = n;
  } else {
    a[f].m_linVel = (float4)(0, 0, 0, 0);
    a[f].m_angVel = (float4)(0, 0, 0, 0);
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

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void L(__global Body* a, __global Shape* b, __global Constraint4* c, __global int* d, __global int* e, int f, int g, int h) {
  __local int i;
  __local int j;
  __local int k;

  int l = get_local_id(0);
  int m = get_group_id(0);

  int n = (m / (h / 2)) * 2 + (g & 1);
  int o = (m % (h / 2)) * 2 + (g >> 1);
  int p = n + o * h;

  if (d[p] == 0)
    return;

  const int q = e[p];
  const int r = q + d[p];

  if (l == 0) {
    i = 0;
    j = 0;
    k = q;
  }

  barrier(1);

  int s = k + l;
  while (i < f) {
    for (; s < r;) {
      if (c[s].m_batchIdx == i) {
        K(a, b, &c[s]);

        s += 64;
      } else {
        break;
      }
    }
    barrier(1);
    if (l == 0) {
      i++;
    }
    barrier(1);
  }
}