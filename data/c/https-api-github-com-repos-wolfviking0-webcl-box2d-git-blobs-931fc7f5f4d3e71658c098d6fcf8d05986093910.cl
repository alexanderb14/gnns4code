typedef struct b2clContactFeature {
  uchar indexA;
  uchar indexB;
  uchar typeA;
  uchar typeB;
} b2clContactFeature;

typedef union b2clContactID {
  b2clContactFeature cf;
  uint key;
} b2clContactID;
typedef struct b2clManifoldPoint {
  float2 localPoint;
  float normalImpulse;
  float tangentImpulse;
  b2clContactID id;
  float dummy;
} b2clManifoldPoint;
typedef struct b2clManifold {
  float2 localNormal;
  float2 localPoint;
  b2clManifoldPoint points[2];
  int type;
  int pointCount;

} b2clManifold;

typedef struct b2clFilter {
  unsigned short categoryBits;
  unsigned short maskBits;
  short groupIndex;
  short dummy;
} b2clFilter;
typedef struct b2clPolygonShape {
  float2 m_centroid;
  float2 m_vertices[8];
  float2 m_normals[8];
  int m_type;
  float m_radius;
  int m_vertexCount;
  int m_bIsSensor;
  b2clFilter m_filter;
} b2clPolygonShape;

typedef struct b2clTransform {
  float2 p;
  float2 q;
} b2clTransform;

typedef struct b2clSweep {
  float2 localCenter;
  float2 c0, c;
  float a0, a;

  float alpha0;
  float dummy;
} b2clSweep;

typedef struct b2clClipVertex {
  float2 v;
  b2clContactID id;
} b2clClipVertex;

typedef struct clb2Velocity {
  float vx;
  float vy;
  float w;
} clb2Velocity;

typedef struct clb2Position {
  float cx;
  float cy;
  float a;
} clb2Position;

typedef struct clb2Contact {
  int color;
  int indexA;
  int indexB;
  float friction;
  float2 normal;
  float invMassA;
  float invIA;
  float invMassB;
  float invIB;
} clb2Contact;

typedef struct clb2Impulse {
  float normalImpulse1;
  float tangentImpulse1;

  float normalImpulse2;
  float tangentImpulse2;
} clb2Impulse;

typedef struct clb2Points {
  float2 rA1;
  float2 rB1;
  float normalMass1;
  float tangentMass1;

  float2 rA2;
  float2 rB2;
  float normalMass2;
  float tangentMass2;

  float velocityBias1;
  float velocityBias2;
} clb2Points;

typedef struct b2clFixtureStatic {
  float m_friction;
  float m_restitution;
  int m_last_uid;
  int dummy;
} b2clFixtureStatic;

typedef struct b2clBodyStatic {
  float2 m_localCenter;
  float m_invMass;

  float m_invI;
  float m_linearDamping;
  float m_angularDamping;
  float m_gravityScale;
  float m_type;
  int m_connectedBodyIndices[8];
  int m_bIsBullet;
  int dummy;
} b2clBodyStatic;

typedef struct b2clBodyDynamic {
  b2clSweep m_sweep;

  float2 m_linearVelocity;
  float2 m_force;
  float m_angularVelocity;
  float m_torque;
  int m_last_uid;
  int dummy;
} b2clBodyDynamic;

typedef struct clb2Manifold {
  float2 localNormal;
  float2 localPoint;
  float2 localPoints1;
  float2 localPoints2;
  int pointCount;
  int type;
  float radiusA;
  float radiusB;
  float2 localCenterA;
  float2 localCenterB;
} clb2Manifold;

typedef struct {
  int type;
  int pointCount;
  float localPointX;
  float localPointY;
  float localNormalX;
  float localNormalY;
  float point0X;
  float point0Y;
  float point1X;
  float point1Y;
} clb2SDManifold;

typedef struct {
  int fixtureAIndex;
  int fixtureBIndex;
  int bodyAIndex;
  int bodyBIndex;
} clb2SDContact;

