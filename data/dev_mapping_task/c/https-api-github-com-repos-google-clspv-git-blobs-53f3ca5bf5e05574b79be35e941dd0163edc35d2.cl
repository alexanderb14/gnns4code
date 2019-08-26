int A(int a[], int b) {
  a[1] = b;
}

int B(int a[], int b) {
  A(a, b);
}

kernel void C(global int* a, int b) {
  int c[2];
  B(c, b);
  *a = c[1];
}