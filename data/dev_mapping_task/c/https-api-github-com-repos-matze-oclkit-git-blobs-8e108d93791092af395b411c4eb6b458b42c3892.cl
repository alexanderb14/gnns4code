__kernel void A(__global float* a, __global float* b) {
  const int c = get_global_id(0);
  a[c] = b[c];
}

__kernel void B(__constant float* a, __constant float* b) {
}

__kernel void C(__constant float* a, __constant float* b, __constant float* c) {
}

__kernel void D(__constant float* a, __constant float* b, __constant float* c, __constant float* d) {
}

__kernel void E(__constant float* a, __constant float* b) {
}

__kernel void F(__constant float* a, __constant float* b, __constant float* c) {
}

__kernel void G(__constant float* a, __constant float* b, __constant float* c, __constant float* d) {
}

__kernel void H(__global float* a, __global float* b) {
}

__kernel void I(__global float* a, __global float* b, __global float* c) {
}

__kernel void J(__global float* a, __global float* b, __global float* c, __global float* d) {
}

__kernel void K(__global float* a, __local float* b, __constant float* c, __constant float* d) {
}