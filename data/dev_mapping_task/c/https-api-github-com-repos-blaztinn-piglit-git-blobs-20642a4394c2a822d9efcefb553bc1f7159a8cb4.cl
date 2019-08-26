kernel void A(global int* a, uint b, uint c) {
  a[0] = b == c;
}

kernel void B(global int* a, uint b, uint c) {
  a[0] = b != c;
}

kernel void C(global int* a, uint b, uint c) {
  a[0] = b > c;
}

kernel void D(global int* a, uint b, uint c) {
  a[0] = b >= c;
}

kernel void E(global int* a, uint b, uint c) {
  a[0] = b < c;
}

kernel void F(global int* a, uint b, uint c) {
  a[0] = b <= c;
}