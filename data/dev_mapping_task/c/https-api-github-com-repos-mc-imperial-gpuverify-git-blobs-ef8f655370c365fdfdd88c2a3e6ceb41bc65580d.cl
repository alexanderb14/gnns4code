__kernel void A(__local unsigned* a, __global unsigned* b) {
  unsigned c = atomic_add(a, 1);

  b[c] = get_global_id(0);
}