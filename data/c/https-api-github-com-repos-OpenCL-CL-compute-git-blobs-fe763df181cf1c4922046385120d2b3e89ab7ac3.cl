__kernel void A(__global float* a, __global float* b, const float c) {
  const uint d = get_global_id(0);
  b[d] = c * a[d] + b[d];
};