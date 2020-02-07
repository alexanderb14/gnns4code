__kernel void A(__global float* a, int b, __global float* c, int d, float e, float f) {
  uint g = get_global_id(0);

  uint h = g * b;
  uint i = g * d;

  float j = a[h];
  float k = c[i];

  float l = f * k;
  float m = __clc_fma(e, j, l);

  float n = e * k;
  c[i] = __clc_fma(-f, j, n);

  a[h] = m;
}