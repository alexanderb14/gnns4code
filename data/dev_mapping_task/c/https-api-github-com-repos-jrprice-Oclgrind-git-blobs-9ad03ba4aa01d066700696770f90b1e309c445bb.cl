kernel void A(int4 a, global int4* b) {
  *b = a + 42;
}