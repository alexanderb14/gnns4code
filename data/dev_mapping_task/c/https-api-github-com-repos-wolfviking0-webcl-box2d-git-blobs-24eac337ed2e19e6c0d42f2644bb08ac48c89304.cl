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
  int type;
  int index;
  float separation;
} b2clEPAxis;

typedef struct {
  float2 vertices[8];
  float2 normals[8];
  int count;
} b2clTempPolygon;

typedef struct {
  int i1, i2;

  float2 v1, v2;

  float2 normal;

  float2 sideNormal1;
  float sideOffset1;

  float2 sideNormal2;
  float sideOffset2;
} b2clReferenceFace;

float AN(const b2clPolygonShape* a, const b2clTransform* b, int c, const b2clPolygonShape* d, const b2clTransform* e) {
  const float2* f = a->m_vertices;
  const float2* g = a->m_normals;

  int h = d->m_vertexCount;
  const float2* i = d->m_vertices;

  float2 j = C(b->q, g[c]);
  float2 k = D(e->q, j);

  int l = 0;
  float m = 0x1.fffffep127f;

  for (int n = 0; n < h; ++n) {
    float o = dot(i[n], k);
    if (o < m) {
      m = o;
      l = n;
    }
  }

  float2 p = E(b, f[c]);
  float2 q = E(e, i[l]);
  float r = dot(q - p, j);

  return r;
}

