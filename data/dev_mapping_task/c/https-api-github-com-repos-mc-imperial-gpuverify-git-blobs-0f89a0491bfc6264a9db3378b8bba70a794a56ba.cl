kernel void A(global float* a) {
  local float b[64];

  event_t c = async_work_group_copy(b, a + 64 * get_group_id(0), 64, 0);

  a[get_global_id(0)] = 2 * b[get_local_id(0)];
}