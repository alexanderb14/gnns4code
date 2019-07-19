kernel void A(global int* a) {
  atomic_add(a, 1);
}