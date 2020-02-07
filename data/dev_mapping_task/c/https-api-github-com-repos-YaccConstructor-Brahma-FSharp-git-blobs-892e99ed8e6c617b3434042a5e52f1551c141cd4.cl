__kernel void A(__global int* a) {
  int b = 3;
  a[0] = b;
}