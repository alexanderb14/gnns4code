kernel void A(global float* __restrict a, global float* __restrict b) {
  local float c[64];
  local float d[64];

  event_t e;

  e = async_work_group_copy(c, a + 64 * get_group_id(0), 64, 0);
  async_work_group_copy(d, b + 64 * get_group_id(0), 64, e);

  wait_group_events(1, &e);
  barrier(1 | 2);

  a[get_global_id(0)] = 2 * c[get_local_id(0)];
  b[get_global_id(0)] = 2 * d[get_local_id(0)];
}