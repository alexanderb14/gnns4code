__kernel void A(__global int4* a, __global int4* b) {
  int4 c = (int4)(0, 0, 0, 0);

  b[get_global_id(0)] = c < a[get_global_id(0)];
}