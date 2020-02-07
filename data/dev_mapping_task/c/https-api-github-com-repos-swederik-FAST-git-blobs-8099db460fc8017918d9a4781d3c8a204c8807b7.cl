__kernel void A(__global TYPE* a, __global TYPE* b) {
  b[get_global_id(0)] = a[get_global_id(0)] * 2;
}