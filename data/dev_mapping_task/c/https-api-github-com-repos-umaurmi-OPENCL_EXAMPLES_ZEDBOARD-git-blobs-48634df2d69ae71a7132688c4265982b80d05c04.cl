__kernel void A(__global float* a, __global float* b, int c, float d) {
  unsigned int e = get_global_id(0);
  unsigned int f = get_global_id(1);

  unsigned int g = f * c + e;

  unsigned int h = 1;

  a[g] = h * (__clc_pow(b[g], d));
}