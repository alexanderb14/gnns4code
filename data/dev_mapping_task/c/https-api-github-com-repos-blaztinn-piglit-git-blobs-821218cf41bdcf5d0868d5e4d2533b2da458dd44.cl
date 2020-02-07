kernel void A(global uchar* a, uchar b, uchar c) {
  a[0] = b + c;
}

kernel void B(global uchar* a, uchar b, uchar c) {
  a[0] = b - c;
}

kernel void C(global uchar* a, uchar b, uchar c) {
  a[0] = b * c;
}

kernel void D(global uchar* a, uchar b, uchar c) {
  a[0] = b / c;
}

kernel void E(global uchar* a, uchar b, uchar c) {
  a[0] = b % c;
}

kernel void F(global uchar* a, uchar b) {
  a[0] = +b;
}

kernel void G(global uchar* a, uchar b) {
  a[0] = b++;
}

kernel void H(global uchar* a, uchar b) {
  a[0] = ++b;
}

kernel void I(global uchar* a, uchar b) {
  a[0] = b--;
}

kernel void J(global uchar* a, uchar b) {
  a[0] = --b;
}