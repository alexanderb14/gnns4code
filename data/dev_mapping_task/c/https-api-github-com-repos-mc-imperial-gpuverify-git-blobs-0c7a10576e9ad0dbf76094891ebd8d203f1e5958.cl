int A(int a) {
  return a + 1;
}

__kernel void B() {
  int a = A(2);
}