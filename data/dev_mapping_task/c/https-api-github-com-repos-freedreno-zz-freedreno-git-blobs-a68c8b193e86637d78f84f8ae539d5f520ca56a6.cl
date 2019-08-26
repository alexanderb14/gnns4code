__kernel void A(__global short4* a, __global short4* b, __global short4* c, __global short4* d) {
  d[0] = a[0] * b[0] + c[0] - a[0];
}