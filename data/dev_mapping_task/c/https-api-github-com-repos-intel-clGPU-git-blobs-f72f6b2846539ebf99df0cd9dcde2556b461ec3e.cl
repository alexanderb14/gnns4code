__kernel void A(__global float* a, int b, __global float* c, float d, float e) {
  int f = get_global_id(0);

  int g = f * b;

  float h = a[g];
  float i = c[f];

  float j = e * i;
  float k = __clc_fma(d, h, j);

  float l = d * i;
  c[f] = __clc_fma(-e, h, l);

  a[g] = k;
}