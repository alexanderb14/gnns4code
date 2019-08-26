kernel void A() {
  for (int a = 0; a < get_group_id(0); a++) {
    barrier(1);
  }
}