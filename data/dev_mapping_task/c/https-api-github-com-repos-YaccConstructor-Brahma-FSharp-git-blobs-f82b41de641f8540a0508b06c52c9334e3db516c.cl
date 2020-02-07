int A(private int a) {
  int b = 8;
  int c = (b + a);
  return c;
}
__kernel void B(__global int* a) {
  a[0] = A(9);
}