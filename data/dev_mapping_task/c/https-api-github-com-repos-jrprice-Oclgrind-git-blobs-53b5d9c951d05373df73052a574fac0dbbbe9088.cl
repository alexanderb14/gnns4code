kernel void A(global int* a) {
  a[0] = get_global_id(0);
}