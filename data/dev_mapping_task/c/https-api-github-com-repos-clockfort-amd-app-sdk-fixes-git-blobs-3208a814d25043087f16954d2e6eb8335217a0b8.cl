__kernel void A(__global float* a, __global float* b) {
  size_t c = get_global_id(0);
  b[c] = a[c];
}