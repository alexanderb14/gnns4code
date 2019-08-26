__kernel void A(__global uint3* a, __global uint3* b) {
  int c = (int)get_global_id(0);
  b[c] = a[c];
}