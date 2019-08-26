__kernel void A(__global float* a, __global float* b, __global float* c) {
  size_t d = get_global_id(0);
  size_t e = get_global_id(1);
  size_t f = e * get_global_size(1) + d;
  c[f] = a[f] + b[f];
}