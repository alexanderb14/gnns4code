struct S0 {
  int d;
  long b;
} A() {
  struct S0 a = {3};
  a.d;
  return a;
}
__kernel void B() {
  A();
}