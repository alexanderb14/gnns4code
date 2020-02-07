kernel void A(global int* a, float b, float c) {
  a[0] = b == c;
}

kernel void B(global int* a, float b, float c) {
  a[0] = b != c;
}

kernel void C(global int* a, float b, float c) {
  a[0] = b > c;
}

kernel void D(global int* a, float b, float c) {
  a[0] = b >= c;
}

kernel void E(global int* a, float b, float c) {
  a[0] = b < c;
}

kernel void F(global int* a, float b, float c) {
  a[0] = b <= c;
}