__kernel void A(__local int* a, __local int* b, __local int* c) {
  c[get_local_id(0)] = c[get_local_id(0) + 1];
  b[get_local_id(0)] = a[c[get_local_id(0) + 2]];
}