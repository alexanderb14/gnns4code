__kernel void A(__global float* a, __global float* b, __global float* c) {
  int d = 4 * get_global_id(0);

  c[d + 0] = a[d + 0] + b[d + 0];
  c[d + 1] = a[d + 1] - b[d + 1];
  c[d + 2] = a[d + 2] * b[d + 2];
  c[d + 3] = a[d + 3] / b[d + 3];
}