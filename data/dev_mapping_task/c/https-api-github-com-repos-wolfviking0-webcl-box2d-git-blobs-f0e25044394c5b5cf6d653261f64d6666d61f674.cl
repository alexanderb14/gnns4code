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
typedef struct {
  float m_min[2];
  float m_max[2];
  uchar m_sType;
  uchar m_bType;

} b2clAABB;

uint AN(float a) {
  uint b = __builtin_astype(a, uint);
  uint c = -(int)(b >> 31) | 0x80000000;
  return b ^ c;
}

float AO(uint a) {
  uint b = ((a >> 31) - 1) | 0x80000000;
  uint c = a ^ b;
  return __builtin_astype(c, float);
}

bool AP(const b2clAABB* a, __local const b2clAABB* b) {
  bool c = true;
  c = (a->m_min[0] > b->m_max[0] || a->m_max[0] < b->m_min[0]) ? false : c;
  c = (a->m_min[1] > b->m_max[1] || a->m_max[1] < b->m_min[1]) ? false : c;
  return c;
}

bool AQ(const b2clAABB* a, __global const b2clAABB* b) {
  bool c = true;

  c = (a->m_min[0] > b->m_max[0] || a->m_max[0] < b->m_min[0]) ? false : c;
  c = (a->m_min[1] > b->m_max[1] || a->m_max[1] < b->m_min[1]) ? false : c;
  return c;
}
bool AR(int a, int b, const __global int* c, const __global int* d) {
  int e;
  const __global int* f;
  if (a < b) {
    e = b;
    f = c;
  } else {
    e = a;
    f = d;
  }

  for (int g = 0; g < 8; ++g) {
    if (f[g] == e)
      return false;
    if (f[g] == -1)
      return true;
  }
  return true;
}

bool AS(ushort a, ushort b, short c, ushort d, ushort e, short f) {
  if (c == f && c != 0) {
    return c > 0;
  }

  bool g = (b & d) != 0 && (a & e) != 0;
  return g;
}

__kernel void AT(const __global b2clPolygonShape* a, const __global b2clBodyStatic* b, const __global b2clTransform* c, __global b2clAABB* d, const __global int* e, int f) {
  int g = get_global_id(0);

  if (g >= f)
    return;

  b2clPolygonShape h = a[g];
  int i = e[g];
  b2clTransform j = c[i];
  b2clBodyStatic k = b[i];

  const float2* l = h.m_vertices;

  float2 m = E(&j, l[0]);
  float2 n = m;

  if (h.m_type > 0) {
    float2 o = E(&j, l[1]);
    m = N(m, o);
    n = O(n, o);
  }

  if (h.m_type == 2) {
    for (int p = 2; p < h.m_vertexCount; ++p) {
      float2 o = E(&j, l[p]);
      m = N(m, o);
      n = O(n, o);
    }
  }

  float q = h.m_radius;

  d[g].m_min[0] = m.x - q;
  d[g].m_min[1] = m.y - q;
  d[g].m_max[0] = n.x + q;
  d[g].m_max[1] = n.y + q;

  d[g].m_sType = h.m_type;
  d[g].m_bType = k.m_type;
}

