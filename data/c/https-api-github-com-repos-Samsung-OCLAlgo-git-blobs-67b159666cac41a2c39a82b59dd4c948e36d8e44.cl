__kernel void A(__global const int* a, __global const int* b, __global int* c) {
  int d = get_global_id(0);
  c[d] = a[d] + b[d];
}