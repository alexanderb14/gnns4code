__kernel void A(__global float* a, __global float* b, __global float* c) {
  unsigned int d = get_global_id(0);
  c[d] = a[d] + b[d];
}

__kernel void B(__global float* a, __global float* b, __global float* c) {
  unsigned int d = get_global_id(0);
  c[d] = a[d] - b[d];
}

__kernel void C(__global float* a, __global float* b, __global float* c) {
  unsigned int d = get_global_id(0);
  c[d] = a[d] * b[d];
}