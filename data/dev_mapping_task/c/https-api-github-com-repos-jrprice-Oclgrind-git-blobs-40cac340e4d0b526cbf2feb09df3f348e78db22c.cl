kernel void A(global int* a, local int* b) {
  int c = get_local_id(0);
  event_t d = async_work_group_copy(b, a, get_local_size(0), 0);
  if (c == 0) {
    d = async_work_group_copy(b, a, 1, d);
  }
  wait_group_events(1, &d);

  a[get_local_size(0) - c - 1] = b[c];
}