kernel void A(global int* a, global int* b) {
  int c = get_group_id(0);
  b[c] = a[0];
  if (c == 1) {
    a[0] = c;
  }
}