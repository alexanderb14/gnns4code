__kernel void A(__global float* a, __global float* b) {
  int c = (int)get_global_id(0);
  b[c] = min(a[c], a[0]);
}