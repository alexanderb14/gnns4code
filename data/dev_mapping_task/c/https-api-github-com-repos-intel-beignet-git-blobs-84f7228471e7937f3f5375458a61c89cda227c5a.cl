__kernel void A(__global int* a, __local volatile int* b) {
  b[get_global_id(0)] = get_local_id(1);
  a[get_global_id(0)] = b[get_local_id(0)];
}