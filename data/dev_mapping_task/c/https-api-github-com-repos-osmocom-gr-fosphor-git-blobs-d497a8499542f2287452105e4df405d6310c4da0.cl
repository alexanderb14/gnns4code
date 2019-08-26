float2 A(float2 a, float2 b) {
  float2 c;
  c.even = (a.even * b.even - a.odd * b.odd);
  c.odd = (a.even * b.odd + a.odd * b.even);
  return c;
}

float4 B(float4 a, float4 b) {
  float4 c;
  c.even = (a.even * b.even - a.odd * b.odd);
  c.odd = (a.even * b.odd + a.odd * b.even);
  return c;
}

float2 C(float2 a, int b, float c) {
  float d, e;

  e = sin(b * c);
  d = cos(b * c);
 return A(a, (float2)(de);
}

__constant float Ga = 0.707106781188f;

float2 D(float2 a) {
  return (float2)(a.y, -a.x);
}

float2 E(float2 a) {
  return (float2)(Ga) * (float2)(a.x + a.y, -a.x + a.y);
}

float2 F(float2 a) {
  return (float2)(Ga) * (float2)(-a.x + a.y, -a.x - a.y);
}

__attribute__((always_inline)) void G(float2* a, float2* b) {
  float2 c;

  c = *a - *b;
  *a = *a + *b;
  *b = c;
}

__attribute__((always_inline)) void H(float2* a, float2* b, float2* c, float2* d) {
  G(a, c);
  G(b, d);

  *c = (*c);
  *d = D(*d);

  G(a, b);
  G(c, d);
}

__attribute__((always_inline)) void I(float2* a, float2* b, float2* c, float2* d, float2* e, float2* f, float2* g, float2* h) {
  G(a, e);
  G(b, f);
  G(c, g);
  G(d, h);

  *e = (*e);
  *f = E(*f);
  *g = D(*g);
  *h = F(*h);

  G(a, c);
  G(b, d);
  G(e, g);
  G(f, h);

  *c = (*c);
  *d = D(*d);
  *g = (*g);
  *h = D(*h);

  G(a, b);
  G(c, d);
  G(e, f);
  G(g, h);
}
__attribute__((always_inline)) void J(float2* a) {
  G(&a[0], &a[1]);
}

__attribute__((always_inline)) void K(float2* a, int b, int c) {
  float d = -(3.141592653589f) * (float)b / (float)(c);

  a[1] = C(a[1], 1, d);
}

__attribute__((always_inline)) void L(__local float2* a, float2* b, int c, int d) {
  a += c;

  b[0] = a[0];
  b[1] = a[d];
}

__attribute__((always_inline)) void M(__local float2* a, float2* b, int c, int d, int e) {
  int f = ((c - d) << 1) + d;

  a += f;

  a[0] = b[0];
  a[e] = b[1];
}

__attribute__((always_inline)) void N(__local float2* a, float2* b, int c, int d, int e, int f) {
  int g = d & (c - 1);

  L(a, b, d, e);

  if (f)
    K(b, g, c);

  J(b);

  barrier(1);

  M(a, b, d, g, c);

  barrier(1);
}

__attribute__((always_inline)) void O(float2* a) {
  H(&a[0], &a[1], &a[2], &a[3]);
}

__attribute__((always_inline)) void P(float2* a, int b, int c) {
  float d = -(3.141592653589f) * (float)b / (float)(2 * c);

  a[1] = C(a[1], 1, d);
  a[2] = C(a[2], 2, d);
  a[3] = C(a[3], 3, d);
}

__attribute__((always_inline)) void Q(__local float2* a, float2* b, int c, int d) {
  a += c;

  b[0] = a[0];
  b[1] = a[d];
  b[2] = a[2 * d];
  b[3] = a[3 * d];
}

__attribute__((always_inline)) void R(__local float2* a, float2* b, int c, int d, int e) {
  int f = ((c - d) << 2) + d;

  a += f;

  a[0] = b[0];
  a[e] = b[2];
  a[2 * e] = b[1];
  a[3 * e] = b[3];
}

__attribute__((always_inline)) void S(__local float2* a, float2* b, int c, int d, int e, int f) {
  int g = d & (c - 1);

  Q(a, b, d, e);

  if (f)
    P(b, g, c);

  O(b);

  barrier(1);

  R(a, b, d, g, c);

  barrier(1);
}

__attribute__((always_inline)) void T(float2* a) {
  I(&a[0], &a[1], &a[2], &a[3], &a[4], &a[5], &a[6], &a[7]);
}

__attribute__((always_inline)) void U(float2* a, int b, int c) {
  float d = -(3.141592653589f) * (float)b / (float)(4 * c);

  a[1] = C(a[1], 1, d);
  a[2] = C(a[2], 2, d);
  a[3] = C(a[3], 3, d);
  a[4] = C(a[4], 4, d);
  a[5] = C(a[5], 5, d);
  a[6] = C(a[6], 6, d);
  a[7] = C(a[7], 7, d);
}

__attribute__((always_inline)) void V(__local float2* a, float2* b, int c, int d) {
  a += c;

  b[0] = a[0];
  b[1] = a[d];
  b[2] = a[2 * d];
  b[3] = a[3 * d];
  b[4] = a[4 * d];
  b[5] = a[5 * d];
  b[6] = a[6 * d];
  b[7] = a[7 * d];
}

__attribute__((always_inline)) void W(__local float2* a, float2* b, int c, int d, int e) {
  int f = ((c - d) << 3) + d;

  a += f;

  a[0] = b[0];
  a[e] = b[4];
  a[2 * e] = b[2];
  a[3 * e] = b[6];
  a[4 * e] = b[1];
  a[5 * e] = b[5];
  a[6 * e] = b[3];
  a[7 * e] = b[7];
}

__attribute__((always_inline)) void X(__local float2* a, float2* b, int c, int d, int e, int f) {
  int g = d & (c - 1);

  V(a, b, d, e);

  if (f)
    U(b, g, c);

  T(b);

  barrier(1);

  W(a, b, d, g, c);

  barrier(1);
}

__kernel void Y(__global const float2* a, __global float2* b, __constant const float* c) {
  __local float2 d[512];

  float2 e[8];
  int f = get_local_id(0);
  int g;

  a += 512 * get_global_id(1);
  b += 512 * get_global_id(1);

  for (g = f; g < 512; g += (512 / 8))
    d[g] = a[g] * c[g];

  X(d, e, 1, f, (512 / 8), 0);

  X(d, e, 8, f, (512 / 8), 1);

  X(d, e, 64, f, (512 / 8), 1);

  for (g = 0; g < 8; g++)
    b[g * (512 / 8) + f] = d[g * (512 / 8) + f];
}

__kernel void Z(__global const float2* a, __global float2* b, __constant const float* c) {
  __local float2 d[1024];

  float2 e[8];
  int f = get_local_id(0);
  int g;

  a += 1024 * get_global_id(1);
  b += 1024 * get_global_id(1);

  for (g = f; g < 1024; g += (1024 / 8))
    d[g] = a[g] * c[g];

  X(d, e, 1, f, (1024 / 8), 0);

  X(d, e, 8, f, (1024 / 8), 1);

  X(d, e, 64, f, (1024 / 8), 1);

  {
    const int h = 512;
    const int g = f << 2;
    const int i = (1024 / 8) << 2;
    const int j = g;

    L(d, e + 0, g + 0, i);
    L(d, e + 2, g + 1, i);
    L(d, e + 4, g + 2, i);
    L(d, e + 6, g + 3, i);

    K(e + 0, j + 0, h);
    K(e + 2, j + 1, h);
    K(e + 4, j + 2, h);
    K(e + 6, j + 3, h);

    J(e + 0);
    J(e + 2);
    J(e + 4);
    J(e + 6);

    barrier(1);

    M(d, e + 0, g + 0, j + 0, h);
    M(d, e + 2, g + 1, j + 1, h);
    M(d, e + 4, g + 2, j + 2, h);
    M(d, e + 6, g + 3, j + 3, h);

    barrier(1);
  }

  for (g = 0; g < 8; g++)
    b[g * (1024 / 8) + f] = d[g * (1024 / 8) + f];
}