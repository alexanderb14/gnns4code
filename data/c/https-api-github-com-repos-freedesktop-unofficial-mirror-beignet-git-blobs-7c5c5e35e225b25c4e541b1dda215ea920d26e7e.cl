__kernel void A(__global uint2* a, __global uint2* b) {
  int c = (int)get_global_id(0);
  b[c] = a[c];
}