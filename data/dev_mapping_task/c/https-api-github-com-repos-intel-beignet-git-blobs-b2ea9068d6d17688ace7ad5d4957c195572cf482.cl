__kernel void A(__global int* a, __local int* b) {
  b[get_local_id(0)] = get_local_id(0);
  barrier(1);
  a[get_global_id(0)] = b[63 - get_local_id(0)];
}