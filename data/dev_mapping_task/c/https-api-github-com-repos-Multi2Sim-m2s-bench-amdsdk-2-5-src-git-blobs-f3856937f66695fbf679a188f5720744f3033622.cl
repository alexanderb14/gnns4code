void A(float4 a, float4* b) {
  float4 c;
  float4 d;
  float4 e;
  float4 f;

  const float4 g = (float4)0.319381530f;
  const float4 h = (float4)-0.356563782f;
  const float4 i = (float4)1.781477937f;
  const float4 j = (float4)-1.821255978f;
  const float4 k = (float4)1.330274429f;

  const float4 l = (float4)0.0f;
  const float4 m = (float4)1.0f;
  const float4 n = (float4)2.0f;
  const float4 o = (float4)0.2316419f;

  const float4 p = (float4)0.398942280f;

  d = __clc_fabs(a);
  e = m / (m + o * d);

  c = m - p * exp(-a * a / n) * e * (g + e * (h + e * (i + e * (j + e * k))));

  f = (a < l) ? (m - c) : c;

  *b = f;
}
__kernel void B(const __global float4* a, int b, __global float4* c, __global float4* d) {
  float4 e, f;
  float4 g, h;
  float4 i;
  float4 j;

  size_t k = get_global_id(0);
  size_t l = get_global_id(1);
  float4 m = (float4)2.0f;
  float4 n = a[l * b + k];
  float4 o = 10.0f * n + 100.0f * (1.0f - n);
  float4 p = 10.0f * n + 100.0f * (1.0f - n);
  float4 q = 1.0f * n + 10.0f * (1.0f - n);
  float4 r = 0.01f * n + 0.05f * (1.0f - n);
  float4 s = 0.01f * n + 0.10f * (1.0f - n);

  i = s * sqrt(q);

  e = (log(o / p) + (r + s * s / m) * q) / i;
  f = e - i;

  j = p * exp(-r * q);
  A(e, &g), A(f, &h);
  c[l * b + k] = o * g - j * h;
  A(-e, &g), A(-f, &h);
  d[l * b + k] = j * h - o * g;
}