uint A(uint* a, uint b, uint c) {
  return (*a) = (b * (*a) + c);
}

uint B(uint* a, uint b, uint c, uint d, uint e) {
  uint f = ((((*a) << b) ^ (*a)) >> c);
  return (*a) = ((((*a) & e) << d) ^ f);
}

float C(uint* a, uint* b, uint* c, uint* d) {
  return 2.3283064365387e-10 * (B(a, 13, 19, 12, 4294967294UL) ^ B(b, 2, 25, 4, 4294967288UL) ^ B(c, 3, 11, 17, 4294967280UL) ^ A(d, 1664525, 1013904223UL));
}

struct photon {
  float4 origin;
  float4 direction;
  float energy;
};

__kernel void D(const int a, __global float* b) {
  int4 c = (int4)(get_global_id(0), get_global_id(1), get_global_id(2), 0);
  b[c.x + c.y * a + c.z * a * a] = 0.0f;
}

float4 E(uint* a, uint* b, uint* c, uint* d) {
  float e, f, g;
  bool h = false;
  while (!h) {
    e = C(a, b, c, d) * 2.0f - 1.0f;
    f = C(a, b, c, d) * 2.0f - 1.0f;
    g = C(a, b, c, d) * 2.0f - 1.0f;
    if ((e * e + f * f + g * g) <= 1.0f) {
      h = true;
    }
  }
  if (e * e + f * f + g * g == 0.0) {
    e = 0.0f;
    f = 1.0f;
    g = 0.0f;
  }
  float i = sqrt(e * e + f * f + g * g);
  return (float4)(e / f / g / i);
}

__constant float Ga = 0.000001f;
__constant float Gb = 0.8f;
__constant float Gc = 1.0f;

float F(float4 a) {
  for (float b = 0.3f; b < 0.9f; b += 0.4f) {
    for (float c = 0.3f; c < 0.9f; c += 0.4f) {
      float d = (a.x - b) * (a.x - b);
      float e = (a.y - c) * (a.y - c);
      if (d + e < 0.001f) {
        return 100.0f;
      }
    }
  }

  for (float b = 0.3f; b < 0.9f; b += 0.4f) {
    for (float f = 0.3f; f < 0.9f; f += 0.4f) {
      float d = (a.x - b) * (a.x - b);
      float g = (a.z - f) * (a.z - f);
      if (d + g < 0.001f) {
        return 100.0f;
      }
    }
  }

  for (float f = 0.3f; f < 0.9f; f += 0.4f) {
    for (float c = 0.3f; c < 0.9f; c += 0.4f) {
      float g = (a.z - f) * (a.z - f);
      float e = (a.y - c) * (a.y - c);
      if (g + e < 0.001f) {
        return 100.0f;
      }
    }
  }

  if (a.y > 0.78f && a.y < 0.83f && ((a.x - 0.5f) * (a.x - 0.5f) + (a.z - 0.5f) * (a.z - 0.5f)) > 0.001f)
    return 100.0f;

  if (a.x < 0.02f)
    return 100.0f;
  if (a.y < 0.02f)
    return 100.0f;
  if (a.z > 0.98f)
    return 100.0f;

  if (a.y < 0.2f)
    return (1.0f - a.y) * 5.0f;

  return 0.5f * Gc;
}

void G(__global struct photon* a, float b) {
  float c = -log(b) / Gc;

  float d = 0.0f;
  float e = 1.0f / 256.0f;
  float f = 0.0f;
  float g = 0.0f;

  while (f < c) {
    float4 h = a->origin + d * a->direction;
    if (h.x < 0.0f || h.x > 1.0f || h.y < 0.0f || h.y > 1.0f || h.z < 0.0f || h.z > 1.0f) {
      a->energy = 0.0f;
      break;
    } else {
      g = F(h);
      f += g * e;
      d += e;
    }
  }

  a->origin = a->origin + a->direction * d;
  a->direction = a->direction;
  a->energy = a->energy * Gb;
}

