__kernel void A(__global int* a) {
  a[get_local_id(0)] = get_local_id(0);
}