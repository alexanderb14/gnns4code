float2 A(float a, float b) {
  return (float2)(a, b);
}

float2 B(float a, float b) {
  return (float2)(hypot(a, b), atan2(b, a));
}

float2 C(float2 a, float2 b) {
  return A(a.x * b.x - a.y * b.y, a.x * b.y + a.y * b.x);
}

float2 D(float2 a, float2 b) {
  float c = dot(b, b);
  return A((((a.x * b.x + a.y * b.y)) / (c)), (((a.y * b.x - a.x * b.y)) / (c)));
}

float E(float a) {
  if (isnan(a) || isinf(a))
    a = 0.0f;
  return a;
}

float2 F(float2 a) {
  if (isnan(a.x) || isinf(a.x))
    a.x = 0.0f;
  if (isnan(a.y) || isinf(a.y))
    a.y = 0.0f;
  return a;
}

float4 G(float4 a) {
  if (isnan(a.x) || isinf(a.x))
    a.x = 0.0f;
  if (isnan(a.y) || isinf(a.y))
    a.y = 0.0f;
  if (isnan(a.z) || isinf(a.z))
    a.z = 0.0f;
  if (isnan(a.w) || isinf(a.w))
    a.w = 0.0f;
  return a;
}

float2 H(float2 a, float b) {
  return a - b * __clc_floor(A(((a.x) / (b)), ((a.y) / (b))));
}

float I(float a, float b) {
  return exp2(b * native_log2(a));
}

float4 J(float4 a, float b) {
  return (float4a(Ia Ia I, a.w);
}