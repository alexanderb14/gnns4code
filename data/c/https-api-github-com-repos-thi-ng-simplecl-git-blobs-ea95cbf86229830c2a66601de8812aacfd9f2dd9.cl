typedef struct {
  float2 pos;
  float2 prev;
  float2 force;
  float mass;
  char isLocked;
} Particle2;

typedef struct {
  int a;
  int b;
  float restLength;
  float strength;
} Spring;

typedef struct {
  float2 min;
  float2 max;
} Rect;

typedef struct {
  float2 pos;
  float radius;
} Circle;

void A(global Particle2* a, const float2 b);
void B(global Particle2* a, const float b);
void C(global Particle2* a, global const Rect* b);
void D(global Particle2* a, global const Circle* b);

void A(global Particle2* a, const float2 b) {
  const float2 c = a->pos;
  a->pos += __clc_fma(a->force + b, (float2)(1.0f / a->mass), a->pos - a->prev);
  a->prev = c;
  a->force = (float2)0.0f;
}

void B(global Particle2* a, const float b) {
  a->prev = mix(a->prev, a->pos, (float2)b);
}

void C(global Particle2* a, global const Rect* b) {
  a->pos = clamp(a->pos, b->min, b->max);
}

void D(global Particle2* a, global const Circle* b) {
  const float2 c = a->pos - b->pos;
  if (length(c) < b->radius) {
    a->pos = __clc_fma(normalize(c), (float2)b->radius, b->pos);
  }
}

kernel void E(global Particle2* a, global const Rect* b, global const float2* c, global Particle2* d, const unsigned int e, const float f) {
  unsigned int g = get_global_id(0);
  if (g < e) {
    global Particle2* h = &a[g];
    if (h->isLocked == 0) {
      B(h, f);
      A(h, c[0]);
      C(h, b);
    }
    d[g] = *h;
  }
}

kernel void F(global Particle2* a, global const Spring* b, global const Rect* c, global Particle2* d, const unsigned int e) {
  unsigned int f = get_global_id(0);
  if (f < e) {
    global const Spring* g = &b[f];
    global Particle2* h = &a[g->a];
    global Particle2* i = &a[g->b];
    const float2 j = i->pos - h->pos;
    const float k = length(j) + 1e-6;
    const float l = 1.0f / h->mass;
    const float m = 1.0f / i->mass;
    const float n = (k - g->restLength) / (k * (l + m)) * g->strength;
    if (h->isLocked == 0) {
      h->pos += (j * n * l);
      C(h, c);
      d[g->a] = *h;
    }
    if (i->isLocked == 0) {
      i->pos += (j * -n * m);
      C(i, c);
      d[g->b] = *i;
    }
  }
}

kernel void G(global Particle2* a, global const Circle* b, global Particle2* c, const unsigned int d, const unsigned int e) {
  unsigned int f = get_global_id(0);
  if (f < d) {
    global Particle2* g = &a[f];
    for (unsigned int h = 0; h < e; h++) {
      global const Circle* i = &b[h];
      D(g, i);
    }
    c[f] = *g;
  }
}