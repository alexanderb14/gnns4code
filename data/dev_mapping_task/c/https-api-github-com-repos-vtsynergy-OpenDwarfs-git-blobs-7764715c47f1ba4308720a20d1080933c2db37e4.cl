void A(__private float* a, __private float3* b, __private float* c, float d, __private float3* e, __private float3* f, __private float3* g, __private float3* h, __private float3* i) {
  (*f).x = (*e).x * (*b).x + d;
  (*f).y = (*e).x * (*b).y;
  (*f).z = (*e).x * (*b).z;

  (*g).x = (*f).y;
  (*g).y = (*e).y * (*b).y + d;
  (*g).z = (*e).y * (*b).z;

  (*h).x = (*f).z;
  (*h).y = (*g).z;
  (*h).z = (*e).z * (*b).z + d;

  float j = *c + d;
  (*i).x = (*e).x * j;
  (*i).y = (*e).y * j;
  (*i).z = (*e).z * j;
}

void B(float a, float3 b, __private float3* c) {
  (*c).x = b.x / a;
  (*c).y = b.y / a;
  (*c).z = b.z / a;
}

float C(float a, float b) {
  return sqrt(1.4f * b / a);
}

float D(float3 a) {
  return a.x * a.x + a.y * a.y + a.z * a.z;
}

float E(float a, float b, float c) {
  return (1.4f - 1.0f) * (b - 0.5f * a * c);
}

__kernel void F(int a, __global int* b, __global float* c, __global float* d, __global float* e, __global float* f, __global float* g, __global float* h, __global float* i, __global float* j, __global float3* k, __global float3* l, __global float3* m, __global float3* n) {
  const float o = 0.2f;
  const int p = get_global_id(0);

  int q, r;
  float3 s;
  float t;
  float u;

  float v = d[p + 0 * a];
  float3 w;
  w.x = d[p + (1 + 0) * a];
  w.y = d[p + (1 + 1) * a];
  w.z = d[p + (1 + 2) * a];

  float x = d[p + (1 + 3) * a];

  float3 y;
  B(v, w, &y);
  float z = D(y);
  float aa = sqrt(z);
  float ab = E(v, x, z);
  float ac = C(v, ab);
  float3 ad, ae, af;
  float3 ag;

  ad.x = e[p + 0 * a];
  ad.y = e[p + 1 * a];
  ad.z = e[p + 2 * a];

  ae.x = f[p + 0 * a];
  ae.y = f[p + 1 * a];
  ae.z = f[p + 2 * a];

  af.x = g[p + 0 * a];
  af.y = g[p + 1 * a];
  af.z = g[p + 2 * a];

  ag.x = h[p + 0 * a];
  ag.y = h[p + 1 * a];
  ag.z = h[p + 2 * a];

  float ah = 0.0f;
  float3 ai;
  ai.x = 0.0f;
  ai.y = 0.0f;
  ai.z = 0.0f;
  float aj = 0.0f;

  float3 ak;
  float al, am;
  float3 an;
  float3 ao, ap, aq;
  float3 ar;
  float as, at, au;

  for (q = 0; q < 4; q++) {
    r = b[p + q * a];
    s.x = c[p + (q + 0 * 4) * a];
    s.y = c[p + (q + 1 * 4) * a];
    s.z = c[p + (q + 2 * 4) * a];
    t = sqrt(s.x * s.x + s.y * s.y + s.z * s.z);

    if (r >= 0) {
      al = d[r + 0 * a];
      an.x = d[r + (1 + 0) * a];
      an.y = d[r + (1 + 1) * a];
      an.z = d[r + (1 + 2) * a];
      am = d[r + (1 + 3) * a];
      B(al, an, &ak);
      as = D(ak);
      au = E(al, am, as);
      at = C(al, au);

      ao.x = e[r + 0 * a];
      ao.y = e[r + 1 * a];
      ao.z = e[r + 2 * a];

      ap.x = f[r + 0 * a];
      ap.y = f[r + 1 * a];
      ap.z = f[r + 2 * a];

      aq.x = g[r + 0 * a];
      aq.y = g[r + 1 * a];
      aq.z = g[r + 2 * a];

      ar.x = h[r + 0 * a];
      ar.y = h[r + 1 * a];
      ar.z = h[r + 2 * a];

      u = -t * o * 0.5f * (aa + sqrt(as) + ac + at);
      ah += u * (v - al);
      aj += u * (x - am);
      ai.x += u * (w.x - an.x);
      ai.y += u * (w.y - an.y);
      ai.z += u * (w.z - an.z);

      u = 0.5f * s.x;
      ah += u * (an.x + w.x);
      aj += u * (ar.x + ag.x);
      ai.x += u * (ao.x + ad.x);
      ai.y += u * (ap.x + ae.x);
      ai.z += u * (aq.x + af.x);

      u = 0.5f * s.y;
      ah += u * (an.y + w.y);
      aj += u * (ar.y + ag.y);
      ai.x += u * (ao.y + ad.y);
      ai.y += u * (ap.y + ae.y);
      ai.z += u * (aq.y + af.y);

      u = 0.5f * s.z;
      ah += u * (an.z + w.z);
      aj += u * (ar.z + ag.z);
      ai.x += u * (ao.z + ad.z);
      ai.y += u * (ap.z + ae.z);
      ai.z += u * (aq.z + af.z);
    } else if (r == -1) {
      ai.x += s.x * ab;
      ai.y += s.y * ab;
      ai.z += s.z * ab;
    } else if (r == -2) {
      u = 0.5f * s.x;
      ah += u * (j[1 + 0] + w.x);
      aj += u * (n[0].x + ag.x);
      ai.x += u * (k[0].x + ad.x);
      ai.y += u * (l[0].x + ae.x);
      ai.z += u * (m[0].x + af.x);

      u = 0.5f * s.y;
      ah += u * (j[1 + 1] + w.y);
      aj += u * (n[0].y + ag.y);
      ai.x += u * (k[0].y + ad.y);
      ai.y += u * (l[0].y + ae.y);
      ai.z += u * (m[0].y + af.y);

      u = 0.5f * s.z;
      ah += u * (j[1 + 2] + w.z);
      aj += u * (n[0].z + ag.z);
      ai.x += u * (k[0].z + ad.z);
      ai.y += u * (l[0].z + ae.z);
      ai.z += u * (m[0].z + af.z);
    }
  }

  i[p + 0 * a] = ah;
  i[p + (1 + 0) * a] = ai.x;
  i[p + (1 + 1) * a] = ai.y;
  i[p + (1 + 2) * a] = ai.z;
  i[p + (1 + 3) * a] = aj;
}

