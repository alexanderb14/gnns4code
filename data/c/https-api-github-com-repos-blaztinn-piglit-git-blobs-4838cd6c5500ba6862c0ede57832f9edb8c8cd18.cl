kernel void A(global int* a, long b, long c) {
  a[0] = b == c;
}

kernel void B(global int* a, long b, long c) {
  a[0] = b != c;
}

kernel void C(global int* a, long b, long c) {
  a[0] = b > c;
}

kernel void D(global int* a, long b, long c) {
  a[0] = b >= c;
}

kernel void E(global int* a, long b, long c) {
  a[0] = b < c;
}

kernel void F(global int* a, long b, long c) {
  a[0] = b <= c;
}