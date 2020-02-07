kernel void A(global ushort* a, ushort b, ushort c) {
  a[0] = b + c;
}

kernel void B(global ushort* a, ushort b, ushort c) {
  a[0] = b - c;
}

kernel void C(global ushort* a, ushort b, ushort c) {
  a[0] = b * c;
}

kernel void D(global ushort* a, ushort b, ushort c) {
  a[0] = b / c;
}

kernel void E(global ushort* a, ushort b, ushort c) {
  a[0] = b % c;
}

kernel void F(global ushort* a, ushort b) {
  a[0] = +b;
}

kernel void G(global ushort* a, ushort b) {
  a[0] = b++;
}

kernel void H(global ushort* a, ushort b) {
  a[0] = ++b;
}

kernel void I(global ushort* a, ushort b) {
  a[0] = b--;
}

kernel void J(global ushort* a, ushort b) {
  a[0] = --b;
}