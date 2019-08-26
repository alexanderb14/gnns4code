int A() {
  return 5;
}

kernel void B(global int* a) {
  a[0] = A();
}