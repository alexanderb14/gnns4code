struct a {
  __global int* p[5];
  int i;
};

__kernel void A(__global int* a, __global struct a* b) {
  b[get_global_id(0)].i = 42;
  b[get_global_id(0)].p[3] = a;
}