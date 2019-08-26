kernel void A(local int* a) {
  atomic_add(a, 1);
}