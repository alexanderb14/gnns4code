kernel void A(global int* a, global int* b) {
  atomic_add(a, 1);
  if (get_global_id(0) == get_global_size(0) - 1) {
    *b = *a;
  }
}