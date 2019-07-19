int A(int a, int b) {
  if (b == 0)
    b = 1;

  a %= b;
  if (a < 0)
    a += b;

  return a;
}

float B(float a) {
  return (0x1.921fb6p+1f / 180.f) * a;
}

float C(float a) {
  return (180.f / 0x1.921fb6p+1f) * a;
}

int D(float a) {
  return (int)__clc_ceil(a);
}

uint E(float a) {
  return (uint)__clc_ceil(a);
}

int F(const float a) {
  return (int)__clc_floor(a);
}

unsigned int G(const float a) {
  return (a > 0.f) ? ((unsigned int)__clc_floor(a)) : 0;
}

float H(const float a, const float b, const float c) {
  return mix(b, c, a);
}

float3 I(const float a, const float3 b, const float3 c) {
  return mix(b, c, a);
}

float J(float a, float b, float c, float d, float e) {
  return c + .5f * a * (d - b + a * (2.f * b - 5.f * c + 4.f * d - e + a * (3.f * (c - d) + e - b)));
}

float3 K(float a, float3 b, float3 c, float3 d, float3 e) {
  return c + .5f * a * (d - b + a * (2.f * b - 5.f * c + 4.f * d - e + a * (3.f * (c - d) + e - b)));
}

float L(const float a, const float b, const float c) {
  const float d = clamp((c - a) / (b - a), 0.f, 1.f);
  return d * d * (-2.f * d + 3.f);
}

float M(const float3 a) {
  return a.z;
}

float N(const float3 a) {
  return fmax(0.f, 1.f - M(a) * M(a));
}

float O(const float3 a) {
  return sqrt(N(a));
}

float P(const float3 a) {
  const float b = O(a);
  return b > 0.f ? clamp(a.x / b, -1.f, 1.f) : 1.f;
}

float Q(const float3 a) {
  const float b = O(a);
  return b > 0.f ? clamp(a.y / b, -1.f, 1.f) : 0.f;
}

float3 R(float a, float b, float c) {
 return (float3)(ac ac bloat3 S(float a, float b, float c,
 const float3 d, const float3 e, const float3 f) {
    return a * cos(c) * d + a * sin(c) * e + b * f;
}