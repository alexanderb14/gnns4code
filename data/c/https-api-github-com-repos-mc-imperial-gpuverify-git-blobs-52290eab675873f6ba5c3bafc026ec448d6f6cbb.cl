__kernel void A() {
  unsigned int a = 1;
  signed int b = 2;

  a >>= a;
  b >>= a;
}