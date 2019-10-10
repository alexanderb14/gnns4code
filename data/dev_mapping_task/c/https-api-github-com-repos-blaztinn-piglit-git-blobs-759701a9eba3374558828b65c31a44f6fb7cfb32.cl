kernel void A(global long* a, long b, long c) {
  a[0] = b + c;
}

kernel void B(global long* a, long b, long c) {
  a[0] = b - c;
}

kernel void C(global long* a, long b, long c) {
  a[0] = b * c;
}

kernel void D(global long* a, long b, long c) {
  a[0] = b / c;
}

kernel void E(global long* a, long b, long c) {
  a[0] = b % c;
}

kernel void F(global long* a, long b) {
  a[0] = +b;
}

kernel void G(global long* a, long b) {
  a[0] = -b;
}

kernel void H(global long* a, long b) {
  a[0] = b++;
}

kernel void I(global long* a, long b) {
  a[0] = ++b;
}

kernel void J(global long* a, long b) {
  a[0] = b--;
}

kernel void K(global long* a, long b) {
  a[0] = --b;
}