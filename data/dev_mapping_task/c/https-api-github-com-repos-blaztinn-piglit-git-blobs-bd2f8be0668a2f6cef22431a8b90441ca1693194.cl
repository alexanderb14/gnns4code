kernel void A(global int* a, int b, int c) {
  a[0] = b + c;
}

kernel void B(global int* a, int b, int c) {
  a[0] = b - c;
}

kernel void C(global int* a, int b, int c) {
  a[0] = b * c;
}

kernel void D(global int* a, int b, int c) {
  a[0] = b / c;
}

kernel void E(global int* a, int b, int c) {
  a[0] = b % c;
}

kernel void F(global int* a, int b) {
  a[0] = +b;
}

kernel void G(global int* a, int b) {
  a[0] = -b;
}

kernel void H(global int* a, int b) {
  a[0] = b++;
}

kernel void I(global int* a, int b) {
  a[0] = ++b;
}

kernel void J(global int* a, int b) {
  a[0] = b--;
}

kernel void K(global int* a, int b) {
  a[0] = --b;
}