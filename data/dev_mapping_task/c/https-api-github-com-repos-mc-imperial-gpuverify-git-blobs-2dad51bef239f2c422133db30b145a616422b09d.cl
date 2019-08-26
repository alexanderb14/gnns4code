__kernel void A(__global uint* a, __global uint* b) {
  a[get_global_id(0)] = sub_sat(a[get_global_id(0)], b[get_global_id(0)]);
}