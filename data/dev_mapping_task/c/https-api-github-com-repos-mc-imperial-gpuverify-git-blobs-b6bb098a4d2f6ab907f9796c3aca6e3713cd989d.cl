__kernel void A(__local int* a) {
  a[get_local_id(0)] = get_global_id(0);

  barrier(2);

  a[get_local_id(0) + 1] = get_global_id(0);
}