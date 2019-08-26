kernel void A(int a, global int* b, int c) {
  *b = a + c;
}