int* A(int a[]) {
  return &a[0];
}

int* B(int a[]) {
  return A(a);
}

kernel void C(global int* a, int b) {
  int c[2];
  c[0] = 0;
  c[1] = 1;
  *a = B(c)[b];
}