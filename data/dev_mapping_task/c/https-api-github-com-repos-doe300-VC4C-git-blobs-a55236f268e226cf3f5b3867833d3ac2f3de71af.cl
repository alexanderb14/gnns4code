__kernel void A(__global float* a) {
  float b = *a + 0.0;
  *a = b;
}

__kernel void B(__global float* a) {
  float b = *a * 0.0;
  *a = b;
}