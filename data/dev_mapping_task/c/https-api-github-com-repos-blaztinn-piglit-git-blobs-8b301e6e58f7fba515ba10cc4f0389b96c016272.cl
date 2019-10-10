kernel void A(global char* a, char b, char c) {
  a[0] = b + c;
}

kernel void B(global char* a, char b, char c) {
  a[0] = b - c;
}

kernel void C(global char* a, char b, char c) {
  a[0] = b * c;
}

kernel void D(global char* a, char b, char c) {
  a[0] = b / c;
}

kernel void E(global char* a, char b, char c) {
  a[0] = b % c;
}

kernel void F(global char* a, char b) {
  a[0] = +b;
}

kernel void G(global char* a, char b) {
  a[0] = -b;
}

kernel void H(global char* a, char b) {
  a[0] = b++;
}

kernel void I(global char* a, char b) {
  a[0] = ++b;
}

kernel void J(global char* a, char b) {
  a[0] = b--;
}

kernel void K(global char* a, char b) {
  a[0] = --b;
}