__kernel void A(__local int* a, int b, int c) {
  for (unsigned d = b; d < c; ++d) {
    a[0] = 42;
  }
}