__kernel void G(int a, __global float* b, __global float* c, __global float* d, __global float* e, __global float* f) {
  const int g = get_global_id(0);

  float h = b[g + 0 * a];
  float3 i;
  i.x = b[g + (1 + 0) * a];
  i.y = b[g + (1 + 1) * a];
  i.z = b[g + (1 + 2) * a];
  float j = b[g + (1 + 3) * a];

  float3 k;
  B(h, i, &k);
  float l = D(k);
  float m = sqrt(l);
  float n = E(h, j, l);
  float o = C(h, n);
  float3 p, q, r;
  float3 s;
  A(&h, &i, &j, n, &k, &p, &q, &r, &s);

  c[g + 0 * a] = p.x;
  c[g + 1 * a] = p.y;
  c[g + 2 * a] = p.z;

  d[g + 0 * a] = q.x;
  d[g + 1 * a] = q.y;
  d[g + 2 * a] = q.z;

  e[g + 0 * a] = r.x;
  e[g + 1 * a] = r.y;
  e[g + 2 * a] = r.z;

  f[g + 0 * a] = s.x;
  f[g + 1 * a] = s.y;
  f[g + 2 * a] = s.z;
}

__kernel void H(int a, __global float* b, __global float* c, __global float* d) {
  const int e = get_global_id(0);

  float f = b[e + 0 * a];
  float3 g;
  g.x = b[e + (1 + 0) * a];
  g.y = b[e + (1 + 1) * a];
  g.z = b[e + (1 + 2) * a];

  float h = b[e + (1 + 3) * a];

  float3 i;
  B(f, g, &i);
  float j = D(i);
  float k = E(f, h, j);
  float l = C(f, k);

  d[e] = 0.5f / (sqrt(c[e]) * (sqrt(j) + l));
}

__kernel void I(int a, int b, __global float* c, __global float* d, __global float* e, __global float* f) {
  const int g = get_global_id(0);

  float h = e[g] / (3 + 1 - a);

  d[g + 0 * b] = c[g + 0 * b] + h * f[g + 0 * b];
  d[g + (1 + 3) * b] = c[g + (1 + 3) * b] + h * f[g + (1 + 3) * b];
  d[g + (1 + 0) * b] = c[g + (1 + 0) * b] + h * f[g + (1 + 0) * b];
  d[g + (1 + 1) * b] = c[g + (1 + 1) * b] + h * f[g + (1 + 1) * b];
  d[g + (1 + 2) * b] = c[g + (1 + 2) * b] + h * f[g + (1 + 2) * b];
}

__kernel void J(int a, __global float* b, __global float* c) {
  unsigned int d = get_global_id(0);
  for (int e = 0; e < ((1 + 3) + 1); e++)
    b[d + e * a] = c[e];
}