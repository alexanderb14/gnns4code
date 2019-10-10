kernel void A(global int* a, int b) {
  a[0] = !b;
}

kernel void B(global int* a, int b, int c) {
  a[0] = b && c;
}

kernel void C(global int* a, int b, int c) {
  a[0] = b || c;
}