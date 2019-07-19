int A(private int a, private int b, private int c) {
  return ((b + a) - c);
}
int B(private int a, private int b) {
  return (b - A(a, a, 2));
}
int C(private int a, private int b) {
  return B(a, 5);
}
int D(private int a) {
  int b = a;
  int c = b;
  return C(c, c);
}
int E(private int a) {
  return (a - 2);
}
__kernel void F(__global int* a) {
  a[0] = D(E(7));
}