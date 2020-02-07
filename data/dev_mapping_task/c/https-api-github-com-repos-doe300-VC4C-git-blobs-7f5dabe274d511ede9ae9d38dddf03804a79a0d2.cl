__inline float A(float4 a, float4 b) {
  float4 c = (float4)(a.xyz, 0.f);
  float4 d = (float4)(b.xyz, 0.f);
  return dot(c, d);
}

typedef float4 Quaternion;

typedef struct { float4 m_row[3]; } Matrix3x3;

__inline float4 B(Matrix3x3 a, float4 b);

__inline float4 C(float4 a, Matrix3x3 b);

__inline float4 B(Matrix3x3 a, float4 b) {
  float4 c;
  c.x = A(a.m_row[0], b);
  c.y = A(a.m_row[1], b);
  c.z = A(a.m_row[2], b);
  c.w = 0.f;
  return c;
}

__inline float4 C(float4 a, Matrix3x3 b) {
  float4 c = (float4)(b.m_row[0].x, b.m_row[1].x, b.m_row[2].x, 0);
  float4 d = (float4)(b.m_row[0].y, b.m_row[1].y, b.m_row[2].y, 0);
  float4 e = (float4)(b.m_row[0].z, b.m_row[1].z, b.m_row[2].z, 0);

  float4 f;
  f.x = A(a, c);
  f.y = A(a, d);
  f.z = A(a, e);
  return f;
}

typedef struct {
  Matrix3x3 m_invInertiaWorld;
  Matrix3x3 m_initInvInertia;
} BodyInertia;

typedef struct {
  Matrix3x3 m_basis;
  float4 m_origin;
} b3Transform;

typedef struct {
  float4 m_deltaLinearVelocity;
  float4 m_deltaAngularVelocity;
  float4 m_angularFactor;
  float4 m_linearFactor;
  float4 m_invMass;
  float4 m_pushVelocity;
  float4 m_turnVelocity;
  float4 m_linearVelocity;
  float4 m_angularVelocity;

  union {
    void* m_originalBody;
    int m_originalBodyIndex;
  };
  int padding[3];

} b3GpuSolverBody;

typedef struct {
  float4 m_pos;
  Quaternion m_quat;
  float4 m_linVel;
  float4 m_angVel;

  unsigned int m_shapeIdx;
  float m_invMass;
  float m_restituitionCoeff;
  float m_frictionCoeff;
} b3RigidBodyCL;

typedef struct {
  float4 m_relpos1CrossNormal;
  float4 m_contactNormal;

  float4 m_relpos2CrossNormal;

  float4 m_angularComponentA;
  float4 m_angularComponentB;

  float m_appliedPushImpulse;
  float m_appliedImpulse;
  int m_padding1;
  int m_padding2;
  float m_friction;
  float m_jacDiagABInv;
  float m_rhs;
  float m_cfm;

  float m_lowerLimit;
  float m_upperLimit;
  float m_rhsPenetration;
  int m_originalConstraint;

  int m_overrideNumSolverIterations;
  int m_frictionIndex;
  int m_solverBodyIdA;
  int m_solverBodyIdB;

} b3SolverConstraint;

typedef struct {
  int m_bodyAPtrAndSignBit;
  int m_bodyBPtrAndSignBit;
  int m_originalConstraintIndex;
  int m_batchId;
} b3BatchConstraint;

typedef struct {
  int m_constraintType;
  int m_rbA;
  int m_rbB;
  float m_breakingImpulseThreshold;

  float4 m_pivotInA;
  float4 m_pivotInB;
  Quaternion m_relTargetAB;

  int m_flags;
  int m_padding[3];
} b3GpuGenericConstraint;
__inline float4 D(float4 a, float4 b) {
  return cross(a, b);
}

__inline float4 E(float4 a) {
  a = (float4)(a.xyz, 0.f);
  return fast_normalize(a);
}

__inline Quaternion F(Quaternion a, Quaternion b);

__inline Quaternion G(Quaternion a);

__inline float4 H(Quaternion a, float4 b);

__inline Quaternion I(Quaternion a);

__inline Quaternion F(Quaternion a, Quaternion b) {
  Quaternion c;
  c = D(a, b);
  c += a.w * b + b.w * a;

  c.w = a.w * b.w - A(a, b);
  return c;
}

