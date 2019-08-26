bool A(void); int B(void); __kernel void C() {
  bool a = A();
  int b = B();

  b = !b;
  a = !a;

  if (b) {
  }
  if (!b) {
  }
  if (a) {
  }
  if (!a) {
  }
  if (b < b) {
  }
  if (!(b < b)) {
  }
}