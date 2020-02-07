kernel void A(global float* a) {
  local float b[64];

  event_t c = async_work_group_copy(b, a + get_local_size(0) * get_group_id(0), get_local_size(0), 0);

  wait_group_events(1, &c);
  barrier(1 | 2);

  c = async_work_group_copy(a + get_local_size(0) * get_group_id(0), b, get_local_size(0), 0);

  wait_group_events(1, &c);
}