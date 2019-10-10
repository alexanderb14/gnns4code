kernel void A(global float* __restrict a, global float* __restrict b) {
  local float c[64];
  local float d[64];

  event_t e;
  event_t f;

  e = async_work_group_copy(c, a + 64 * get_group_id(0), 64, 0);
  f = async_work_group_copy(d, b + 64 * get_group_id(0), 64, 0);

  event_t* g = &e;

  if (get_local_id(0) > 13) {
    g = &f;
  }
  wait_group_events(1, g);
}