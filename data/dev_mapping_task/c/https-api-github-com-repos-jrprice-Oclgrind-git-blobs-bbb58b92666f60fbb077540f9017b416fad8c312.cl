kernel void A(global int* a) {
  int b = get_global_id(0);
  atomic_add(a + b, 1);
}