__kernel void A(__global float* a, __constant float* b, __constant int* c) {
  int d = get_global_id(0);

  float e = b[d];
  float f = c[d];
  a[d] = e * f;
}