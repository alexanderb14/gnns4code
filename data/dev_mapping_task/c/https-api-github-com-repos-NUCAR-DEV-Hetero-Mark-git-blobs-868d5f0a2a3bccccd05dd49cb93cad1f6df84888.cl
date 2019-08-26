float A(float a) {
  float b, c, d;

  const float e = 0.319381530f;
  const float f = -0.356563782f;
  const float g = 1.781477937f;
  const float h = -1.821255978f;
  const float i = 1.330274429f;

  const float j = 0.398942280f;

  c = __clc_fabs(a);
  d = 1.0f / (1.0f + 0.2316419f * c);

  b = 1.0f - j * exp(-a * a / 2.0f) * d * (e + d * (f + d * (g + d * (h + d * i))));

  return (a < 0) ? (1.0f - b) : b;
}

__kernel void B(__global float* a, __global float* b, __global float* c, int d) {
  a = a + d;
  b = b + d;
  c = c + d;
  uint e = get_global_id(0);

  float f = a[e];

  float g = 10.0 * f + 100.0 * (1.0f - f);
  float h = 10.0 * f + 100.0 * (1.0f - f);
  float i = 1.0 * f + 10.0 * (1.0f - f);
  float j = 0.01 * f + 0.05 * (1.0f - f);
  float k = 0.01 * f + 0.10 * (1.0f - f);

  float l = k * sqrt(i);

  float m = (log(g / h) + (j + k * k / 2.0f) * i) / l;
  float n = m - l;

  float o = h * exp(-j * i);

  b[e] = g * A(m) - o * A(n);
  c[e] = o * A(-n) - g * A(-m);
}