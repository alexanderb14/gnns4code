__kernel void A(__global int* a, __global int* b, __global int* c) {
  size_t d = get_global_id(0);
  c[d] = a[d] + b[d];
}