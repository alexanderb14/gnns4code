__kernel void A(__global float* a, __global float* b, __global float* c) {
  *c = *a + *b;
}

__kernel void B(__global float* a, __global float* b, __global float* c) {
  *c = *a - *b;
}

__kernel void C(__global float* a, __global float* b, __global float* c) {
  *c = *a * *b;
}

__kernel void D(__global float* a, __global float* b, __global float* c) {
  *c = *a / *b;
}