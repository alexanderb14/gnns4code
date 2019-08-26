__kernel void A(__global float* a, __global float* b, int c, float d, float e) {
  int f = get_global_id(0);

  int g = f * c;

  float h = a[f];
  float i = b[g];

  float j = e * i;
  float k = __clc_fma(d, h, j);

  float l = d * i;
  b[g] = __clc_fma(-e, h, l);

  a[f] = k;
}