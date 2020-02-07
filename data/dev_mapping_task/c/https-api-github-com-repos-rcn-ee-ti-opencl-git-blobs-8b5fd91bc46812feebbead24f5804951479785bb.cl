kernel void A(global const float2* a, global const float2* b, const float c, global float2* d, local float2* e, local float2* f, local float2* g) {
  int h = get_group_id(0);
  int i = get_local_size(0);

  event_t j = async_work_group_copy(e, a + h * i, i, 0);
  event_t k = async_work_group_copy(f, b + h * i, i, 0);

  wait_group_events(1, &j);
  wait_group_events(1, &k);

  int l = get_local_id(0);
  g[l] = f[l] * e[l] + c;

  event_t m = async_work_group_copy(d + h * i, g, i, 0);
  wait_group_events(1, &m);
}