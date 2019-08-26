kernel void A(global ulong* a, ulong b, ulong c) {
  a[0] = b + c;
}

kernel void B(global ulong* a, ulong b, ulong c) {
  a[0] = b - c;
}

kernel void C(global ulong* a, ulong b, ulong c) {
  a[0] = b * c;
}

kernel void D(global ulong* a, ulong b, ulong c) {
  a[0] = b / c;
}

kernel void E(global ulong* a, ulong b, ulong c) {
  a[0] = b % c;
}

kernel void F(global ulong* a, ulong b) {
  a[0] = +b;
}

kernel void G(global ulong* a, ulong b) {
  a[0] = b++;
}

kernel void H(global ulong* a, ulong b) {
  a[0] = ++b;
}

kernel void I(global ulong* a, ulong b) {
  a[0] = b--;
}

kernel void J(global ulong* a, ulong b) {
  a[0] = --b;
}