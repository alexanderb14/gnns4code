kernel void A(global int* a, local int* b) {
  event_t c = async_work_group_copy(b, a, get_local_size(0), 0);
  wait_group_events(1, &c);

  int d = get_local_id(0);
  a[get_local_size(0) - d - 1] = b[d];
}