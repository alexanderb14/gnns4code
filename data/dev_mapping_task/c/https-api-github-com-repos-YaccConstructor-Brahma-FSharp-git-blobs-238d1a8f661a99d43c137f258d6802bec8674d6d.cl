int A(private int a) {
  int b = (1 + a);
  return b;
}
__kernel void B(__global int* a) {
  a[0] = A(1);
}