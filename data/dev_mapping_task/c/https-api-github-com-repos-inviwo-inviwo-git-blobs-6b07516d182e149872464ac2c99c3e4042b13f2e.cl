float A(float3 a, float3 b, float3 c) {
  return dot(cross(a, b), c);
}

bool B(const float3 a, const float3 b, const float3 c, const float3 d, float* __restrict e, float* __restrict f) {
  float g = dot(b, d);

  if (__clc_fabs(g) > 1e-6) {
    float h = dot((a - c), b);

    float i = h / g;

    if (i >= *e && i <= *f) {
      *f = i;
      return true;
    }
  }
  return false;
}

bool C(const float3 a, const float3 b, const float3 c, const float3 d, const float3 e, const float3 f, float* __restrict g, float* __restrict h) {
  float3 i = a - e;
  float3 j = b - e;
  float3 k = c - e;

  float3 l = cross(k, f);
  float m = dot(i, l);
  float3 n;
  if (m >= 0.f) {
    float o = -dot(j, l);
    if (o < 0.f)
      return false;

    float p = A(f, j, i);
    if (p < 0.f)
      return false;

    float q = 1.f / (o + m + p);
    o *= q;
    m *= q;
    p *= q;
    n = o * a + m * b + p * c;
  } else {
    float3 r = d - e;
    float o = dot(r, l);
    if (o < 0.f)
      return false;

    float p = A(f, i, r);
    if (p < 0.f)
      return false;

    m = -m;

    float q = 1.f / (o + m + p);
    o *= q;
    m *= q;
    p *= q;
    n = o * a + m * d + p * c;
  }
  float3 s = n - e;
  if (dot(s, f) >= 0) {
    float t = length(s);
    if (t >= *g && t <= *h) {
      *h = t;
      return true;
    }
  }
  return false;
}