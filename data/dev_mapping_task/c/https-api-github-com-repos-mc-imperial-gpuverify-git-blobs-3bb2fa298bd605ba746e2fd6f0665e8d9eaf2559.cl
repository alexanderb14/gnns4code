kernel void A(global float* a) {
  local float b[2 * 64];
  local float c[2 * 64];

  event_t d = async_work_group_copy(b, a + get_group_id(0) * 64, 64, 0);

  global char* e = (global char*)a;

  async_work_group_copy((local char*)c, e + get_group_id(0) * 64 * sizeof(float), sizeof(float) * 64, d);

  b[64 + get_local_id(0)] = get_global_id(0);
  c[64 + get_local_id(0)] = get_global_id(0);

  wait_group_events(1, &d);
  barrier(1 | 2);

  a[get_global_id(0)] = 2 * b[get_local_id(0)];
}