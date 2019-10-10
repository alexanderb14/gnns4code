__kernel void A(__global int* a, __global short* b) {
  a = (__global int*)b;
  b[3] = get_local_id(0);
}