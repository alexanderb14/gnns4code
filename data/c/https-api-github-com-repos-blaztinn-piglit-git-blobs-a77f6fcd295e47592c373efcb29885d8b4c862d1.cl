kernel void A(global uint* a, uint b, uint c) {
  a[0] = b + c;
}

kernel void B(global uint* a, uint b, uint c) {
  a[0] = b - c;
}

kernel void C(global uint* a, uint b, uint c) {
  a[0] = b * c;
}

kernel void D(global uint* a, uint b, uint c) {
  a[0] = b / c;
}

kernel void E(global uint* a, uint b, uint c) {
  a[0] = b % c;
}

kernel void F(global uint* a, uint b) {
  a[0] = +b;
}

kernel void G(global uint* a, uint b) {
  a[0] = b++;
}

kernel void H(global uint* a, uint b) {
  a[0] = ++b;
}

kernel void I(global uint* a, uint b) {
  a[0] = b--;
}

kernel void J(global uint* a, uint b) {
  a[0] = --b;
}