__kernel void A(__global int* a) {
  int b = 3;
  int c = b;
  int d = c;
  a[0] = d;
}