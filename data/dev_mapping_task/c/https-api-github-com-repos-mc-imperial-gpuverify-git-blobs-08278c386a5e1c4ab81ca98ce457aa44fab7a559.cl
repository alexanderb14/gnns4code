int3 A(void); __kernel void B() {
  int3 a = A();
  int3 b = (int3)(0, 0, 0);
  b += a;
}