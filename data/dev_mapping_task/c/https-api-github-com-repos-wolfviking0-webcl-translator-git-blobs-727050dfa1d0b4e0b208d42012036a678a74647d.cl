typedef struct quat { float x, y, z, w; } quat;

typedef struct vec { float x, y, z; } vec;

typedef struct vec4 { float x, y, z, w; } vec4;

typedef struct mat4 { float m[16]; } mat4;

bool A(mat4* a, const mat4* b) {
  mat4 c;
  float d;
  int e;

  c.m[0] = b->m[5] * b->m[10] * b->m[15] - b->m[5] * b->m[11] * b->m[14] - b->m[9] * b->m[6] * b->m[15] + b->m[9] * b->m[7] * b->m[14] + b->m[13] * b->m[6] * b->m[11] - b->m[13] * b->m[7] * b->m[10];

  c.m[4] = -b->m[4] * b->m[10] * b->m[15] + b->m[4] * b->m[11] * b->m[14] + b->m[8] * b->m[6] * b->m[15] - b->m[8] * b->m[7] * b->m[14] - b->m[12] * b->m[6] * b->m[11] + b->m[12] * b->m[7] * b->m[10];

  c.m[8] = b->m[4] * b->m[9] * b->m[15] - b->m[4] * b->m[11] * b->m[13] - b->m[8] * b->m[5] * b->m[15] + b->m[8] * b->m[7] * b->m[13] + b->m[12] * b->m[5] * b->m[11] - b->m[12] * b->m[7] * b->m[9];

  c.m[12] = -b->m[4] * b->m[9] * b->m[14] + b->m[4] * b->m[10] * b->m[13] + b->m[8] * b->m[5] * b->m[14] - b->m[8] * b->m[6] * b->m[13] - b->m[12] * b->m[5] * b->m[10] + b->m[12] * b->m[6] * b->m[9];

  c.m[1] = -b->m[1] * b->m[10] * b->m[15] + b->m[1] * b->m[11] * b->m[14] + b->m[9] * b->m[2] * b->m[15] - b->m[9] * b->m[3] * b->m[14] - b->m[13] * b->m[2] * b->m[11] + b->m[13] * b->m[3] * b->m[10];

  c.m[5] = b->m[0] * b->m[10] * b->m[15] - b->m[0] * b->m[11] * b->m[14] - b->m[8] * b->m[2] * b->m[15] + b->m[8] * b->m[3] * b->m[14] + b->m[12] * b->m[2] * b->m[11] - b->m[12] * b->m[3] * b->m[10];

  c.m[9] = -b->m[0] * b->m[9] * b->m[15] + b->m[0] * b->m[11] * b->m[13] + b->m[8] * b->m[1] * b->m[15] - b->m[8] * b->m[3] * b->m[13] - b->m[12] * b->m[1] * b->m[11] + b->m[12] * b->m[3] * b->m[9];

  c.m[13] = b->m[0] * b->m[9] * b->m[14] - b->m[0] * b->m[10] * b->m[13] - b->m[8] * b->m[1] * b->m[14] + b->m[8] * b->m[2] * b->m[13] + b->m[12] * b->m[1] * b->m[10] - b->m[12] * b->m[2] * b->m[9];

  c.m[2] = b->m[1] * b->m[6] * b->m[15] - b->m[1] * b->m[7] * b->m[14] - b->m[5] * b->m[2] * b->m[15] + b->m[5] * b->m[3] * b->m[14] + b->m[13] * b->m[2] * b->m[7] - b->m[13] * b->m[3] * b->m[6];

  c.m[6] = -b->m[0] * b->m[6] * b->m[15] + b->m[0] * b->m[7] * b->m[14] + b->m[4] * b->m[2] * b->m[15] - b->m[4] * b->m[3] * b->m[14] - b->m[12] * b->m[2] * b->m[7] + b->m[12] * b->m[3] * b->m[6];

  c.m[10] = b->m[0] * b->m[5] * b->m[15] - b->m[0] * b->m[7] * b->m[13] - b->m[4] * b->m[1] * b->m[15] + b->m[4] * b->m[3] * b->m[13] + b->m[12] * b->m[1] * b->m[7] - b->m[12] * b->m[3] * b->m[5];

  c.m[14] = -b->m[0] * b->m[5] * b->m[14] + b->m[0] * b->m[6] * b->m[13] + b->m[4] * b->m[1] * b->m[14] - b->m[4] * b->m[2] * b->m[13] - b->m[12] * b->m[1] * b->m[6] + b->m[12] * b->m[2] * b->m[5];

  c.m[3] = -b->m[1] * b->m[6] * b->m[11] + b->m[1] * b->m[7] * b->m[10] + b->m[5] * b->m[2] * b->m[11] - b->m[5] * b->m[3] * b->m[10] - b->m[9] * b->m[2] * b->m[7] + b->m[9] * b->m[3] * b->m[6];

  c.m[7] = b->m[0] * b->m[6] * b->m[11] - b->m[0] * b->m[7] * b->m[10] - b->m[4] * b->m[2] * b->m[11] + b->m[4] * b->m[3] * b->m[10] + b->m[8] * b->m[2] * b->m[7] - b->m[8] * b->m[3] * b->m[6];

  c.m[11] = -b->m[0] * b->m[5] * b->m[11] + b->m[0] * b->m[7] * b->m[9] + b->m[4] * b->m[1] * b->m[11] - b->m[4] * b->m[3] * b->m[9] - b->m[8] * b->m[1] * b->m[7] + b->m[8] * b->m[3] * b->m[5];

  c.m[15] = b->m[0] * b->m[5] * b->m[10] - b->m[0] * b->m[6] * b->m[9] - b->m[4] * b->m[1] * b->m[10] + b->m[4] * b->m[2] * b->m[9] + b->m[8] * b->m[1] * b->m[6] - b->m[8] * b->m[2] * b->m[5];

  d = b->m[0] * c.m[0] + b->m[1] * c.m[4] + b->m[2] * c.m[8] + b->m[3] * c.m[12];

  if (d == 0) {
    return false;
  }

  d = 1.0 / d;

  for (e = 0; e < 16; e++) {
    a->m[e] = c.m[e] * d;
  }

  return true;
}

