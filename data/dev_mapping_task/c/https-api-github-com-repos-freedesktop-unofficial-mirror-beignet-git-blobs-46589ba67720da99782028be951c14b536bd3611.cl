__kernel void A(__global int* a, __local int* b, __local int* c) {
  b[get_local_id(0)] = get_local_id(0);
  c[get_local_id(0)] = get_global_id(0);
  barrier(1);
  a[get_global_id(0)] = b[15 - get_local_id(0)] + c[15 - get_local_id(0)];
}