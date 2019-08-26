__kernel void A(__global int* a, __global int* b, __global int* c) {
  c[0] = (a[0] > b[0]) ? a[0] : b[0];
  c[1] = (a[1] >= b[1]) ? a[1] : b[1];
  c[2] = (a[2] < b[2]) ? a[2] : b[2];
  c[3] = (a[3] <= b[3]) ? a[3] : b[3];
}