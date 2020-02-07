kernel void A(global float* __restrict a, global float* __restrict b) {
  local float c[64];
  local float d[64];

  event_t e;

  e = async_work_group_copy(c, a + 64 * get_group_id(0), 64, 0);
  async_work_group_copy(d, b + 64 * get_group_id(0), 64, e);

  if (get_local_id(0) > 13) {
    wait_group_events(1, &e);
  }
}