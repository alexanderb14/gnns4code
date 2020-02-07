struct a {
  __global int* p;
  short2 i;
};

__kernel void A(__global struct a* a, __global struct a* b) {
  b[get_global_id(0)].i = a[get_global_id(0)].i;
  b[get_global_id(0)].p = a[get_global_id(0)].p;
}