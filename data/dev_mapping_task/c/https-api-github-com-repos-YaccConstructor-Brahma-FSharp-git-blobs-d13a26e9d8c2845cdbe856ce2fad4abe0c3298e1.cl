int A(private int a, private int b) {
  int c = 0;
  return ((a + b) + c);
}
__kernel void B(__global int* a) {
  int b = 9;
  a[0] = A(7, 9);
}