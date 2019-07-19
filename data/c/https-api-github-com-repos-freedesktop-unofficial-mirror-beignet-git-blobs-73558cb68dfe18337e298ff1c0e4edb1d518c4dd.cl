__kernel void A(__global int* a, __global int* b, int c) {
  b[get_global_id(0)] = a[get_global_id(0)] % c;
}