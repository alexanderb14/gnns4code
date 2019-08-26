__kernel void A(__global int* a) {
  a[get_global_id(0)] = get_global_id(0);

  barrier(1);

  if (get_local_id(0) < get_local_size(0) - 1) {
    a[get_global_id(0) + 1] = get_global_id(0);
  }
}