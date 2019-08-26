__kernel void A(__global int* a, __global int* b) {
  size_t c = get_global_id(0);
  b[c] = a[c] + 1;
}

__kernel void B(__global int* a, __global int* b) {
  size_t c = get_global_id(0);
  b[c] = a[c] - 1;
}