kernel void A(global int* a, local int* b) {
  event_t c[4];
  c[0] = async_work_group_copy(b, a, 1, 0);
  c[1] = c[0];
  c[2] = async_work_group_copy(b + 1, a + 1, 3, 0);
  c[3] = c[0];

  wait_group_events(4, c);

  int d = get_local_id(0);
  a[get_local_size(0) - d - 1] = b[d];
}