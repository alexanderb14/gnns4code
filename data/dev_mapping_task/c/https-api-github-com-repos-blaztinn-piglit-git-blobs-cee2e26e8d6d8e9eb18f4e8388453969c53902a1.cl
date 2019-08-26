kernel void A(global int* a, int b, int c) {
  a[0] = b == c;
}

kernel void B(global int* a, int b, int c) {
  a[0] = b != c;
}

kernel void C(global int* a, int b, int c) {
  a[0] = b > c;
}

kernel void D(global int* a, int b, int c) {
  a[0] = b >= c;
}

kernel void E(global int* a, int b, int c) {
  a[0] = b < c;
}

kernel void F(global int* a, int b, int c) {
  a[0] = b <= c;
}