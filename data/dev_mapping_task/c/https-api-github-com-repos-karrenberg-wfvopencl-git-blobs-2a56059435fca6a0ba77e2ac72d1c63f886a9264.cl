__kernel void A(__global int* a, __global int* b, __global float* c, __local float* d, const uint e, const uint f, const uint g) {
  uint h = get_global_id(0);

  a[h * 2] = ((h << 3) + 1) & 15;
}