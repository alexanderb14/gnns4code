int A(__global int* a, private int b) {
  return ((b + a[0]) + a[1]);
}
int B(private int a, __global int* b, private int c) {
  return ((b[2] + a) - c);
}
int C(__global int* a, private int b, private int c, private int d) {
  int e = ((5 - c) + A(a, 4));
  return B(d, a, ((d + e) + b));
}
int D(__global int* a, private int b) {
  int c = a[9];
  int d = C(a, c, b, 6);
  return (d + a[3]);
}
__kernel void E(__global int* a) {
  int b = a[0];
  a[0] = D(a, 7);
}