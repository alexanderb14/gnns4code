__kernel void A(__global float* a, __global float* b, int c, int d) {
  int e = get_global_id(0);
  b[e] = a[c + d * e];
};