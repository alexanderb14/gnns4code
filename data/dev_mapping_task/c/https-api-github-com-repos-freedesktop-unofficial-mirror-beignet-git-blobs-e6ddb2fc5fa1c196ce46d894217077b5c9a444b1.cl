kernel void A(__global int* a, __global int* b) {
  *a = get_global_size(*b);
}