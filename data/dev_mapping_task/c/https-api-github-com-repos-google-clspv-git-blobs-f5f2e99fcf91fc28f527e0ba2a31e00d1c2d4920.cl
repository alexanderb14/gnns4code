kernel void A(global uint* a, uint b) {
  a[b] = 0;
}