struct ray {
  float4 org;
  float4 dir;
};

float4 A(struct ray a, float b) {
  return a.org + a.dir * b;
}

float4 B(float16 a, float4 b) {
  float4 c;
  c = a.s0123 * b.x;
  c += a.s4567 * b.y;
  c += a.s89ab * b.z;
  c += a.scdef * b.w;
  return c;
}

float2 C(float4 a) {
  return (float2)(acos(a.y), atan2(a.x, a.z));
}

float4 D(float a, float b) {
  float c = 1.0f - 2.0f * a;
  float d = sqrt(max(0.0f, 1.0f - c * c));
  float e = 2.0f * ((float)3.14159265358979323846) * b;
  float f = d * cos(e);
  float g = d * sin(e);
  return (float4)(f, g, c, 0.0f);
}

float4 E(float4 a) {
  float4 b;
  b.x = a.x <= 0.0031308f ? 12.92f * a.x : 1.055f * __clc_pow(a.x, 1.0f / 2.4f) - 0.055f;
  b.y = a.y <= 0.0031308f ? 12.92f * a.y : 1.055f * __clc_pow(a.y, 1.0f / 2.4f) - 0.055f;
  b.z = a.z <= 0.0031308f ? 12.92f * a.z : 1.055f * __clc_pow(a.z, 1.0f / 2.4f) - 0.055f;
  b.w = a.w;
  return b;
}

float4 F(float4 a) {
  float4 b;
  b.x = a.x <= 0.04045f ? a.x / 12.92f : __clc_pow((a.x + 0.055f) / 1.055f, 2.4f);
  b.y = a.y <= 0.04045f ? a.y / 12.92f : __clc_pow((a.y + 0.055f) / 1.055f, 2.4f);
  b.z = a.z <= 0.04045f ? a.z / 12.92f : __clc_pow((a.z + 0.055f) / 1.055f, 2.4f);
  b.w = a.w;
  return b;
}