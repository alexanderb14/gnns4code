__kernel void A(__global double* a, __global double* b, __global double* c) {
  size_t d = get_global_id(0);
  c[d] = a[d] + b[d];
}