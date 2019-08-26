__kernel void A(__local int* a) {
  int b;

  b = a[0];
  a[0] = b;
}