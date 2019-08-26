__kernel void A(__global ulong* a) {
  int b[] = {1, 2, 3};
  volatile int c, d;

  b[c] = 4;

  a[0] = b[d];
}