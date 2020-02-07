__kernel void A(__global int* a, __global int* b, int c) {
  int d = get_global_id(0);
  b[d + c] = a[d + c];
}