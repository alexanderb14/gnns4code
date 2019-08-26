kernel void A(__global int* a) {
  int b = get_global_id(0) + get_global_id(1) * 3 + get_global_id(2) * 3 * 4;
  a[b] = b;
}