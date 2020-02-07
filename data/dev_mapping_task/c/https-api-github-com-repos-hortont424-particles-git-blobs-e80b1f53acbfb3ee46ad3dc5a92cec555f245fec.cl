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

float4 A(float a, float b, float c) {
  float4 d = (float4)0.0f;

  float e, f, g;
  float h, i, j, k;
  float l;

  a = fmax(0.0f, fmin(360.0f, a));
  b = fmax(0.0f, fmin(100.0f, b));
  c = fmax(0.0f, fmin(100.0f, c));

  b /= 100.0f;
  c /= 100.0f;

  if (b == 0) {
    e = f = g = c;
  } else {
    a /= 60.0f;
    l = __clc_floor(a);
    h = a - l;
    i = c * (1.0f - b);
    j = c * (1.0f - b * h);
    k = c * (1.0f - b * (1.0f - h));

    if (l == 0) {
      e = c;
      f = k;
      g = i;
    } else if (l == 1) {
      e = j;
      f = c;
      g = i;
    } else if (l == 2) {
      e = i;
      f = c;
      g = k;
    } else if (l == 3) {
      e = i;
      f = j;
      g = c;
    } else if (l == 4) {
      e = k;
      f = i;
      g = c;
    } else {
      e = c;
      f = i;
      g = j;
    }
  }

  d.x = e;
  d.y = f;
  d.z = g;

  return d;
}

__kernel void B(__global PAPhysicsParticle* a, __global PAPhysicsNewtonian* b, __global PAFloat* c, int d, int e) {
  int f = get_global_id(0);
  float4 g, h, i, j, k;
  float l;

  j = k = (float4)(0.0f);

  if (f >= (e * e))
    return;

  h = (float4)((float)(f % e)f / (float)e .0f);
  i = h / ((float)e);

  float m = 4.0;
  i *= m;
  i.x += (0.5 - (m / 2.0f));
  i.y += (0.5 - (m / 2.0f));

  i.x += 1.5;

  c[(f * 4) + 0] = 0;
  c[(f * 4) + 1] = 0;
  c[(f * 4) + 2] = 0;
  c[(f * 4) + 3] = 255;

  float n = 0.0;
  float4 o;

  for (int p = 0; p < d; p++) {
    if (a[p].lifetime == 0)
      continue;

        g = (float4p(axp ay, 0.0f, 0.0f);
        l = distance(i, g);

        j.x = a[p].x;
        j.y = a[p].y;
        j.z = a[p].z;
        k.x = b[p].ox;
        k.y = b[p].oy;
        k.z = b[p].oz;

        float q = distance(j, k) * 8.0;

        if(l < 0.2)
        {
      n = (0.2 - l) * 1.0f;
      float r = a[p].z;

      o = A(r * 300, 100, 100 * (n + (r / 3.0)));

      c[(f * 4) + 0] += o.x;
      c[(f * 4) + 1] += o.y;
      c[(f * 4) + 2] += o.z;
        }
  }

  for (int p = 0; p < 4; p++)
    c[(f * 4) + p] = fmin(c[(f * 4) + p], 255.0f);
}