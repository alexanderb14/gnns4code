__kernel void A(__global int* a, uint b) {
  __global int* c;

  c = a + (b + (b >> 5));
}