kernel void A(global int* a) {
  int b = get_global_id(0);
  if (b == 0) {
    *a = 0;
  }
  barrier(2);
  atomic_add(a, 1);
}