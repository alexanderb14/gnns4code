__kernel void A(__global const int* a, __global float* b) {
  const int c = get_global_id(0);
}