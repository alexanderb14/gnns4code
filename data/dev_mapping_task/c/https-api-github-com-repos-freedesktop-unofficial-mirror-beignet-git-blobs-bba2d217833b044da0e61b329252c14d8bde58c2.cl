__kernel void A(__global float* a, __global float* b, __global int* c) {
  int d = get_global_id(0);
  float e = b[d];

  a[d * (*c) + 0] = acos(e);
  a[d * (*c) + 1] = acosh(e);
  a[d * (*c) + 2] = asin(e);
  a[d * (*c) + 3] = asinh(e);
  a[d * (*c) + 4] = e;
};