typedef struct {
  int bodyIndex;
  float posX;
  float posY;
  float posAngle;
  float xfX;
  float xfY;
  float xfS;
  float xfC;
  float alpha;
  float velocityX;
  float velocityY;
  float velocityAngular;
} clb2SDBody;

typedef struct clb2PositionSolverManifold {
  float2 normal;
  float2 point;
  float separation;
} clb2PositionSolverManifold;

typedef struct clb2Rotation {
  float s;
  float c;
} clb2Rotation;

typedef struct clb2Transform {
  clb2Rotation rotation;
  float2 translation;
} clb2Transform;

typedef struct b2clMat22 {
  float ex[2];
  float ey[2];
} b2clMat22;

typedef struct b2clMat33 {
  float ex[3];
  float ey[3];
  float ez[3];
} b2clMat33;

enum b2clLimitState { e_inactiveLimit, e_atLowerLimit, e_atUpperLimit, e_equalLimits };

enum b2JointType { e_unknownJoint, e_revoluteJoint, e_prismaticJoint, e_distanceJoint, e_pulleyJoint, e_mouseJoint, e_gearJoint, e_wheelJoint, e_weldJoint, e_frictionJoint, e_ropeJoint };

typedef struct b2clDistanceJointDatastruct {
  float frequencyHz;
  float dampingRatio;
  float bias;

  float localAnchorA[2];
  float localAnchorB[2];
  float gamma;
  float nlength;

  float u[2];
  float rA[2];
  float rB[2];
  float localCenterA[2];
  float localCenterB[2];
  float invMassA;
  float invMassB;
  float invIA;
  float invIB;
  float mass;
} b2clDistanceJointData;

typedef struct b2clRevoluteJointData {
  float localAnchorA[2];
  float localAnchorB[2];

  int enableMotor;
  float maxMotorTorque;
  float motorSpeed;

  int enableLimit;
  float referenceAngle;
  float lowerAngle;
  float upperAngle;

  float rA[2];
  float rB[2];
  float localCenterA[2];
  float localCenterB[2];
  float invMassA;
  float invMassB;
  float invIA;
  float invIB;
  b2clMat33 mass;
  float motorMass;
  int limitState;
} b2clRevoluteJointData;

typedef struct b2clPrismaticJointData {
  float localAnchorA[2];
  float localAnchorB[2];
  float localXAxisA[2];
  float localYAxisA[2];
  float referenceAngle;
  float lowerTranslation;
  float upperTranslation;
  float maxMotorForce;
  float motorSpeed;
  int enableLimit;
  int enableMotor;
  int limitState;

  float localCenterA[2];
  float localCenterB[2];
  float invMassA;
  float invMassB;
  float invIA;
  float invIB;
  float axis[2], perp[2];
  float s1, s2;
  float a1, a2;
  b2clMat33 K;
  float motorMass;
} b2clPrismaticJointData;

typedef struct b2clGearJointData {
  int joint1;
  int joint2;
  int typeA;
  int typeB;

  float localAnchorA[2];
  float localAnchorB[2];
  float localAnchorC[2];
  float localAnchorD[2];

  float localAxisC[2];
  float localAxisD[2];

  float referenceAngleA;
  float referenceAngleB;

  float gearConstant;
  float ratio;

  float lcA[2], lcB[2], lcC[2], lcD[2];
  float mA, mB, mC, mD;
  float iA, iB, iC, iD;
  float JvAC[2], JvBD[2];
  float JwA, JwB, JwC, JwD;
  float mass;
} b2clGearJointData;

typedef struct b2clPulleyJointData {
  float groundAnchorA[2];
  float groundAnchorB[2];
  float lengthA;
  float lengthB;
  float localAnchorA[2];
  float localAnchorB[2];
  float pulleyConstant;
  float ratio;
  float uA[2];
  float uB[2];
  float rA[2];
  float rB[2];
  float localCenterA[2];
  float localCenterB[2];
  float invMassA;
  float invMassB;
  float invIA;
  float invIB;
  float mass;
} b2clPulleyJointData;

