__kernel void A(__global unsigned* a, __global float* b) {
  unsigned c = 12;

  if (get_global_id(0) != 13) {
    c = atomic_add(a, 1);
  }
  b[c] = get_global_id(0);
}