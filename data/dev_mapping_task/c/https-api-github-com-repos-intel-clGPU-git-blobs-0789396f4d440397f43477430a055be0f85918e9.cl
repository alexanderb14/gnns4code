__kernel void A(__global float* a, __global float* b, float c, float d) {
  uint e = get_global_id(0);

  float f = a[e];
  float g = b[e];

  float h = d * g;
  float i = __clc_fma(c, f, h);

  float j = c * g;
  b[e] = __clc_fma(-d, f, j);

  a[e] = i;
}