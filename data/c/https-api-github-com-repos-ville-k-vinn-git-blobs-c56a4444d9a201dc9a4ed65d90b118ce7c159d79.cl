__kernel void A(__global float* a, float b) {
  float c = a[0] - b;
}