__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d) {
  float e, f;
  float g = *b;

  float h = __clc_fabs(*a);
  float i = __clc_fabs(*b);

  if (h > i)
    g = *a;

  float j = h * i;

  if (j == 0.0f) {
    *c = 1.0f;
    *d = 0.0f;
    e = 0.0f;
    f = 0.0f;
  }

  if (j != 0.0f) {
    float k = (*a / j);
    float l = (*b / j);

    e = sign(g) * j * sqrt(k * k + l * l);
    *c = *a / e;
    *d = *b / e;
    f = 1.0f;

    if (h > i)
      f = *d;

    if (i >= h && *c != 0.0f)
      f = 1.0f / *c;
  }

  *a = e;
  *b = f;
}