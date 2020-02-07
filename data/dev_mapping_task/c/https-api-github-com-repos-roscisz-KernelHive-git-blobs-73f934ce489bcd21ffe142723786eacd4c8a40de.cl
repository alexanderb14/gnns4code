__kernel void A(__global const int* a, unsigned int b, __global int* c, unsigned int d) {
  int e = get_global_id(0);

  c[e] = a[e];
}