__inline Quaternion G(Quaternion a) {
  return E(a);
}
__inline float4 H(Quaternion a, float4 b) {
  Quaternion c = I(a);
  float4 d = b;
  d.w = 0.f;
  float4 e = F(F(a, d), c);
  return e;
}

__inline Quaternion I(Quaternion a) {
  return (Quaternion)(-a.xyz, a.w);
}

__inline void J(__global b3GpuSolverBody* a, float4 b, float4 c, float d) {
  a->m_deltaLinearVelocity += b * d * a->m_linearFactor;
  a->m_deltaAngularVelocity += c * (d * a->m_angularFactor);
}

void K(__global b3GpuSolverBody* a, __global b3GpuSolverBody* b, __global b3SolverConstraint* c) {
  float d = c->m_rhs - c->m_appliedImpulse * c->m_cfm;
  float e = A(c->m_contactNormal, a->m_deltaLinearVelocity) + A(c->m_relpos1CrossNormal, a->m_deltaAngularVelocity);
  float f = -A(c->m_contactNormal, b->m_deltaLinearVelocity) + A(c->m_relpos2CrossNormal, b->m_deltaAngularVelocity);

  d -= e * c->m_jacDiagABInv;
  d -= f * c->m_jacDiagABInv;

  float g = c->m_appliedImpulse + d;
  if (g < c->m_lowerLimit) {
    d = c->m_lowerLimit - c->m_appliedImpulse;
    c->m_appliedImpulse = c->m_lowerLimit;
  } else if (g > c->m_upperLimit) {
    d = c->m_upperLimit - c->m_appliedImpulse;
    c->m_appliedImpulse = c->m_upperLimit;
  } else {
    c->m_appliedImpulse = g;
  }

  J(a, c->m_contactNormal * a->m_invMass, c->m_angularComponentA, d);
  J(b, -c->m_contactNormal * b->m_invMass, c->m_angularComponentB, d);
}

__kernel void L(__global b3GpuSolverBody* a, __global b3BatchConstraint* b, __global b3SolverConstraint* c, __global unsigned int* d, __global unsigned int* e, __global b3GpuGenericConstraint* f, int g, int h) {
  int i = get_global_id(0);
  if (i >= h)
    return;

  __global b3BatchConstraint* j = &b[i + g];
  int k = j->m_originalConstraintIndex;
  if (f[k].m_flags & 1) {
    int l = d[k];
    int m = e[k];
    for (int n = 0; n < l; n++) {
      __global b3SolverConstraint* o = &c[m + n];
      K(&a[o->m_solverBodyIdA], &a[o->m_solverBodyIdB], o);
    }
  }
};

__kernel void M(__global b3GpuSolverBody* a, __global b3RigidBodyCL* b, int c) {
  int d = get_global_id(0);
  if (d >= c)
    return;

  __global b3GpuSolverBody* e = &a[d];
  __global b3RigidBodyCL* f = &b[d];

  e->m_deltaLinearVelocity = (float4)(0.f, 0.f, 0.f, 0.f);
  e->m_deltaAngularVelocity = (float4)(0.f, 0.f, 0.f, 0.f);
  e->m_pushVelocity = (float4)(0.f, 0.f, 0.f, 0.f);
  e->m_pushVelocity = (float4)(0.f, 0.f, 0.f, 0.f);
  e->m_invMass = (float4)(fnvMass, fnvMass, fnvMass, 0.f);
  e->m_originalBodyIndex = d;
  e->m_angularFactor = (float4)(1, 1, 1, 0);
  e->m_linearFactor = (float4)(1, 1, 1, 0);
  e->m_linearVelocity = f->m_linVel;
  e->m_angularVelocity = f->m_angVel;
}

__kernel void N(__global b3GpuGenericConstraint* a, __global unsigned int* b, __global unsigned int* c, __global b3SolverConstraint* d, int e) {
  int f = get_global_id(0);
  if (f >= e)
    return;
  int g = b[f];
  if (g) {
    for (int h = 0; h < g; h++) {
      int i = c[f] + h;
      float j = a[f].m_breakingImpulseThreshold;
      if (__clc_fabs(d[i].m_appliedImpulse) >= j) {
        a[f].m_flags = 0;
      }
    }
  }
}

