__kernel void A(__global int3* a) {
  a[200] = get_global_id(0);
}