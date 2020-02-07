__kernel void A(__global unsigned int* a, __global unsigned int* b, const unsigned int c) {
  uint d = get_global_id(0);

  a[d] = b[d] * c;
}