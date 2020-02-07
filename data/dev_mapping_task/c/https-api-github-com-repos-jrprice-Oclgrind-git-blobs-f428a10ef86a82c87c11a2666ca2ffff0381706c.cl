kernel void A(global int* a, local int* b) {
  int c = get_local_id(0);
  size_t d = get_local_size(0);
  if (c == d - 1) {
    d = 1;
  }

  event_t e = async_work_group_copy(b, a, d, 0);
  wait_group_events(1, &e);

  a[get_local_size(0) - c - 1] = b[c];
}