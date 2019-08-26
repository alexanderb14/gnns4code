__kernel void A(__global uint16* a, __global uint16* b) {
  int c = (int)get_global_id(0);
  b[c] = a[c];
}