float A(float a); void B(__global float* a, __global float* b, float c, float d, float e, float f, float g); float A(float a) {
  const float b = 0.31938153f;
  const float c = -0.356563782f;
  const float d = 1.781477937f;
  const float e = -1.821255978f;
  const float f = 1.330274429f;
  const float g = 0.39894228040143267793994605993438f;

  float h = 1.0f / (1.0f + 0.2316419f * __clc_fabs(a));

  float i = g * exp(-0.5f * a * a) * (h * (b + h * (c + h * (d + h * (e + h * f)))));

  if (a > 0)
    i = 1.0f - i;

  return i;
}

void B(__global float* a, __global float* b, float c, float d, float e, float f, float g) {
  float h = sqrt(e);
  float i = (log(c / d) + (f + 0.5f * g * g) * e) / (g * h);
  float j = i - g * h;
  float k = A(i);
  float l = A(j);

  float m = exp(-f * e);
  *a = (c * k - d * m * l);
  *b = (d * m * (1.0f - l) - c * (1.0f - k));
}

__kernel void C(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, float f, float g, unsigned int h) {
  for (unsigned int i = get_global_id(0); i < h; i += get_global_size(0))
    B(&a[i], &b[i], c[i], d[i], e[i], f, g);
}