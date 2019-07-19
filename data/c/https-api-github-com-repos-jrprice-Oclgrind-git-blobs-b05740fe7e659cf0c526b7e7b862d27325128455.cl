kernel void A(int16 a, global int8* b) {
  int8 c = (int8)(1, 2, 3, 4, 5, 6, 7, 8);

  int16 d = a + c.s0011223344556677;

  *b = d.lo;
}