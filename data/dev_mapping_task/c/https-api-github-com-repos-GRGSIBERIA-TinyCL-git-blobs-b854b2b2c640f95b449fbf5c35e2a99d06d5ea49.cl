__kernel void A(__global float* a, __global float* b) {
  int c = get_local_id(0);
  a[c] = c;
  b[c] = c * c;
}