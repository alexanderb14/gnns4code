int A(private int a, private int b) {
  return ((1 + a) + b);
}
int B(private int a) {
  return (7 - a);
}
int C(private int a, private int b) {
  return (A(1, 2) - ((a * b) / B(53)));
}
__kernel void D(__global int* a) {
  a[0] = C(1, 4);
}