__kernel void AU(const __global b2clPolygonShape* a, const __global b2clBodyStatic* b, const __global b2clBodyDynamic* c, const __global b2clTransform* d, __global b2clAABB* e, const __global int* f, int g) {
  int h = get_global_id(0);

  if (h >= g)
    return;

  b2clPolygonShape i = a[h];
  int j = f[h];
  b2clTransform k = d[j];
  b2clBodyStatic l = b[j];
  b2clBodyDynamic m = c[j];

  const float2* n = i.m_vertices;

  float2 o = E(&k, n[0]);
  float2 p = o;

  if (i.m_type > 0) {
    float2 q = E(&k, n[1]);
    o = N(o, q);
    p = O(p, q);
  }

  if (i.m_type == 2) {
    for (int r = 2; r < i.m_vertexCount; ++r) {
      float2 q = E(&k, n[r]);
      o = N(o, q);
      p = O(p, q);
    }
  }

  float s = i.m_radius;

  float t, u;
  float2 v, w;
  float2 x, y, z, aa, ab;

  t = m.m_sweep.a0;
  u = m.m_sweep.a;
  v = m.m_sweep.c0;
  w = m.m_sweep.c;

  float ac, ad;

  ac = sincos(t, &ad);
  y.x = ac;
  y.y = ad;

  x = v - C(y, l.m_localCenter);

  ac = sincos(u, &ad);
  aa.x = ac;
  aa.y = ad;

  z = w - C(aa, l.m_localCenter);

  ab = (z - x) * 2.0f;
  if (ab.x < 0.0f) {
    o.x += ab.x;
  } else {
    p.x += ab.x;
  }

  if (ab.y < 0.0f) {
    o.y += ab.y;
  } else {
    p.y += ab.y;
  }

  e[h].m_min[0] = o.x - s;
  e[h].m_min[1] = o.y - s;
  e[h].m_max[0] = p.x + s;
  e[h].m_max[1] = p.y + s;

  e[h].m_sType = i.m_type;
  e[h].m_bType = l.m_type;
}

