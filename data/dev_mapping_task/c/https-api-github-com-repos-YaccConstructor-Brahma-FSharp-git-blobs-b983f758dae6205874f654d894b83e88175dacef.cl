int A(private int a) {
  return (a + 1);
}
int B(private int a) {
  int b = a;
  int c = b;
  return A(c);
}
__kernel void C(__global int* a) {
  a[0] = B(7);
}