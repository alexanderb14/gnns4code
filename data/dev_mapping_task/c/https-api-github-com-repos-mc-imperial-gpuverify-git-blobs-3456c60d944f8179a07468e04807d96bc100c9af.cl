bool A(void); __kernel void B() {
  bool a = A();

  a = !a;
}