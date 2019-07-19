int A(private int a, private int b) {
  return (b + a);
}
int B(private int a) {
  return (a + 1);
}
__kernel void C(__global int* a) {
  int b = 1;
  int c = A(b, 9);
  a[0] = c;
}