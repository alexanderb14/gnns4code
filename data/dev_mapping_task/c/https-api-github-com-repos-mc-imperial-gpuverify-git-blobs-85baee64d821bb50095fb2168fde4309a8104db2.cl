__kernel void A(__local int* a, __local int* b, int c, int d) {
  a[c] = b[d];
}