struct a {
  __global int* p[5];
  int i;
};

__kernel void A(__global struct a* a, __global struct a* b) {
  b[get_global_id(0)].i = a[get_global_id(0)].i;
  b[get_global_id(0)].p[3] = a[get_global_id(0)].p[3];
}