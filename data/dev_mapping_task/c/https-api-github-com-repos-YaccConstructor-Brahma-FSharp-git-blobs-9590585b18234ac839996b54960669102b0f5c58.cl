int A(private int a) {
  return (6 - a);
}
int B(private int a) {
  return A(a);
}
__kernel void C(__global int* a) {
  a[0] = B(7);
}