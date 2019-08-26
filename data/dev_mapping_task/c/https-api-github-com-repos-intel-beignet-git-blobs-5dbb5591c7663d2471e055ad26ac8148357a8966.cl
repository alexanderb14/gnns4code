__kernel void A(__global char4* a, __global char4* b, __local char4* c, int d, int e) {
  event_t f;
  int g = d * get_local_size(0);
  int h;
  f = async_work_group_strided_copy((__local char4*)c, (__global const char4*)(b + g * e * get_group_id(0)), (size_t)g, (size_t)e, 0);
  wait_group_events(1, &f);

  for (h = 0; h < d; h++)
    c[get_local_id(0) * d + h] = c[get_local_id(0) * d + h] + (char4)(3);
  barrier(1);

  f = async_work_group_strided_copy((__global char4*)(a + g * e * get_group_id(0)), (__local const char4*)c, (size_t)g, (size_t)e, 0);
  wait_group_events(1, &f);
}