typedef struct b2clRopeJointData {
  float localAnchorA[2];
  float localAnchorB[2];
  float maxLength;
  float nlength;
  float u[2];
  float rA[2];
  float rB[2];
  float localCenterA[2];
  float localCenterB[2];
  float invMassA;
  float invMassB;
  float invIA;
  float invIB;
  float mass;
  int limitState;
} b2clRopeJointData;

typedef struct b2clWheelJointData {
  float frequencyHz;
  float dampingRatio;

  float localAnchorA[2];
  float localAnchorB[2];
  float localXAxisA[2];
  float localYAxisA[2];

  float maxMotorTorque;
  float motorSpeed;
  int enableMotor;

  float localCenterA[2];
  float localCenterB[2];
  float invMassA;
  float invMassB;
  float invIA;
  float invIB;

  float ax[2], ay[2];
  float sAx, sBx;
  float sAy, sBy;

  float mass;
  float motorMass;
  float springMass;

  float bias;
  float gamma;
} b2clWheelJointData;

typedef struct b2clWeldJointData {
  float frequencyHz;
  float dampingRatio;
  float bias;

  float localAnchorA[2];
  float localAnchorB[2];
  float referenceAngle;
  float gamma;

  float rA[2];
  float rB[2];
  float localCenterA[2];
  float localCenterB[2];
  float invMassA;
  float invMassB;
  float invIA;
  float invIB;
  b2clMat33 mass;
} b2clWeldJointData;

typedef struct b2clMouseJointData {
  float localAnchorB[2];
  float targetA[2];
  float frequencyHz;
  float dampingRatio;
  float beta;

  float maxForce;
  float gamma;

  float rB[2];
  float localCenterB[2];
  float invMassB;
  float invIB;
  b2clMat22 mass;
  float C[2];
} b2clMouseJointData;

typedef struct b2clFrictionJointData {
  float localAnchorA[2];
  float localAnchorB[2];

  float maxForce;
  float maxTorque;

  float rA[2];
  float rB[2];
  float localCenterA[2];
  float localCenterB[2];
  float invMassA;
  float invMassB;
  float invIA;
  float invIB;
  b2clMat22 linearMass;
  float angularMass;
} b2clFrictionJointData;

typedef struct clJoint {
  int index;

  union a1 {
    struct x1 {
      float impulse[3];
    } x;
    struct y1 {
      float scalarImpulse;
      float springImpulse;
    } y;
    struct z1 {
      float linearImpulse[2];
      float angularImpulse;
    } z;
  } a;
  float motorImpulse;

  int color;
  int type;
  int collideConnected;

  int indexA, indexB, indexC, indexD;

  union b1 {
    b2clDistanceJointData distanceJointData;
    b2clRevoluteJointData revoluteJointData;
    b2clPrismaticJointData prismaticJointData;
    b2clGearJointData gearJointData;
    b2clPulleyJointData pulleyJointData;
    b2clRopeJointData ropeJointData;
    b2clWheelJointData wheelJointData;
    b2clWeldJointData weldJointData;
    b2clMouseJointData mouseJointData;
    b2clFrictionJointData frictionJointData;
  } b;
} b2clJoint;

typedef struct {
  int index;
  float nimpulse[4];
} b2clJointImpulseNode;

typedef struct {
  int isCollide;
  float normal[2];
  float fraction;
  unsigned int shapeIndex;
} b2clRayCastOutput;

typedef struct {
  float2 m_buffer[2];
  float2 m_vertices[8];
  int m_count;
  float m_radius;
} b2clDistanceProxy;

typedef struct {
  float metric;
  short count;
  unsigned char indexA[3];
  unsigned char indexB[3];
} b2clSimplexCache;

typedef struct {
  b2clDistanceProxy proxyA;
  b2clDistanceProxy proxyB;
  b2clTransform transformA;
  b2clTransform transformB;
  bool useRadii;
} b2clDistanceInput;

typedef struct {
  float2 pointA;
  float2 pointB;
  float ndistance;
  int iterations;
} b2clDistanceOutput;

