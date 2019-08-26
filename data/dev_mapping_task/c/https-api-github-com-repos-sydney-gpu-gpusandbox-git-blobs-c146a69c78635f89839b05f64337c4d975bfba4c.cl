typedef struct Params {
  float neighbourRadiusSqr;

  float maxSteeringForce;
  float maxBoidSpeed;

  float wanderRadius;
  float wanderJitter;
  float wanderDistance;
  float wanderWeight;

  float separationWeight;
  float cohesionWeight;
  float alignmentWeight;

  unsigned int boidCount;
} Params;

float4 A(float a, float4 b) {
  float c = b.x * b.x + b.y * b.y + b.z * b.z;

  if (c > a) {
    float d = a / c;
    b.x *= d;
    b.y *= d;
    b.z *= d;
  }

  return b;
}

float B(float4 a) {
  return a.x * a.x + a.y * a.y + a.z * a.z;
}

float C(float2 a) {
  float b = 0;
  return fract(sin(dot(a, (float2)(12.9898f, 78.233f))) * 43758.5453f, &b);
}

kernel void D(global float4* a, global float4* b, global float4* c, constant struct Params* d, float e) {
  unsigned int f = get_global_id(0);

  unsigned int g, h;

  float4 i = (float4)0.0f;
  float4 j = (float4)0.0f;
  float4 k = (float4)0.0f;
  float4 l = (float4)0.0f;
  float4 m = (float4)0.0f;

  float3 n = fast_normalize(b[f].xyz);

  for (g = 0, h = 0; g < d->boidCount; ++g) {
    if (f == g)
      continue;

    float4 o = a[f] - a[g];
    o.w = 0;
    float p = o.x * o.x + o.y * o.y + o.z * o.z;

    if (p < d->neighbourRadiusSqr) {
      h += 1;

      if (p != 0) {
        o = fast_normalize(o);
        j += o / sqrt(p);
      }

      k += a[g];
      l.xyz += fast_normalize(b[g].xyz);
    }
  }

  b[f].w = (float)h;

  if (h > 0) {
    k /= b[f].w;
    if (a[f].x != k.x || a[f].y != k.y || a[f].z != k.z) {
      k = fast_normalize(k - a[f]) * d->maxBoidSpeed - (flfat4)(b 0.0f);
    }

    l /= b[f].w;
    l.xyz -= n;
  }

  c[f].x += C(a[f].xy * 42) * d->wanderJitter;
  c[f].y += C(a[f].xz * 666) * d->wanderJitter;
  c[f].z += C(a[f].yz * 42) * d->wanderJitter;
  c[f] = fast_normalize(c[f]) * d->wanderRadius;
 m = (c[f] + (float4)(n* d->wanderDistance) - a[f];

 float q = d->maxSteeringForce * d->maxSteeringForce;



 i += m * d->wanderDistance * d->wanderWeight;
 i = A(q, i);

 if (B(i) < q)
 {
    i += j * d->separationWeight;
    i = A(q, i);

    if (B(i) < q) {
      i += k * d->cohesionWeight;
      i = A(q, i);

      if (B(i) < q) {
        i += l * d->alignmentWeight;
        i = A(q, i);
      }
    }
 }


 b[f].xyz += i.xyz * e;
 b[f] = A(d->maxBoidSpeed * d->maxBoidSpeed, b[f]);


 barrier(1 | 2);

 a[f].xyz += b[f].xyz * e;

 if (a[f].x > 100)
  a[f].x = -100;
 if (a[f].x < -100)
  a[f].x = 100;

 if (a[f].y > 100)
  a[f].y = -100;
 if (a[f].y < -100)
  a[f].y = 100;

 if (a[f].z > 100)
  a[f].z = -100;
 if (a[f].z < -100)
  a[f].z = 100;

 barrier(1 | 2);
}