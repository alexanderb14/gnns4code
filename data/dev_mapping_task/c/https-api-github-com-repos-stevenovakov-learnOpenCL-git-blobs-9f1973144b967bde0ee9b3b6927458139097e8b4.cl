__kernel void A(__global float* a, __global float* b, __global float* c) {
  uint d = get_global_id(0);

  c[d] = a[d] + b[d];
}