__kernel void AV(__global const b2clAABB* a, __global float4* b,

                 int c) {
  int d = get_global_id(0);
  if (d > c)
    return;
  float2 e, f;
  e.x = (a[d].m_max[0] + a[d].m_min[0]) * 0.5f;
  e.y = (a[d].m_max[1] + a[d].m_min[1]) * 0.5f;
  f = e * e;
 b[d] = (float4)(e, f;
}

__kernel void AW(__global const b2clAABB* a, __global float* b, __global float* c, __global float* d, __global float* e, int f) {
  int g = get_global_id(0);
  if (g > f)
    return;
  float2 h, i;
  h.x = (a[g].m_max[0] + a[g].m_min[0]) * 0.5f;
  h.y = (a[g].m_max[1] + a[g].m_min[1]) * 0.5f;
  i = h * h;
  b[g] = h.x;
  c[g] = h.y;
  d[g] = i.x;
  e[g] = i.y;
}

__kernel void AX(__global const b2clAABB* a, __global uint* b, __global uint* c, int d, int e, int f) {
  int g = get_global_id(0);
  if (g >= d) {
    if (g < f)
      b[g] = 0;
    return;
  }

  b[g] = AN(a[g].m_max[e]);
  c[g] = g;
}

__kernel void AY(const __global b2clAABB* a,

                 const __global b2clBodyStatic* b, const __global b2clPolygonShape* c, __global int4* d, volatile __global int* e, const __global uint* f, const __global int* g, volatile __global int* h, volatile __global int* i, int j, int k, int l) {
  int m = get_global_id(0);

  if (m >= j)
    return;

  int n, o, p, q, r, s;
  b2clAABB t, u;
  n = f[m];
  p = g[n];
  t = a[n];
  r = a[n].m_bType;
  unsigned short v = c[n].m_filter.categoryBits;
  unsigned short w = c[n].m_filter.maskBits;
  short x = c[n].m_filter.groupIndex;

  for (int y = m + 1; y < j; y++) {
    o = f[y];

    if (t.m_min[k] > (a[o].m_max[k])) {
      break;
    }

    q = g[o];
    s = a[o].m_bType;

    if (p == q)
      continue;

    bool z = AQ(&t, &a[o]) && (r == 2 || s == 2);

    z &= AR(p, q, b[p].m_connectedBodyIndices, b[q].m_connectedBodyIndices);

    unsigned short aa = c[o].m_filter.categoryBits;
    unsigned short ab = c[o].m_filter.maskBits;
    short ac = c[o].m_filter.groupIndex;
    z &= AS(v, w, x, aa, ab, ac);

    int4 ad;
    int ae;
    int af, ag;
    if (z) {
      ad.x = n;
      ad.y = o;
      ad.z = p;
      ad.w = q;

      int ah = t.m_sType;
      int ai = a[o].m_sType;
      if (ah == 0) {
        if (ai == 0) {
          ae = 0;
        } else if (ai == 1) {
          ae = 3;

          ad.x = o;
          ad.y = n;
          ad.z = q;
          ad.w = p;
        } else {
          ae = 1;

          ad.x = o;
          ad.y = n;
          ad.z = q;
          ad.w = p;
        }
      } else if (ah == 1) {
        if (ai == 0) {
          ae = 3;
        } else if (ai == 1) {
        } else {
          ae = 4;
        }
      } else {
        if (ai == 0) {
          ae = 1;
        } else if (ai == 1) {
          ae = 4;

          ad.x = o;
          ad.y = n;
          ad.z = q;
          ad.w = p;
        } else {
          ae = 2;
        }
      }

      af = atomic_add(h + ae, 1);
      ag = atomic_add(i, 1);
      if (ag < l) {
        d[ag] = ad;
        e[l * ae + af] = ag;
      }
    }
  }
}

__kernel void AZ(const __global b2clAABB* a, const __global b2clBodyStatic* b, const __global b2clPolygonShape* c, __global int4* d, __global int* e, __global int* f, const __global uint* g, const __global int* h, int i, int j, int k, int l) {
  int m = get_global_id(0);

  if (m >= i)
    return;

  int n = m * k;

  int o, p, q, r, s, t;
  o = g[m];
  q = h[o];
  s = a[o].m_bType;

  unsigned short u = c[o].m_filter.categoryBits;
  unsigned short v = c[o].m_filter.maskBits;
  short w = c[o].m_filter.groupIndex;

  int x = 0;

  int y[5];
  for (int z = 0; z < 5; z++)
    y[z] = 0;

  for (int aa = m + 1; aa < i; aa++) {
    p = g[aa];
    if (a[o].m_min[j] > (a[p].m_max[j])) {
      break;
    }

    r = h[p];
    t = a[p].m_bType;

    if (q == r)
      continue;

    bool ab = 1;

    ab &= AR(q, r, b[q].m_connectedBodyIndices, b[r].m_connectedBodyIndices);

    unsigned short ac = c[p].m_filter.categoryBits;
    unsigned short ad = c[p].m_filter.maskBits;
    short ae = c[p].m_filter.groupIndex;
    ab &= AS(u, v, w, ac, ad, ae);

    int4 af;
    int ag;
    if (ab) {
      af.x = o;
      af.y = p;
      af.z = q;
      af.w = r;

      int ah = a[o].m_sType;
      int ai = a[p].m_sType;
      if (ah == 0) {
        if (ai == 0) {
          ag = 0;
        } else if (ai == 1) {
          ag = 3;

          af.x = p;
          af.y = o;
          af.z = r;
          af.w = q;
        } else {
          ag = 1;

          af.x = p;
          af.y = o;
          af.z = r;
          af.w = q;
        }
      } else if (ah == 1) {
        if (ai == 0) {
          ag = 3;
        } else if (ai == 1) {
        } else {
          ag = 4;
        }
      } else {
        if (ai == 0) {
          ag = 1;
        } else if (ai == 1) {
          ag = 4;

          af.x = p;
          af.y = o;
          af.z = r;
          af.w = q;
        } else {
          ag = 2;
        }
      }

      if (x < l) {
        d[n + x] = af;
        e[l * ag + n + y[ag]] = n + x;
        f[l * ag + n + y[ag]] = 1;
        x++;
        y[ag]++;
      }
    }
  }
}

__kernel void BA(__global const b2clAABB* a, const __global b2clBodyStatic* b, const __global b2clPolygonShape* c, __global int4* d, __global int4* e, const __global uint* f, const __global int* g, volatile __global int* h, volatile __global int* i, int j, int k, int l) {
  int m = get_global_id(0);

  int n = get_local_id(0);

  __local int o[1];
  __local int p[1];
  __local int q[256 * 2];
  __local b2clAABB r[256 * 2];
  __local int s[256 * 2];
  __local int t[256 * 2];

  if (n == 0) {
    o[0] = 0;
    p[0] = 0;
  }
  int u = 0;
  int v = 0;

  int w, x, y, z, aa;
  b2clAABB ab;
  int ac, ad, ae;

  w = f[0];
  x = m < j ? f[m] : w;
  ac = x;
  q[n] = ac;
  z = (m + 256) < j ? f[m + 256] : w;
  q[n + 256] = z;

  ab = a[x];
  float af = ab.m_max[k];
  r[n] = ab;
  r[n + 256] = a[z];

  y = g[x];
  ad = y;
  s[n] = ad;
  aa = g[z];
  s[n + 256] = aa;

  ae = b[y].m_type;
  t[n] = ae;
  t[n + 256] = b[aa].m_type;

  barrier(1);
  atomic_add(o, 1);
  barrier(1);
  int ag = 0;

  int ah = m + 1;
  do {
    barrier(1);

    if (ah < j) {
      if (af < (r[u + n + 1].m_min[k])) {
        if (!ag) {
          atomic_add(p, 1);
          ag = 1;
        }
      }
    }

    barrier(1);

    if (ah >= j && !ag) {
      atomic_add(p, 1);
      ag = 1;
    }
    barrier(1);

    if (!ag) {
      bool ai = AP(&ab, &r[u + n + 1]) && (ae != 0 || t[u + n + 1] != 0);
      if (ai) {
        int4 aj;
        aj.x = ac;
        aj.y = q[u + n + 1];
        aj.z = ad;
        aj.w = s[u + n + 1];
        int ak = atomic_add(h, 1);
        if (ak < l) {
          e[ak] = aj;
        }
      }
    }

    barrier(1);

    u++;
    if (u == 256) {
      u = 0;
      v += 256;

      x = (m + v) < j ? f[m + v] : w;
      q[n] = x;
      z = (m + v + 256) < j ? f[m + v + 256] : w;
      q[n + 256] = z;

      r[n] = a[x];
      r[n + 256] = a[z];

      y = g[x];
      s[n] = y;
      aa = g[z];
      s[n + 256] = aa;

      t[n] = b[y].m_type;
      t[n + 256] = b[aa].m_type;
    }
    ah++;

  } while (p[0] < o[0]);
}
__kernel void BB(float4 a, const __global b2clAABB* b, const __global uint* c, int d, volatile __global int* e, volatile __global int* f, __global unsigned int* g, __global unsigned int* h) {
  int i = get_global_id(0);

  if (i >= d)
    return;

  unsigned int j = c[i];

  b2clAABB k;
  k.m_min[0] = a.x;
  k.m_min[1] = a.y;
  k.m_max[0] = a.z;
  k.m_max[1] = a.w;

  if (b[j].m_min[0] > k.m_max[0] || b[j].m_max[0] < k.m_min[0] || b[j].m_min[1] > k.m_max[1] || b[j].m_max[1] < k.m_min[1])
    return;

  unsigned int l = b[j].m_sType;

  int m = atomic_add(e + l, 1);
  int n = atomic_add(f, 1);

  g[n] = j;
  h[n] = l;
}
__kernel void BC(float4 a, const __global b2clPolygonShape* b, const __global unsigned int* c, const __global b2clTransform* d, const __global int* e, int f, int g, __global b2clRayCastOutput* h) {
  int i = get_global_id(0) + f;

  if (i >= f + g)
    return;

  __global b2clRayCastOutput* j = h + i;

  unsigned int k = c[i];
  const b2clPolygonShape l = b[k];
  unsigned int m = e[k];
  const b2clTransform n = d[m];

  j->shapeIndex = k;

  float2 o = E(&n, l.m_centroid);
  float2 p = (float2)(a, a) - o;
  float q = I(p, p) - l.m_radius * l.m_radius;

  float2 r = (float2)(a, a) - (float2)(a, a);
  float s = I(p, r);
  float t = I(r, r);
  float u = s * s - t * q;

  if (u < 0.0f || t < 0x1.0p-23f) {
    j->isCollide = 0;
    return;
  }

  float v = -(s + sqrt(u));

  if (0.0f <= v && v <= 1.0f * t) {
    v /= t;
    j->fraction = v;
    float2 w = normalize(p + v * r);
    j->normal[0] = w.x;
    j->normal[1] = w.y;
    j->isCollide = 1;
  } else {
    j->isCollide = 0;
  }
}
__kernel void BD(float4 a, const __global b2clPolygonShape* b, const __global unsigned int* c, const __global b2clTransform* d, const __global int* e, int f, int g, __global b2clRayCastOutput* h) {
  int i = get_global_id(0) + f;

  if (i >= f + g)
    return;

  __global b2clRayCastOutput* j = h + i;

  unsigned int k = c[i];
  const b2clPolygonShape l = b[k];
  unsigned int m = e[k];
  const b2clTransform n = d[m];

  j->shapeIndex = k;

  float2 o = D(n.q, (float2)(a, a) - n.p);
  float2 p = D(n.q, (float2)(a, a) - n.p);
  float2 q = p - o;

  float2 r = l.m_vertices[0];
  float2 s = l.m_vertices[1];
  float2 t = s - r;
  float2 u = normalize((float2)(t.y, -t.x));

  float v = I(u, r - o);
  float w = I(u, q);

  if (w == 0.0f) {
    j->isCollide = 0;
    return;
  }

  float x = v / w;
  if (x < 0.0f || 1.0f < x) {
    j->isCollide = 0;
    return;
  }

  float2 y = o + x * q;

  float2 z = s - r;
  float aa = I(z, z);
  if (aa == 0.0f) {
    j->isCollide = 0;
    return;
  }

  float ab = I(y - r, z) / aa;
  if (ab < 0.0f || 1.0f < ab) {
    j->isCollide = 0;
    return;
  }

  j->fraction = x;
  if (v > 0.0f) {
    j->normal[0] = -u.x;
    j->normal[1] = -u.y;
  } else {
    j->normal[0] = u.x;
    j->normal[1] = u.y;
  }
  j->isCollide = 1;

  return;
}
__kernel void BE(float4 a, const __global b2clPolygonShape* b, const __global unsigned int* c, const __global b2clTransform* d, const __global int* e, int f, int g, __global b2clRayCastOutput* h) {
  int i = get_global_id(0) + f;

  if (i >= f + g)
    return;

  __global b2clRayCastOutput* j = h + i;

  unsigned int k = c[i];
  const b2clPolygonShape l = b[k];
  unsigned int m = e[k];
  const b2clTransform n = d[m];

  j->shapeIndex = k;

  float2 o = D(n.q, (float2)(a, a) - n.p);
  float2 p = D(n.q, (float2)(a, a) - n.p);
  float2 q = p - o;

  float r = 0.0f, s = 1.0f;

  int t = -1;

  for (int i = 0; i < l.m_vertexCount; ++i) {
    float u = I(l.m_normals[i], l.m_vertices[i] - o);
    float v = I(l.m_normals[i], q);

    if (v == 0.0f) {
      if (u < 0.0f) {
        j->isCollide = 0;
        return;
      }
    } else {
      if (v < 0.0f && u < r * v) {
        r = u / v;
        t = i;
      } else if (v > 0.0f && u < s * v) {
        s = u / v;
      }
    }

    if (s < r) {
      j->isCollide = 0;
      return;
    }
  }

  if (t >= 0) {
    j->fraction = r;
    float2 w = C(n.q, l.m_normals[t]);
    j->normal[0] = w.x;
    j->normal[1] = w.y;
    j->isCollide = 1;
  } else {
    j->isCollide = 0;
  }
}

__kernel void BF(float4 a, const __global b2clPolygonShape* b, const __global unsigned int* c, const __global b2clTransform* d, const __global int* e, int f, int g, __global b2clRayCastOutput* h) {
  int i = get_global_id(0) + f;

  if (i >= f + g)
    return;

  __global b2clRayCastOutput* j = h + i;

  j->isCollide = 0;
}