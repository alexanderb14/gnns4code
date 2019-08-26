int A(__global int* a, private int b) {
  if ((b == 0)) {
    return a[1];
  } else {
    return a[2];
  };
}
int B(__global int* a, private int b) {
  return A(a, b);
}
__kernel void C(__global int* a) {
  a[0] = B(a, 0);
}