kernel void A(global int* a) {
  int b = get_global_id(0);
  if (b != 0) {
    barrier(2);
  }
  a[b] = b;
}