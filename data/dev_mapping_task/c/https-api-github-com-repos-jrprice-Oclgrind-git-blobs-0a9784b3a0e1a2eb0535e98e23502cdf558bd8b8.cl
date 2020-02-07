kernel void A(global int* a) {
  int b = get_group_id(0);
  if (get_local_id(0) == 0) {
    a[b] = b;
  }
  barrier(2);
  if (get_global_id(0) == 0) {
    int c = 0;
    for (int d = 0; d < get_num_groups(0); d++) {
      c += a[d];
    }
    a[0] = c;
  }
  barrier(2);
}