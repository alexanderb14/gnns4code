__kernel void A(__global int* a, __global int* b) {
  unsigned int c = get_global_id(0);
  unsigned int d = get_global_id(1);

  unsigned int e = c + 5 * d;

  b[e] = a[e] + e;
}