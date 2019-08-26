__kernel void A(__global int* a) {
  int b = 1;
  int c = (b + 1);
  a[0] = c;
}