typedef struct {
  b2clDistanceProxy proxyA;
  b2clDistanceProxy proxyB;
  b2clSweep sweepA;
  b2clSweep sweepB;
  float tMax;
  float dummy;
} b2clTOIInput;

enum b2clTOIOutputState { e_unknown, e_failed, e_overlapped, e_touching, e_separated };

typedef struct {
  int state;
  float t;
} b2clTOIOutput;

typedef struct {
  float2 wA;
  float2 wB;
  float2 w;
  float a;
  int indexA;
  int indexB;
} b2clSimplexVertex;

typedef struct {
  b2clSimplexVertex m_v1, m_v2, m_v3;
  int m_count;
} b2clSimplex;
inline float2 A(const float2 a, const float2 b) {
  float2 c;
  c.x = a.x * b.y + a.y * b.x;
  c.y = a.y * b.y - a.x * b.x;
  return c;
}

inline float2 B(const float2 a, const float2 b) {
  float2 c;
  c.x = a.y * b.x - a.x * b.y;
  c.y = a.y * b.y + a.x * b.x;
  return c;
}

inline float2 C(const float2 a, const float2 b) {
  float2 c;
  c.x = a.y * b.x - a.x * b.y;
  c.y = a.x * b.x + a.y * b.y;

  return c;
}

inline float2 D(const float2 a, const float2 b) {
  float2 c;
  c.x = a.y * b.x + a.x * b.y;
  c.y = -a.x * b.x + a.y * b.y;

  return c;
}

inline float2 E(const b2clTransform* a, const float2 b) {
  float2 c;
  c.x = (a->q.y * b.x - a->q.x * b.y) + a->p.x;
  c.y = (a->q.x * b.x + a->q.y * b.y) + a->p.y;

  return c;
}

inline float2 F(const b2clTransform* a, const float2 b) {
  float c = b.x - a->p.x;
  float d = b.y - a->p.y;
  float2 e;
  e.x = (a->q.y * c + a->q.x * d);
  e.y = (-a->q.x * c + a->q.y * d);

  return e;
}

inline b2clTransform G(const b2clTransform* a, const b2clTransform* b) {
  b2clTransform c;
  c.q = A(a->q, b->q);
  c.p = A(a->q, b->p) + a->p;
  return c;
}

inline b2clTransform H(const b2clTransform* a, const b2clTransform* b) {
  b2clTransform c;
  c.q = B(a->q, b->q);
  c.p = B(a->q, b->p - a->p);
  return c;
}

inline float I(const float2 a, const float2 b) {
  return a.x * b.x + a.y * b.y;
}

inline float J(const float2 a, const float2 b) {
  return a.x * b.y - a.y * b.x;
}

inline float2 K(const float2 a, float b) {
  return (float2)(b * a.y, -b * a.x);
}

inline float2 L(float a, const float2 b) {
  return (float2)(-a * b.y, a * b.x);
}

inline float M(float a, float b, float c) {
  return max(b, min(a, c));
}

inline float2 N(const float2 a, const float2 b) {
  return (float2)(min(a.x, b.x), min(a.y, b.y));
}

inline float2 O(const float2 a, const float2 b) {
  return (float2)(max(a.x, b.x), max(a.y, b.y));
}

inline float P(const float2 a, const float2 b) {
  float2 c = a - b;
  return I(c, c);
}

inline float Q(const float2 a, const float2 b) {
  float2 c = a - b;
  return sqrt(I(c, c));
}

inline float R(const float2 a) {
  return I(a, a);
}

inline float S(float a) {
  return a > 0.0f ? a : -a;
}

inline float T(const float3 a, const float3 b) {
  return a.x * b.x + a.y * b.y + a.z * b.z;
}

inline float3 U(const float3 a, const float3 b) {
  return (float3)(a.y * b.z - a.z * b.y, a.z * b.x - a.x * b.z, a.x * b.y - a.y * b.x);
}

