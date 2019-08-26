__kernel void A(__global const int2* a, __global const int2* b, __global int2* c) {
  int d = get_global_id(0);
  c[d] = a[d] + b[d];
}