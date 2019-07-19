__kernel void A(__global int* a) {
  int b = 2;
  a[0] = b;
  int c = 3;
  a[1] = c;
}