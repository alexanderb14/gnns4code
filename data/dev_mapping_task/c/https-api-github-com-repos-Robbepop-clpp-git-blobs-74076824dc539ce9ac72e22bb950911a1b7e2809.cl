__kernel void A(__global int* a, __global int* b, __global int* c, const unsigned int d, __local int* e) {
  size_t f = get_global_id(0);
  if (f < d) {
    c[f] = a[f] + b[f];
  }
}