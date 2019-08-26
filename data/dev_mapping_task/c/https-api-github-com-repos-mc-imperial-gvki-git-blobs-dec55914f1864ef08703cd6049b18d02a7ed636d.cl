__kernel void A(__global const float* a, __global const float* b, __global float* c) {
  int d = get_global_id(0);

  c[d] = a[d] + b[d];
}

__kernel void B(__global const float* a, __global const float* b, __global float* c) {
  int d = get_global_id(0);

  c[d] = a[d] * b[d];
}