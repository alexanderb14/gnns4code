__kernel void A(__global int* a) {
  __global int* b = ((void*)0);

  b[get_global_id(0)] = get_global_id(0);
  a[get_global_id(0)] = get_global_id(0);
}