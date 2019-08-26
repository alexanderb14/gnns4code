kernel void A(global short* a, short b, short c) {
  a[0] = b + c;
}

kernel void B(global short* a, short b, short c) {
  a[0] = b - c;
}

kernel void C(global short* a, short b, short c) {
  a[0] = b * c;
}

kernel void D(global short* a, short b, short c) {
  a[0] = b / c;
}

kernel void E(global short* a, short b, short c) {
  a[0] = b % c;
}

kernel void F(global short* a, short b) {
  a[0] = +b;
}

kernel void G(global short* a, short b) {
  a[0] = -b;
}

kernel void H(global short* a, short b) {
  a[0] = b++;
}

kernel void I(global short* a, short b) {
  a[0] = ++b;
}

kernel void J(global short* a, short b) {
  a[0] = b--;
}

kernel void K(global short* a, short b) {
  a[0] = --b;
}