inline float3 V(const b2clMat33 a, const float3 b) {
  float3 c = (float3)(ax[0], ax[1], ax[2]);
  float3 d = (float3)(ay[0], ay[1], ay[2]);
  float3 e = (float3)(az[0], az[1], az[2]);

  float f = T(c, U(d, e));

  if (f != 0.0f) {
    f = 1.0f / f;
  }
  float3 g;
  g.x = f * T(b, U(d, e));
  g.y = f * T(c, U(b, e));
  g.z = f * T(c, U(d, b));
  return g;
}

inline float2 W(const b2clMat33 a, const float2 b) {
  float2 c = (float2)(ax[0], ax[1]);
  float2 d = (float2)(ay[0], ay[1]);

  float e = c.x * d.y - d.x * c.y;
  if (e != 0.0f) {
    e = 1.0f / e;
  }
  float2 f;
  f.x = e * (d.y * b.x - d.x * b.y);
  f.y = e * (c.x * b.y - c.y * b.x);
  return f;
}

inline float2 X(const b2clMat22 a, const float2 b) {
  float2 c = (float2)(ax[0], ax[1]);
  float2 d = (float2)(ay[0], ay[1]);

  float e = c.x * d.y - d.x * c.y;
  if (e != 0.0f) {
    e = 1.0f / e;
  }
  float2 f;
  f.x = e * (d.y * b.x - d.x * b.y);
  f.y = e * (c.x * b.y - c.y * b.x);
  return f;
}

inline float2 Y(const b2clMat33 a, const float2 b) {
  return (float2)(a.ex[0] * b.x + a.ey[0] * b.y, a.ex[1] * b.x + a.ey[1] * b.y);
}

inline float2 Z(const b2clMat22 a, const float2 b) {
  return (float2)(a.ex[0] * b.x + a.ey[0] * b.y, a.ex[1] * b.x + a.ey[1] * b.y);
}

inline void AA(const b2clMat33 a, b2clMat33* b) {
  float c = a.ex[0], d = a.ey[0], e = a.ex[1], f = a.ey[1];
  float g = c * f - d * e;
  if (g != 0.0f) {
    g = 1.0f / g;
  }

  b->ex[0] = g * f;
  b->ey[0] = -g * d;
  b->ex[2] = 0.0f;
  b->ex[1] = -g * e;
  b->ey[1] = g * c;
  b->ey[2] = 0.0f;
  b->ez[0] = 0.0f;
  b->ez[1] = 0.0f;
  b->ez[2] = 0.0f;
}

inline void AB(const b2clMat33 a, b2clMat33* b) {
  float c = a.ex[0] * (a.ey[1] * a.ez[2] - a.ey[2] * a.ez[1]) + a.ex[1] * (a.ey[2] * a.ez[0] - a.ey[0] * a.ez[2]) + a.ex[2] * (a.ey[0] * a.ez[1] - a.ey[1] * a.ez[0]);

  if (c != 0.0f) {
    c = 1.0f / c;
  }

  float d = a.ex[0], e = a.ey[0], f = a.ez[0];
  float g = a.ey[1], h = a.ez[1];
  float i = a.ez[2];

  b->ex[0] = c * (g * i - h * h);
  b->ex[1] = c * (f * h - e * i);
  b->ex[2] = c * (e * h - f * g);

  b->ey[0] = b->ex[1];
  b->ey[1] = c * (d * i - f * f);
  b->ey[2] = c * (f * e - d * h);

  b->ez[0] = b->ex[2];
  b->ez[1] = b->ey[2];
  b->ez[2] = c * (d * g - e * e);
}

inline float2 AC(const b2clMat33 a, const float2 b) {
  return (float2)(a.ex[0] * b.x + a.ey[0] * b.y, a.ex[1] * b.x + a.ey[1] * b.y);
}

inline float3 AD(const b2clMat33 a, const float3 b) {
  return (float3)(a.ex[0] * b.x + a.ey[0] * b.y + a.ez[0] * b.z, a.ex[1] * b.x + a.ey[1] * b.y + a.ez[1] * b.z, a.ex[2] * b.x + a.ey[2] * b.y + a.ez[2] * b.z);
}

