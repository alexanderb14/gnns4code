int A(private int a, private int b) {
  return (a + b);
}
int B(private int a, private int b) {
  return A(a, b);
}
__kernel void C(__global int* a) {
  a[0] = B(1, 7);
}