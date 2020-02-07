int A(private int a, private int b) {
  int c = a;
  return (c + b);
}
__kernel void B(__global int* a) {
  a[0] = A(7, 8);
}