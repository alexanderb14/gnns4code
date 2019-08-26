__kernel void A(__local int* a, __local int* b, __local int* c) {
  if (get_local_id(0) > 10) {
    a[get_local_id(0)] = b[get_local_id(0)];
  }

  if (get_local_id(0) <= 10) {
    c[get_local_id(0)] = a[get_local_id(0)];
  }
}