kernel void A(global int* a) {
  unsigned int b = get_global_id(0) + 4 * get_global_id(1) + 16 * get_global_id(2);
  a[b] = b;
}