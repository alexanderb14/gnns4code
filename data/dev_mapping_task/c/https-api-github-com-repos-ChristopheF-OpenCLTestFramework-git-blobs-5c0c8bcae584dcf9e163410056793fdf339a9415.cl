__kernel void A(__global const int* a, const long b, __global int* c) {
  unsigned long d = get_global_id(0) * 4;

  c[d] = a[d];
  c[d + 1] = a[d + 1];
  c[d + 2] = a[d + 2];
  c[d + 3] = a[d + 3];
}