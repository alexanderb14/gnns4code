kernel void A(global float* __restrict a, global float* __restrict b) {
  local float c[64];
  local float d[64];

  event_t e[2];

  if (get_global_id(0) < 213) {
    e[0] = async_work_group_copy(c, a, 64, 0);
  }
}