kernel void A(global char4* a, float b) {
  *a = (char4)(1, 2, (char)b, 4);
}