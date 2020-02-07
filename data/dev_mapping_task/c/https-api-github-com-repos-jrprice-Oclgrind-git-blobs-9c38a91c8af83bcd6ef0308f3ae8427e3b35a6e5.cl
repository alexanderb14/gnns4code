kernel void A(local int* a, global int* b) {
  int c = get_local_id(0);
  a[c] = c;
  barrier(1);
  event_t d = async_work_group_copy(b + 1, a, get_local_size(0), 0);
  wait_group_events(1, &d);
}