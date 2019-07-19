__kernel void A(__global uint* a, __global uint* b, int c, int d) {
  int e = get_global_id(0);
  b[e * d] = a[e * c];
}