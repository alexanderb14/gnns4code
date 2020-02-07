kernel void A(global int* a, local int* b) {
  event_t c = async_work_group_copy(b, a, get_local_size(0), 0);

  int d = get_local_id(0);
  a[get_local_size(0) - d - 1] = d;
}