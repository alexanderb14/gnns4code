int A(private int a, private int b) {
  return (b + a);
}
int B(private int a, private int b) {
  int c = b;
  int d = c;
  return A(a, d);
}
__kernel void C(__global int* a) {
  a[0] = B(1, 7);
}