int A(int a); kernel void B(global int* a); kernel void C(global int* a) {
  int b = A(0);

  a[b] = b;
  B(a);
}