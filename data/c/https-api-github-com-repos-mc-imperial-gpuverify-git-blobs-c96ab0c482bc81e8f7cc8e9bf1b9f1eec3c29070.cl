int A(void); void B(int* a) {
}

__kernel void C() {
  int a;
  int b = A();

  a = b;

  B(&b);
}