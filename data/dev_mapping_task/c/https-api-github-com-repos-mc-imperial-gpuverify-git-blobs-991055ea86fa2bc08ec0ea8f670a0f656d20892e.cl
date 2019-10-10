__kernel void A(__local int* a, __local int* b) {
  a[get_local_id(0)] = get_local_id(0);

  b[get_local_id(0)] = a[3];
}