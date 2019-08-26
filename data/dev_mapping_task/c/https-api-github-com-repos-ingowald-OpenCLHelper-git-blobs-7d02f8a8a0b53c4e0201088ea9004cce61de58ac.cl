struct RNGState {
  int seed;
  int state;
  int table[32];
};

void A(struct RNGState* a, int b) {
  const int c = 16807;
  const int d = 2147483647;
  const int e = 127773;
  const int f = 2836;

  if (b == 0)
    a->seed = 1;
  else
    a->seed = b & 0x7FFFFFFF;

  for (int g = 32 + 7; g >= 0; g--) {
    int h = a->seed / e;
    a->seed = c * (a->seed - h * e) - f * h;
    a->seed = a->seed & 0x7FFFFFFF;
    if (g < 32)
      a->table[g] = a->seed;
  }
  a->state = a->table[0];
}

float B(struct RNGState* a) {
  const int b = 16807;
  const int c = 2147483647;
  const int d = 127773;
  const int e = 2836;
  const int f = 1 + (2147483647 / 32);

  int g = a->seed / d;
  a->seed = b * (a->seed - g * d) - e * g;
  a->seed = a->seed & 0x7FFFFFFF;
  int h = min(a->state / f, 32 - 1);
  a->state = a->table[h];
  a->table[h] = a->seed;
  return a->state;
}

float C(struct RNGState* a) {
  return B(a) / 2147483647.0f;
}

struct vec3f {
  float x, y, z;
};

struct Isect {
  float t;
  struct vec3f p;
  struct vec3f n;
  int hit;
};

struct Sphere {
  struct vec3f center;
  float radius;
};

struct Plane {
  struct vec3f p;
  struct vec3f n;
};

struct Ray {
  struct vec3f org;
  struct vec3f dir;
};

inline float D(struct vec3f a, struct vec3f b) {
  return a.x * b.x + a.y * b.y + a.z * b.z;
}

inline struct vec3f E(struct vec3f a, struct vec3f b) {
  struct vec3f c;
  c.x = a.y * b.z - a.z * b.y;
  c.y = a.z * b.x - a.x * b.z;
  c.z = a.x * b.y - a.y * b.x;
  return c;
}

inline struct vec3f
F(struct vec3f a, float b) {
  struct vec3f c;
  c.x = a.x * b;
  c.y = a.y * b;
  c.z = a.z * b;
  return c;
}

inline struct vec3f
G(struct vec3f a, struct vec3f b) {
  struct vec3f c;
  c.x = a.x + b.x;
  c.y = a.y + b.y;
  c.z = a.z + b.z;
  return c;
}

inline struct vec3f
H(struct vec3f a, struct vec3f b) {
  struct vec3f c;
  c.x = a.x - b.x;
  c.y = a.y - b.y;
  c.z = a.z - b.z;
  return c;
}

inline struct vec3f
I(struct vec3f a, float b, struct vec3f c) {
  struct vec3f d;
  d.x = a.x + b * c.x;
  d.y = a.y + b * c.y;
  d.z = a.z + b * c.z;
  return d;
}

inline struct vec3f
J(struct vec3f a) {
  float b = D(a, a);
  float c = (1.f / sqrt(b));
  return F(a, c);
}

inline void
K(struct Isect* a, struct Ray b, struct Plane c) {
  float d = -D(c.p, c.n);
  float e = D(b.dir, c.n);

  if (__clc_fabs(e) < 1.0e-17f)
    return;
  else {
    float f = -(D(b.org, c.n) + d) / e;

    if ((f > 0.0f) && (f < a->t)) {
      a->t = f;
      a->hit = 1;
      a->p = I(b.org, f, b.dir);
      a->n = c.n;
    }
  }
}

