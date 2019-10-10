__kernel void A(__global float* a, __global float* b) {
  uint c = get_global_id(0);
  b[c] = a[c] + 1.0f;
}