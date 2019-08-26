__kernel void A(__global int* a) {
  if (get_local_size(0) != 16 || get_local_size(1) != 16) {
    a[0] = get_local_id(0);
  }
}