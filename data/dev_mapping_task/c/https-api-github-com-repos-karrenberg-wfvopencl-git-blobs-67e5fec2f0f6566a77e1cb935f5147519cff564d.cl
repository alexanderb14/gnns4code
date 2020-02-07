__kernel void A(__global float* a, __global float* b) {
  int c = get_global_id(0);
  b[c] = (c >= get_global_size(0) - 1) ? 0.f : a[c + 1];
}