kernel void A(global float* a) {
  local float b[64];

  b[get_local_id(0)] = get_global_id(0);

  barrier(1);

  event_t c = async_work_group_copy(a, b, 64, 0);

  wait_group_events(1, &c);
}