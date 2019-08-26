__kernel void A(__global int4* a, __global int4* b, int c) {
  int d;
  int e[16];
  __global int* f = (__global int*)(b + c + get_global_id(0));
  __global int* g = (__global int*)(a + c + get_global_id(0));
  f[-4] = g[-4];
}