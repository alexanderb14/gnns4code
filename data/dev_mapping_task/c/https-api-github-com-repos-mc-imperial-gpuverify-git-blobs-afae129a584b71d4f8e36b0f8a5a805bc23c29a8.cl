__kernel void A(__local int* a, __local int* b) {
  a[get_local_id(0)] = get_local_id(0);

  barrier(2);

  b[get_local_id(0)] = get_local_id(0);
}