inline void AE(const b2clMat22 a, b2clMat22* b) {
  float c = a.ex[0], d = a.ey[0], e = a.ex[1], f = a.ey[1];
  float g = c * f - d * e;
  if (g != 0.0f) {
    g = 1.0f / g;
  }
  b->ex[0] = g * f;
  b->ey[0] = -g * d;
  b->ex[1] = -g * e;
  b->ey[1] = g * c;
}

inline void AF(b2clSweep* a) {
  float b = 2.0f * 3.14159265359f;
  float c = b * __clc_floor(a->a0 / b);
  a->a0 -= c;
  a->a -= c;
}

inline void AG(b2clSweep* a, b2clTransform* b, float c) {
  b->p = (1.0f - c) * a->c0 + c * a->c;
  float d = (1.0f - c) * a->a0 + c * a->a;
  b->q.x = sin(d);
  b->q.y = cos(d);

  b->p -= C(b->q, a->localCenter);
}

inline void AH(b2clSweep* a, float b) {
  float c = (b - a->alpha0) / (1.0f - a->alpha0);
  a->c0 = (1.0f - c) * a->c0 + c * a->c;
  a->a0 = (1.0f - c) * a->a0 + c * a->a;
  a->alpha0 = b;
}
inline void AI(b2clBodyDynamic* a, b2clTransform* b, float c) {
  AH(&(a->m_sweep), c);
  a->m_sweep.c = a->m_sweep.c0;
  a->m_sweep.a = a->m_sweep.a0;
  b->q.x = sin(a->m_sweep.a);
  b->q.y = cos(a->m_sweep.a);
  b->p = a->m_sweep.c - C(b->q, a->m_sweep.localCenter);
}

inline void AJ(b2clDistanceProxy* a, const b2clPolygonShape* b) {
  a->m_count = b->m_vertexCount;
  a->m_radius = b->m_radius;
  for (int c = 0; c < b->m_vertexCount; ++c) {
    a->m_vertices[c] = b->m_vertices[c];
  }
}

inline int AK(const b2clDistanceProxy* a, float2 b) {
  int c = 0;
  float d = I(a->m_vertices[0], b);
  for (int e = 1; e < a->m_count; ++e) {
    float f = I(a->m_vertices[e], b);
    if (f > d) {
      c = e;
      d = f;
    }
  }
  return c;
}

inline float2 AL(const b2clDistanceProxy* a, int b) {
  return a->m_vertices[b];
}

inline float AM(float2* a) {
  float b = sqrt(I(*a, *a));
  if (b < 0x1.0p-23f) {
    return 0.0f;
  }
  float c = 1.0f / b;
  (*a).x *= c;
  (*a).y *= c;

  return b;
}
float AN(const b2clPolygonShape* a, const b2clTransform* b, int c, const b2clPolygonShape* d, const b2clTransform* e, float4* f) {
  const float2* g = a->m_vertices;
  const float2* h = a->m_normals;

  int i = d->m_vertexCount;
  const float2* j = d->m_vertices;

  float2 k = C(b->q, h[c]);
  float2 l = D(e->q, k);

  int m = 0;
  float n = 0x1.fffffep127f;

  for (int o = 0; o < i; ++o) {
    float p = dot(j[o], l);
    if (p < n) {
      n = p;
      m = o;
    }
  }

  float2 q = E(b, g[c]);
  float2 r = E(e, j[m]);
  float s = dot(r - q, k);
  (*f).xy = j[m];
  (*f).zw = m;
  return s;
}

