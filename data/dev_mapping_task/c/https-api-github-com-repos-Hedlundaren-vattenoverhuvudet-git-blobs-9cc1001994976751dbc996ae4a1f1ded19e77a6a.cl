__kernel void A(__global float* a, __global float* b, __global float* c) {
  int d = 0;

  c[d + 0] = a[d + 0] + b[d + 0];
  c[d + 4] = a[d + 4] + b[d + 4];
  c[d + 8] = a[d + 8] + b[d + 8];
  c[d + 12] = a[d + 12] + b[d + 12];
}

__kernel void B(__global float* a, __global float* b, __global float* c) {
  int d = 1;

  c[d + 0] = a[d + 0] - b[d + 0];
  c[d + 4] = a[d + 4] - b[d + 4];
  c[d + 8] = a[d + 8] - b[d + 8];
  c[d + 12] = a[d + 12] - b[d + 12];
}

__kernel void C(__global float* a, __global float* b, __global float* c) {
  int d = 2;

  c[d + 0] = a[d + 0] * b[d + 0];
  c[d + 4] = a[d + 4] * b[d + 4];
  c[d + 8] = a[d + 8] * b[d + 8];
  c[d + 12] = a[d + 12] * b[d + 12];
}

__kernel void D(__global float* a, __global float* b, __global float* c) {
  int d = 3;

  c[d + 0] = a[d + 0] / b[d + 0];
  c[d + 4] = a[d + 4] / b[d + 4];
  c[d + 8] = a[d + 8] / b[d + 8];
  c[d + 12] = a[d + 12] / b[d + 12];
}