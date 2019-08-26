char A(void); uchar3 B(void); __kernel void C() {
  char a = A();
  a <<= 1;

  a <<= a;

  uchar3 b = B();

  b <<= b;

  b = b ^ b;
}