float AO(int* a, const b2clPolygonShape* b, const b2clTransform* c, const b2clPolygonShape* d, const b2clTransform* e, float4* f) {
  int g = b->m_vertexCount;
  const float2* h = b->m_normals;

  float2 i = E(e, d->m_centroid) - E(c, b->m_centroid);
  float2 j = D(c->q, i);

  (*f).x = b->m_centroid.x;
  (*f).y = b->m_centroid.y;
  (*f).z = d->m_centroid.x;
  (*f).w = d->m_centroid.y;

  int k = 0;
  float l = -0x1.fffffep127f;
  for (int m = 0; m < g; ++m) {
    float n = dot(h[m], j);
    if (n > l) {
      l = n;
      k = m;
    }
  }

  float4 o;

  float p = AN(b, c, k, d, e, &o);

  int q = k - 1 >= 0 ? k - 1 : g - 1;
  float r = AN(b, c, q, d, e, &o);

  int s = k + 1 < g ? k + 1 : 0;
  float t = AN(b, c, s, d, e, &o);

  int u;
  float v;
  int w;
  if (r > p && r > t) {
    w = -1;
    u = q;
    v = r;
  } else if (t > p) {
    w = 1;
    u = s;
    v = t;
  } else {
    *a = k;
    return p;
  }

  for (;;) {
    if (w == -1)
      k = u - 1 >= 0 ? u - 1 : g - 1;
    else
      k = u + 1 < g ? u + 1 : 0;

    p = AN(b, c, k, d, e, &o);

    if (p > v) {
      u = k;
      v = p;
    } else {
      break;
    }
  }

  *a = u;

  return v;
}

void AP(b2clClipVertex a[2], const b2clPolygonShape* b, const b2clTransform* c, int d, const b2clPolygonShape* e, const b2clTransform* f) {
  const float2* g = b->m_normals;

  int h = e->m_vertexCount;
  const float2* i = e->m_vertices;
  const float2* j = e->m_normals;

  float2 k = D(f->q, C(c->q, g[d]));

  int l = 0;
  float m = 0x1.fffffep127f;
  for (int n = 0; n < h; ++n) {
    float o = dot(k, j[n]);
    if (o < m) {
      m = o;
      l = n;
    }
  }

  int p = l;
  int q = p + 1 < h ? p + 1 : 0;

  a[0].v = E(f, i[p]);
  a[0].id.cf.indexA = (uint)d;
  a[0].id.cf.indexB = (uint)p;
  a[0].id.cf.typeA = 1;
  a[0].id.cf.typeB = 0;

  a[1].v = E(f, i[q]);
  a[1].id.cf.indexA = (uint)d;
  a[1].id.cf.indexB = (uint)q;
  a[1].id.cf.typeA = 1;
  a[1].id.cf.typeB = 0;
}

