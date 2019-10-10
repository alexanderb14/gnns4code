kernel void A(global int* a) {
  if (get_global_id(0) == 0) {
    *a = 0;
  }
  atomic_sub(a, 1);
}