vec* B(vec* a, const vec* b, const mat4* c) {
  vec4 d;

  d.x = b->x * c->m[0] + b->y * c->m[4] + b->z * c->m[8] + c->m[12];
  d.y = b->x * c->m[1] + b->y * c->m[5] + b->z * c->m[9] + c->m[13];
  d.z = b->x * c->m[2] + b->y * c->m[6] + b->z * c->m[10] + c->m[14];
  d.w = b->x * c->m[3] + b->y * c->m[7] + b->z * c->m[11] + c->m[15];

  a->x = d.x / d.w;
  a->y = d.y / d.w;
  a->z = d.z / d.w;

  return a;
}

mat4* C(mat4* a, const mat4* b, const mat4* c) {
  float d[16];

  const float *e = b->m, *f = c->m;

  a->m[0] = e[0] * f[0] + e[4] * f[1] + e[8] * f[2] + e[12] * f[3];
  a->m[1] = e[1] * f[0] + e[5] * f[1] + e[9] * f[2] + e[13] * f[3];
  a->m[2] = e[2] * f[0] + e[6] * f[1] + e[10] * f[2] + e[14] * f[3];
  a->m[3] = e[3] * f[0] + e[7] * f[1] + e[11] * f[2] + e[15] * f[3];

  a->m[4] = e[0] * f[4] + e[4] * f[5] + e[8] * f[6] + e[12] * f[7];
  a->m[5] = e[1] * f[4] + e[5] * f[5] + e[9] * f[6] + e[13] * f[7];
  a->m[6] = e[2] * f[4] + e[6] * f[5] + e[10] * f[6] + e[14] * f[7];
  a->m[7] = e[3] * f[4] + e[7] * f[5] + e[11] * f[6] + e[15] * f[7];

  a->m[8] = e[0] * f[8] + e[4] * f[9] + e[8] * f[10] + e[12] * f[11];
  a->m[9] = e[1] * f[8] + e[5] * f[9] + e[9] * f[10] + e[13] * f[11];
  a->m[10] = e[2] * f[8] + e[6] * f[9] + e[10] * f[10] + e[14] * f[11];
  a->m[11] = e[3] * f[8] + e[7] * f[9] + e[11] * f[10] + e[15] * f[11];

  a->m[12] = e[0] * f[12] + e[4] * f[13] + e[8] * f[14] + e[12] * f[15];
  a->m[13] = e[1] * f[12] + e[5] * f[13] + e[9] * f[14] + e[13] * f[15];
  a->m[14] = e[2] * f[12] + e[6] * f[13] + e[10] * f[14] + e[14] * f[15];
  a->m[15] = e[3] * f[12] + e[7] * f[13] + e[11] * f[14] + e[15] * f[15];

  return a;
}

void D(mat4* a, vec* b) {
  a->m[12] += b->x;
  a->m[13] += b->y;
  a->m[14] += b->z;
}

void E(mat4* a, quat* b) {
  float c = b->x * b->x;
  float d = b->x * b->y;
  float e = b->x * b->z;
  float f = b->x * b->w;

  float g = b->y * b->y;
  float h = b->y * b->z;
  float i = b->y * b->w;

  float j = b->z * b->z;
  float k = b->z * b->w;

  a->m[0] = 1 - 2 * (g + j);
  a->m[1] = 2 * (d + k);
  a->m[2] = 2 * (e - i);
  a->m[3] = 0;

  a->m[4] = 2 * (d - k);
  a->m[5] = 1 - 2 * (c + j);
  a->m[6] = 2 * (h + f);
  a->m[7] = 0.0;

  a->m[8] = 2 * (e + i);
  a->m[9] = 2 * (h - f);
  a->m[10] = 1 - 2 * (c + g);
  a->m[11] = 0.0;

  a->m[15] = 1.0;
}

__kernel void F(global float* a, global float* b, global float* c, global float* d) {
  size_t e = get_global_id(0);

  mat4 f;
  mat4 g;
  for (int h = e * 16, i = 0; h < (e + 1) * 16; h++, i++) {
    f.m[i] = c[h];
    g.m[i] = d[i];
  }

  quat j;
  j.x = a[e * 4];
  j.y = a[e * 4 + 1];
  j.z = a[e * 4 + 2];
  j.w = a[e * 4 + 3];

  vec k;
  k.x = f.m[12];
  k.y = f.m[13];
  k.z = f.m[14];

  mat4 l;
  C(&l, &g, &f);

  l.m[12] -= (2.5 * l.m[15]) * step(1.1f, l.m[12] / l.m[15]);
  l.m[13] += (2.5 * l.m[15]) * step(l.m[13] / l.m[15], -1.1f);
  l.m[14] += (1.5 * l.m[15]) * step(1.1f, l.m[14] / l.m[15]);

  mat4 m;
  A(&m, &g);
  C(&f, &m, &l);

  vec n;
  n.x = b[e * 3];
  n.y = b[e * 3 + 1];
  n.z = b[e * 3 + 2];

  mat4 o;

  E(&o, &j);
  C(&f, &f, &o);
  D(&f, &n);

  for (int h = e * 16, i = 0; h < (e + 1) * 16; h++, i++) {
    c[h] = f.m[i];
  }
}