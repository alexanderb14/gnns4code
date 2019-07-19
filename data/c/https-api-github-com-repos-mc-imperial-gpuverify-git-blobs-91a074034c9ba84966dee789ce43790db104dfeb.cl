__kernel void A(__global unsigned int* a) {
  a[0] = 0;

  int b = a[0];
}