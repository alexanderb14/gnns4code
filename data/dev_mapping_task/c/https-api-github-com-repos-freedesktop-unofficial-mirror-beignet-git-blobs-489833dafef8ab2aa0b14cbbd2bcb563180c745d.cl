kernel void A(__global int* a) {
  int b = get_local_id(0) + get_group_id(0) * 2 + get_local_id(1) * 4 + get_group_id(1) * 12 + get_local_id(2) * 36 + get_group_id(2) * 144;

  a[b] = b;
}