__kernel void O(__global unsigned int* a, __global b3GpuGenericConstraint* b, int c) {
  int d = get_global_id(0);
  if (d >= c)
    return;

  __global b3GpuGenericConstraint* e = &b[d];

  switch (e->m_constraintType) {
    case 3: {
      a[d] = 3;
      break;
    }
    case 4: {
      a[d] = 6;
      break;
    }
    default: {}
  }
}

__kernel void P(__global unsigned int* a, __global unsigned int* b, __global b3BatchConstraint* c, __global b3GpuGenericConstraint* d, __global b3RigidBodyCL* e, int f) {
  int g = get_global_id(0);
  if (g >= f)
    return;

  int h = d[g].m_rbA;
  int i = d[g].m_rbB;

  c[g].m_bodyAPtrAndSignBit = e[h].m_invMass != 0.f ? h : -h;
  c[g].m_bodyBPtrAndSignBit = e[i].m_invMass != 0.f ? i : -i;
  c[g].m_batchId = -1;
  c[g].m_originalConstraintIndex = g;
}

typedef struct {
  float fps, erp;

  union {
    __global float4* m_J1linearAxisFloat4;
    __global float* m_J1linearAxis;
  };
  union {
    __global float4* m_J1angularAxisFloat4;
    __global float* m_J1angularAxis;
  };
  union {
    __global float4* m_J2linearAxisFloat4;
    __global float* m_J2linearAxis;
  };
  union {
    __global float4* m_J2angularAxisFloat4;
    __global float* m_J2angularAxis;
  };

  int rowskip;

  __global float* m_constraintError;
  __global float* cfm;

  __global float* m_lowerLimit;
  __global float* m_upperLimit;

  __global int* findex;

  int m_numIterations;

  float m_damping;
} b3GpuConstraintInfo2;

void Q(float4 a, __global float4* b, __global float4* c, __global float4* d) {
  *b = (float4)(0., -aa.f);
  *c = (float4)(a0., -a.f);
  *d = (float4)(-aa0.f, 0.f);
}

void R(__global b3GpuGenericConstraint* a, b3GpuConstraintInfo2* b, __global b3RigidBodyCL* c) {
  float4 d = c[a->m_rbA].m_pos;
  Quaternion e = c[a->m_rbA].m_quat;

  float4 f = c[a->m_rbB].m_pos;
  Quaternion g = c[a->m_rbB].m_quat;

  b->m_J1linearAxis[0] = 1;
  b->m_J1linearAxis[b->rowskip + 1] = 1;
  b->m_J1linearAxis[2 * b->rowskip + 2] = 1;

  float4 h = H(e, a->m_pivotInA);

  {
    __global float4* i = (__global float4*)(b->m_J1angularAxis);
    __global float4* j = (__global float4*)(b->m_J1angularAxis + b->rowskip);
    __global float4* k = (__global float4*)(b->m_J1angularAxis + 2 * b->rowskip);
    float4 l = -h;
    Q(l, i, j, k);
  }
  if (b->m_J2linearAxis) {
    b->m_J2linearAxis[0] = -1;
    b->m_J2linearAxis[b->rowskip + 1] = -1;
    b->m_J2linearAxis[2 * b->rowskip + 2] = -1;
  }

  float4 m = H(g, a->m_pivotInB);

  {
    __global float4* i = (__global float4*)(b->m_J2angularAxis);
    __global float4* j = (__global float4*)(b->m_J2angularAxis + b->rowskip);
    __global float4* k = (__global float4*)(b->m_J2angularAxis + 2 * b->rowskip);
    Q(m, i, j, k);
  }

  float n = b->erp;

  float o = b->fps * n;
  int p;
  float4 q = m + f - h - d;
  float* r = &q;

  for (p = 0; p < 3; p++) {
    b->m_constraintError[p * b->rowskip] = o * (r[p]);
  }
}

Quaternion S(Quaternion a, Quaternion b) {
  Quaternion c, d;
  c = a - b;
  d = a + b;

  if (dot(c, c) < dot(d, d))
    return b;
  return (-b);
}

float T(float a) {
  if (a < -1)
    a = -1;
  if (a > 1)
    a = 1;
  return acos(a);
}

float U(Quaternion a) {
  if (a.w >= 1.f)
    a.w = 1.f;
  float b = 2.f * T(a.w);
  return b;
}

