kernel void A(global int* a, ulong b, ulong c) {
  a[0] = b == c;
}

kernel void B(global int* a, ulong b, ulong c) {
  a[0] = b != c;
}

kernel void C(global int* a, ulong b, ulong c) {
  a[0] = b > c;
}

kernel void D(global int* a, ulong b, ulong c) {
  a[0] = b >= c;
}

kernel void E(global int* a, ulong b, ulong c) {
  a[0] = b < c;
}

kernel void F(global int* a, ulong b, ulong c) {
  a[0] = b <= c;
}