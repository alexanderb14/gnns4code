__kernel void A(__global uint* a, __global uint* b, unsigned int c) {
  unsigned int d = get_global_id(0);
  if (d < c)
    b[d] = a[d] * a[d];
}