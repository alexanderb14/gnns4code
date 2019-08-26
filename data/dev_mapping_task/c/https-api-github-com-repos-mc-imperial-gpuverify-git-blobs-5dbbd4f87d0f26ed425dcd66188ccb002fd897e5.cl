__kernel void A(__local int* a, __local int* b, __local int* c) {
  a[get_local_id(0)] = b[get_local_id(0)];
  c[get_local_id(0)] = b[get_local_id(0)];
}