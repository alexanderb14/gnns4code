__kernel void A(__local int* a) {
  a[get_local_id(0)] = get_local_id(0);
  if (get_local_id(0) == 0) {
    barrier(1);
  }
  a[get_local_id(0)] = get_local_id(0);
  barrier(1);
  a[get_local_id(0)] = get_local_id(0);
}