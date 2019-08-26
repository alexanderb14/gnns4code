kernel void A(__global int* a, __global int* b) {
  *a = get_local_size(*b);
}