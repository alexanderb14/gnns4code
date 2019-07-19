void A(const float a, const float b, float* c, float* d) {
  const float e = sqrt(a);
  *c = 1.f - e;
  *d = b * e;
}

float3 B(const float3 a, const float3 b, const float3 c, const float d, const float e, float* f, float* g, float* h) {
  A(d, e, g, h);
  *f = 1.f - (*g) - (*h);

  return (*f) * a + (*g) * b + (*h) * c;
}

float3 C(const float3 a, const float3 b, const float3 c) {
  return normalize(cross(b - a, c - a));
}

float3 D(const float3 a, const float3 b, const float3 c, const float d, const float e, const float f) {
  return normalize(d * a + e * b + f * c);
}

float2 E(const float2 a, const float2 b, const float2 c, const float d, const float e, const float f) {
  return d * a + e * b + f * c;
}

float3 F(const float3 a, const float3 b, const float3 c, const float d, const float e, const float f) {
  return d * a + e * b + f * c;
}

float G(const float a, const float b, const float c, const float d, const float e, const float f) {
  return d * a + e * b + f * c;
}

void H(const float3 a, const float3 b, const float c, float* d, uint* e, uint* f, float* g, float* h, const uint i, const uint j, const float3 k, const float3 l, const float3 m) {
  const float3 n = l - k;
  const float3 o = m - k;
  const float3 p = cross(b, o);

  const float q = dot(p, n);
  if (q == 0.f)
    return;

  const float r = 1.f / q;

  const float3 s = a - k;
  const float t = dot(s, p) * r;
  if (t < 0.f)
    return;

  const float3 u = cross(s, n);
  const float v = dot(b, u) * r;
  if (v < 0.f)
    return;

  const float w = 1.f - t - v;
  if (w < 0.f)
    return;

  const float x = dot(o, u) * r;
  if (x < c || x > *d)
    return;

  *d = x;
  *g = t;
  *h = v;
  *e = i;
  *f = j;
}