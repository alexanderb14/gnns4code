__kernel void A(__global const float* a, const long b, __global float* c) {
  int d = get_global_id(0);

  c[d] = a[d];
}