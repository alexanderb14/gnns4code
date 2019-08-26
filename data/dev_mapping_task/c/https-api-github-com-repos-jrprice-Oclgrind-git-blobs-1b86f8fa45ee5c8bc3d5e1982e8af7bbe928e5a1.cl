kernel void A(global int* a, local int* b) {
  event_t c;
  c = async_work_group_copy(b, a, 1, 0);
  for (int d = 1; d < 4; d++) {
    async_work_group_copy(b + d, a + d, 1, c);
  }
  wait_group_events(1, &c);

  int d = get_local_id(0);
  a[get_local_size(0) - d - 1] = b[d];
}