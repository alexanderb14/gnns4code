__kernel void A(__local int* a) {
  if (get_local_id(0) == 3) {
    barrier(2);
  }

  a[get_local_id(0)] = get_local_id(0);
}