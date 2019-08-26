char A(void); __kernel void B() {
  char a = A();

  a = a + a;
  a++;
}