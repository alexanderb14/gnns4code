kernel void A(global int* __restrict a, global int* __restrict b) {
  local int c[1024];

  event_t d = async_work_group_copy(c, a, 1024, 0);

  barrier(1 | 2);

  b[get_global_id(0)] = c[get_global_id(0)];

  wait_group_events(1, &d);
}