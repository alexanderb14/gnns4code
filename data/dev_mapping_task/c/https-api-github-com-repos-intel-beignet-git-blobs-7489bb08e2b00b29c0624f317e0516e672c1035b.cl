kernel void A(__global float* a) {
  prefetch(a, 10);
  local float b[10];
  event_t c[2];
  async_work_group_copy(b, a, 10, 0);
  async_work_group_copy(a, b, 10, 0);
  wait_group_events(2, c);
}