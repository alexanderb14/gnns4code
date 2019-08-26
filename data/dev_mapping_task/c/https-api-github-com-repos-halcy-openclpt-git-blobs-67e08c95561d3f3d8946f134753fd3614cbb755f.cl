typedef struct {
  ulong a;
  ulong b;
  ulong c;
} random_state;

typedef struct ray {
  float3 origin;
  float3 direction;
  float3 radiance;
  float terminate;
} ray;

typedef struct hit {
  int object;
  float3 position;
  float3 normal;
  float3 s;
  float3 t;
  ray hitter;
  int hit;
  float distance;
} hit;

typedef struct simple_brdf_data {
  float3 emission;
  float3 albedo;
  float reflectivity;
  float specularity;
} simple_brdf_data;

typedef struct sphere_object_data {
  float3 position;
  float radius;
} sphere_object_data;

typedef struct object {
  sphere_object_data object_data;
  simple_brdf_data brdf_data;
} object;

inline float A(random_state* a) {
  ulong b = a->b;
  a->b = a->a * 1103515245 + 12345;
  a->a = (~b ^ (a->b >> 3)) - a->c++;
  return (float)(a->b & 4294967295) / 4294967295.0f;
}

void B(random_state* a, uint b) {
  a->a = b;
  a->b = 0;
  a->c = 362436;
  for (int c = 0; c < 1000; c++) {
    A(a);
  }
}

inline float3 C(random_state* a, float3 b) {
  float c = A(a) * 2.0f - 1.0f;
  float d = A(a) * 2.0f * 3.14159265359f;
  float e = sqrt(1.0f - __clc_pow(c, 2.0f));
  float3 f = (float3)(e * cos(d), e * sin(d), c);
  return dot(f, b) < 0 ? -f : f;
}

float3 D(random_state* a, float3 b, float c) {
  float3 d = C(a, b);
  return normalize(d + b * c);
}

inline float3 E(float3 a, float3 b) {
  return a + b * 0.002f;
}

inline hit F(__constant sphere_object_data* a, ray b) {
  hit c;

  float3 d = b.origin - a->position;
  float e = dot(b.direction, b.direction);
  float f = 2.0f * dot(b.direction, d);
  float g = dot(d, d) - (a->radius * a->radius);
  float h = f * f - 4.0f * e * g;

  if (h < 0) {
    c.hit = 0;
    return c;
  }

  float i = sqrt(h);
  float j;
  if (f < 0) {
    j = (-f - i) / 2.0f;
  } else {
    j = (-f + i) / 2.0f;
  }

  float k = j / e;
  float l = g / j;
  if (k > l) {
    float m = k;
    k = l;
    l = m;
  }

  if (l < 0) {
    c.hit = 0;
    return c;
  }

  float n;
  if (k < 0) {
    n = l;
  } else {
    n = k;
  }

  c.position = b.origin + b.direction * n;
  c.normal = normalize(c.position - a->position);
  if (c.normal.x <= 0.1f && c.normal.y <= 0.1f) {
    c.s = normalize((float3)(cal.x, cal.y, 0));
  } else {
    c.s = normalize((float3)(cal.x, 0, cal.z));
  }
  c.t = normalize(cross(c.normal, c.s));
  c.hitter = b;
  c.hit = 1;
  c.distance = n;

  return c;
}

inline ray G(random_state* a, __constant simple_brdf_data* b, hit c) {
  ray d;

  if (A(a) > b->reflectivity) {
    float3 e = C(a, c.normal);
    d.direction = normalize(e);
    d.origin = E(c.position, d.direction);
  } else {
    float3 f = D(a, c.normal, b->specularity);
    d.direction = normalize(c.hitter.direction - f * dot(c.hitter.direction, f) * 2.0f);
    d.origin = E(c.position, d.direction);
  }

  d.terminate = c.hitter.terminate * 0.95f;
  ;
  return d;
}

inline float3 H(__constant simple_brdf_data* a, float3 b) {
  float3 c = b;
  c = c + a->emission;
  c = c * a->albedo;
  return c;
}

inline float3 I(random_state* a, ray b, __constant object* c, float* d, int* e) {
  int f = 0;
  ray g = b;
  hit h;
  d[0] = b.terminate;
  while (f < 1024 && A(a) <= g.terminate) {
    h.hit = 0;
    h.distance = 0x1.fffffep127f;
    h.object = 0;

    for (int i = 0; i < 13; i++) {
      hit j = F(&c[i].object_data, g);
      if (j.hit == 1 && j.distance < h.distance) {
        h = j;
        h.object = i;
      }
    }
    e[f] = h.object;
    f++;
    d[f] = g.terminate;
    g = G(a, &c[h.object].brdf_data, h);
  }

  float3 k = (float3)(0, 0, 0);
  for (int l = f - 1; l >= 0; l--) {
    k = H(&c[e[l]].brdf_data, k);
    k = k * d[l];
  }

  return k;
}

__kernel void J(__global float* a, __global float* b, __global float* c, __constant object* d) {
  unsigned int e = get_global_id(0);
  int f = (e % 400) - 400 / 2;
  int g = -(__clc_floor((float)e / (float)400) - 400 / 2);

  random_state h;
  B(&h, e);

  float i[1024];
  int j[1024];

  float3 k = (float3)(0, 0, 0);
  ray l;
  for (int e = 0; e < 30000; e++) {
    l.origin = (float3)(0, 0, 0);
  l.direction = normalize((floah) * (800.0f / (float)4h) * (800.0f / (float)400),
   -800.0f
  ));
  l.terminate = 1.0f;
  k += I(&h, l, d, i, j);
  }

  a[e] = k.x;
  b[e] = k.y;
  c[e] = k.z;
}