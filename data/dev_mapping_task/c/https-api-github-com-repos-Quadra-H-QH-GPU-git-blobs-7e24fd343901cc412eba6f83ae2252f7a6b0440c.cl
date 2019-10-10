__kernel void A(__global const float* a, __global const float* b, __global int* c) {
  int d = get_global_id(0);

  c[d] = (int)(a[d] + b[d]);
}