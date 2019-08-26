typedef struct {
  float x;
  float y;
  float z;
} FLOAT3;
__kernel void A(__global char* a, short b, int c) {
  const int d = get_global_id(0);
  a[d] = b;
}

inline void B(float a, FLOAT3 b, FLOAT3* c) {
  c->x = b.x / a;
  c->y = b.y / a;
  c->z = b.z / a;
}

inline float C(FLOAT3 a) {
  return a.x * a.x + a.y * a.y + a.z * a.z;
}

inline float D(float a, float b, float c) {
  return ((float)((1.4f)) - (float)(1.0f)) * (b - (float)(0.5f) * a * c);
}
inline float E(float a, float b) {
  return sqrt((float)((1.4f)) * b / a);
}
inline void F(float a, FLOAT3 b, float c, float d, FLOAT3 e, FLOAT3* f, FLOAT3* g, FLOAT3* h, FLOAT3* i) {
  f->x = e.x * b.x + d;
  f->y = e.x * b.y;
  f->z = e.x * b.z;

  g->x = f->y;
  g->y = e.y * b.y + d;
  g->z = e.y * b.z;

  h->x = f->z;
  h->y = g->z;
  h->z = e.z * b.z + d;

  float j = c + d;
  i->x = e.x * j;
  i->y = e.y * j;
  i->z = e.z * j;
}
__kernel void G(__global float* a, __constant float* b, int c) {
  const int d = get_global_id(0);
  for (int e = 0; e < ((1 + 3) + 1); e++)
    a[d + e * c] = b[e];
}

__kernel void H(__global float* a, __global float* b, __global float* c, int d) {
  const int e = get_global_id(0);

  float f = a[e + 0 * d];
  FLOAT3 g;
  g.x = a[e + (1 + 0) * d];
  g.y = a[e + (1 + 1) * d];
  g.z = a[e + (1 + 2) * d];

  float h = a[e + (1 + 3) * d];

  FLOAT3 i;
  B(f, g, &i);
  float j = C(i);

  float k = D(f, h, j);
  float l = E(f, k);

  c[e] = (float)(0.5f) / (sqrt(b[e]) * (sqrt(j) + l));
}

__kernel void I(__global int* a, __global float* b, __global float* c, __constant float* d, __global float* e, __constant FLOAT3* f, __constant FLOAT3* g, __constant FLOAT3* h, __constant FLOAT3* i, int j) {
  const float k = (float)(0.2f);

  const int l = get_global_id(0);

  int m, n;
  FLOAT3 o;
  float p;
  float q;

  float r = c[l + 0 * j];
  FLOAT3 s;
  s.x = c[l + (1 + 0) * j];
  s.y = c[l + (1 + 1) * j];
  s.z = c[l + (1 + 2) * j];

  float t = c[l + (1 + 3) * j];

  FLOAT3 u;
  B(r, s, &u);
  float v = C(u);

  float w = sqrt(v);
  float x = D(r, t, v);
  float y = E(r, x);
  FLOAT3 z, aa, ab;
  FLOAT3 ac;
  F(r, s, t, x, u, &z, &aa, &ab, &ac);

  float ad = (float)(0.0f);
  FLOAT3 ae;
  ae.x = (float)(0.0f);
  ae.y = (float)(0.0f);
  ae.z = (float)(0.0f);
  float af = (float)(0.0f);

  FLOAT3 ag;
  float ah, ai;
  FLOAT3 aj;
  FLOAT3 ak, al, am;
  FLOAT3 an;
  float ao, ap, aq;

  for (m = 0; m < 4; m++) {
    n = a[l + m * j];
    o.x = b[l + (m + 0 * 4) * j];
    o.y = b[l + (m + 1 * 4) * j];
    o.z = b[l + (m + 2 * 4) * j];

    p = sqrt(o.x * o.x + o.y * o.y + o.z * o.z);

    if (n >= 0) {
      ah = c[n + 0 * j];
      aj.x = c[n + (1 + 0) * j];
      aj.y = c[n + (1 + 1) * j];
      aj.z = c[n + (1 + 2) * j];
      ai = c[n + (1 + 3) * j];
      B(ah, aj, &ag);
      ao = C(ag);
      aq = D(ah, ai, ao);
      ap = E(ah, aq);
      F(ah, aj, ai, aq, ag, &ak, &al, &am, &an);

      q = -p * k * (float)(0.5f) * (w + sqrt(ao) + y + ap);
      ad += q * (r - ah);
      af += q * (t - ai);
      ae.x += q * (s.x - aj.x);
      ae.y += q * (s.y - aj.y);
      ae.z += q * (s.z - aj.z);

      q = (float)(0.5f) * o.x;
      ad += q * (aj.x + s.x);
      af += q * (an.x + ac.x);
      ae.x += q * (ak.x + z.x);
      ae.y += q * (al.x + aa.x);
      ae.z += q * (am.x + ab.x);

      q = (float)(0.5f) * o.y;
      ad += q * (aj.y + s.y);
      af += q * (an.y + ac.y);
      ae.x += q * (ak.y + z.y);
      ae.y += q * (al.y + aa.y);
      ae.z += q * (am.y + ab.y);

      q = (float)(0.5f) * o.z;
      ad += q * (aj.z + s.z);
      af += q * (an.z + ac.z);
      ae.x += q * (ak.z + z.z);
      ae.y += q * (al.z + aa.z);
      ae.z += q * (am.z + ab.z);
    } else if (n == -1) {
      ae.x += o.x * x;
      ae.y += o.y * x;
      ae.z += o.z * x;
    } else if (n == -2) {
      q = (float)(0.5f) * o.x;
      ad += q * (d[1 + 0] + s.x);
      af += q * (f[0].x + ac.x);
      ae.x += q * (g[0].x + z.x);
      ae.y += q * (h[0].x + aa.x);
      ae.z += q * (i[0].x + ab.x);

      q = (float)(0.5f) * o.y;
      ad += q * (d[1 + 1] + s.y);
      af += q * (f[0].y + ac.y);
      ae.x += q * (g[0].y + z.y);
      ae.y += q * (h[0].y + aa.y);
      ae.z += q * (i[0].y + ab.y);

      q = (float)(0.5f) * o.z;
      ad += q * (d[1 + 2] + s.z);
      af += q * (f[0].z + ac.z);
      ae.x += q * (g[0].z + z.z);
      ae.y += q * (h[0].z + aa.z);
      ae.z += q * (i[0].z + ab.z);
    }
  }

  e[l + 0 * j] = ad;
  e[l + (1 + 0) * j] = ae.x;
  e[l + (1 + 1) * j] = ae.y;
  e[l + (1 + 2) * j] = ae.z;
  e[l + (1 + 3) * j] = af;
}

__kernel void J(int a, int b, __global float* c, __global float* d, __global float* e, __global float* f) {
  const int g = get_global_id(0);

  float h = e[g] / (float)(3 + 1 - a);

  d[g + 0 * b] = c[g + 0 * b] + h * f[g + 0 * b];
  d[g + (1 + 3) * b] = c[g + (1 + 3) * b] + h * f[g + (1 + 3) * b];
  d[g + (1 + 0) * b] = c[g + (1 + 0) * b] + h * f[g + (1 + 0) * b];
  d[g + (1 + 1) * b] = c[g + (1 + 1) * b] + h * f[g + (1 + 1) * b];
  d[g + (1 + 2) * b] = c[g + (1 + 2) * b] + h * f[g + (1 + 2) * b];
}