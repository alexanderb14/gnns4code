__kernel void A(__global int* a) {
  __global int* b = 0;
  int c = b[get_global_id(0)];
}