void V(Quaternion a, Quaternion b, float4* c, float* d) {
  Quaternion e = S(a, b);

  Quaternion f = F(e, I(a));
  *d = U(f);
  *c = (float4)(fff0.f);

  float g = A(*c, *c);
  if (g < 0x1.0p-23f * 0x1.0p-23f)
    *c = (float4)(1, 0, 0, 0);
  else
    *c /= sqrt(g);
}

void W(__global b3GpuGenericConstraint* a, b3GpuConstraintInfo2* b, __global b3RigidBodyCL* c, int d) {
  Quaternion e = c[a->m_rbA].m_quat;
  Quaternion f = c[a->m_rbB].m_quat;

  int g = b->rowskip;
  int h = d * g;

  b->m_J1angularAxis[h] = 1;
  b->m_J1angularAxis[h + g + 1] = 1;
  b->m_J1angularAxis[h + g * 2 + 2] = 1;
  if (b->m_J2angularAxis) {
    b->m_J2angularAxis[h] = -1;
    b->m_J2angularAxis[h + g + 1] = -1;
    b->m_J2angularAxis[h + g * 2 + 2] = -1;
  }

  float i = b->erp;
  float j = b->fps * i;
  float4 k;
  float l;
  float4 m = F(e, I(f));

  V(a->m_relTargetAB, m, &k, &l);
  k *= -l;

  float* n = &k;

  for (int o = 0; o < 3; o++) {
    b->m_constraintError[(3 + o) * b->rowskip] = j * n[o];
  }
}

__kernel void X(__global b3RigidBodyCL* a, __global b3GpuSolverBody* b, int c) {
  int d = get_global_id(0);
  if (d >= c)
    return;

  if (a[d].m_invMass) {
    { a[d].m_linVel += b[d].m_deltaLinearVelocity; }

    { a[d].m_angVel += b[d].m_deltaAngularVelocity; }
  }
}

