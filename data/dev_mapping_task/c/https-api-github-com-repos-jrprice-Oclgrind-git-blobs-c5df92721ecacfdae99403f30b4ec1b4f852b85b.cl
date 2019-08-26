kernel void A(global int* a, global int* b) {
  b[0] *= a[0];
}