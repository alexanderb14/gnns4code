__kernel void A(__global int3* a) {
  a[get_global_id(0)] = get_global_id(0);
}