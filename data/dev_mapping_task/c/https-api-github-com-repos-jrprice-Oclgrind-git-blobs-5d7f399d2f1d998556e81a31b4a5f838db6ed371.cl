kernel void A(global int* a, local int* b) {
  int c = get_local_id(0);

  event_t d = 0;
  for (int e = 0; e < get_local_size(0); e++) {
    int f = e;
    if (c == 2 && e == 2) {
      f = 0;
    }

    d = async_work_group_copy(b + f, a + f, 1, d);
  }
  wait_group_events(1, &d);

  a[get_local_size(0) - c - 1] = b[c];
}