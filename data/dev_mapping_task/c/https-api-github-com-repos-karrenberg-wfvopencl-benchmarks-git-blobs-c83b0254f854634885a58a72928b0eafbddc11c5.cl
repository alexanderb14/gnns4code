struct Ray {
  float orgX, orgY, orgZ;
  float dirX, dirY, dirZ;
};
struct Sphere {
  float centerX, centerY, centerZ;
  float radius;
};
struct Plane {
  float pX, pY, pZ;
  float nX, nY, nZ;
};

struct Intersection {
  float t;
  float pX, pY, pZ;
  float nX, nY, nZ;
  int hit;
};

void A(const struct Sphere* a, const struct Ray* b, struct Intersection* c) {
  const float d = b->orgX - a->centerX;
  const float e = b->orgY - a->centerY;
  const float f = b->orgZ - a->centerZ;
  const float g = d * b->dirX + e * b->dirY + f * b->dirZ;
  const float h = (d * d + e * e + f * f) - (a->radius * a->radius);
  const float i = g * g - h;

  if (i > 0.0f) {
    const float j = -g - sqrt(i);
    if ((j > 0.0f) && (j < c->t)) {
      c->t = j;
      c->hit = 1;

      const float k = b->orgX + b->dirX * j;
      const float l = b->orgY + b->dirY * j;
      const float m = b->orgZ + b->dirZ * j;
      float n = k - a->centerX;
      float o = l - a->centerY;
      float p = m - a->centerZ;

      const float q = n * n + o * o + p * p;
      const float r = 1.0f / sqrt(q);
      n = n * r;
      o = o * r;
      p = p * r;
      c->nX = n;
      c->nY = o;
      c->nZ = p;
      c->pX = k;
      c->pY = l;
      c->pZ = m;
    }
  }
}

void B(const struct Plane* a, const struct Ray* b, struct Intersection* c) {
  const float d = 1.0f - (a->pX * a->nX + a->pY * a->nY + a->pZ * a->nZ);
  const float e = b->dirX * a->nX + b->dirY * a->nY + b->dirZ * a->nZ;

  if (__clc_fabs(e) < 1.0e-6f)
    return;

  const float f = (1.0f - (b->orgX * a->nX + b->orgY * a->nY + b->orgZ * a->nZ + d)) / e;

  if ((f > 0.0f) && (f < c->t)) {
    c->hit = 1;
    c->t = f;
    c->nX = a->nX;
    c->nY = a->nY;
    c->nZ = a->nZ;

    const float g = b->orgX + f * b->dirX;
    const float h = b->orgY + f * b->dirY;
    const float i = b->orgZ + f * b->dirZ;
    c->pX = g;
    c->pY = h;
    c->pZ = i;
  }
}

void C(const struct Ray* a, struct Intersection* b) {
  struct Sphere c[3];
  c[0].centerX = -2.0f;
  c[0].centerY = 0.0f;
  c[0].centerZ = -3.5f;
  c[0].radius = 0.5f;
  c[1].centerX = -0.5f;
  c[1].centerY = 0.0f;
  c[1].centerZ = -3.0f;
  c[1].radius = 0.5f;
  c[2].centerX = 1.0f;
  c[2].centerY = 0.0f;
  c[2].centerZ = -2.2f;
  c[2].radius = 0.5f;
  struct Plane d;
  d.pX = 0.0f;
  d.pY = -0.5f;
  d.pZ = 0.0f;
  d.nX = 0.0f;
  d.nY = 1.0f;
  d.nZ = 0.0f;

  A(&c[0], a, b);
  A(&c[1], a, b);
  A(&c[2], a, b);
  B(&d, a, b);
}

