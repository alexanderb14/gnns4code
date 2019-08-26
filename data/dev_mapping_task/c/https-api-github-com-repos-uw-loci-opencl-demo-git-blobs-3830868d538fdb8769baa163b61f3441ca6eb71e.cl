__kernel void A(__global float* a, __global float* b, int c) {
  int d = get_global_id(0);
  a[c + d] = b[d];
};