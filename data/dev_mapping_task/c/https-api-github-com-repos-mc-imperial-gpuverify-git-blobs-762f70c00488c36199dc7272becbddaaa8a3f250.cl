__kernel void A(__global int* a, __global int* b) {
  a[get_global_id(0)] = add_sat(a[get_global_id(0)], b[get_global_id(0)]);
}