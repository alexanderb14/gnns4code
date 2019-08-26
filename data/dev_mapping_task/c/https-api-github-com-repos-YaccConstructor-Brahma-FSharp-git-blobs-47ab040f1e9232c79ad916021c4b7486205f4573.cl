int A(private int a) {
  return (a + 1);
}
int B(__global int* a, private int b) {
  if ((b == 0)) {
    return A(9);
  } else {
    return a[2];
  };
}
__kernel void C(__global int* a) {
  a[0] = B(a, 0);
}