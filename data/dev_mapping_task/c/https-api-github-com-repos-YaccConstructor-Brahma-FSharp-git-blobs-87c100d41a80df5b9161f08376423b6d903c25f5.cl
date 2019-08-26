__kernel void A(__global int* a) {
  int b = 3;
  int c = b;
  a[0] = c;
}