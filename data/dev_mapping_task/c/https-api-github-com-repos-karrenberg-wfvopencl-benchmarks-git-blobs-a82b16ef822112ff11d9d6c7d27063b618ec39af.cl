void A(float a, float* b) {
  float c;
  float d;
  float e;
  float f;

  const float g = (float)0.319381530f;
  const float h = (float)-0.356563782f;
  const float i = (float)1.781477937f;
  const float j = (float)-1.821255978f;
  const float k = (float)1.330274429f;

  const float l = (float)0.0f;
  const float m = (float)1.0f;
  const float n = (float)2.0f;
  const float o = (float)0.2316419f;

  const float p = (float)0.398942280f;

  d = __clc_fabs(a);
  e = m / (m + o * d);

  c = m - p * exp(-a * a / n) * e * (g + e * (h + e * (i + e * (j + e * k))));

  f = (a < l) ? (m - c) : c;

  *b = f;
}
__kernel void B(const __global float* a, int b, __global float* c, __global float* d) {
  float e, f;
  float g, h;
  float i;
  float j;

  size_t k = get_global_id(0);
  size_t l = get_global_id(1);
  float m = (float)2.0f;

  float n = a[l * b + k];
  float o = 10.0f * n + 100.0f * (1.0f - n);
  float p = 10.0f * n + 100.0f * (1.0f - n);
  float q = 1.0f * n + 10.0f * (1.0f - n);
  float r = 0.01f * n + 0.05f * (1.0f - n);
  float s = 0.01f * n + 0.10f * (1.0f - n);

  i = s * sqrt(q);

  e = (log(o / p) + (r + s * s / m) * q) / i;
  f = e - i;

  j = p * exp(-r * q);
  A(e, &g), A(f, &h);

  c[l * b + k] = o * g - j * h;
  A(-e, &g), A(-f, &h);

  d[l * b + k] = j * h - o * g;
}