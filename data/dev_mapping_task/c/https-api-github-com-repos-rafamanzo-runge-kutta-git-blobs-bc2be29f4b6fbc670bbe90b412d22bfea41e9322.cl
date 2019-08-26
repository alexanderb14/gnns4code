typedef struct vec {
  double x;
  double y;
  double z;
} vector;

typedef vector* vector_field;

unsigned int A(int a, int b, unsigned int c, unsigned int d, unsigned int e) {
  return c + a * d + b * a * e;
}

vector B(vector a, double b) {
  vector c;

  c.x = a.x * b;
  c.y = a.y * b;
  c.z = a.z * b;

  return c;
}

vector C(vector a, vector b) {
  vector c;

  c.x = a.x + b.x;
  c.y = a.y + b.y;
  c.z = a.z + b.z;

  return c;
}

vector D(vector a, vector b) {
  vector c;

  c.x = a.x - b.x;
  c.y = a.y - b.y;
  c.z = a.z - b.z;

  return c;
}

double E(vector a) {
  return sqrt(__clc_pow(a.x, 2) + __clc_pow(a.y, 2) + __clc_pow(a.z, 2));
}

void F(vector* a, vector b) {
  (*a).x = b.x;
  (*a).y = b.y;
  (*a).z = b.z;
}

vector G(vector a, __global int* b, __global int* c, __global int* d, __global vector* e) {
  int f, g, h;
  vector i;

  i.x = i.y = i.z = 0.0;

  if ((a.x - __clc_floor(a.x)) > 0.5 && a.x < (*b - 1))
    f = (int)__clc_ceil(a.x);
  else
    f = (int)__clc_floor(a.x);

  if ((a.y - __clc_floor(a.y)) > 0.5 && a.y < (*c - 1))
    g = (int)__clc_ceil(a.y);
  else
    g = (int)__clc_floor(a.y);

  if ((a.z - __clc_floor(a.z)) > 0.5 && a.z < (*d - 1))
    h = (int)__clc_ceil(a.z);
  else
    h = (int)__clc_floor(a.z);

  if (f >= *b || g >= *c || h >= *d || f < 0 || g < 0 || h < 0) {
    return i;
  } else {
    return e[A(*b, *c, f, g, h)];
  }
}
vector H(vector a, __global int* b, __global int* c, __global int* d, __global vector* e) {
  int f, g, h, i, j, k;
  double l, m, n;

  vector o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac;

  f = __clc_ceil(a.x);
  g = __clc_ceil(a.y);
  h = __clc_ceil(a.z);
  i = __clc_floor(a.x);
  j = __clc_floor(a.y);
  k = __clc_floor(a.z);
  l = a.x - i;
  m = a.y - j;
  n = a.z - k;

  if (f >= *b || g >= *c || h >= *d || i < 0 || j < 0 || k < 0) {
    return G(a, b, c, d, e);
  } else {
    F(&o, e[A(*b, *c, i, j, k)]);
    F(&p, e[A(*b, *c, f, j, k)]);
    F(&q, e[A(*b, *c, i, j, h)]);
    F(&r, e[A(*b, *c, f, j, h)]);
    F(&s, e[A(*b, *c, i, g, k)]);
    F(&t, e[A(*b, *c, f, g, k)]);
    F(&u, e[A(*b, *c, i, g, h)]);
    F(&v, e[A(*b, *c, f, g, h)]);

    F(&w, C(o, B(D(p, o), l)));
    F(&x, C(q, B(D(r, q), l)));
    F(&y, C(s, B(D(t, s), l)));
    F(&z, C(u, B(D(v, u), l)));

    F(&aa, C(w, B(D(y, w), m)));
    F(&ab, C(x, B(D(z, x), m)));

    F(&ac, C(aa, B(D(ab, aa), n)));

    return ac;
  }
}

__kernel void I(__global vector* a, __global unsigned int* b, __global double* c, __global int* d, __global int* e, __global int* f, __global vector* g, __global vector* h, __global unsigned int* i, __global unsigned int* j) {
  vector k, l, m, n;
  int o, p;

  p = 0;

  o = get_global_id(0);

  F(&m, a[o]);
  F(&n, g[A(*d, *e, (unsigned int)m.x, (unsigned int)m.y, (unsigned int)m.z)]);

  while (E(n) > 0.0 && (p < (*j) && p < 10000)) {
    p++;

    h[A((*b), 0, o, p - 1, 0)] = m;

    F(&k, B(n, *c));
    F(&l, B(H(C(m, B(k, 0.5)), d, e, f, g), *c));

    F(&m, C(m, l));
    F(&n, H(m, d, e, f, g));
  }

  i[o] = p;
}

__kernel void J(__global vector* a, __global unsigned int* b, __global double* c, __global int* d, __global int* e, __global int* f, __global vector* g, __global vector* h, __global unsigned int* i, __global unsigned int* j) {
  vector k, l, m, n, o, p;
  unsigned int q, r;

  r = 0;

  q = get_global_id(0);

  F(&o, a[q]);
  F(&p, g[A(*d, *e, (unsigned int)o.x, (unsigned int)o.y, (unsigned int)o.z)]);

  while (E(p) > 0.0 && (r < (*j) && r < 10000)) {
    r++;

    h[A((*b), 0, q, r - 1, 0)] = o;

    F(&k, B(p, *c));
    F(&l, B(H(C(o, B(k, 0.5)), d, e, f, g), *c));
    F(&m, B(H(C(o, B(l, 0.5)), d, e, f, g), *c));
    F(&n, B(H(C(o, m), d, e, f, g), *c));

    F(&o, C(o, C(B(k, 0.166666667), C(B(l, 0.333333333), C(B(m, 0.333333333), B(n, 0.166666667))))));
    F(&p, H(o, d, e, f, g));
  }

  i[q] = r;
}