float AO(int* a, const b2clPolygonShape* b, const b2clTransform* c, const b2clPolygonShape* d, const b2clTransform* e) {
  int f = b->m_vertexCount;
  const float2* g = b->m_normals;

  float2 h = E(e, d->m_centroid) - E(c, b->m_centroid);
  float2 i = D(c->q, h);

  int j = 0;
  float k = -0x1.fffffep127f;
  for (int l = 0; l < f; ++l) {
    float m = dot(g[l], i);
    if (m > k) {
      k = m;
      j = l;
    }
  }

  float n = AN(b, c, j, d, e);

  int o = j - 1 >= 0 ? j - 1 : f - 1;
  float p = AN(b, c, o, d, e);

  int q = j + 1 < f ? j + 1 : 0;
  float r = AN(b, c, q, d, e);

  int s;
  float t;
  int u;
  if (p > n && p > r) {
    u = -1;
    s = o;
    t = p;
  } else if (r > n) {
    u = 1;
    s = q;
    t = r;
  } else {
    *a = j;
    return n;
  }

  for (;;) {
    if (u == -1)
      j = s - 1 >= 0 ? s - 1 : f - 1;
    else
      j = s + 1 < f ? s + 1 : 0;

    n = AN(b, c, j, d, e);

    if (n > t) {
      s = j;
      t = n;
    } else {
      break;
    }
  }

  *a = s;

  return t;
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

inline b2clEPAxis AR(bool a, b2clTempPolygon* b, float2 c, float2 d) {
  b2clEPAxis e;
  e.type = 1;
  e.index = a ? 0 : 1;
  e.separation = 0x1.fffffep127f;

  for (int f = 0; f < b->count; ++f) {
    float g = I(c, b->vertices[f] - d);
    if (g < e.separation) {
      e.separation = g;
    }
  }

  return e;
}

inline b2clEPAxis AS(float2 a, b2clTempPolygon* b, float2 c, float2 d, float2 e, float2 f, float g) {
  b2clEPAxis h;
  h.type = 0;
  h.index = -1;
  h.separation = -0x1.fffffep127f;

  float2 i = (float2)afor(int j = 0; j < b->count; ++j) {
    float2 k = -b->normals[j];

    float l = I(k, b->vertices[j] - c);
    float m = I(k, b->vertices[j] - d);
    float n = min(l, m);

    if (n > g) {
      h.type = 2;
      h.index = j;
      h.separation = n;
      return h;
    }

    if (I(k, i) >= 0.0f) {
      if (I(k - e, a) < -(2.0f / 180.0f * 3.14159265359f)) {
        continue;
      }
    } else {
      if (I(k - f, a) < -(2.0f / 180.0f * 3.14159265359f)) {
        continue;
      }
    }

    if (n > h.separation) {
      h.type = 2;
      h.index = j;
      h.separation = n;
    }
  }

  return h;
}
__kernel void AT(__global b2clManifold* a, __global int* b,

                 const __global b2clPolygonShape* c, const __global b2clTransform* d, const __global int4* e, const __global int* f, const int g, const int h) {
  unsigned int i = get_global_id(0);

  if (i >= h)
    return;

  b2clManifold j;

  j.pointCount = 0;
  j.points[0].normalImpulse = 0;
  j.points[0].tangentImpulse = 0;
  j.points[1].normalImpulse = 0;
  j.points[1].tangentImpulse = 0;
  int k;

  int l;
  int4 m;
  b2clPolygonShape n, o;
  b2clTransform p, q;

  l = f[i + g * 2];
  m = e[l];
  n = c[m.x];
  o = c[m.y];
  p = d[m.z];
  q = d[m.w];
  bool r = n.m_bIsSensor || o.m_bIsSensor;

  float s = n.m_radius + o.m_radius;

  int t = 0;
  float u = AO(&t, &n, &p, &o, &q);

  if (u > s) {
    a[l] = j;
    b[l] = 0;
    return;
  }

  int v = 0;
  float w = AO(&v, &o, &q, &n, &p);
  if (w > s) {
    a[l] = j;
    b[l] = 0;
    return;
  }

  const b2clPolygonShape* x;
  const b2clPolygonShape* y;
  b2clTransform *z, *aa;
  int ab;
  uint ac;
  const float ad = 0.98f;
  const float ae = 0.001f;

  if (w > ad * u + ae) {
    x = &o;
    y = &n;
    z = &q;
    aa = &p;
    ab = v;
    j.type = 2;
    ac = 1;
  } else {
    x = &n;
    y = &o;
    z = &p;
    aa = &q;
    ab = t;
    j.type = 1;
    ac = 0;
  }

  b2clClipVertex af[2];
  AP(af, x, z, ab, y, aa);

  int ag = x->m_vertexCount;
  const float2* ah = x->m_vertices;

  int ai = ab;
  int aj = ab + 1 < ag ? ab + 1 : 0;

  float2 ak = ah[ai];
  float2 al = ah[aj];

  float2 am = al - ak;
  am = normalize(am);

  float2 an = K(am, 1.0f);
  float2 ao = 0.5f * (ak + al);

  float2 ap = C(z->q, am);
  float2 aq = K(ap, 1.0f);

  ak = E(z, ak);
  al = E(z, al);

  float ar = dot(aq, ak);

  float as = -dot(ap, ak) + s;
  float at = dot(ap, al) + s;

  b2clClipVertex au[2];
  b2clClipVertex av[2];
  int aw;

  aw = AQ(au, af, -ap, as, ai);

  if (aw < 2) {
    a[l] = j;
    b[l] = 0;
    return;
  }

  aw = AQ(av, au, ap, at, aj);

  if (aw < 2) {
    a[l] = j;
    b[l] = 0;
    return;
  }

  j.localNormal = an;
  j.localPoint = ao;

  int ax = 0;
  for (int ay = 0; ay < 2; ++ay) {
    float az = dot(aq, av[ay].v) - ar;

    if (az <= s) {
      b2clManifoldPoint* ba = j.points + ax;
      ba->localPoint = F(aa, av[ay].v);
      ba->id = av[ay].id;
      if (ac) {
        b2clContactFeature bb = ba->id.cf;
        ba->id.cf.indexA = bb.indexB;
        ba->id.cf.indexB = bb.indexA;
        ba->id.cf.typeA = bb.typeB;
        ba->id.cf.typeB = bb.typeA;
      }
      ++ax;
    }
  }

  j.pointCount = ax;
  a[l] = j;
  b[l] = ax > 0 ? !r : 0;
}

__kernel void AU(__global b2clManifold* a, __global int* b,

                 const __global b2clPolygonShape* c, const __global b2clTransform* d, const __global int4* e, const __global int* f, const int g, const int h) {
  unsigned int i = get_global_id(0);

  if (i >= h)
    return;

  b2clManifold j;

  j.pointCount = 0;
  j.points[0].normalImpulse = 0;
  j.points[0].tangentImpulse = 0;
  j.points[1].normalImpulse = 0;
  j.points[1].tangentImpulse = 0;
  int k;

  int l;
  int4 m;
  b2clPolygonShape n, o;
  b2clTransform p, q;

  l = f[i];
  m = e[l];
  n = c[m.x];
  o = c[m.y];
  p = d[m.z];
  q = d[m.w];
  bool r = n.m_bIsSensor || o.m_bIsSensor;

  float s = n.m_radius + o.m_radius;

  float2 t = E(&p, n.m_centroid) - E(&q, o.m_centroid);
  float u = I(t, t);

  if (u > s * s) {
    a[l] = j;
    b[l] = 0;
    return;
  }

  j.type = 0;
  j.localPoint = n.m_centroid;
  j.localNormal = 0;
  j.pointCount = 1;

  j.points[0].localPoint = o.m_centroid;
  j.points[0].id.key = 0;

  a[l] = j;
  b[l] = !r;
}

__kernel void AV(__global b2clManifold* a, __global int* b,

                 const __global b2clPolygonShape* c, const __global b2clTransform* d, const __global int4* e, const __global int* f, const int g, const int h) {
  unsigned int i = get_global_id(0);

  if (i >= h)
    return;

  b2clManifold j;

  j.pointCount = 0;
  j.points[0].normalImpulse = 0;
  j.points[0].tangentImpulse = 0;
  j.points[1].normalImpulse = 0;
  j.points[1].tangentImpulse = 0;
  int k;

  int l;
  int4 m;
  b2clPolygonShape n, o;
  b2clTransform p, q;

  l = f[i + g * 1];
  m = e[l];
  n = c[m.x];
  o = c[m.y];
  p = d[m.z];
  q = d[m.w];
  bool r = n.m_bIsSensor || o.m_bIsSensor;

  float2 s = E(&q, o.m_centroid);
  float2 t = F(&p, s);

  int u = 0;
  float v = -0x1.fffffep127f;
  float w = n.m_radius + o.m_radius;
  int x = n.m_vertexCount;
  const float2* y = n.m_vertices;
  const float2* z = n.m_normals;

  for (int i = 0; i < x; ++i) {
    float aa = I(z[i], t - y[i]);

    if (aa > w) {
      a[l] = j;
      b[l] = 0;

      return;
    }

    if (aa > v) {
      v = aa;
      u = i;
    }
  }

  int ab = u;
  int ac = ab + 1 < x ? ab + 1 : 0;
  float2 ad = y[ab];
  float2 ae = y[ac];

  if (v < 0x1.0p-23f) {
    j.pointCount = 1;
    j.type = 1;
    j.localNormal = z[u];
    j.localPoint = 0.5f * (ad + ae);
    j.points[0].localPoint = o.m_centroid;
    j.points[0].id.key = 0;

    a[l] = j;
    b[l] = !r;
    return;
  }

  float af = I(t - ad, ae - ad);
  float ag = I(t - ae, ad - ae);
  if (af <= 0.0f) {
    if (P(t, ad) > w * w) {
      a[l] = j;
      b[l] = 0;
      return;
    }

    j.pointCount = 1;
    j.type = 1;
    j.localNormal = normalize(t - ad);
    j.localPoint = ad;
    j.points[0].localPoint = o.m_centroid;
    j.points[0].id.key = 0;
  } else if (ag <= 0.0f) {
    if (P(t, ae) > w * w) {
      a[l] = j;
      b[l] = 0;
      return;
    }

    j.pointCount = 1;
    j.type = 1;
    j.localNormal = normalize(t - ae);
    j.localPoint = ae;
    j.points[0].localPoint = o.m_centroid;
    j.points[0].id.key = 0;
  } else {
    float2 ah = 0.5f * (ad + ae);
    float v = I(t - ah, z[ab]);
    if (v > w) {
      a[l] = j;
      b[l] = 0;
      return;
    }

    j.pointCount = 1;
    j.type = 1;
    j.localNormal = z[ab];
    j.localPoint = ah;
    j.points[0].localPoint = o.m_centroid;
    j.points[0].id.key = 0;
  }

  a[l] = j;
  b[l] = !r;
}

__kernel void AW(__global b2clManifold* a, __global int* b,

                 const __global b2clPolygonShape* c, const __global b2clTransform* d, const __global int4* e, const __global int* f, const int g, const int h) {
  unsigned int i = get_global_id(0);

  if (i >= h)
    return;

  b2clManifold j;

  j.pointCount = 0;
  j.points[0].normalImpulse = 0;
  j.points[0].tangentImpulse = 0;
  j.points[1].normalImpulse = 0;
  j.points[1].tangentImpulse = 0;
  int k;

  int l;
  int4 m;
  b2clPolygonShape n, o;
  b2clTransform p, q;

  l = f[i + g * 3];
  m = e[l];
  n = c[m.x];
  o = c[m.y];
  p = d[m.z];
  q = d[m.w];
  bool r = n.m_bIsSensor || o.m_bIsSensor;

  float2 s = F(&p, E(&q, o.m_centroid));

  float2 t = n.m_vertices[0], u = n.m_vertices[1];
  float2 v = u - t;

  float w = I(v, u - s);
  float x = I(v, s - t);

  float y = n.m_radius + o.m_radius;

  b2clContactFeature z;
  z.indexB = 0;
  z.typeB = 0;

  if (x <= 0.0f) {
    float2 aa = t;
    float2 ab = s - aa;
    float ac = I(ab, ab);
    if (ac > y * y) {
      a[l] = j;
      b[l] = 0;
      return;
    }

    if (n.m_centroid.x) {
      float2 ad = n.m_vertices[2];
      float2 ae = t;
      float2 af = ae - ad;
      float ag = I(af, ae - s);

      if (ag > 0.0f) {
        a[l] = j;
        b[l] = 0;
        return;
      }
    }

    z.indexA = 0;
    z.typeA = 0;
    j.pointCount = 1;
    j.type = 0;
    j.localNormal = 0;
    j.localPoint = aa;
    j.points[0].id.key = 0;
    j.points[0].id.cf = z;
    j.points[0].localPoint = o.m_centroid;

    a[l] = j;
    b[l] = !r;
    return;
  }

  if (w <= 0.0f) {
    float2 aa = u;
    float2 ab = s - aa;
    float ac = I(ab, ab);
    if (ac > y * y) {
      a[l] = j;
      b[l] = 0;
      return;
    }

    if (n.m_centroid.y) {
      float2 ah = n.m_vertices[3];
      float2 ai = u;
      float2 aj = ah - ai;
      float ak = I(aj, s - ai);

      if (ak > 0.0f) {
        a[l] = j;
        b[l] = 0;
        return;
      }
    }

    z.indexA = 1;
    z.typeA = 0;
    j.pointCount = 1;
    j.type = 0;
    j.localNormal = 0;
    j.localPoint = aa;
    j.points[0].id.key = 0;
    j.points[0].id.cf = z;
    j.points[0].localPoint = o.m_centroid;

    a[l] = j;
    b[l] = !r;
    return;
  }

  float al = I(v, v);
  float2 aa = (1.0f / al) * (w * t + x * u);
  float2 ab = s - aa;
  float ac = I(ab, ab);
  if (ac > y * y) {
    a[l] = j;
    b[l] = 0;
    return;
  }

  float2 am = (float2)(-v.y, v.x);
  if (I(am, s - t) < 0.0f) {
    float2 an = (float2)(-amm.x, -amm.y);
    am = an;
  }
  am = normalize(am);

  z.indexA = 0;
  z.typeA = 1;
  j.pointCount = 1;
  j.type = 1;
  j.localNormal = am;
  j.localPoint = t;
  j.points[0].id.key = 0;
  j.points[0].id.cf = z;
  j.points[0].localPoint = o.m_centroid;

  a[l] = j;
  b[l] = !r;
}

__kernel void AX(__global b2clManifold* a, __global int* b,

                 const __global b2clPolygonShape* c, const __global b2clTransform* d, const __global int4* e, const __global int* f, const int g, const int h) {
  unsigned int i = get_global_id(0);

  if (i >= h)
    return;

  b2clManifold j;

  j.pointCount = 0;
  j.points[0].normalImpulse = 0;
  j.points[0].tangentImpulse = 0;
  j.points[1].normalImpulse = 0;
  j.points[1].tangentImpulse = 0;
  int k;

  int l;
  int4 m;
  b2clPolygonShape n, o;
  b2clTransform p, q;

  l = f[i + g * 4];
  m = e[l];
  n = c[m.x];
  o = c[m.y];
  p = d[m.z];
  q = d[m.w];
  bool r = n.m_bIsSensor || o.m_bIsSensor;
  b2clTempPolygon s;

  b2clTransform t;
  float2 u;
  float2 v, w, x, y;
  float2 z, aa, ab;
  float2 ac;
  int ad, ae;
  float2 af, ag;
  float ah;
  bool ai;

  t = H(&p, &q);

  u = E(&t, o.m_centroid);

  v = n.m_vertices[2];
  w = n.m_vertices[0];
  x = n.m_vertices[1];
  y = n.m_vertices[3];

  bool aj = n.m_centroid.x;
  bool ak = n.m_centroid.y;

  float2 al = x - w;
  al = normalize(al);
 aa = (float2)(al -al;
 float am = I(aa, u - w);
 float an = 0.0f, ao = 0.0f;
 bool ap = false, aq = false;


 if (aj)
 {
    float2 ar = w - v;
    ar = normalize(ar);
  z = (float2)(ar -ar;
  ap = J(ar, al) >= 0.0f;
  an = I(z, u - v);
 }


 if (ak)
 {
    float2 as = y - x;
    as = normalize(as);
  ab = (float2)(as -as;
  aq = J(al, as) > 0.0f;
  ao = I(ab, u - x);
 }


 if (aj && ak)
 {
    if (ap && aq) {
      ai = an >= 0.0f || am >= 0.0f || ao >= 0.0f;
      if (ai) {
        ac = aa;
        af = z;
        ag = ab;
      } else {
        ac = -aa;
        af = -aa;
        ag = -aa;
      }
    } else if (ap) {
      ai = an >= 0.0f || (am >= 0.0f && ao >= 0.0f);
      if (ai) {
        ac = aa;
        af = z;
        ag = aa;
      } else {
        ac = -aa;
        af = -ab;
        ag = -aa;
      }
    } else if (aq) {
      ai = ao >= 0.0f || (an >= 0.0f && am >= 0.0f);
      if (ai) {
        ac = aa;
        af = aa;
        ag = ab;
      } else {
        ac = -aa;
        af = -aa;
        ag = -z;
      }
    } else {
      ai = an >= 0.0f && am >= 0.0f && ao >= 0.0f;
      if (ai) {
        ac = aa;
        af = aa;
        ag = aa;
      } else {
        ac = -aa;
        af = -ab;
        ag = -z;
      }
    }
 }
 else if (aj)
 {
    if (ap) {
      ai = an >= 0.0f || am >= 0.0f;
      if (ai) {
        ac = aa;
        af = z;
        ag = -aa;
      } else {
        ac = -aa;
        af = aa;
        ag = -aa;
      }
    } else {
      ai = an >= 0.0f && am >= 0.0f;
      if (ai) {
        ac = aa;
        af = aa;
        ag = -aa;
      } else {
        ac = -aa;
        af = aa;
        ag = -z;
      }
    }
 }
 else if (ak)
 {
    if (aq) {
      ai = am >= 0.0f || ao >= 0.0f;
      if (ai) {
        ac = aa;
        af = -aa;
        ag = ab;
      } else {
        ac = -aa;
        af = -aa;
        ag = aa;
      }
    } else {
      ai = am >= 0.0f && ao >= 0.0f;
      if (ai) {
        ac = aa;
        af = -aa;
        ag = aa;
      } else {
        ac = -aa;
        af = -ab;
        ag = aa;
      }
    }
 }
 else
 {
    ai = am >= 0.0f;
    if (ai) {
      ac = aa;
      af = -aa;
      ag = -aa;
    } else {
      ac = -aa;
      af = aa;
      ag = aa;
    }
 }


 s.count = o.m_vertexCount;
 for (int i = 0; i < o.m_vertexCount; ++i)
 {
    s.vertices[i] = E(&t, o.m_vertices[i]);
    s.normals[i] = C(t.q, o.m_normals[i]);
 }

 ah = 2.0f * (2.0f * 0.005f);

 j.pointCount = 0;

 b2clEPAxis at = AR(ai, &s, ac, w);


 if (at.type == 0 )
 {
    a[l] = j;
    b[l] = 0;
    return;
 }

 if (at.separation > ah)
 {
    a[l] = j;
    b[l] = 0;
    return;
 }

 b2clEPAxis au = AS(ac, &s, w, x, ag, af, ah);
 if (au.type != 0 && au.separation > ah)
 {
    a[l] = j;
    b[l] = 0;
    return;
 }


 const float av = 0.98f;
 const float aw = 0.001f;

 b2clEPAxis ax;
 if (au.type == 0 )
 {
    ax = at;
 }
 else if (au.separation > av * at.separation + aw)
 {
    ax = au;
 }
 else
 {
    ax = at;
 }

 b2clClipVertex ay[2];
 b2clReferenceFace az;
 if (ax.type == 1 )
 {
    j.type = 1;

    int ba = 0;
    float bb = I(ac, s.normals[0]);
    for (int i = 1; i < s.count; ++i) {
      float bc = I(ac, s.normals[i]);
      if (bc < bb) {
        bb = bc;
        ba = i;
      }
    }

    int bd = ba;
    int be = bd + 1 < s.count ? bd + 1 : 0;

    ay[0].v = s.vertices[bd];
    ay[0].id.cf.indexA = 0;
    ay[0].id.cf.indexB = bd;
    ay[0].id.cf.typeA = 1;
    ay[0].id.cf.typeB = 0;

    ay[1].v = s.vertices[be];
    ay[1].id.cf.indexA = 0;
    ay[1].id.cf.indexB = be;
    ay[1].id.cf.typeA = 1;
    ay[1].id.cf.typeB = 0;

    if (ai) {
      az.i1 = 0;
      az.i2 = 1;
      az.v1 = w;
      az.v2 = x;
      az.normal = aa;
    } else {
      az.i1 = 1;
      az.i2 = 0;
      az.v1 = x;
      az.v2 = w;
      az.normal = -aa;
    }
 }
 else
 {
    j.type = 2;

    ay[0].v = w;
    ay[0].id.cf.indexA = 0;
    ay[0].id.cf.indexB = ax.index;
    ay[0].id.cf.typeA = 0;
    ay[0].id.cf.typeB = 1;

    ay[1].v = x;
    ay[1].id.cf.indexA = 0;
    ay[1].id.cf.indexB = ax.index;
    ay[1].id.cf.typeA = 0;
    ay[1].id.cf.typeB = 1;

    az.i1 = ax.index;
    az.i2 = az.i1 + 1 < s.count ? az.i1 + 1 : 0;
    az.v1 = s.vertices[az.i1];
    az.v2 = s.vertices[az.i2];
    az.normal = s.normals[az.i1];
 }

 az.sideNormal1 = (float2)(az.normal.y, -az.normal.x);
 az.sideNormal2 = -az.sideNormal1;
 az.sideOffset1 = I(az.sideNormal1, az.v1);
 az.sideOffset2 = I(az.sideNormal2, az.v2);


 b2clClipVertex bf[2];
 b2clClipVertex bg[2];
 int bh;


 bh = AQ(bf, ay, az.sideNormal1, az.sideOffset1, az.i1);

 if (bh < 2)
 {
    a[l] = j;
    b[l] = 0;
    return;
 }


 bh = AQ(bg, bf, az.sideNormal2, az.sideOffset2, az.i2);

 if (bh < 2)
 {
    a[l] = j;
    b[l] = 0;
    return;
 }


 if (ax.type == 1 )
 {
    j.localNormal = az.normal;
    j.localPoint = az.v1;
 }
 else
 {
    j.localNormal = o.m_normals[az.i1];
    j.localPoint = o.m_vertices[az.i1];
 }

 int bi = 0;
 for (int i = 0; i < 2; ++i)
 {
    float bj;

    bj = I(az.normal, bg[i].v - az.v1);

    if (bj <= ah) {
      b2clManifoldPoint* bk = j.points + bi;

      if (ax.type == 1) {
        bk->localPoint = F(&t, bg[i].v);
        bk->id = bg[i].id;
      } else {
        bk->localPoint = bg[i].v;
        bk->id.cf.typeA = bg[i].id.cf.typeB;
        bk->id.cf.typeB = bg[i].id.cf.typeA;
        bk->id.cf.indexA = bg[i].id.cf.indexB;
        bk->id.cf.indexB = bg[i].id.cf.indexA;
      }

      ++bi;
    }
 }

 j.pointCount = bi;
 a[l] = j;
 b[l] = !r;
}

__kernel void AY(const __global int* a, __global int* b, __global int* c) {
  *c = a[0];
  if (*c)
    b[0] = 0;
}