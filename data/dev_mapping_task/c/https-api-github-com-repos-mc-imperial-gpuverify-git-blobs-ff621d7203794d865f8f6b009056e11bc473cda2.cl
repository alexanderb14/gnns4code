__kernel void A(__global int* a) {
  a[get_global_id(0)] = get_global_id(0);

  barrier(2);

  a[get_global_id(0) + 1] = get_global_id(0);
}