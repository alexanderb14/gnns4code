__kernel void A(__global float* a) {
  *a++ = 0;
  *a++ = 0;
  *a++ = 0;
  *a++ = 0;
}