int AQ(b2clClipVertex a[2], const b2clClipVertex b[2], const float2 c, float d, int e) {
  int f = 0;

  float g = dot(c, b[0].v) - d;
  float h = dot(c, b[1].v) - d;

  if (g <= 0.0f)
    a[f++] = b[0];
  if (h <= 0.0f)
    a[f++] = b[1];

  if (g * h < 0.0f) {
    float i = g / (g - h);
    a[f].v = b[0].v + i * (b[1].v - b[0].v);

    a[f].id.cf.indexA = e;
    a[f].id.cf.indexB = b[0].id.cf.indexB;
    a[f].id.cf.typeA = 0;
    a[f].id.cf.typeB = 1;
    ++f;
  }

  return f;
}
__kernel void AR(__global b2clManifold* a, const __global b2clPolygonShape* b, const __global b2clTransform* c, const __global int4* d, const int e) {
  unsigned int f = get_global_id(0);

  if (f >= e)
    return;

  b2clManifold g;

  g.pointCount = 0;
  int h;

  int4 i;
  b2clPolygonShape j, k;
  b2clTransform l, m;

  i = d[f];
  j = b[i.x];
  k = b[i.y];
  l = c[i.z];
  m = c[i.w];

  float n = j.m_radius + k.m_radius;

  float4 o;

  int p = 0;
  float q = AO(&p, &j, &l, &k, &m, &o);

  if (q > n) {
    a[f] = g;
    return;
  }

  int r = 0;
  float s = AO(&r, &k, &m, &j, &l, &o);
  if (s > n) {
    a[f] = g;
    return;
  }

  const b2clPolygonShape* t;
  const b2clPolygonShape* u;
  b2clTransform *v, *w;
  int x;
  uint y;
  const float z = 0.98f;
  const float aa = 0.001f;

  if (s > z * q + aa) {
    t = &k;
    u = &j;
    v = &m;
    w = &l;
    x = r;
    g.type = 2;
    y = 1;
  } else {
    t = &j;
    u = &k;
    v = &l;
    w = &m;
    x = p;
    g.type = 1;
    y = 0;
  }

  b2clClipVertex ab[2];
  AP(ab, t, v, x, u, w);

  int ac = t->m_vertexCount;
  const float2* ad = t->m_vertices;

  int ae = x;
  int af = x + 1 < ac ? x + 1 : 0;

  float2 ag = ad[ae];
  float2 ah = ad[af];

  float2 ai = ah - ag;
  ai = normalize(ai);

  float2 aj = K(ai, 1.0f);
  float2 ak = 0.5f * (ag + ah);

  float2 al = C(v->q, ai);
  float2 am = K(al, 1.0f);

  ag = E(v, ag);
  ah = E(v, ah);

  float an = dot(am, ag);

  float ao = -dot(al, ag) + n;
  float ap = dot(al, ah) + n;

  b2clClipVertex aq[2];
  b2clClipVertex ar[2];
  int as;

  as = AQ(aq, ab, -al, ao, ae);

  if (as < 2) {
    a[f] = g;
    return;
  }

  as = AQ(ar, aq, al, ap, af);

  if (as < 2) {
    a[f] = g;
    return;
  }

  g.localNormal = aj;
  g.localPoint = ak;

  int at = 0;
  for (int au = 0; au < 2; ++au) {
    float av = dot(am, ar[au].v) - an;

    if (av <= n) {
      b2clManifoldPoint* aw = g.points + at;
      aw->localPoint = F(w, ar[au].v);
      aw->id = ar[au].id;
      if (y) {
        b2clContactFeature ax = aw->id.cf;
        aw->id.cf.indexA = ax.indexB;
        aw->id.cf.indexB = ax.indexA;
        aw->id.cf.typeA = ax.typeB;
        aw->id.cf.typeB = ax.typeA;
      }
      ++at;
    }
  }

  g.pointCount = at;

  for (int au = 0; au < g.pointCount; ++au) {
    b2clManifoldPoint* ay = g.points + au;
    ay->normalImpulse = 0.0f;
    ay->tangentImpulse = 0.0f;
    int az = ay->id.key;

    b2clManifold ba = a[f];
    for (int bb = 0; bb < ba.pointCount; ++bb) {
      b2clManifoldPoint* bc = ba.points + bb;

      if (bc->id.key == az) {
        ay->normalImpulse = bc->normalImpulse;
        ay->tangentImpulse = bc->tangentImpulse;
        break;
      }
    }
  }

  a[f] = g;
}

__kernel void AS(__global b2clManifold* a, const __global b2clPolygonShape* b, const __global b2clTransform* c, const __global int4* d, const __global int* e, const int f, const int g) {
  unsigned int h = get_global_id(0);

  if (h >= g)
    return;

  b2clManifold i;

  i.pointCount = 0;
  int j;

  int k;
  int4 l;
  b2clPolygonShape m, n;
  b2clTransform o, p;

  k = e[h];
  l = d[k];
  m = b[l.x];
  n = b[l.y];
  o = c[l.z];
  p = c[l.w];

  float q = m.m_radius + n.m_radius;

  float2 r = E(&o, m.m_centroid) - E(&p, n.m_centroid);
  float s = I(r, r);

  if (s > q * q) {
    a[k] = i;
    return;
  }

  i.type = 0;
  i.localPoint = m.m_centroid;
  i.localNormal = 0;
  i.pointCount = 1;

  i.points[0].localPoint = n.m_centroid;
  i.points[0].id.key = 0;

  a[k] = i;
}

__kernel void AT(const __global int* a, __global int* b, __global int* c) {
  *c = a[0];
  if (*c)
    b[0] = 0;
}