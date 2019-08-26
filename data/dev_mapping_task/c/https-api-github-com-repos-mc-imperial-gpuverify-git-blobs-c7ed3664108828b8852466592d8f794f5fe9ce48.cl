kernel void A(global float* __restrict a, global float* __restrict b, global float* __restrict c) {
  local float d[64];
  local float e[64];
  local float f[64];

  event_t g;
  event_t h;

  g = async_work_group_copy(d, a + 64 * get_group_id(0), 64, 0);
  h = async_work_group_copy(e, b + 64 * get_group_id(0), 64, 0);

  event_t* i = &g;

  if (get_local_id(0) > 13) {
    i = &h;
  }
  async_work_group_copy(f, c + 64 * get_group_id(0), 64, *i);
}