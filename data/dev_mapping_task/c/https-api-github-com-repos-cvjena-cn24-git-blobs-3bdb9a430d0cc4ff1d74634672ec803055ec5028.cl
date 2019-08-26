__kernel void A(__global float* a, float b, uint c) {
  uint d = get_global_id(0);
  a[d + c] = b;
}