inline void L(struct Isect* a, struct Ray b, struct Sphere c) {
  struct vec3f d = H(b.org, c.center);

  float e = D(d, b.dir);
  float f = D(d, d) - c.radius * c.radius;
  float g = e * e - f;

  if (g > 0.f) {
    float h = -e - sqrt(g);

    if ((h > 0.0f) && (h < a->t)) {
      a->t = h;
      a->hit = 1;
      a->p = I(b.org, h, b.dir);
      a->n = J(H(a->p, c.center));
    }
  }
}

inline void M(struct vec3f a[3], struct vec3f b) {
  a[2] = b;
  a[1].x = 0.0f;
  a[1].y = 0.0f;
  a[1].z = 0.0f;

  if ((b.x < 0.6f) && (b.x > -0.6f)) {
    a[1].x = 1.0f;
  } else if ((b.y < 0.6f) && (b.y > -0.6f)) {
    a[1].y = 1.0f;
  } else if ((b.z < 0.6f) && (b.z > -0.6f)) {
    a[1].z = 1.0f;
  } else {
    a[1].x = 1.0f;
  }

  a[0] = J(E(a[1], a[2]));
  a[1] = J(E(a[2], a[0]));
}

float N(struct Isect* a, struct Plane b, struct Sphere c[3], struct RNGState* d) {
  float e = 0.0001f;
  struct vec3f f, g;
  struct vec3f h[3];
  float i = 0.0f;

  f = I(a->p, e, a->n);

  M(h, a->n);

  const int j = 8;
  const int k = 8;
  for (int l = 0; l < j; l++) {
    for (int m = 0; m < k; m++) {
      struct Ray n;
      struct Isect o;

      float p = sqrt(C(d));
      float q = 2.0f * 3.1415926535f * C(d);
      float r = cos(q) * p;
      float s = sin(q) * p;
      float t = sqrt(1.0f - p * p);

      float u = r * h[0].x + s * h[1].x + t * h[2].x;
      float v = r * h[0].y + s * h[1].y + t * h[2].y;
      float w = r * h[0].z + s * h[1].z + t * h[2].z;

      n.org = f;
      n.dir.x = u;
      n.dir.y = v;
      n.dir.z = w;

      o.t = 1.0e+17f;
      o.hit = 0;

      for (int x = 0; x < 3; ++x)
        L(&o, n, c[x]);
      K(&o, n, b);

      if (o.hit)
        i += 1.0f;
    }
  }

  i = (j * k - i) / (float)(j * k);
  return i;
}

__kernel void O(int a, int b, int c, __global float* d) {
  struct Plane e = {{0.0f, -0.5f, 0.0f}, {0.f, 1.f, 0.f}};
  struct Sphere f[3] = {{{-2.0f, 0.0f, -3.5f}, 0.5f}, {{-0.5f, 0.0f, -3.0f}, 0.5f}, {{1.0f, 0.0f, -2.2f}, 0.5f}};
  struct RNGState g;

  float h = 1.f / c;

  int i = get_global_id(0);
  int j = get_global_id(1);
  int k = 3 * (j * a + i);
  A(&g, k);

  float l = 0.f;
  for (int m = 0; m < c; m++)
    for (int n = 0; n < c; n++) {
      float o = (float)n * h, p = (float)m * h;

      float q = (i + o - (a / 2.0f)) / (a / 2.0f);
      float r = -(j + p - (b / 2.0f)) / (b / 2.0f);
      struct Ray s;
      struct Isect t;

      s.org.x = 0.f;
      s.org.y = 0.f;
      s.org.z = 0.f;

      s.dir.x = q;
      s.dir.y = r;
      s.dir.z = -1.0f;
      s.dir = J(s.dir);

      t.t = 1.0e+17f;
      t.hit = 0;

      for (int u = 0; u < 3; ++u)
        L(&t, s, f[u]);
      K(&t, s, e);

      if (t.hit) {
        l += N(&t, e, f, &g);
      }
    }

  l *= (h * h);

  d[k] = l;
  d[k + 1] = l;
  d[k + 2] = l;
}