kernel void A(global float* a, float b, float c) {
  a[0] = b + c;
}

kernel void B(global float* a, float b, float c) {
  a[0] = b - c;
}

kernel void C(global float* a, float b, float c) {
  a[0] = b * c;
}

kernel void D(global float* a, float b, float c) {
  a[0] = b / c;
}

kernel void E(global float* a, float b) {
  a[0] = +b;
}

kernel void F(global float* a, float b) {
  a[0] = -b;
}