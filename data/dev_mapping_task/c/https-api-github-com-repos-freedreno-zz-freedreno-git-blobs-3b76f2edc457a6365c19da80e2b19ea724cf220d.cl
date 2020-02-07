__kernel void A(__global int* a, __global int* b, __global int* c) {
  c[0] = a[0] + b[0];
}