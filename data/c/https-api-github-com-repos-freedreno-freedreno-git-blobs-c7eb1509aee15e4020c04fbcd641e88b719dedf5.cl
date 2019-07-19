__kernel void A(__global float* a, __global float* b) {
  b[0] = sin(a[0]);
}