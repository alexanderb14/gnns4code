kernel void A(global int* a, local int* b) {
  int c = get_local_id(0);
  b[c] = 0;
  barrier(1);

  event_t d[2];
  d[0] = async_work_group_copy(b, a, 1, 0);
  d[1] = async_work_group_copy(b + 1, a + 1, 1, 0);

  wait_group_events(1, d + c);

  a[get_local_size(0) - c - 1] = b[c];
}