void D(float a[3], float b[3], float c[3], const float d, const float e, const float f) {
  a[2] = d;
  b[2] = e;
  c[2] = f;
  a[1] = 0.0f;
  b[1] = 0.0f;
  c[1] = 0.0f;

  if ((d < 0.6f) && (d > -0.6f))
    a[1] = 1.0f;
  else if ((e < 0.6f) && (e > -0.6f))
    b[1] = 1.0f;
  else if ((f < 0.6f) && (f > -0.6f))
    c[1] = 1.0f;
  else
    a[1] = 1.0f;

  a[0] = b[1] * c[2] - c[1] * b[2];
  b[0] = c[1] * a[2] - a[1] * c[2];
  c[0] = a[1] * b[2] - b[1] * a[2];

  const float g = a[0] * a[0] + b[0] * b[0] + c[0] * c[0];
  const float h = 1.0f / sqrt(g);
  a[0] = a[0] * h;
  b[0] = b[0] * h;
  c[0] = c[0] * h;

  a[1] = b[2] * c[0] - c[2] * b[0];
  b[1] = c[2] * a[0] - a[2] * c[0];
  c[1] = a[2] * b[0] - b[2] * a[0];

  const float i = a[1] * a[1] + b[1] * b[1] + c[1] * c[1];
  const float j = 1.0f / sqrt(i);
  a[1] = a[1] * j;
  b[1] = b[1] * j;
  c[1] = c[1] * j;
}

float E(struct Intersection* a, float* b) {
  int c, d;
  const int e = 16;
  const int f = 16;
  float g = 0.0001f;

  float h = a->pX + g * a->nX;
  float i = a->pY + g * a->nY;
  float j = a->pZ + g * a->nZ;

  float k[3], l[3], m[3];
  D(k, l, m, a->nX, a->nY, a->nZ);

  float n = 0.0f;

  for (d = 0; d < e; d++) {
    for (c = 0; c < f; c++) {
      *b = (int)(fmod((float)(*b) * 1364.0f + 626.0f, 509.0f));
      const float o = *b / 509.0f;
      *b = (int)(fmod((float)(*b) * 1364.0f + 626.0f, 509.0f));
      const float p = *b / 509.0f * 2.0f * 3.141592f;

      const float q = cos(p) * sqrt(1.0f - o);
      const float r = sin(p) * sqrt(1.0f - o);
      const float s = sqrt(o);

      const float t = q * k[0] + r * k[1] + s * k[2];
      const float u = q * l[0] + r * l[1] + s * l[2];
      const float v = q * m[0] + r * m[1] + s * m[2];

      struct Ray w;
      w.orgX = h;
      w.orgY = i;
      w.orgZ = j;
      w.dirX = t;
      w.dirY = u;
      w.dirZ = v;

      struct Intersection x;
      x.hit = 0;
      x.t = 1.0e+30f;
      x.nX = x.pX = 0.0f;
      x.nY = x.pY = 0.0f;
      x.nZ = x.pZ = 0.0f;
      C(&w, &x);
      if (x.hit != 0)
        n += 1.0f;
    }
  }

  n = ((float)(e * f) - n) / (float)(e * f);
  return n;
}

__kernel void F(__global uint* a, uint b, uint c) {
  const float d = b / 2.0f;
  const float e = c / 2.0f;

  struct Intersection f;
  f.hit = 0;
  f.t = 1.0e+30f;
  f.nX = f.pX = 0;
  f.nY = f.pY = 0;
  f.nZ = f.pZ = 0;

  const float g = ((float)(int)(get_global_id(0)) - d) / d;
  const float h = ((float)(int)(get_global_id(1)) - e) / e;

  const float i = g * g + h * h + 1.0f;
  const float j = 1.0f / sqrt(i);
  const float k = g * j;
  const float l = h * j;
  const float m = -1.0f * j;
  struct Ray n;
  n.orgX = 0;
  n.orgY = 0;
  n.orgZ = 0;
  n.dirX = k;
  n.dirY = l;
  n.dirZ = m;
  int o = (int)(fmod((k + d) * (l + e) * 4525434.0f, 65536.0f));

  int p = 0;
  C(&n, &f);
  if (f.hit != 0) {
    float q = o;
    p = (int)(E(&f, &q) * 255);
    o = q;
  }

  a[get_global_id(0) + get_global_id(1) * get_global_size(0)] = (int)(p | (p << 8) | (p << 16) | (255 << 24));
}