__kernel void A(__global unsigned int* a, __global unsigned int* b) {
  uint c = get_global_id(0);
  b[0] = a[0] * 2;
}