__kernel void Y(__global b3SolverConstraint* a, __global unsigned int* b, __global unsigned int* c, __global b3GpuGenericConstraint* d, __global b3BatchConstraint* e, __global b3RigidBodyCL* f, __global BodyInertia* g, __global b3GpuSolverBody* h, float i, float j, float k, float l, int m, int n) {
  int o = get_global_id(0);
  if (o >= n)
    return;

  int p = b[o];

  __global b3SolverConstraint* q = &a[c[o]];
  __global b3GpuGenericConstraint* r = &d[o];

  __global b3RigidBodyCL* s = &f[r->m_rbA];
  __global b3RigidBodyCL* t = &f[r->m_rbB];

  int u = r->m_rbA;
  int v = r->m_rbB;

  __global b3GpuSolverBody* w = &h[u];
  __global b3GpuSolverBody* x = &h[v];

  if (s->m_invMass) {
    e[o].m_bodyAPtrAndSignBit = u;
  } else {
    e[o].m_bodyAPtrAndSignBit = -u;
  }

  if (t->m_invMass) {
    e[o].m_bodyBPtrAndSignBit = v;
  } else {
    e[o].m_bodyBPtrAndSignBit = -v;
  }

  if (p) {
    int y = 0;

    int z;
    for (z = 0; z < p; z++) {
      q[z].m_angularComponentA = (float4)(0, 0, 0, 0);
      q[z].m_angularComponentB = (float4)(0, 0, 0, 0);
      q[z].m_appliedImpulse = 0.f;
      q[z].m_appliedPushImpulse = 0.f;
      q[z].m_cfm = 0.f;
      q[z].m_contactNormal = (float4)(0, 0, 0, 0);
      q[z].m_friction = 0.f;
      q[z].m_frictionIndex = 0;
      q[z].m_jacDiagABInv = 0.f;
      q[z].m_lowerLimit = 0.f;
      q[z].m_upperLimit = 0.f;

      q[z].m_originalConstraint = o;
      q[z].m_overrideNumSolverIterations = 0;
      q[z].m_relpos1CrossNormal = (float4)(0, 0, 0, 0);
      q[z].m_relpos2CrossNormal = (float4)(0, 0, 0, 0);
      q[z].m_rhs = 0.f;
      q[z].m_rhsPenetration = 0.f;
      q[z].m_solverBodyIdA = 0;
      q[z].m_solverBodyIdB = 0;

      q[z].m_lowerLimit = -1e30f;
      q[z].m_upperLimit = 1e30f;
      q[z].m_appliedImpulse = 0.f;
      q[z].m_appliedPushImpulse = 0.f;
      q[z].m_solverBodyIdA = u;
      q[z].m_solverBodyIdB = v;
      q[z].m_overrideNumSolverIterations = y;
    }

    w->m_deltaLinearVelocity = (float4)(0, 0, 0, 0);
    w->m_deltaAngularVelocity = (float4)(0, 0, 0, 0);
    w->m_pushVelocity = (float4)(0, 0, 0, 0);
    w->m_turnVelocity = (float4)(0, 0, 0, 0);
    x->m_deltaLinearVelocity = (float4)(0, 0, 0, 0);
    x->m_deltaAngularVelocity = (float4)(0, 0, 0, 0);
    x->m_pushVelocity = (float4)(0, 0, 0, 0);
    x->m_turnVelocity = (float4)(0, 0, 0, 0);

    int aa = sizeof(b3SolverConstraint) / sizeof(float);

    b3GpuConstraintInfo2 ab;
    ab.fps = 1.f / i;
    ab.erp = j;
    ab.m_J1linearAxisFloat4 = &q->m_contactNormal;
    ab.m_J1angularAxisFloat4 = &q->m_relpos1CrossNormal;
    ab.m_J2linearAxisFloat4 = 0;
    ab.m_J2angularAxisFloat4 = &q->m_relpos2CrossNormal;
    ab.rowskip = sizeof(b3SolverConstraint) / sizeof(float);

    ab.m_constraintError = &q->m_rhs;
    q->m_cfm = k;
    ab.m_damping = l;
    ab.cfm = &q->m_cfm;
    ab.m_lowerLimit = &q->m_lowerLimit;
    ab.m_upperLimit = &q->m_upperLimit;
    ab.m_numIterations = m;

    switch (r->m_constraintType) {
      case 3: {
        R(r, &ab, f);
        break;
      }
      case 4: {
        R(r, &ab, f);

        W(r, &ab, f, 3);

        break;
      }

      default: {}
    }

    for (z = 0; z < p; z++) {
      __global b3SolverConstraint* ac = &q[z];

      if (ac->m_upperLimit >= r->m_breakingImpulseThreshold) {
        ac->m_upperLimit = r->m_breakingImpulseThreshold;
      }

      if (ac->m_lowerLimit <= -r->m_breakingImpulseThreshold) {
        ac->m_lowerLimit = -r->m_breakingImpulseThreshold;
      }

      Matrix3x3 ad = g[r->m_rbA].m_invInertiaWorld;
      {
        float4 ae = ac->m_relpos1CrossNormal;
        ac->m_angularComponentA = B(ad, ae);
      }

      Matrix3x3 af = g[r->m_rbB].m_invInertiaWorld;
      {
        float4 ag = ac->m_relpos2CrossNormal;
        ac->m_angularComponentB = B(af, ag);
      }

      {
        float4 ah = ac->m_contactNormal * s->m_invMass;
        float4 ai = C(ac->m_relpos1CrossNormal, ad);
        float4 aj = ac->m_contactNormal * t->m_invMass;
        float4 ak = C(ac->m_relpos2CrossNormal, af);

        float al = A(ah, ac->m_contactNormal);
        al += A(ai, ac->m_relpos1CrossNormal);
        al += A(aj, ac->m_contactNormal);
        al += A(ak, ac->m_relpos2CrossNormal);
        float am = __clc_fabs(al);
        if (am > 0x1.0p-23f) {
          ac->m_jacDiagABInv = 1.f / al;
        } else {
          ac->m_jacDiagABInv = 0.f;
        }
      }

      {
        float an;
        float ao = A(ac->m_contactNormal, s->m_linVel) + A(ac->m_relpos1CrossNormal, s->m_angVel);
        float ap = -A(ac->m_contactNormal, t->m_linVel) + A(ac->m_relpos2CrossNormal, t->m_angVel);

        an = ao + ap;

        float aq = 0.f;
        float ar = ac->m_rhs;
        float as = aq - an * ab.m_damping;
        float at = ar * ac->m_jacDiagABInv;
        float au = as * ac->m_jacDiagABInv;
        ac->m_rhs = at + au;
        ac->m_appliedImpulse = 0.f;
      }
    }
  }
}