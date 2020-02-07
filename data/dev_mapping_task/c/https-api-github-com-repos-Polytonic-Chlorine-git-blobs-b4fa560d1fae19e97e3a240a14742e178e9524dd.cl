__kernel void A(__global float* a, __global float* b) {
  unsigned int c = get_global_id(0);
  float d = a[c];
  a[c] = b[c];
  b[c] = d;
}