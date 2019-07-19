typedef float PAFloat; typedef int PAInt; typedef unsigned char PAUChar; typedef struct _PAPhysicsParticle {
  PAInt lifetime;
  PAFloat x, y, z;
} PAPhysicsParticle;

typedef enum _PAPhysicsType {
  PAPhysicsNormalType,
  PAPhysicsWindType,
  PAPhysicsVortexType,
  PAPhysicsHarmonicType,
  PAPhysicsGravityType,
  PAPhysicsNBodyType,
  PAPhysicsDragType,
  PAPhysicsTurbulenceType,
  PAPhysicsBoidsType,

  PAPhysicsIntegrationType,

  PAPhysicsLastType
} PAPhysicsType;

typedef struct _PAPhysicsFalloffData { PAFloat strength, max, min; } PAPhysicsFalloffData;

typedef struct _PAPhysicsNormalData {
  PAFloat strength, noise;
  PAPhysicsFalloffData falloff;
} PAPhysicsNormalData;

typedef struct _PAPhysicsWindData {
  PAFloat strength, noise;
  PAPhysicsFalloffData falloff;
} PAPhysicsWindData;

typedef struct _PAPhysicsVortexData {
  PAFloat strength, noise;
  PAPhysicsFalloffData falloff;
} PAPhysicsVortexData;

typedef struct _PAPhysicsHarmonicData {
  PAFloat strength, damping, restLength, noise;
  PAPhysicsFalloffData falloff;
} PAPhysicsHarmonicData;

typedef struct _PAPhysicsGravityData {
  PAFloat strength, noise;
  PAFloat mass;
} PAPhysicsGravityData;

typedef struct _PAPhysicsNBodyData { PAFloat strength, noise; } PAPhysicsNBodyData;

typedef struct _PAPhysicsDragData { PAFloat linearStrength, quadraticStrength, noise; } PAPhysicsDragData;

typedef struct _PAPhysicsTurbulenceData {
  PAFloat strength, size, noise;
  PAPhysicsFalloffData falloff;
} PAPhysicsTurbulenceData;

typedef struct _PAPhysicsBoidsData { PAFloat strength, noise; } PAPhysicsBoidsData;

typedef struct _PAPhysicsForce {
  PAPhysicsType type;
  PAPhysicsParticle particle;

  union {
    PAPhysicsNormalData normal;
    PAPhysicsWindData wind;
    PAPhysicsVortexData vortex;
    PAPhysicsHarmonicData harmonic;
    PAPhysicsGravityData gravity;
    PAPhysicsNBodyData nbody;
    PAPhysicsDragData drag;
    PAPhysicsTurbulenceData turbulence;
    PAPhysicsBoidsData boids;
  } data;
} PAPhysicsForce;

typedef struct _PAPhysicsNewtonian {
  PAFloat fixed, mass;
  PAFloat ax, ay, az;
  PAFloat ox, oy, oz;
} PAPhysicsNewtonian;

typedef struct _PAEmitter {
  PAPhysicsParticle particle;

  PAFloat birthRate, birthRateNoise;
  PAFloat lifetime, lifetimeNoise;
  PAFloat initialVelocity, initialVelocityNoise;
  PAFloat emissionAngleStart, emissionAngleEnd, emissionAngleNoise;
} PAEmitter;

__kernel void A(__global PAPhysicsParticle* a, __global PAPhysicsParticle* b, __global PAPhysicsNewtonian* c, __global PAPhysicsNewtonian* d, __global PAPhysicsForce* e, const unsigned int f) {
  int g = get_global_id(0);

  if (g > f)
    return;

  b[g].lifetime = a[g].lifetime;
  b[g].x = a[g].x;
  b[g].y = a[g].y;
  b[g].z = a[g].z;
}