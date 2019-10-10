struct a {
  __global int* p;
  short2 i;
};

__kernel void A(__global int* a, __global struct a* b) {
  b[get_global_id(0)].i = (short2){42, 43};
  b[get_global_id(0)].p = a;
}