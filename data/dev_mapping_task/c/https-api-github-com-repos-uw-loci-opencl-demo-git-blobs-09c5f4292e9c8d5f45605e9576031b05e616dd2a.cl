__kernel void A(__global float* a, __global float* b, int c, int d) {
  int e = get_global_id(0);
  a[c + d * e] = b[e];
};