void H(__global struct photon* a, const int b, __global float* c) {
  if (a->energy < 0.1f)
    return;

  int d = a->origin.x * b;
  int e = a->origin.y * b;
  int f = a->origin.z * b;

  if (d > b - 1 || d < 0)
    return;
  if (e > b - 1 || e < 0)
    return;
  if (f > b - 1 || f < 0)
    return;

  c[d + e * b + f * b * b] += a->energy;
}

__kernel void I(const int a, __global uint4* b, __global struct photon* c, const int d, __global float* e, const float4 f) {
  int g = get_global_id(0);

  uint h = b[g].s0;
  uint i = b[g].s1;
  uint j = b[g].s2;
  uint k = b[g].s3;

  if (0 == a || c[g].energy < 0.2f) {
    c[g].origin = f;
    c[g].direction = E(&h, &i, &j, &k);
    c[g].energy = 1.0f;
  } else {
    c[g].direction = E(&h, &i, &j, &k);
  }

  G(&c[g], C(&h, &i, &j, &k));
  H(&c[g], d, e);

  b[g].s0 = h;
  b[g].s1 = i;
  b[g].s2 = j;
  b[g].s3 = k;
}
int J(float4 a, float4 b, float4 c, float4 d, float* e, float* f) {
  float4 g = (float4)(1.0f, 1.0f, 1.0f, 1.0f) / b;
  float4 h = g * (c - a);
  float4 i = g * (d - a);

  float4 j = min(i, h);
  float4 k = max(i, h);

  float l = max(max(j.x, j.y), max(j.x, j.z));
  float m = min(min(k.x, k.y), min(k.x, k.z));

  *e = l;
  *f = m;

  return m > l;
}

float K(const float4 a, const int b, __global float* c) {
  int d = a.x * b;
  int e = a.y * b;
  int f = a.z * b;

  if (d > b - 1 || d < 0)
    return (0.0f);
  if (e > b - 1 || e < 0)
    return (0.0f);
  if (f > b - 1 || f < 0)
    return (0.0f);

  return c[d + e * b + f * b * b];
}

__kernel void L(const int a, const int b, __global float4* c, const int d, __global float* e, const int f, const float16 g) {
  int2 h = (int2)(get_global_id(0), get_global_id(1));

  float2 i = (float2)( (hx / (float) a0f-1.0f, (hy / (float) bf-1.0f );

  float4 j = (float4)(-1.0f, -1.0f, -1.0f,1.0f);
  float4 k = (float4)(1.0f, 1.0f, 1.0f,1.0f);


  struct photon l;

  l.gat4 m = normalize(((float4)(ix, iy, -2.0f, 0.0f)));
  l.directionl.directionl.directionl.direction.w = 0.0f;

  float n = 0.0f;
  float o = 1.0f;

  float p, q;
  int r = J(l.origin, l.direction, j, k, &p, &q);
  if(r){
    if (p < 0.0f)
      p = 0.0f;
    float s = 256.0f;
    float t = (q - p) / s;
    float u = q - 0.0001f;
    for (int v = 0; v < s; ++v) {
      float4 w = ((l.origin + u * l.direction) + 1.0f) / 2.0f;
      float x = K(w, d, e) / (f * 500) / (4.0f * 3.14) / pown(1.0f / d, 3) / Gb * t;
      float y = F(w) * t;

      n = (1.0f - y) * n + x;
      o *= (1 - y);

      u -= t;
      if (u < p)
        break;
    }
  }

  if(h.x < a && h.y < b){
    float4 z = (float4)(0.17f, 0.4f, 0.6f, 0.0f);
    z = z * o;

    float4 aa = z + n;

    float ab = 0.8f;
    aa.x = __clc_pow(aa.x, ab);
    aa.y = __clc_pow(aa.y, ab);
    aa.z = __clc_pow(aa.z, ab);

    c[h.x + h.y * a] = aa;
  }
}