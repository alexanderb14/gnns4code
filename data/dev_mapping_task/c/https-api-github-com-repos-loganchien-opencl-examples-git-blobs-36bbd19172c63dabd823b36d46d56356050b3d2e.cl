__kernel void A(__global int* a, __global const int* b, __global const int* c) {
  int d = get_global_id(0);
  a[d] = b[d] + c[d];
}