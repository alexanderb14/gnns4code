kernel void A(global float* __restrict a, global float* __restrict b) {
  local float c[64];
  local float d[64];

  event_t e[2];

  e[0] = async_work_group_copy(c, a + 64 * get_group_id(0), 64, 0);
  e[1] = async_work_group_copy(d, b + 64 * get_group_id(0), 64, 0);

  wait_group_events(2, e);

  c[get_local_id(0)] = 2 * c[get_local_id(0)];
  d[get_local_id(0)] = 2 * d[get_local_id(0)];

  async_work_group_copy(a + 64 * get_group_id(0), c, 64, 0);
  async_work_group_copy(b + 64 * get_group_id(0), d, 64, 0);
}